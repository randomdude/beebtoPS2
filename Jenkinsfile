//group=electronics
parallel(
	'board':
	{
		node ("win10")
		{
			checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'kicad-jenkins-support']], submoduleCfg: [], userRemoteConfigs: [[url: 'http://gitea/aliz/kicad-jenkins-support']]])
			bat script: 'copy kicad-jenkins-support\\* .'

			def rootDir = pwd()
			def kicadSupport = load "${rootDir}\\build.groovy"
			dir('board')
			{
				kicadSupport.build("http://gitea/aliz/beebToPS2.git")
			}
		}
	},
	'gateware' : 
	{
		node ("xilinx")
		{
				checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'http://gitea/aliz/beebToPS2.git']]])
				
				$chip = 'xc95144xl'
				$package = 'TQ100'
				$speed = '5'
				
				$iseloc = '/data/Xilinx/14.7/ISE_DS/ISE'
				
				dir('cpld')
				{
						sh "${$iseloc}/bin/lin64/ngdbuild -intstyle ise -dd _ngo -i -p ${$chip}-${$package}-${$speed} kb.ngc kb.ngd"
						sh "${$iseloc}/bin/lin64/cpldfit -intstyle ise -p ${$chip}-${$speed}-${$package} -ofmt vhdl -optimize density -htmlrpt -loc on -slew fast -init low -inputs 25 -pterms 90 -unused float -power auto -terminate keeper kb.ngd"
						// sh '$iseloc/XSLTProcess kb_build.xml'
						sh "${$iseloc}/bin/lin64/tsim -intstyle ise kb kb.nga"
						sh "${$iseloc}/bin/lin64/hprep6 -s IEEE1149 -n kb -i kb"
				
						archiveArtifacts artifacts: "kb.jed, kb.rpt"
						archiveArtifacts artifacts: "kb.jed"
						
						withEnv(["XILINX=${$iseloc}", "PATH+a=/data/Xilinx/14.7/ISE_DS/ISE:/data/Xilinx/14.7/ISE_DS/ISE/bin/lin64"]) {
								sh "python2.7 generateprj.py"
						}
						
						junit 'results.xml'
				}
		}
	}
)