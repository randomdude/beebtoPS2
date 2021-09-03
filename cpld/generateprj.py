import xml.etree.ElementTree as ET
import os
import subprocess

def runTest(testfile, testname):
	if os.path.isfile("isim.log"):
		os.remove("isim.log")

	# Run this test. First, we must compile it..
	res = subprocess.Popen([
		"fuse", 
		"-intstyle", "ise", 
		"-incremental", 
		"-o", "generated.exe",
		"-prj", testfile + ".prj",
		testname
		], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	stdout, stderr = res.communicate()
	if res.returncode != 0:
		return "fuse failed\n" + stdout + " " + stderr

	# Generate a file containing tcl commands the simulator will execute
	with open('isim.cmd', 'w') as f:
		f.write("onerror {resume}\n")
		f.write("wave add /\n")
		f.write("run 1 s;\n")
		f.write("quit -f\n")

	# And now run the generated executable.
	res = subprocess.Popen([
		"./generated.exe",
		"-intstyle", "ise",
		"-tclbatch", "isim.cmd"
	], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	stdout, stderr = res.communicate()
	if res.returncode != 0:
		return "simulation failed: " + stdout + " " + stderr
	# Find any assertions..
	with open("isim.log", "r") as logfile:
		loglines = logfile.readlines()
	asserts = list(filter(lambda x: x.find("** Failure") == 0, loglines ))
	if len(asserts) == 0:
		return "No assertions found"
	for assertText in asserts:
		if assertText.strip().lower() != "** Failure:all OK".lower():
			return "Assert failed: " + assertText
	
	return None

# Load the project file, and make a list of implementation and simulation files.
tree = ET.parse('beebkb.xise')
root = tree.getroot()

implFiles = []
testFiles = []

for filetag in root.findall('{http://www.xilinx.com/XMLSchema}files/{http://www.xilinx.com/XMLSchema}file'):
	filename = filetag.attrib['{http://www.xilinx.com/XMLSchema}name']
	fileType = filetag.attrib['{http://www.xilinx.com/XMLSchema}type']
	if fileType != 'FILE_VHDL':
		continue
	for assoctag in filetag.findall('{http://www.xilinx.com/XMLSchema}association'):
		assoc = assoctag.attrib['{http://www.xilinx.com/XMLSchema}name']
		
		if assoc == 'Implementation':
			implFiles.append(filename)
		elif assoc == 'BehavioralSimulation':
			testFiles.append(filename)
		elif assoc == 'PostRouteSimulation':
			pass
		else:
			raise Exception("Unrecognised file association '" + assoc + "'")

resStr = "<testsuites>"

for testfile in testFiles:
	if testfile in implFiles:
		continue
	# Create a .prj file, containing all the implementation files plus this simulation file.
	with open(testfile + '.prj', 'w') as f:
		for implFile in implFiles:
			f.write("vhdl work \"" + implFile + "\"\n")
		f.write("vhdl work \"" + testfile + "\"\n")

	# The test class name will be the filename minus the file extension.
	testname = testfile.split(".")
	testname = ".".join(testname[:-1])

	res = runTest(testfile, testname)
	resStr = resStr + "<testcase classname=\"ISE\" name=\"" + testname +"\">"
	if res is not None:
		res = res.strip()
		resStr = resStr + "<failure type=\"" + res + "\">"
		if os.path.isfile("isim.log"):
			with open("isim.log", "r") as logfile:
				thisResStr = "\n".join(logfile.readlines())
				thisResStr = thisResStr.replace("&", "&amp;")
				thisResStr = thisResStr.replace(">", "&gt;")
				thisResStr = thisResStr.replace("<", "&lt;")
				resStr = resStr + thisResStr
		resStr = resStr + "</failure>"
	resStr = resStr + "</testcase>"

resStr = resStr + "</testsuites>"

with open("results.xml", "w") as f:
	f.write(resStr)

