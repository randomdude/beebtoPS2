EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CPLD_Xilinx:XC95144XL-TQ100 U3
U 1 1 60D36DC4
P 6250 3700
F 0 "U3" H 6800 6300 50  0000 C CNN
F 1 "XC95144XL-TQ100" H 6200 5800 50  0000 C CNN
F 2 "Package_QFP:TQFP-100_14x14mm_P0.5mm" H 6250 3700 50  0001 C CNN
F 3 "https://www.xilinx.com/support/documentation/data_sheets/ds056.pdf" H 6250 3700 50  0001 C CNN
	1    6250 3700
	1    0    0    -1  
$EndComp
$Comp
L Connector:AVR-JTAG-10 J2
U 1 1 60D3C0DA
P 9200 5600
F 0 "J2" H 8770 5646 50  0000 R CNN
F 1 "AVR-JTAG-10" H 8770 5555 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Horizontal" V 9050 5750 50  0001 C CNN
F 3 " ~" H 7925 5050 50  0001 C CNN
	1    9200 5600
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 60D3D186
P 7550 4000
F 0 "SW1" H 7550 4667 50  0000 C CNN
F 1 "SW_DIP_x08" H 7550 4576 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx08_Slide_9.78x22.5mm_W7.62mm_P2.54mm" H 7550 4000 50  0001 C CNN
F 3 "~" H 7550 4000 50  0001 C CNN
	1    7550 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 6400 5950 6500
Wire Wire Line
	5950 6500 6050 6500
Wire Wire Line
	6050 6500 6050 6400
Wire Wire Line
	6150 6400 6150 6500
Wire Wire Line
	6150 6500 6050 6500
Connection ~ 6050 6500
Wire Wire Line
	6250 6400 6250 6500
Wire Wire Line
	6250 6500 6150 6500
Connection ~ 6150 6500
Wire Wire Line
	6350 6400 6350 6500
Wire Wire Line
	6350 6500 6300 6500
Connection ~ 6250 6500
Wire Wire Line
	6450 6400 6450 6500
Wire Wire Line
	6450 6500 6350 6500
Connection ~ 6350 6500
Wire Wire Line
	6550 6400 6550 6500
Wire Wire Line
	6550 6500 6450 6500
Connection ~ 6450 6500
Wire Wire Line
	6650 6400 6650 6500
Wire Wire Line
	6650 6500 6550 6500
Connection ~ 6550 6500
$Comp
L power:GND #PWR05
U 1 1 60D41F69
P 6300 6500
F 0 "#PWR05" H 6300 6250 50  0001 C CNN
F 1 "GND" H 6305 6327 50  0000 C CNN
F 2 "" H 6300 6500 50  0001 C CNN
F 3 "" H 6300 6500 50  0001 C CNN
	1    6300 6500
	1    0    0    -1  
$EndComp
Connection ~ 6300 6500
Wire Wire Line
	6300 6500 6250 6500
$Comp
L power:GND #PWR010
U 1 1 60D42232
P 9200 6200
F 0 "#PWR010" H 9200 5950 50  0001 C CNN
F 1 "GND" H 9205 6027 50  0000 C CNN
F 2 "" H 9200 6200 50  0001 C CNN
F 3 "" H 9200 6200 50  0001 C CNN
	1    9200 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 60D4290A
P 10100 1350
F 0 "#PWR011" H 10100 1100 50  0001 C CNN
F 1 "GND" H 10105 1177 50  0000 C CNN
F 2 "" H 10100 1350 50  0001 C CNN
F 3 "" H 10100 1350 50  0001 C CNN
	1    10100 1350
	1    0    0    -1  
$EndComp
$Comp
L beeb:beebKB U4
U 1 1 60D45876
P 1600 1600
F 0 "U4" H 1600 2431 50  0000 C CNN
F 1 "beebKB" H 1600 2340 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x17_P2.54mm_Horizontal" H 1600 2050 50  0001 C CNN
F 3 "" H 1600 2050 50  0001 C CNN
	1    1600 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 60D46A0C
P 3550 1300
F 0 "#PWR08" H 3550 1050 50  0001 C CNN
F 1 "GND" H 3555 1127 50  0000 C CNN
F 2 "" H 3550 1300 50  0001 C CNN
F 3 "" H 3550 1300 50  0001 C CNN
	1    3550 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 60D46F8F
P 1600 950
F 0 "#PWR07" H 1600 800 50  0001 C CNN
F 1 "+5V" H 1615 1123 50  0000 C CNN
F 2 "" H 1600 950 50  0001 C CNN
F 3 "" H 1600 950 50  0001 C CNN
	1    1600 950 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 60D475DD
P 9450 900
F 0 "#PWR06" H 9450 750 50  0001 C CNN
F 1 "+5V" H 9465 1073 50  0000 C CNN
F 2 "" H 9450 900 50  0001 C CNN
F 3 "" H 9450 900 50  0001 C CNN
	1    9450 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 1050 9450 1050
Wire Wire Line
	9450 1050 9450 900 
Wire Wire Line
	7250 5800 7600 5800
Wire Wire Line
	7250 5900 7600 5900
Wire Wire Line
	7250 6000 7600 6000
Wire Wire Line
	7250 6100 7600 6100
Text Label 7500 5800 0    50   ~ 0
TDI
Text Label 7500 5900 0    50   ~ 0
TMS
Text Label 7500 6000 0    50   ~ 0
TCK
Text Label 7500 6100 0    50   ~ 0
TDO
Wire Wire Line
	9700 5500 10050 5500
Wire Wire Line
	9700 5600 10050 5600
Wire Wire Line
	9700 5700 10050 5700
Text Label 9950 5500 0    50   ~ 0
TCK
Text Label 9950 5600 0    50   ~ 0
TMS
Text Label 9950 5700 0    50   ~ 0
TDO
Wire Wire Line
	9700 5800 10050 5800
Text Label 9950 5800 0    50   ~ 0
TDI
$Comp
L power:+3V3 #PWR012
U 1 1 60D50AF0
P 10750 850
F 0 "#PWR012" H 10750 700 50  0001 C CNN
F 1 "+3V3" H 10765 1023 50  0000 C CNN
F 2 "" H 10750 850 50  0001 C CNN
F 3 "" H 10750 850 50  0001 C CNN
	1    10750 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 1050 10750 1050
Wire Wire Line
	10750 1050 10750 850 
$Comp
L beeb:ps2 U2
U 1 1 60D5A20A
P 2250 2850
F 0 "U2" H 2250 3125 50  0000 C CNN
F 1 "ps2" H 2250 3034 50  0000 C CNN
F 2 "thirdparty:Connector_Mini-DIN_Female_6Pin_2rows" H 2550 2550 50  0001 C CNN
F 3 "" H 2550 2550 50  0001 C CNN
	1    2250 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 60D5AE5F
P 9200 5000
F 0 "#PWR09" H 9200 4850 50  0001 C CNN
F 1 "+5V" H 9215 5173 50  0000 C CNN
F 2 "" H 9200 5000 50  0001 C CNN
F 3 "" H 9200 5000 50  0001 C CNN
	1    9200 5000
	1    0    0    -1  
$EndComp
$Comp
L LED:HDSP-4830_2 BAR1
U 1 1 60D5B5EC
P 8200 1700
F 0 "BAR1" H 8200 2367 50  0000 C CNN
F 1 "HDSP-4830_2" H 8200 2276 50  0000 C CNN
F 2 "Display:HDSP-4830" H 8200 900 50  0001 C CNN
F 3 "https://docs.broadcom.com/docs/AV02-1798EN" H 6200 1900 50  0001 C CNN
	1    8200 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 60D602A6
P 4850 850
F 0 "C1" H 4965 896 50  0000 L CNN
F 1 "C" H 4965 805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4888 700 50  0001 C CNN
F 3 "~" H 4850 850 50  0001 C CNN
	1    4850 850 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 60D6120F
P 4950 700
F 0 "C2" H 5065 746 50  0000 L CNN
F 1 "C" H 5065 655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4988 550 50  0001 C CNN
F 3 "~" H 4950 700 50  0001 C CNN
	1    4950 700 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 60D6157D
P 5050 850
F 0 "C3" H 5165 896 50  0000 L CNN
F 1 "C" H 5165 805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5088 700 50  0001 C CNN
F 3 "~" H 5050 850 50  0001 C CNN
	1    5050 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 1000 6050 850 
Wire Wire Line
	4850 700  4850 550 
Wire Wire Line
	4850 550  4950 550 
Wire Wire Line
	4950 550  5050 550 
Wire Wire Line
	5050 550  5050 700 
Connection ~ 4950 550 
$Comp
L Device:C C4
U 1 1 60D63B20
P 5150 700
F 0 "C4" H 5265 746 50  0000 L CNN
F 1 "C" H 5265 655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5188 550 50  0001 C CNN
F 3 "~" H 5150 700 50  0001 C CNN
	1    5150 700 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 60D63F4D
P 5250 850
F 0 "C5" H 5365 896 50  0000 L CNN
F 1 "C" H 5365 805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5288 700 50  0001 C CNN
F 3 "~" H 5250 850 50  0001 C CNN
	1    5250 850 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 60D64353
P 5350 700
F 0 "C6" H 5465 746 50  0000 L CNN
F 1 "C" H 5465 655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5388 550 50  0001 C CNN
F 3 "~" H 5350 700 50  0001 C CNN
	1    5350 700 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 60D646A7
P 5450 850
F 0 "C7" H 5565 896 50  0000 L CNN
F 1 "C" H 5565 805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5488 700 50  0001 C CNN
F 3 "~" H 5450 850 50  0001 C CNN
	1    5450 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 1000 6250 850 
Wire Wire Line
	6450 850  6450 1000
Wire Wire Line
	5450 700  5450 550 
Wire Wire Line
	5450 550  5350 550 
Connection ~ 5350 550 
$Comp
L power:+5V #PWR01
U 1 1 60D68CAC
P 1800 2750
F 0 "#PWR01" H 1800 2600 50  0001 C CNN
F 1 "+5V" H 1815 2923 50  0000 C CNN
F 2 "" H 1800 2750 50  0001 C CNN
F 3 "" H 1800 2750 50  0001 C CNN
	1    1800 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2800 1800 2800
Wire Wire Line
	1800 2800 1800 2750
$Comp
L power:GND #PWR02
U 1 1 60D69FF3
P 1800 2950
F 0 "#PWR02" H 1800 2700 50  0001 C CNN
F 1 "GND" H 1805 2777 50  0000 C CNN
F 2 "" H 1800 2950 50  0001 C CNN
F 3 "" H 1800 2950 50  0001 C CNN
	1    1800 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2900 1800 2900
Wire Wire Line
	1800 2900 1800 2950
Wire Wire Line
	5250 5000 4650 5000
Text Label 4650 5000 0    50   ~ 0
ROW2
Wire Wire Line
	7250 3300 7600 3300
Wire Wire Line
	7250 3200 7600 3200
Text Label 7450 3300 0    50   ~ 0
COL1
Text Label 7450 3200 0    50   ~ 0
COL0
Wire Wire Line
	5250 5200 4650 5200
Text Label 4650 5200 0    50   ~ 0
CA2
Wire Wire Line
	7250 3100 7600 3100
Text Label 7450 3100 0    50   ~ 0
CB
Wire Wire Line
	5250 4800 4650 4800
Wire Wire Line
	5250 4900 4650 4900
Text Label 4650 4800 0    50   ~ 0
ROW0
Text Label 4650 4900 0    50   ~ 0
ROW1
Wire Wire Line
	7250 3400 7600 3400
Text Label 7450 3400 0    50   ~ 0
COL2
Wire Wire Line
	5250 4700 4650 4700
Text Label 4650 4700 0    50   ~ 0
COL3
Wire Wire Line
	5250 1400 4650 1400
Text Label 4650 1400 0    50   ~ 0
W
Wire Wire Line
	1000 1200 650  1200
Wire Wire Line
	1000 1300 650  1300
Wire Wire Line
	1000 1400 650  1400
Wire Wire Line
	1000 1500 650  1500
Wire Wire Line
	650  1600 1000 1600
Wire Wire Line
	1000 1700 650  1700
Wire Wire Line
	650  1800 1000 1800
Wire Wire Line
	1000 1900 650  1900
Wire Wire Line
	650  2000 1000 2000
Wire Wire Line
	2500 1450 2200 1450
Wire Wire Line
	2200 1600 2500 1600
Text Label 2350 1600 0    50   ~ 0
W
Text Label 2350 1450 0    50   ~ 0
CA2
Text Label 650  1300 0    50   ~ 0
CB
Text Label 650  1700 0    50   ~ 0
ROW0
Text Label 650  1800 0    50   ~ 0
ROW1
Text Label 650  1900 0    50   ~ 0
ROW2
Text Label 650  2000 0    50   ~ 0
ROW3
Text Label 650  1400 0    50   ~ 0
COL0
Text Label 650  1500 0    50   ~ 0
COL1
Text Label 650  1600 0    50   ~ 0
COL2
Wire Wire Line
	5250 2300 4650 2300
Text Label 4650 2300 0    50   ~ 0
BEEBCLK
Text Label 650  1200 0    50   ~ 0
BEEBCLK
Wire Wire Line
	5250 700  5250 550 
Connection ~ 5250 550 
Wire Wire Line
	5250 550  5150 550 
$Comp
L power:GND #PWR0101
U 1 1 60E39981
P 7900 4350
F 0 "#PWR0101" H 7900 4100 50  0001 C CNN
F 1 "GND" H 7905 4177 50  0000 C CNN
F 2 "" H 7900 4350 50  0001 C CNN
F 3 "" H 7900 4350 50  0001 C CNN
	1    7900 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 4350 7900 4300
Wire Wire Line
	7900 3600 7850 3600
Wire Wire Line
	7850 3700 7900 3700
Connection ~ 7900 3700
Wire Wire Line
	7900 3700 7900 3600
Wire Wire Line
	7850 3800 7900 3800
Connection ~ 7900 3800
Wire Wire Line
	7900 3800 7900 3700
Wire Wire Line
	7850 3900 7900 3900
Connection ~ 7900 3900
Wire Wire Line
	7900 3900 7900 3800
Wire Wire Line
	7850 4000 7900 4000
Connection ~ 7900 4000
Wire Wire Line
	7900 4000 7900 3900
Wire Wire Line
	7850 4100 7900 4100
Connection ~ 7900 4100
Wire Wire Line
	7900 4100 7900 4000
Wire Wire Line
	7900 4200 7850 4200
Connection ~ 7900 4200
Wire Wire Line
	7900 4200 7900 4100
Wire Wire Line
	7850 4300 7900 4300
Connection ~ 7900 4300
Wire Wire Line
	7900 4300 7900 4200
$Comp
L Device:R R1
U 1 1 60E5841F
P 8550 1300
F 0 "R1" V 8343 1300 50  0000 C CNN
F 1 "R" V 8434 1300 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8480 1300 50  0001 C CNN
F 3 "~" H 8550 1300 50  0001 C CNN
	1    8550 1300
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 60E591BA
P 8550 1400
F 0 "R2" V 8343 1400 50  0000 C CNN
F 1 "R" V 8434 1400 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8480 1400 50  0001 C CNN
F 3 "~" H 8550 1400 50  0001 C CNN
	1    8550 1400
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 60E59762
P 8550 1500
F 0 "R3" V 8343 1500 50  0000 C CNN
F 1 "R" V 8434 1500 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8480 1500 50  0001 C CNN
F 3 "~" H 8550 1500 50  0001 C CNN
	1    8550 1500
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 60E599E6
P 8550 1600
F 0 "R4" V 8343 1600 50  0000 C CNN
F 1 "R" V 8434 1600 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8480 1600 50  0001 C CNN
F 3 "~" H 8550 1600 50  0001 C CNN
	1    8550 1600
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 60E59C63
P 8550 1700
F 0 "R5" V 8343 1700 50  0000 C CNN
F 1 "R" V 8434 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8480 1700 50  0001 C CNN
F 3 "~" H 8550 1700 50  0001 C CNN
	1    8550 1700
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 60E59DCB
P 8550 1800
F 0 "R6" V 8343 1800 50  0000 C CNN
F 1 "R" V 8434 1800 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8480 1800 50  0001 C CNN
F 3 "~" H 8550 1800 50  0001 C CNN
	1    8550 1800
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 60E5A020
P 8550 1900
F 0 "R7" V 8343 1900 50  0000 C CNN
F 1 "R" V 8434 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8480 1900 50  0001 C CNN
F 3 "~" H 8550 1900 50  0001 C CNN
	1    8550 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 60E5A1B2
P 8550 2000
F 0 "R8" V 8343 2000 50  0000 C CNN
F 1 "R" V 8434 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8480 2000 50  0001 C CNN
F 3 "~" H 8550 2000 50  0001 C CNN
	1    8550 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 60E5A2FB
P 8550 2100
F 0 "R9" V 8343 2100 50  0000 C CNN
F 1 "R" V 8434 2100 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8480 2100 50  0001 C CNN
F 3 "~" H 8550 2100 50  0001 C CNN
	1    8550 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 60E5A42F
P 8550 2200
F 0 "R10" V 8343 2200 50  0000 C CNN
F 1 "R" V 8434 2200 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8480 2200 50  0001 C CNN
F 3 "~" H 8550 2200 50  0001 C CNN
	1    8550 2200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 60E5ADC6
P 8750 2250
F 0 "#PWR0102" H 8750 2000 50  0001 C CNN
F 1 "GND" H 8755 2077 50  0000 C CNN
F 2 "" H 8750 2250 50  0001 C CNN
F 3 "" H 8750 2250 50  0001 C CNN
	1    8750 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 1300 8750 1300
Wire Wire Line
	8700 2200 8750 2200
Connection ~ 8750 2200
Wire Wire Line
	8750 2200 8750 2250
Wire Wire Line
	8700 2100 8750 2100
Connection ~ 8750 2100
Wire Wire Line
	8750 2100 8750 2200
Wire Wire Line
	8700 2000 8750 2000
Connection ~ 8750 2000
Wire Wire Line
	8750 2000 8750 2100
Wire Wire Line
	8700 1900 8750 1900
Connection ~ 8750 1900
Wire Wire Line
	8750 1900 8750 2000
Wire Wire Line
	8750 1800 8700 1800
Connection ~ 8750 1800
Wire Wire Line
	8750 1800 8750 1900
Wire Wire Line
	8700 1700 8750 1700
Connection ~ 8750 1700
Wire Wire Line
	8750 1700 8750 1800
Wire Wire Line
	8700 1600 8750 1600
Connection ~ 8750 1600
Wire Wire Line
	8750 1600 8750 1700
Wire Wire Line
	8750 1400 8700 1400
Wire Wire Line
	8750 1300 8750 1400
Wire Wire Line
	8750 1400 8750 1500
Connection ~ 8750 1400
Wire Wire Line
	8700 1500 8750 1500
Connection ~ 8750 1500
Wire Wire Line
	8750 1500 8750 1600
Wire Wire Line
	5250 550  5300 550 
Wire Wire Line
	5950 850  6050 850 
Wire Wire Line
	6050 850  6150 850 
Wire Wire Line
	6150 850  6150 1000
Connection ~ 6050 850 
Wire Wire Line
	5950 850  5950 1000
Wire Wire Line
	6250 850  6350 850 
Wire Wire Line
	6450 850  6550 850 
Wire Wire Line
	6550 850  6550 1000
Connection ~ 6450 850 
Wire Wire Line
	6350 1000 6350 850 
Connection ~ 6350 850 
Wire Wire Line
	6350 850  6400 850 
$Comp
L power:+3V3 #PWR0103
U 1 1 60F20AAC
P 6050 850
F 0 "#PWR0103" H 6050 700 50  0001 C CNN
F 1 "+3V3" H 6065 1023 50  0000 C CNN
F 2 "" H 6050 850 50  0001 C CNN
F 3 "" H 6050 850 50  0001 C CNN
	1    6050 850 
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0105
U 1 1 60F21A6A
P 4950 550
F 0 "#PWR0105" H 4950 400 50  0001 C CNN
F 1 "+3V3" H 4965 723 50  0000 C CNN
F 2 "" H 4950 550 50  0001 C CNN
F 3 "" H 4950 550 50  0001 C CNN
	1    4950 550 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 60F22178
P 5300 550
F 0 "#PWR0106" H 5300 400 50  0001 C CNN
F 1 "+5V" H 5315 723 50  0000 C CNN
F 2 "" H 5300 550 50  0001 C CNN
F 3 "" H 5300 550 50  0001 C CNN
	1    5300 550 
	1    0    0    -1  
$EndComp
Connection ~ 5300 550 
Wire Wire Line
	5300 550  5350 550 
$Comp
L power:GND #PWR0107
U 1 1 60F226E2
P 4950 1050
F 0 "#PWR0107" H 4950 800 50  0001 C CNN
F 1 "GND" H 4955 877 50  0000 C CNN
F 2 "" H 4950 1050 50  0001 C CNN
F 3 "" H 4950 1050 50  0001 C CNN
	1    4950 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1050 4850 1050
Wire Wire Line
	4850 1050 4850 1000
Wire Wire Line
	4950 850  4950 1050
Connection ~ 4950 1050
Wire Wire Line
	4950 1050 5050 1050
Wire Wire Line
	5050 1050 5050 1000
Wire Wire Line
	5050 1050 5150 1050
Wire Wire Line
	5450 1050 5450 1000
Connection ~ 5050 1050
Wire Wire Line
	5350 1050 5350 850 
Connection ~ 5350 1050
Wire Wire Line
	5350 1050 5450 1050
Wire Wire Line
	5250 1000 5250 1050
Connection ~ 5250 1050
Wire Wire Line
	5250 1050 5350 1050
Wire Wire Line
	5150 1050 5150 850 
Connection ~ 5150 1050
Wire Wire Line
	5150 1050 5250 1050
Wire Wire Line
	8000 1300 7700 1300
Wire Wire Line
	7700 1400 8000 1400
Wire Wire Line
	8000 1500 7700 1500
Wire Wire Line
	8000 1700 7700 1700
Wire Wire Line
	7700 1600 8000 1600
Wire Wire Line
	7700 1800 8000 1800
Wire Wire Line
	8000 1900 7700 1900
Wire Wire Line
	7700 2000 8000 2000
Wire Wire Line
	7700 2200 8000 2200
Wire Wire Line
	8000 2100 7700 2100
Text Label 7700 1300 0    50   ~ 0
LED1
Text Label 7700 1400 0    50   ~ 0
LED2
Text Label 7700 1500 0    50   ~ 0
LED3
Text Label 7700 1600 0    50   ~ 0
LED4
Text Label 7700 1700 0    50   ~ 0
LED5
Text Label 7700 1800 0    50   ~ 0
LED6
Text Label 7700 1900 0    50   ~ 0
LED7
Text Label 7700 2000 0    50   ~ 0
LED8
Text Label 7700 2100 0    50   ~ 0
LED9
Text Label 7700 2200 0    50   ~ 0
LED10
Wire Wire Line
	7250 2200 7550 2200
Wire Wire Line
	7550 2100 7250 2100
Wire Wire Line
	7250 2000 7550 2000
Wire Wire Line
	7250 1800 7550 1800
Wire Wire Line
	7550 1900 7250 1900
Wire Wire Line
	7550 1700 7250 1700
Wire Wire Line
	7250 1600 7550 1600
Wire Wire Line
	7550 1500 7250 1500
Wire Wire Line
	7550 1300 7250 1300
Wire Wire Line
	7250 1400 7550 1400
Text Label 7550 2200 2    50   ~ 0
LED1
Text Label 7550 2100 2    50   ~ 0
LED2
Text Label 7550 2000 2    50   ~ 0
LED3
Text Label 7550 1900 2    50   ~ 0
LED4
Text Label 7550 1800 2    50   ~ 0
LED5
Text Label 7550 1700 2    50   ~ 0
LED6
Text Label 7550 1600 2    50   ~ 0
LED7
Text Label 7550 1500 2    50   ~ 0
LED8
Text Label 7550 1400 2    50   ~ 0
LED9
Text Label 7550 1300 2    50   ~ 0
LED10
Wire Bus Line
	7550 2250 7550 1200
Wire Bus Line
	7550 1200 7700 1200
Wire Bus Line
	7700 1200 7700 2250
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 60D8B261
P 1000 6450
F 0 "H1" H 1100 6499 50  0001 L CNN
F 1 "MountingHole_Pad" H 1100 6408 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 1000 6450 50  0001 C CNN
F 3 "~" H 1000 6450 50  0001 C CNN
	1    1000 6450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 60D9FB5B
P 1200 6450
F 0 "H2" H 1300 6499 50  0001 L CNN
F 1 "MountingHole_Pad" H 1300 6408 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 1200 6450 50  0001 C CNN
F 3 "~" H 1200 6450 50  0001 C CNN
	1    1200 6450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 60DA0410
P 1400 6450
F 0 "H3" H 1500 6499 50  0001 L CNN
F 1 "MountingHole_Pad" H 1500 6408 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 1400 6450 50  0001 C CNN
F 3 "~" H 1400 6450 50  0001 C CNN
	1    1400 6450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 60DA0551
P 1600 6450
F 0 "H4" H 1700 6499 50  0001 L CNN
F 1 "MountingHole_Pad" H 1700 6408 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 1600 6450 50  0001 C CNN
F 3 "~" H 1600 6450 50  0001 C CNN
	1    1600 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 60DA06E9
P 1000 6550
F 0 "#PWR0108" H 1000 6300 50  0001 C CNN
F 1 "GND" H 1005 6377 50  0000 C CNN
F 2 "" H 1000 6550 50  0001 C CNN
F 3 "" H 1000 6550 50  0001 C CNN
	1    1000 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 60DA0F23
P 1200 6550
F 0 "#PWR0109" H 1200 6300 50  0001 C CNN
F 1 "GND" H 1205 6377 50  0000 C CNN
F 2 "" H 1200 6550 50  0001 C CNN
F 3 "" H 1200 6550 50  0001 C CNN
	1    1200 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 60DA1068
P 1400 6550
F 0 "#PWR0110" H 1400 6300 50  0001 C CNN
F 1 "GND" H 1405 6377 50  0000 C CNN
F 2 "" H 1400 6550 50  0001 C CNN
F 3 "" H 1400 6550 50  0001 C CNN
	1    1400 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 60DA113D
P 1600 6550
F 0 "#PWR0111" H 1600 6300 50  0001 C CNN
F 1 "GND" H 1605 6377 50  0000 C CNN
F 2 "" H 1600 6550 50  0001 C CNN
F 3 "" H 1600 6550 50  0001 C CNN
	1    1600 6550
	1    0    0    -1  
$EndComp
$Comp
L beeb:WIT122UH U1
U 1 1 60DEB4CE
P 2300 3950
F 0 "U1" H 2350 4375 50  0000 C CNN
F 1 "WIT122UH" H 2350 4284 50  0000 C CNN
F 2 "Package_SO:SOP-8_3.9x4.9mm_P1.27mm" H 2000 3900 50  0001 C CNN
F 3 "" H 2000 3900 50  0001 C CNN
	1    2300 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0112
U 1 1 60DEBBE2
P 2000 4350
F 0 "#PWR0112" H 2000 4200 50  0001 C CNN
F 1 "+5V" H 2015 4523 50  0000 C CNN
F 2 "" H 2000 4350 50  0001 C CNN
F 3 "" H 2000 4350 50  0001 C CNN
	1    2000 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 60DEC1F3
P 1500 4200
F 0 "#PWR0113" H 1500 3950 50  0001 C CNN
F 1 "GND" H 1505 4027 50  0000 C CNN
F 2 "" H 1500 4200 50  0001 C CNN
F 3 "" H 1500 4200 50  0001 C CNN
	1    1500 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 3850 1500 3850
Wire Wire Line
	1500 3850 1500 3950
$Comp
L Device:C C8
U 1 1 60DF3F97
P 1700 3950
F 0 "C8" H 1815 3996 50  0000 L CNN
F 1 "0.1uF" H 1815 3905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1738 3800 50  0001 C CNN
F 3 "~" H 1700 3950 50  0001 C CNN
	1    1700 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 3950 1500 3950
Connection ~ 1500 3950
Wire Wire Line
	1500 3950 1500 4200
Wire Wire Line
	1850 4050 1850 4350
Wire Wire Line
	1850 4350 2000 4350
$Comp
L Connector_Generic:Conn_02x01 RESET1
U 1 1 60E340C4
P 3050 1300
F 0 "RESET1" H 3100 1075 50  0000 C CNN
F 1 "J3" H 3100 1166 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 3050 1300 50  0001 C CNN
F 3 "~" H 3050 1300 50  0001 C CNN
	1    3050 1300
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even LEDS1
U 1 1 60E41D48
P 2950 1850
F 0 "LEDS1" H 3000 1500 50  0000 C CNN
F 1 "J1" H 3000 1600 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 2950 1850 50  0001 C CNN
F 3 "~" H 2950 1850 50  0001 C CNN
	1    2950 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1750 2700 1750
Wire Wire Line
	2200 1850 2400 1850
Wire Wire Line
	2750 1950 2700 1950
$Comp
L power:+5V #PWR0115
U 1 1 60E68334
P 3350 1650
F 0 "#PWR0115" H 3350 1500 50  0001 C CNN
F 1 "+5V" H 3365 1823 50  0000 C CNN
F 2 "" H 3350 1650 50  0001 C CNN
F 3 "" H 3350 1650 50  0001 C CNN
	1    3350 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 1750 2200 1750
$Comp
L Device:R R12
U 1 1 60E68CDC
P 2550 1850
F 0 "R12" V 2550 2000 50  0000 C CNN
F 1 "470" V 2550 1850 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 2480 1850 50  0001 C CNN
F 3 "~" H 2550 1850 50  0001 C CNN
	1    2550 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	2700 1850 2750 1850
$Comp
L Device:R R13
U 1 1 60E68EAD
P 2550 1950
F 0 "R13" V 2550 2100 50  0000 C CNN
F 1 "470" V 2550 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 2480 1950 50  0001 C CNN
F 3 "~" H 2550 1950 50  0001 C CNN
	1    2550 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	2400 1950 2200 1950
$Comp
L Device:R R11
U 1 1 60E68917
P 2550 1750
F 0 "R11" V 2550 1900 50  0000 C CNN
F 1 "470" V 2550 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 2480 1750 50  0001 C CNN
F 3 "~" H 2550 1750 50  0001 C CNN
	1    2550 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 1750 3350 1750
Wire Wire Line
	3350 1750 3350 1650
Wire Wire Line
	3250 1850 3350 1850
Wire Wire Line
	3350 1850 3350 1750
Connection ~ 3350 1750
Wire Wire Line
	3250 1950 3350 1950
Wire Wire Line
	3350 1950 3350 1850
Connection ~ 3350 1850
Wire Wire Line
	3250 1300 3550 1300
Wire Wire Line
	2200 1300 2750 1300
$Comp
L power:GND #PWR0116
U 1 1 60D9C9E0
P 1600 2200
F 0 "#PWR0116" H 1600 1950 50  0001 C CNN
F 1 "GND" H 1605 2027 50  0000 C CNN
F 2 "" H 1600 2200 50  0001 C CNN
F 3 "" H 1600 2200 50  0001 C CNN
	1    1600 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2900 5250 2900
Wire Wire Line
	4300 2800 5250 2800
Wire Wire Line
	4300 2600 5250 2600
Wire Wire Line
	4300 2700 5250 2700
Text Label 4500 2900 0    50   ~ 0
PS2DATA_A
Text Label 4400 2600 0    50   ~ 0
PS2DATA_B
Text Label 4400 2700 0    50   ~ 0
PS2CLK_B
Text Label 4500 2800 0    50   ~ 0
PS2CLK_A
Wire Wire Line
	2600 2800 3050 2800
Wire Wire Line
	2600 2900 3050 2900
Text Label 2700 2900 0    50   ~ 0
PS2DATA_A
Text Label 2700 2800 0    50   ~ 0
PS2CLK_A
Wire Wire Line
	2850 3750 3200 3750
Wire Wire Line
	3200 3850 2850 3850
Text Label 2950 3750 0    50   ~ 0
PS2CLK_B
Text Label 2950 3850 0    50   ~ 0
PS2DATA_B
$Comp
L power:+5V #PWR0117
U 1 1 60F41921
P 3650 3850
F 0 "#PWR0117" H 3650 3700 50  0001 C CNN
F 1 "+5V" H 3665 4023 50  0000 C CNN
F 2 "" H 3650 3850 50  0001 C CNN
F 3 "" H 3650 3850 50  0001 C CNN
	1    3650 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 60E7476B
P 3650 4150
F 0 "#PWR0114" H 3650 3900 50  0001 C CNN
F 1 "GND" H 3655 3977 50  0000 C CNN
F 2 "" H 3650 4150 50  0001 C CNN
F 3 "" H 3650 4150 50  0001 C CNN
	1    3650 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 4050 2850 4050
Wire Wire Line
	2850 3950 3650 3950
$Comp
L Connector_Generic:Conn_01x04 USB1
U 1 1 60E5E356
P 3850 3950
F 0 "USB1" H 3930 3942 50  0000 L CNN
F 1 "USB" H 3930 3851 50  0001 L CNN
F 2 "Connector_USB:USB_A_Molex_67643_Horizontal" H 3850 3950 50  0001 C CNN
F 3 "~" H 3850 3950 50  0001 C CNN
	1    3850 3950
	1    0    0    -1  
$EndComp
Text Label 3350 3950 0    50   ~ 0
USB_N
Text Label 3350 4050 0    50   ~ 0
USB_P
$Comp
L power:+3V3 #PWR0104
U 1 1 6124D12C
P 6400 850
F 0 "#PWR0104" H 6400 700 50  0001 C CNN
F 1 "+3V3" H 6415 1023 50  0000 C CNN
F 2 "" H 6400 850 50  0001 C CNN
F 3 "" H 6400 850 50  0001 C CNN
	1    6400 850 
	1    0    0    -1  
$EndComp
Connection ~ 6400 850 
Wire Wire Line
	6400 850  6450 850 
$Comp
L Regulator_Linear:LM1117-3.3 U5
U 1 1 6124DC51
P 10100 1050
F 0 "U5" H 10100 1292 50  0000 C CNN
F 1 "LM1117-3.3" H 10100 1201 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 10100 1050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 10100 1050 50  0001 C CNN
	1    10100 1050
	1    0    0    -1  
$EndComp
$EndSCHEMATC
