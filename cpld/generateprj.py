import xml.etree.ElementTree as ET


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

for testfile in testFiles:
	# Create a .prj file, containing all the implementation files plus this simulation file.
	with open(testfile + '.prj', 'w') as f:
		for implFile in implFiles:
			f.write("vhdl work \"" + implFile + "\"\n")
		f.write("vhdl work \"" + testfile + "\"\n")
	
	print(testfile)


