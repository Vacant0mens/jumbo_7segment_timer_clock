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
U 1 1 613AAB72
P 7250 2100
F 0 "ShiftRegister0" H 7250 2881 50  0000 C CNN
F 1 "TPIC6595" H 7250 2790 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 7900 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tpic6595.pdf" H 7250 2050 50  0001 C CNN
	1    7250 2100
	1    0    0    -1  
$EndComp
$Comp
L Interface_Expansion:TPIC6595 ShiftRegister1
U 1 1 613ABBBB
P 7250 4500
F 0 "ShiftRegister1" H 7250 5281 50  0000 C CNN
F 1 "TPIC6595" H 7250 5190 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 7900 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tpic6595.pdf" H 7250 4450 50  0001 C CNN
	1    7250 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 2100 6750 2200
Wire Wire Line
	6650 2200 6650 2300
Wire Wire Line
	6650 2300 6750 2300
Wire Wire Line
	7750 2600 7750 3150
Wire Wire Line
	5650 2100 6750 2100
Wire Wire Line
	5800 2000 6750 2000
Wire Wire Line
	5950 1900 6750 1900
$Comp
L Connector:Barrel_Jack 12v_0
U 1 1 613BF9A9
P 4650 800
F 0 "12v_0" V 4661 988 50  0000 L CNN
F 1 "Barrel_Jack" V 4752 988 50  0000 L CNN
F 2 "Connector_CustomPinSocket_2.54mm:BarrelJack_SmallGeneric_Horizontal" H 4700 760 50  0001 C CNN
F 3 "~" H 4700 760 50  0001 C CNN
	1    4650 800 
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 2800 6300 2800
Wire Wire Line
	7750 3150 6750 3150
Wire Wire Line
	6750 3150 6750 4100
Wire Wire Line
	5950 4300 6750 4300
Wire Wire Line
	5950 1900 5950 4300
Wire Wire Line
	5800 4400 6750 4400
Wire Wire Line
	5800 2000 5800 4400
Wire Wire Line
	5650 4600 6750 4600
Wire Wire Line
	5650 2100 5650 4600
Wire Wire Line
	5500 4700 6750 4700
$Comp
L Device:R_Small_US Res0
U 1 1 613C0E62
P 9750 1400
F 0 "Res0" V 9863 1400 50  0000 C CNN
F 1 "100 Ohm" V 9954 1400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" H 9750 1400 50  0001 C CNN
F 3 "~" H 9750 1400 50  0001 C CNN
	1    9750 1400
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US Res3
U 1 1 61412A32
P 8300 4800
F 0 "Res3" V 8413 4800 50  0000 C CNN
F 1 "1.1k Ohm" V 8504 4800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" H 8300 4800 50  0001 C CNN
F 3 "~" H 8300 4800 50  0001 C CNN
	1    8300 4800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US Res2
U 1 1 613E0069
P 8250 2400
F 0 "Res2" V 8045 2400 50  0000 C CNN
F 1 "1.1k Ohm" V 8136 2400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" H 8250 2400 50  0001 C CNN
F 3 "~" H 8250 2400 50  0001 C CNN
	1    8250 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 1500 6550 3900
Wire Wire Line
	6550 3900 7250 3900
Wire Wire Line
	6550 1500 7250 1500
$Comp
L Connector:Conn_01x08_Male ExtensionPins0
U 1 1 6143AA26
P 5150 5950
F 0 "ExtensionPins0" H 5258 6431 50  0000 C CNN
F 1 "Conn_01x08_Male" H 5258 6340 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 5150 5950 50  0001 C CNN
F 3 "~" H 5150 5950 50  0001 C CNN
	1    5150 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3900 6550 5750
Wire Wire Line
	6550 5750 5350 5750
Connection ~ 6550 3900
Wire Wire Line
	6300 5850 5350 5850
Wire Wire Line
	5650 4600 5650 6150
Wire Wire Line
	5650 6150 5350 6150
Connection ~ 5650 4600
Wire Wire Line
	6300 2800 6650 2800
Wire Wire Line
	6650 2800 6650 2900
Wire Wire Line
	6650 2900 6950 2900
Wire Wire Line
	7150 2900 7150 2800
Connection ~ 6300 2800
Wire Wire Line
	6950 2900 6950 2800
Connection ~ 6950 2900
Wire Wire Line
	6950 2900 7150 2900
Wire Wire Line
	6300 2800 6300 5300
Wire Wire Line
	7150 5300 7150 5200
Wire Wire Line
	6950 5300 6950 5200
Wire Wire Line
	6950 5300 7150 5300
Wire Wire Line
	6950 5300 6300 5300
Connection ~ 6950 5300
Connection ~ 6300 5300
Wire Wire Line
	6300 5300 6300 5850
Wire Wire Line
	7750 4100 8400 4100
Wire Wire Line
	7750 4200 8400 4200
Wire Wire Line
	7750 4300 8400 4300
Wire Wire Line
	7750 4400 8400 4400
Wire Wire Line
	7750 4500 8400 4500
Wire Wire Line
	7750 4600 8400 4600
Wire Wire Line
	7750 4700 8400 4700
Wire Wire Line
	7750 4800 8200 4800
Wire Wire Line
	7750 1700 8350 1700
Wire Wire Line
	7750 1800 8350 1800
Wire Wire Line
	7750 1900 8350 1900
Wire Wire Line
	7750 2000 8350 2000
Wire Wire Line
	7750 2100 8350 2100
Wire Wire Line
	7750 2200 8350 2200
Wire Wire Line
	7750 2300 8350 2300
Wire Wire Line
	7750 2400 8150 2400
$Comp
L Connector:Conn_01x04_Male To_7-Segment_Green1
U 1 1 6167710E
P 8600 4600
F 0 "To_7-Segment_Green1" H 8572 4574 50  0000 R CNN
F 1 "Conn_01x04_Male" H 8572 4483 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 8600 4600 50  0001 C CNN
F 3 "~" H 8600 4600 50  0001 C CNN
	1    8600 4600
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male To_7-Segment_Green0
U 1 1 6167A02F
P 8600 4200
F 0 "To_7-Segment_Green0" H 8572 4174 50  0000 R CNN
F 1 "Conn_01x04_Male" H 8572 4083 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 8600 4200 50  0001 C CNN
F 3 "~" H 8600 4200 50  0001 C CNN
	1    8600 4200
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male To_7-Segment_Red0
U 1 1 6167C93C
P 8550 1800
F 0 "To_7-Segment_Red0" H 8522 1774 50  0000 R CNN
F 1 "Conn_01x04_Male" H 8522 1683 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 8550 1800 50  0001 C CNN
F 3 "~" H 8550 1800 50  0001 C CNN
	1    8550 1800
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male To_7-Segment_Red1
U 1 1 6167FA66
P 8550 2200
F 0 "To_7-Segment_Red1" H 8522 2174 50  0000 R CNN
F 1 "Conn_01x04_Male" H 8522 2083 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 8550 2200 50  0001 C CNN
F 3 "~" H 8550 2200 50  0001 C CNN
	1    8550 2200
	-1   0    0    -1  
$EndComp
$Comp
L wemos_d1_mini_5v_out:WeMos_D1_mini_5v_out ESP8266_0
U 1 1 6153FE85
P 1200 1800
F 0 "ESP8266_0" H 1200 911 50  0000 C CNN
F 1 "WeMos_D1_mini_5v_out" H 1200 820 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 1200 650 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H -650 650 50  0001 C CNN
	1    1200 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1400 1600 1400
Wire Wire Line
	5500 2200 6650 2200
Wire Wire Line
	4150 1200 4150 1400
Wire Wire Line
	2900 1200 2900 3100
Wire Wire Line
	6750 1700 4200 1700
Wire Wire Line
	4200 1700 4200 1800
Wire Wire Line
	4200 1800 3900 1800
Wire Wire Line
	1100 800  1100 1000
Wire Wire Line
	1200 2600 1200 3100
Wire Wire Line
	1600 2200 3100 2200
Wire Wire Line
	3100 2100 1600 2100
Wire Wire Line
	3100 2000 1600 2000
Wire Wire Line
	3100 1900 1600 1900
Wire Wire Line
	5950 1900 5100 1900
Connection ~ 5950 1900
Wire Wire Line
	5500 2200 5500 4700
Wire Wire Line
	5500 2200 5500 2000
Wire Wire Line
	5500 2000 3900 2000
Connection ~ 5500 2200
Wire Wire Line
	5800 2000 5800 1800
Wire Wire Line
	5800 1800 4850 1800
Wire Wire Line
	4850 1800 4850 1900
Wire Wire Line
	4850 1900 3900 1900
Connection ~ 5800 2000
Wire Wire Line
	5100 1900 5100 2200
Wire Wire Line
	5100 2200 3900 2200
Connection ~ 5650 2100
Wire Wire Line
	5650 2100 3900 2100
Wire Wire Line
	4300 800  4300 1500
Connection ~ 6550 1500
Connection ~ 5800 4400
Wire Wire Line
	5800 6050 5350 6050
Wire Wire Line
	5800 4400 5800 6050
Wire Wire Line
	5500 4700 5500 5950
Wire Wire Line
	5500 5950 5350 5950
Connection ~ 5500 4700
Wire Wire Line
	5950 4300 5950 6250
Wire Wire Line
	5950 6250 5350 6250
Connection ~ 5950 4300
Wire Wire Line
	7750 6350 5350 6350
Wire Wire Line
	7750 5000 7750 6350
Wire Wire Line
	5350 5650 8900 5650
$Comp
L Device:R_US Res1
U 1 1 6140FFC3
P 9750 1300
F 0 "Res1" V 9545 1300 50  0000 C CNN
F 1 "470 Ohm" V 9636 1300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 9790 1290 50  0001 C CNN
F 3 "~" H 9750 1300 50  0001 C CNN
	1    9750 1300
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Male 12v_To-7-Segment0
U 1 1 6143211F
P 10100 1300
F 0 "12v_To-7-Segment0" H 10072 1274 50  0000 R CNN
F 1 "Conn_01x02_Male" H 10072 1183 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10100 1300 50  0001 C CNN
F 3 "~" H 10100 1300 50  0001 C CNN
	1    10100 1300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8900 1300 8900 5650
Connection ~ 8900 1300
NoConn ~ 1600 1500
NoConn ~ 1600 1400
NoConn ~ 1600 1300
NoConn ~ 800  1400
NoConn ~ 800  1700
NoConn ~ 800  1800
Wire Wire Line
	1850 1600 1600 1600
Wire Wire Line
	1850 1600 1850 2300
Wire Wire Line
	1950 1800 1950 1700
Wire Wire Line
	1950 1700 1600 1700
NoConn ~ 1600 1800
Wire Wire Line
	9850 1400 9900 1400
Wire Wire Line
	8900 1300 9400 1300
Wire Wire Line
	9400 1300 9400 1400
Wire Wire Line
	9400 1400 9650 1400
Connection ~ 9400 1300
Wire Wire Line
	9400 1300 9600 1300
$Comp
L Connector:Conn_01x02_Male UBEC_Buck_12v1
U 1 1 6152A779
P 5400 1300
F 0 "UBEC_Buck_12v1" H 5508 1481 50  0000 C CNN
F 1 "Conn_01x02_Male" H 5508 1390 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5400 1300 50  0001 C CNN
F 3 "~" H 5400 1300 50  0001 C CNN
	1    5400 1300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male UBEC_Buck5v1
U 1 1 6152BE43
P 5250 1500
F 0 "UBEC_Buck5v1" H 5358 1650 50  0000 C CNN
F 1 "Conn_01x02_Male" H 5358 1750 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5250 1500 50  0001 C CNN
F 3 "~" H 5250 1500 50  0001 C CNN
	1    5250 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	1200 3100 2900 3100
Wire Wire Line
	4750 1100 4750 1300
Connection ~ 5600 1300
Wire Wire Line
	5600 1300 8900 1300
Wire Wire Line
	4150 1400 4550 1400
Wire Wire Line
	4550 1100 4550 1400
Connection ~ 4550 1400
Wire Wire Line
	4550 1400 5050 1400
Wire Wire Line
	4550 1400 4550 2800
Wire Wire Line
	4300 1500 5050 1500
Connection ~ 5050 1500
Wire Wire Line
	5050 1500 6550 1500
Wire Wire Line
	4750 1300 5600 1300
Wire Wire Line
	5600 1400 5050 1400
Connection ~ 5050 1400
$Comp
L Connector_Generic:Conn_02x07_Counter_Clockwise Inverter0
U 1 1 61965A6B
P 3500 2050
F 0 "Inverter0" V 3596 1662 50  0000 R CNN
F 1 "SN74HC04" V 3505 1662 50  0000 R CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3500 2050 50  0001 C CNN
F 3 "~" H 3500 2050 50  0001 C CNN
	1    3500 2050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2900 1200 4150 1200
Wire Wire Line
	3000 1800 1950 1800
Wire Wire Line
	3600 1750 3600 1800
Wire Wire Line
	1100 800  4300 800 
$EndSCHEMATC
