EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "RC Light System"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 "The idea was to avoid having a ton of wires going between chassis and shell."
Comment4 "RC Light Control-module, connects to separate output module in order to control LEDs."
$EndDescr
Text Label 4175 2500 0    50   ~ 0
SER_DATA
Text Label 4175 2600 0    50   ~ 0
SER_CLK_1
Text Label 4175 2700 0    50   ~ 0
SER_LATCH
$Comp
L rc_light_system:Conn_Light_Output J2
U 1 1 64D5BE1E
P 3225 3850
F 0 "J2" H 3325 4225 50  0000 C CNN
F 1 "OUTPUT 2" H 3325 4150 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B6B-XH-A_1x06_P2.50mm_Vertical" H 3225 3850 50  0001 C CNN
F 3 "~" H 3225 3850 50  0001 C CNN
	1    3225 3850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3425 2200 3500 2200
Wire Wire Line
	3500 3650 3425 3650
Wire Wire Line
	3425 2300 3575 2300
Wire Wire Line
	3575 3750 3425 3750
Connection ~ 3575 2300
Wire Wire Line
	3800 2400 3425 2400
Wire Wire Line
	3800 3850 3425 3850
Wire Wire Line
	3950 4050 3425 4050
Wire Wire Line
	3425 2700 4025 2700
Wire Wire Line
	4025 4150 3425 4150
Wire Wire Line
	3500 2200 3500 3650
Wire Wire Line
	3575 2300 3575 3750
Wire Wire Line
	3800 2400 3800 3850
Wire Wire Line
	4025 2700 4025 4150
Wire Wire Line
	3500 3650 3500 4250
Connection ~ 3500 3650
$Comp
L power:GND #PWR0107
U 1 1 64D78207
P 3500 4250
F 0 "#PWR0107" H 3500 4000 50  0001 C CNN
F 1 "GND" H 3505 4077 50  0000 C CNN
F 2 "" H 3500 4250 50  0001 C CNN
F 3 "" H 3500 4250 50  0001 C CNN
	1    3500 4250
	1    0    0    -1  
$EndComp
Connection ~ 4025 2700
Wire Wire Line
	3425 2500 3875 2500
Wire Wire Line
	3425 3950 3875 3950
Wire Wire Line
	3875 3950 3875 2500
Connection ~ 3875 2500
$Comp
L arduino_pro_micro:Arduino_Pro_Micro A1
U 1 1 64E1EB77
P 5850 2475
F 0 "A1" H 6200 2975 50  0000 C CNN
F 1 "Arduino Pro Micro" H 6250 2900 50  0000 C CNN
F 2 "arduino_pro_micro:Arduino_Pro_Micro" H 5800 2475 50  0001 C CNN
F 3 "~" H 5800 2475 50  0001 C CNN
	1    5850 2475
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 64E20D30
P 5950 3725
F 0 "#PWR0103" H 5950 3475 50  0001 C CNN
F 1 "GND" H 5955 3552 50  0000 C CNN
F 2 "" H 5950 3725 50  0001 C CNN
F 3 "" H 5950 3725 50  0001 C CNN
	1    5950 3725
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3575 5950 3650
Wire Wire Line
	5950 3650 5850 3650
Wire Wire Line
	5750 3650 5750 3575
Wire Wire Line
	5950 3650 5950 3725
Connection ~ 5950 3650
Wire Wire Line
	5850 3575 5850 3650
Connection ~ 5850 3650
Wire Wire Line
	5850 3650 5750 3650
NoConn ~ 5375 2225
NoConn ~ 6325 2425
Wire Wire Line
	5375 2725 5300 2725
Wire Wire Line
	5225 2625 5375 2625
Wire Wire Line
	3875 2500 5150 2500
Wire Wire Line
	4025 2700 5000 2700
NoConn ~ 5375 3025
NoConn ~ 5375 3325
NoConn ~ 6325 2725
NoConn ~ 6325 2825
NoConn ~ 6325 3025
NoConn ~ 6325 3125
NoConn ~ 6325 3325
$Comp
L rc_light_system:Conn_Channel_Input J3
U 1 1 64E7BFBD
P 5300 5425
F 0 "J3" H 5604 5467 50  0000 L CNN
F 1 "THR_IN" H 5604 5376 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 5300 5425 50  0001 C CNN
F 3 "~" H 5300 5425 50  0001 C CNN
	1    5300 5425
	1    0    0    -1  
$EndComp
$Comp
L rc_light_system:Conn_Channel_Output J4
U 1 1 64E7C734
P 5300 5750
F 0 "J4" H 5605 5792 50  0000 L CNN
F 1 "THR_OUT" H 5605 5701 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5300 5750 50  0001 C CNN
F 3 "~" H 5300 5750 50  0001 C CNN
	1    5300 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 5425 4950 5750
Wire Wire Line
	4875 5650 4875 5325
$Comp
L power:GND #PWR01
U 1 1 64E81BFC
P 4775 5950
F 0 "#PWR01" H 4775 5700 50  0001 C CNN
F 1 "GND" H 4780 5777 50  0000 C CNN
F 2 "" H 4775 5950 50  0001 C CNN
F 3 "" H 4775 5950 50  0001 C CNN
	1    4775 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 5425 5100 5425
Wire Wire Line
	4875 5325 5100 5325
Wire Wire Line
	4875 5650 5100 5650
Wire Wire Line
	4950 5750 5100 5750
Wire Wire Line
	5100 5525 5025 5525
Wire Wire Line
	5025 5525 5025 5850
Wire Wire Line
	5025 5850 5100 5850
Connection ~ 5025 5525
$Comp
L rc_light_system:Conn_Channel_Input J5
U 1 1 64E92EE3
P 6800 5425
F 0 "J5" H 7105 5467 50  0000 L CNN
F 1 "STR_IN" H 7105 5376 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 6800 5425 50  0001 C CNN
F 3 "~" H 6800 5425 50  0001 C CNN
	1    6800 5425
	1    0    0    -1  
$EndComp
$Comp
L rc_light_system:Conn_Channel_Output J6
U 1 1 64E92EE9
P 6800 5750
F 0 "J6" H 7105 5792 50  0000 L CNN
F 1 "STR_OUT" H 7105 5701 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6800 5750 50  0001 C CNN
F 3 "~" H 6800 5750 50  0001 C CNN
	1    6800 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 5425 6450 5750
Wire Wire Line
	6375 5650 6375 5325
Wire Wire Line
	6450 5425 6600 5425
Wire Wire Line
	6375 5325 6600 5325
Wire Wire Line
	6375 5650 6600 5650
Wire Wire Line
	6450 5750 6600 5750
Wire Wire Line
	6600 5525 6525 5525
Wire Wire Line
	6525 5525 6525 5850
Wire Wire Line
	6525 5850 6600 5850
$Comp
L rc_light_system:Conn_Channel_Input J7
U 1 1 64EAB617
P 8325 5425
F 0 "J7" H 8630 5467 50  0000 L CNN
F 1 "AUX_IN" H 8630 5376 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 8325 5425 50  0001 C CNN
F 3 "~" H 8325 5425 50  0001 C CNN
	1    8325 5425
	1    0    0    -1  
$EndComp
$Comp
L rc_light_system:Conn_Channel_Output J8
U 1 1 64EAB61D
P 8325 5750
F 0 "J8" H 8629 5792 50  0000 L CNN
F 1 "AUX_OUT" H 8629 5701 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 8325 5750 50  0001 C CNN
F 3 "~" H 8325 5750 50  0001 C CNN
	1    8325 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7975 5425 7975 5750
Wire Wire Line
	7900 5650 7900 5325
Wire Wire Line
	7975 5425 8125 5425
Wire Wire Line
	7900 5325 8125 5325
Wire Wire Line
	7900 5650 8125 5650
Wire Wire Line
	7975 5750 8125 5750
Wire Wire Line
	8125 5525 8050 5525
Wire Wire Line
	8050 5525 8050 5850
Wire Wire Line
	8050 5850 8125 5850
$Comp
L rc_light_system:Conn_Channel_Input J10
U 1 1 64E6F1A8
P 2850 5425
F 0 "J10" H 3154 5467 50  0000 L CNN
F 1 "BIND_IN" H 3154 5376 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 2850 5425 50  0001 C CNN
F 3 "~" H 2850 5425 50  0001 C CNN
	1    2850 5425
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4950 5750 4950 6250
Wire Wire Line
	6450 6250 6450 5750
Connection ~ 4950 5750
Connection ~ 6450 5750
Wire Wire Line
	7975 6250 7975 5750
Connection ~ 6450 6250
Connection ~ 7975 5750
NoConn ~ 6325 3225
Wire Wire Line
	5075 2600 5075 3125
Wire Wire Line
	5075 3125 5375 3125
Wire Wire Line
	5150 3225 5375 3225
Wire Wire Line
	5150 2500 5150 3225
Wire Wire Line
	5375 2825 5000 2825
Wire Wire Line
	5000 2700 5000 2825
$Comp
L rc_light_system:Conn_Light_Output J1
U 1 1 64D5880E
P 3225 2400
F 0 "J1" H 3325 2775 50  0000 C CNN
F 1 "OUTPUT 1" H 3325 2700 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B6B-XH-A_1x06_P2.50mm_Vertical" H 3225 2400 50  0001 C CNN
F 3 "~" H 3225 2400 50  0001 C CNN
	1    3225 2400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3425 2600 5075 2600
Wire Wire Line
	3950 4050 3950 2925
Wire Wire Line
	3950 2925 5375 2925
Text Label 4175 2925 0    50   ~ 0
SER_CLK_2
Text GLabel 5300 3650 3    50   Output ~ 0
STR
Text GLabel 5225 3875 3    50   Output ~ 0
THR
Text GLabel 5300 2325 0    50   Output ~ 0
AUX
Wire Wire Line
	5300 3650 5300 2725
Wire Wire Line
	5225 2625 5225 3875
Text GLabel 4775 5175 1    50   Input ~ 0
THR
$Comp
L Device:R_Small R3
U 1 1 651E78BF
P 4775 5350
F 0 "R3" H 4834 5396 50  0000 L CNN
F 1 "10k" H 4834 5305 50  0000 L CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4775 5350 50  0001 C CNN
F 3 "~" H 4775 5350 50  0001 C CNN
	1    4775 5350
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 651F6E5D
P 4775 5700
F 0 "R4" H 4834 5746 50  0000 L CNN
F 1 "20k" H 4834 5655 50  0000 L CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4775 5700 50  0001 C CNN
F 3 "~" H 4775 5700 50  0001 C CNN
	1    4775 5700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4775 5875 4775 5950
Wire Wire Line
	4875 5650 4875 5875
Connection ~ 4875 5650
Wire Wire Line
	4775 5800 4775 5875
Wire Wire Line
	4775 5175 4775 5250
Wire Wire Line
	4775 5450 4775 5525
Wire Wire Line
	4775 5525 5025 5525
Connection ~ 4775 5525
Wire Wire Line
	4775 5525 4775 5600
Wire Wire Line
	4775 5875 4875 5875
Connection ~ 4775 5875
$Comp
L power:GND #PWR0102
U 1 1 65254AA0
P 6275 5950
F 0 "#PWR0102" H 6275 5700 50  0001 C CNN
F 1 "GND" H 6280 5777 50  0000 C CNN
F 2 "" H 6275 5950 50  0001 C CNN
F 3 "" H 6275 5950 50  0001 C CNN
	1    6275 5950
	1    0    0    -1  
$EndComp
Text GLabel 6275 5175 1    50   Input ~ 0
STR
$Comp
L Device:R_Small R5
U 1 1 65254AA7
P 6275 5350
F 0 "R5" H 6334 5396 50  0000 L CNN
F 1 "10k" H 6334 5305 50  0000 L CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 6275 5350 50  0001 C CNN
F 3 "~" H 6275 5350 50  0001 C CNN
	1    6275 5350
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R6
U 1 1 65254AAD
P 6275 5700
F 0 "R6" H 6334 5746 50  0000 L CNN
F 1 "20k" H 6334 5655 50  0000 L CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 6275 5700 50  0001 C CNN
F 3 "~" H 6275 5700 50  0001 C CNN
	1    6275 5700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6275 5875 6275 5950
Wire Wire Line
	6275 5800 6275 5875
Wire Wire Line
	6275 5175 6275 5250
Wire Wire Line
	6275 5450 6275 5525
Wire Wire Line
	6275 5525 6525 5525
Connection ~ 6275 5525
Wire Wire Line
	6275 5525 6275 5600
Wire Wire Line
	6275 5875 6375 5875
Connection ~ 6275 5875
Wire Wire Line
	6375 5650 6375 5875
$Comp
L power:GND #PWR0110
U 1 1 65274486
P 7800 5950
F 0 "#PWR0110" H 7800 5700 50  0001 C CNN
F 1 "GND" H 7805 5777 50  0000 C CNN
F 2 "" H 7800 5950 50  0001 C CNN
F 3 "" H 7800 5950 50  0001 C CNN
	1    7800 5950
	1    0    0    -1  
$EndComp
Text GLabel 7800 5175 1    50   Input ~ 0
AUX
$Comp
L Device:R_Small R7
U 1 1 6527448D
P 7800 5350
F 0 "R7" H 7859 5396 50  0000 L CNN
F 1 "10k" H 7859 5305 50  0000 L CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 7800 5350 50  0001 C CNN
F 3 "~" H 7800 5350 50  0001 C CNN
	1    7800 5350
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R8
U 1 1 65274493
P 7800 5700
F 0 "R8" H 7859 5746 50  0000 L CNN
F 1 "20k" H 7859 5655 50  0000 L CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 7800 5700 50  0001 C CNN
F 3 "~" H 7800 5700 50  0001 C CNN
	1    7800 5700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7800 5875 7800 5950
Wire Wire Line
	7800 5800 7800 5875
Wire Wire Line
	7800 5175 7800 5250
Wire Wire Line
	7800 5450 7800 5525
Wire Wire Line
	7800 5525 8050 5525
Connection ~ 7800 5525
Wire Wire Line
	7800 5525 7800 5600
Wire Wire Line
	7800 5875 7900 5875
Connection ~ 7800 5875
Wire Wire Line
	7900 5650 7900 5875
Connection ~ 6375 5650
Connection ~ 6525 5525
Connection ~ 7900 5650
Connection ~ 8050 5525
Wire Wire Line
	4950 6250 6450 6250
Wire Wire Line
	6450 6250 7975 6250
Wire Wire Line
	5300 2325 5375 2325
NoConn ~ 6325 2925
NoConn ~ 6325 2225
$Comp
L Diode:1N4001 D1
U 1 1 656D8D5E
P 4200 1900
F 0 "D1" H 4200 1683 50  0000 C CNN
F 1 "1N4001" H 4200 1774 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 4200 1725 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4200 1900 50  0001 C CNN
	1    4200 1900
	-1   0    0    1   
$EndComp
$Comp
L Device:Jumper_NC_Small JP2
U 1 1 656E23E1
P 4650 1900
F 0 "JP2" H 4650 2112 50  0000 C CNN
F 1 "POWER" H 4650 2021 50  0000 C CNN
F 2 "solder_bridge:bridge" H 4650 1900 50  0001 C CNN
F 3 "~" H 4650 1900 50  0001 C CNN
	1    4650 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1900 4550 1900
NoConn ~ 6325 2625
Wire Wire Line
	3800 6250 4950 6250
Connection ~ 3800 3850
Connection ~ 4950 6250
Wire Wire Line
	5850 1900 5850 1975
Wire Wire Line
	3800 2400 3800 1900
Wire Wire Line
	3800 1900 4050 1900
Connection ~ 3800 2400
Wire Wire Line
	3475 5325 3050 5325
Connection ~ 3800 5425
Wire Wire Line
	3800 5425 3800 6250
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 657816EC
P 3475 5250
F 0 "#FLG0101" H 3475 5325 50  0001 C CNN
F 1 "PWR_FLAG" H 3475 5423 50  0000 C CNN
F 2 "" H 3475 5250 50  0001 C CNN
F 3 "~" H 3475 5250 50  0001 C CNN
	1    3475 5250
	1    0    0    -1  
$EndComp
Connection ~ 3475 5325
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 65782122
P 3650 5350
F 0 "#FLG0102" H 3650 5425 50  0001 C CNN
F 1 "PWR_FLAG" H 3650 5523 50  0001 C CNN
F 2 "" H 3650 5350 50  0001 C CNN
F 3 "~" H 3650 5350 50  0001 C CNN
	1    3650 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 5425 3800 5425
Wire Wire Line
	3050 5425 3650 5425
Connection ~ 3650 5425
Wire Wire Line
	3650 5350 3650 5425
Wire Wire Line
	3475 5250 3475 5325
Wire Wire Line
	3575 1500 5850 1500
Wire Wire Line
	5850 1500 5850 1900
Wire Wire Line
	3575 1500 3575 2300
Connection ~ 5850 1900
Text Label 4950 1900 0    50   ~ 0
+5v
Wire Wire Line
	3475 5875 3475 5325
$Comp
L power:GND #PWR0101
U 1 1 64E97454
P 3400 5950
F 0 "#PWR0101" H 3400 5700 50  0001 C CNN
F 1 "GND" H 3405 5777 50  0000 C CNN
F 2 "" H 3400 5950 50  0001 C CNN
F 3 "" H 3400 5950 50  0001 C CNN
	1    3400 5950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3400 5875 3475 5875
Wire Wire Line
	3400 5875 3400 5950
Connection ~ 3400 5875
Wire Wire Line
	3400 5800 3400 5875
Wire Wire Line
	3400 5525 3050 5525
Wire Wire Line
	3400 5525 3400 5600
$Comp
L Device:Jumper_NO_Small JP1
U 1 1 64E75A17
P 3400 5700
F 0 "JP1" V 3446 5652 50  0000 R CNN
F 1 "BIND" V 3355 5652 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3400 5700 50  0001 C CNN
F 3 "~" H 3400 5700 50  0001 C CNN
	1    3400 5700
	0    1    -1   0   
$EndComp
$Comp
L rc_light_system:Conn_Channel_Output J9
U 1 1 657D93BB
P 5300 5100
F 0 "J9" H 5604 5142 50  0000 L CNN
F 1 "THR_Y" H 5604 5051 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5300 5100 50  0001 C CNN
F 3 "~" H 5300 5100 50  0001 C CNN
	1    5300 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4875 5325 4875 5000
Wire Wire Line
	4875 5000 5100 5000
Connection ~ 4875 5325
Wire Wire Line
	5100 5100 4950 5100
Wire Wire Line
	4950 5100 4950 5425
Connection ~ 4950 5425
Wire Wire Line
	5100 5200 5025 5200
Wire Wire Line
	5025 5200 5025 5525
$Comp
L rc_light_system:Conn_Channel_Output J11
U 1 1 657EBDFE
P 6800 5100
F 0 "J11" H 7104 5142 50  0000 L CNN
F 1 "STR_Y" H 7104 5051 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6800 5100 50  0001 C CNN
F 3 "~" H 6800 5100 50  0001 C CNN
	1    6800 5100
	1    0    0    -1  
$EndComp
$Comp
L rc_light_system:Conn_Channel_Output J12
U 1 1 657ECF90
P 8325 5100
F 0 "J12" H 8629 5142 50  0000 L CNN
F 1 "AUX_Y" H 8629 5051 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 8325 5100 50  0001 C CNN
F 3 "~" H 8325 5100 50  0001 C CNN
	1    8325 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6375 5325 6375 5000
Wire Wire Line
	6375 5000 6600 5000
Connection ~ 6375 5325
Wire Wire Line
	7900 5325 7900 5000
Wire Wire Line
	7900 5000 8125 5000
Connection ~ 7900 5325
Wire Wire Line
	6450 5425 6450 5100
Wire Wire Line
	6450 5100 6600 5100
Connection ~ 6450 5425
Wire Wire Line
	7975 5425 7975 5100
Wire Wire Line
	7975 5100 8125 5100
Connection ~ 7975 5425
Wire Wire Line
	6525 5525 6525 5200
Wire Wire Line
	6525 5200 6600 5200
Wire Wire Line
	8050 5525 8050 5200
Wire Wire Line
	8050 5200 8125 5200
$Comp
L Connector:TestPoint TP1
U 1 1 65811F73
P 5850 1400
F 0 "TP1" H 5908 1518 50  0000 L CNN
F 1 "+5v" H 5908 1427 50  0000 L CNN
F 2 "rc_light_system:Testpoint" H 6050 1400 50  0001 C CNN
F 3 "~" H 6050 1400 50  0001 C CNN
	1    5850 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 1400 5850 1500
Connection ~ 5850 1500
Wire Wire Line
	4750 1900 5850 1900
$Comp
L Connector:TestPoint TP2
U 1 1 65823CFF
P 6200 1400
F 0 "TP2" H 6258 1518 50  0000 L CNN
F 1 "GND" H 6258 1427 50  0000 L CNN
F 2 "rc_light_system:Testpoint" H 6400 1400 50  0001 C CNN
F 3 "~" H 6400 1400 50  0001 C CNN
	1    6200 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1400 6200 1500
$Comp
L power:GND #PWR0104
U 1 1 65829EA5
P 6200 1500
F 0 "#PWR0104" H 6200 1250 50  0001 C CNN
F 1 "GND" H 6205 1327 50  0000 C CNN
F 2 "" H 6200 1500 50  0001 C CNN
F 3 "" H 6200 1500 50  0001 C CNN
	1    6200 1500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3800 1800 3800 1900
Wire Wire Line
	3800 3850 3800 5425
Text Label 3825 1900 0    50   ~ 0
+6v
$Comp
L Connector:TestPoint TP3
U 1 1 65830E3A
P 3800 1800
F 0 "TP3" H 3858 1918 50  0000 L CNN
F 1 "LED" H 3858 1827 50  0000 L CNN
F 2 "rc_light_system:Testpoint" H 4000 1800 50  0001 C CNN
F 3 "~" H 4000 1800 50  0001 C CNN
	1    3800 1800
	1    0    0    -1  
$EndComp
$EndSCHEMATC
