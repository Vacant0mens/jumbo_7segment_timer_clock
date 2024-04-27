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
L Interface_Expansion:TPIC6595 ShiftRegister0
U 1 1 614A81DE
P 5650 3350
F 0 "ShiftRegister0" H 5650 4131 50  0000 C CNN
F 1 "TPIC6595" H 5650 4040 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6300 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tpic6595.pdf" H 5650 3300 50  0001 C CNN
	1    5650 3350
	1    0    0    -1  
$EndComp
$Comp
L Interface_Expansion:TPIC6595 ShiftRegister1
U 1 1 614A97BC
P 5550 5400
F 0 "ShiftRegister1" H 5550 6181 50  0000 C CNN
F 1 "TPIC6595" H 5550 6090 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6200 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tpic6595.pdf" H 5550 5350 50  0001 C CNN
	1    5550 5400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Male In0
U 1 1 614AA6EC
P 1900 3350
F 0 "In0" H 2008 3831 50  0000 C CNN
F 1 "Conn_01x08_Male" H 2008 3740 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 1900 3350 50  0001 C CNN
F 3 "~" H 1900 3350 50  0001 C CNN
	1    1900 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Male Out0
U 1 1 614AB756
P 1900 4450
F 0 "Out0" H 2008 4931 50  0000 C CNN
F 1 "Conn_01x08_Male" H 2008 4840 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 1900 4450 50  0001 C CNN
F 3 "~" H 1900 4450 50  0001 C CNN
	1    1900 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US DotRes1
U 1 1 614AC268
P 6200 5700
F 0 "DotRes1" V 5995 5700 50  0000 C CNN
F 1 "R_US" V 6086 5700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6240 5690 50  0001 C CNN
F 3 "~" H 6200 5700 50  0001 C CNN
	1    6200 5700
	0    1    1    0   
$EndComp
$Comp
L Device:R_US DotRes0
U 1 1 614ACBE5
P 6300 3650
F 0 "DotRes0" V 6095 3650 50  0000 C CNN
F 1 "R_US" V 6186 3650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6340 3640 50  0001 C CNN
F 3 "~" H 6300 3650 50  0001 C CNN
	1    6300 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R_US RedRes0
U 1 1 614AD241
P 8250 2550
F 0 "RedRes0" V 8455 2550 50  0000 C CNN
F 1 "470 Ohm" V 8364 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 8290 2540 50  0001 C CNN
F 3 "~" H 8250 2550 50  0001 C CNN
	1    8250 2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2100 3150 2300 3150
Wire Wire Line
	3000 3150 3000 2600
Wire Wire Line
	3000 2600 4650 2600
Wire Wire Line
	5650 2600 5650 2750
Wire Wire Line
	4650 2600 4650 4800
Wire Wire Line
	4650 4800 5550 4800
Connection ~ 4650 2600
Wire Wire Line
	4650 2600 5650 2600
Wire Wire Line
	2100 3250 2400 3250
Wire Wire Line
	3050 3250 3050 4050
Wire Wire Line
	3050 4050 5350 4050
Connection ~ 5350 4050
Wire Wire Line
	5350 4050 5550 4050
Wire Wire Line
	3050 4050 3050 6100
Wire Wire Line
	3050 6100 5250 6100
Connection ~ 3050 4050
Connection ~ 5250 6100
Wire Wire Line
	5250 6100 5450 6100
Wire Wire Line
	2300 3150 2300 4250
Wire Wire Line
	2200 3050 2200 4150
Wire Wire Line
	2200 4150 2100 4150
Wire Wire Line
	2400 3250 2400 4350
Wire Wire Line
	2100 3350 2500 3350
Wire Wire Line
	3300 5600 5050 5600
Wire Wire Line
	3500 3450 3500 5300
Wire Wire Line
	3500 5300 5050 5300
Wire Wire Line
	2100 3450 2600 3450
Wire Wire Line
	3150 3450 3150 3250
Wire Wire Line
	3150 3250 5150 3250
Connection ~ 3150 3450
Wire Wire Line
	3150 3450 3500 3450
Wire Wire Line
	3300 3350 3300 5600
Wire Wire Line
	3300 3350 4000 3350
Wire Wire Line
	4000 3350 4000 3550
Wire Wire Line
	4000 3550 5150 3550
Connection ~ 3300 3350
Wire Wire Line
	2100 3550 2700 3550
Wire Wire Line
	3850 3550 3850 3450
Wire Wire Line
	3850 3450 5150 3450
Wire Wire Line
	4300 3650 4300 3150
Wire Wire Line
	4300 3150 5150 3150
Wire Wire Line
	2100 3750 4450 3750
Wire Wire Line
	4450 3750 4450 2950
Wire Wire Line
	4450 2950 5150 2950
Wire Wire Line
	3850 3550 3850 5500
Wire Wire Line
	3850 5500 5050 5500
Connection ~ 3850 3550
Wire Wire Line
	4300 3650 4300 5200
Wire Wire Line
	4300 5200 5050 5200
Connection ~ 4300 3650
Wire Wire Line
	6150 3850 6150 4350
Wire Wire Line
	6150 4350 5050 4350
Wire Wire Line
	5050 4350 5050 5000
Wire Wire Line
	6050 5900 6050 6200
Wire Wire Line
	6050 6200 2650 6200
Wire Wire Line
	2650 6200 2650 4850
Wire Wire Line
	2650 4850 2100 4850
Wire Wire Line
	2500 3350 2500 4450
Wire Wire Line
	2600 3450 2600 4550
Wire Wire Line
	2700 3550 2700 4650
Connection ~ 2300 3150
Wire Wire Line
	2300 4250 2100 4250
Wire Wire Line
	2300 3150 3000 3150
Connection ~ 2400 3250
Wire Wire Line
	2400 4350 2100 4350
Wire Wire Line
	2400 3250 3050 3250
Connection ~ 2500 3350
Wire Wire Line
	2500 4450 2100 4450
Wire Wire Line
	2500 3350 3300 3350
Connection ~ 2600 3450
Wire Wire Line
	2600 4550 2100 4550
Wire Wire Line
	2600 3450 3150 3450
Connection ~ 2700 3550
Wire Wire Line
	2700 4650 2100 4650
Wire Wire Line
	2700 3550 3850 3550
Wire Wire Line
	2100 3650 2800 3650
Wire Wire Line
	2800 3650 2800 4750
Wire Wire Line
	2800 4750 2100 4750
Connection ~ 2800 3650
Wire Wire Line
	2800 3650 4300 3650
$Comp
L Connector:Conn_01x04_Male SR_Pins0
U 1 1 61508C1F
P 6650 3050
F 0 "SR_Pins0" H 6758 3331 50  0000 C CNN
F 1 "Conn_01x04_Male" H 6758 3240 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6650 3050 50  0001 C CNN
F 3 "~" H 6650 3050 50  0001 C CNN
	1    6650 3050
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male SR_Pins1
U 1 1 61509260
P 6650 3450
F 0 "SR_Pins1" H 6758 3117 50  0000 C CNN
F 1 "Conn_01x04_Male" H 6758 3026 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6650 3450 50  0001 C CNN
F 3 "~" H 6650 3450 50  0001 C CNN
	1    6650 3450
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male SR_Pins2
U 1 1 61509B44
P 6550 5100
F 0 "SR_Pins2" H 6658 5381 50  0000 C CNN
F 1 "Conn_01x04_Male" H 6658 5290 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6550 5100 50  0001 C CNN
F 3 "~" H 6550 5100 50  0001 C CNN
	1    6550 5100
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male SR_Pins3
U 1 1 6150A788
P 6550 5500
F 0 "SR_Pins3" H 6658 5167 50  0000 C CNN
F 1 "Conn_01x04_Male" H 6658 5076 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6550 5500 50  0001 C CNN
F 3 "~" H 6550 5500 50  0001 C CNN
	1    6550 5500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2100 3050 2200 3050
Wire Wire Line
	2200 3050 2850 3050
Wire Wire Line
	2850 3050 2850 2450
Connection ~ 2200 3050
Wire Wire Line
	6050 5600 6350 5600
Wire Wire Line
	6050 5500 6350 5500
Wire Wire Line
	6050 5400 6350 5400
Wire Wire Line
	6050 5300 6350 5300
Wire Wire Line
	6050 5200 6350 5200
Wire Wire Line
	6050 5100 6350 5100
Wire Wire Line
	6050 5000 6350 5000
Wire Wire Line
	6150 3550 6450 3550
Wire Wire Line
	6150 3450 6450 3450
Wire Wire Line
	6150 3350 6450 3350
Wire Wire Line
	6150 3250 6450 3250
Wire Wire Line
	6150 3150 6450 3150
Wire Wire Line
	6150 3050 6450 3050
Wire Wire Line
	6150 2950 6450 2950
$Comp
L Connector:Conn_01x01_Male 12v_R0
U 1 1 6154F1FD
P 8600 2550
F 0 "12v_R0" H 8572 2528 50  0000 R CNN
F 1 "Led_12v_Red0" H 8708 2640 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8600 2550 50  0001 C CNN
F 3 "~" H 8600 2550 50  0001 C CNN
	1    8600 2550
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male 12v_G0
U 1 1 61553ADB
P 8550 4800
F 0 "12v_G0" H 8522 4778 50  0000 R CNN
F 1 "Led_12v_Red0" H 8658 4890 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8550 4800 50  0001 C CNN
F 3 "~" H 8550 4800 50  0001 C CNN
	1    8550 4800
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Red0
U 1 1 61553F42
P 8400 2950
F 0 "Red0" H 8372 2928 50  0000 R CNN
F 1 "Led_12v_Red0" H 8508 3040 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8400 2950 50  0001 C CNN
F 3 "~" H 8400 2950 50  0001 C CNN
	1    8400 2950
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Red1
U 1 1 615542F9
P 8400 3050
F 0 "Red1" H 8372 3028 50  0000 R CNN
F 1 "Led_12v_Red0" H 8508 3140 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8400 3050 50  0001 C CNN
F 3 "~" H 8400 3050 50  0001 C CNN
	1    8400 3050
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Red2
U 1 1 6155448F
P 8400 3150
F 0 "Red2" H 8372 3128 50  0000 R CNN
F 1 "Led_12v_Red0" H 8508 3240 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8400 3150 50  0001 C CNN
F 3 "~" H 8400 3150 50  0001 C CNN
	1    8400 3150
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Red3
U 1 1 615545F5
P 8400 3250
F 0 "Red3" H 8372 3228 50  0000 R CNN
F 1 "Led_12v_Red0" H 8508 3340 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8400 3250 50  0001 C CNN
F 3 "~" H 8400 3250 50  0001 C CNN
	1    8400 3250
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Red4
U 1 1 615547C4
P 8400 3350
F 0 "Red4" H 8372 3328 50  0000 R CNN
F 1 "Led_12v_Red0" H 8508 3440 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8400 3350 50  0001 C CNN
F 3 "~" H 8400 3350 50  0001 C CNN
	1    8400 3350
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Red5
U 1 1 6155494F
P 8400 3450
F 0 "Red5" H 8372 3428 50  0000 R CNN
F 1 "Led_12v_Red0" H 8508 3540 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8400 3450 50  0001 C CNN
F 3 "~" H 8400 3450 50  0001 C CNN
	1    8400 3450
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Red6
U 1 1 61554AAB
P 8400 3550
F 0 "Red6" H 8372 3528 50  0000 R CNN
F 1 "Led_12v_Red0" H 8508 3640 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8400 3550 50  0001 C CNN
F 3 "~" H 8400 3550 50  0001 C CNN
	1    8400 3550
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Red7
U 1 1 61554C90
P 8400 3650
F 0 "Red7" H 8372 3628 50  0000 R CNN
F 1 "Led_12v_Red0" H 8508 3740 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8400 3650 50  0001 C CNN
F 3 "~" H 8400 3650 50  0001 C CNN
	1    8400 3650
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Green0
U 1 1 6156C4E5
P 8450 5000
F 0 "Green0" H 8422 4978 50  0000 R CNN
F 1 "Led" H 8558 5090 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8450 5000 50  0001 C CNN
F 3 "~" H 8450 5000 50  0001 C CNN
	1    8450 5000
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Green1
U 1 1 6156D3EF
P 8450 5100
F 0 "Green1" H 8422 5078 50  0000 R CNN
F 1 "Led" H 8558 5190 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8450 5100 50  0001 C CNN
F 3 "~" H 8450 5100 50  0001 C CNN
	1    8450 5100
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Green2
U 1 1 6156D5D3
P 8450 5200
F 0 "Green2" H 8422 5178 50  0000 R CNN
F 1 "Led" H 8558 5290 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8450 5200 50  0001 C CNN
F 3 "~" H 8450 5200 50  0001 C CNN
	1    8450 5200
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Green3
U 1 1 6156D7E5
P 8450 5300
F 0 "Green3" H 8422 5278 50  0000 R CNN
F 1 "Led" H 8558 5390 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8450 5300 50  0001 C CNN
F 3 "~" H 8450 5300 50  0001 C CNN
	1    8450 5300
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Green4
U 1 1 6156D986
P 8450 5400
F 0 "Green4" H 8422 5378 50  0000 R CNN
F 1 "Led" H 8558 5490 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8450 5400 50  0001 C CNN
F 3 "~" H 8450 5400 50  0001 C CNN
	1    8450 5400
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Green5
U 1 1 6156DB05
P 8450 5500
F 0 "Green5" H 8422 5478 50  0000 R CNN
F 1 "Led" H 8558 5590 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8450 5500 50  0001 C CNN
F 3 "~" H 8450 5500 50  0001 C CNN
	1    8450 5500
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Green6
U 1 1 6156DC12
P 8450 5600
F 0 "Green6" H 8422 5578 50  0000 R CNN
F 1 "Led" H 8558 5690 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8450 5600 50  0001 C CNN
F 3 "~" H 8450 5600 50  0001 C CNN
	1    8450 5600
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male Green7
U 1 1 6156DD2D
P 8450 5700
F 0 "Green7" H 8422 5678 50  0000 R CNN
F 1 "Led" H 8558 5790 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 8450 5700 50  0001 C CNN
F 3 "~" H 8450 5700 50  0001 C CNN
	1    8450 5700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2850 2450 7150 2450
Wire Wire Line
	8100 2450 8100 2550
Wire Wire Line
	7150 2450 7150 4800
Wire Wire Line
	6350 5000 8250 5000
Connection ~ 6350 5000
Wire Wire Line
	6350 5100 8250 5100
Connection ~ 6350 5100
Wire Wire Line
	6350 5200 8250 5200
Connection ~ 6350 5200
Wire Wire Line
	6350 5300 8250 5300
Connection ~ 6350 5300
Wire Wire Line
	6350 5400 8250 5400
Connection ~ 6350 5400
Wire Wire Line
	6350 5500 8250 5500
Connection ~ 6350 5500
Wire Wire Line
	6350 5600 8250 5600
Connection ~ 6350 5600
Wire Wire Line
	6350 5700 8250 5700
Connection ~ 6350 5700
Wire Wire Line
	6450 2950 8200 2950
Connection ~ 6450 2950
Wire Wire Line
	6450 3050 8200 3050
Connection ~ 6450 3050
Wire Wire Line
	6450 3150 8200 3150
Connection ~ 6450 3150
Wire Wire Line
	6450 3250 8200 3250
Connection ~ 6450 3250
Wire Wire Line
	6450 3350 8200 3350
Connection ~ 6450 3350
Wire Wire Line
	6450 3450 8200 3450
Connection ~ 6450 3450
Wire Wire Line
	6450 3550 8200 3550
Connection ~ 6450 3550
Wire Wire Line
	6450 3650 8200 3650
Connection ~ 6450 3650
Connection ~ 7150 2450
$Comp
L Device:R_US Res1
U 1 1 61623884
P 7300 4800
F 0 "Res1" V 7505 4800 50  0000 C CNN
F 1 "100 Ohm" V 7414 4800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7340 4790 50  0001 C CNN
F 3 "~" H 7300 4800 50  0001 C CNN
	1    7300 4800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7450 4800 8350 4800
Wire Wire Line
	7150 2450 8100 2450
$EndSCHEMATC
