import xml.etree.ElementTree as ET
tree = ET.parse('beebkb.xise')
root = tree.getroot()

#print (root[0])

implFiles = []
testFiles = []

for filetag in root.findall('{http://www.xilinx.com/XMLSchema}files/{http://www.xilinx.com/XMLSchema}file'):
	filename = filetag.attrib['{http://www.xilinx.com/XMLSchema}name']
	for assoctag in filetag.findall('{http://www.xilinx.com/XMLSchema}association'):
		assoc = assoctag.attrib['{http://www.xilinx.com/XMLSchema}name']
		if assoc == 'Implementation':
			implFiles.append("vhdl work \"" + filename + "\"")
		elif assoc == 'BehavioralSimulation':
			testFiles.append(filename)

with open('all.prj', 'w') as f:
	f.writelines("\n".join(implFiles))

for x in testFiles:
	print(x)
