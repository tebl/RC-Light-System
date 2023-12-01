EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "RC Exhaust Digispark"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 "them using a Digispark."
Comment4 "Found some exhaust tubes for a 1:10 model on AliExpress, let's add some glow effects to"
$EndDescr
$Comp
L rc_light_system:Conn_Input J5
U 1 1 64E92EE3
P 3225 3200
F 0 "J5" H 3530 3242 50  0000 L CNN
F 1 "THR" H 3530 3151 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3225 3200 50  0001 C CNN
F 3 "~" H 3225 3200 50  0001 C CNN
	1    3225 3200
	-1   0    0    -1  
$EndComp
$Comp
L rc_light_system:Conn_Channel_Output J6
U 1 1 64E92EE9
P 3225 3525
F 0 "J6" H 3530 3567 50  0000 L CNN
F 1 "THR_Y" H 3530 3476 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3225 3525 50  0001 C CNN
F 3 "~" H 3225 3525 50  0001 C CNN
	1    3225 3525
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3575 3200 3575 3525
Wire Wire Line
	3650 3425 3650 3100
Wire Wire Line
	3650 3425 3650 3700
Connection ~ 3650 3425
$Comp
L power:GND #PWR02
U 1 1 64E92EF3
P 3650 3700
F 0 "#PWR02" H 3650 3450 50  0001 C CNN
F 1 "GND" H 3655 3527 50  0000 C CNN
F 2 "" H 3650 3700 50  0001 C CNN
F 3 "" H 3650 3700 50  0001 C CNN
	1    3650 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3575 3200 3425 3200
Wire Wire Line
	3650 3100 3425 3100
Wire Wire Line
	3650 3425 3425 3425
Wire Wire Line
	3575 3525 3425 3525
Wire Wire Line
	3425 3300 3500 3300
Wire Wire Line
	3500 3300 3500 3625
Wire Wire Line
	3500 3625 3425 3625
Connection ~ 3500 3300
Wire Wire Line
	3575 3200 3725 3200
Connection ~ 3575 3200
Text GLabel 4550 3300 2    50   Output ~ 0
THR
$Comp
L Device:R_Small R1
U 1 1 64ECF255
P 7900 2725
F 0 "R1" H 7959 2771 50  0000 L CNN
F 1 "270" H 7959 2680 50  0000 L CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 7900 2725 50  0001 C CNN
F 3 "~" H 7900 2725 50  0001 C CNN
	1    7900 2725
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 64ED38BC
P 8350 2725
F 0 "R2" H 8409 2771 50  0000 L CNN
F 1 "270" H 8409 2680 50  0000 L CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 8350 2725 50  0001 C CNN
F 3 "~" H 8350 2725 50  0001 C CNN
	1    8350 2725
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 650115B7
P 8800 2725
F 0 "R3" H 8859 2771 50  0000 L CNN
F 1 "270" H 8859 2680 50  0000 L CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 8800 2725 50  0001 C CNN
F 3 "~" H 8800 2725 50  0001 C CNN
	1    8800 2725
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 650152BE
P 4225 3300
F 0 "R4" V 4375 3275 50  0000 L CNN
F 1 "10k" V 4300 3225 50  0000 L CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4225 3300 50  0001 C CNN
F 3 "~" H 4225 3300 50  0001 C CNN
	1    4225 3300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 65018C06
P 4400 3475
F 0 "R5" H 4459 3521 50  0000 L CNN
F 1 "20k" H 4459 3430 50  0000 L CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4400 3475 50  0001 C CNN
F 3 "~" H 4400 3475 50  0001 C CNN
	1    4400 3475
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 6501AAA2
P 4400 3650
F 0 "#PWR0107" H 4400 3400 50  0001 C CNN
F 1 "GND" H 4405 3477 50  0000 C CNN
F 2 "" H 4400 3650 50  0001 C CNN
F 3 "" H 4400 3650 50  0001 C CNN
	1    4400 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4400 3575 4400 3650
Wire Wire Line
	4400 3300 4400 3375
Wire Wire Line
	4400 3300 4325 3300
Connection ~ 4400 3300
Wire Wire Line
	4400 3300 4550 3300
$Comp
L Device:LED_RAGB D1
U 1 1 65190DA5
P 8350 2275
F 0 "D1" V 8396 1945 50  0000 R CNN
F 1 "LED_RGBA" V 8305 1945 50  0000 R CNN
F 2 "Connector_JST:JST_XH_B4B-XH-A_1x04_P2.50mm_Vertical" H 8350 2225 50  0001 C CNN
F 3 "~" H 8350 2225 50  0001 C CNN
	1    8350 2275
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8800 2625 8800 2550
Wire Wire Line
	8800 2550 8550 2550
Wire Wire Line
	8550 2550 8550 2475
Wire Wire Line
	8150 2475 8150 2550
Wire Wire Line
	8150 2550 7900 2550
Wire Wire Line
	7900 2550 7900 2625
Wire Wire Line
	8350 2475 8350 2625
$Comp
L digispark:Digispark A1
U 1 1 65687FC8
P 6900 3375
F 0 "A1" H 5873 3421 50  0000 R CNN
F 1 "Digispark" H 5873 3330 50  0000 R CNN
F 2 "Digispark:Digispark" H 6250 2775 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 6900 3375 50  0001 C CNN
	1    6900 3375
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 6568975B
P 6700 3975
F 0 "#PWR0105" H 6700 3725 50  0001 C CNN
F 1 "GND" H 6705 3802 50  0000 C CNN
F 2 "" H 6700 3975 50  0001 C CNN
F 3 "" H 6700 3975 50  0001 C CNN
	1    6700 3975
	-1   0    0    -1  
$EndComp
NoConn ~ 6800 2775
Wire Wire Line
	7500 3625 7900 3625
Wire Wire Line
	7900 3625 7900 2825
Wire Wire Line
	8350 2825 8350 3525
Wire Wire Line
	8350 3525 7500 3525
Wire Wire Line
	8800 2825 8800 3225
Wire Wire Line
	8800 3225 7500 3225
Text Label 7600 3625 0    50   ~ 0
RGB_R
Text Label 7600 3525 0    50   ~ 0
RGB_G
Text Label 7600 3225 0    50   ~ 0
RGB_B
NoConn ~ 7500 3125
NoConn ~ 7500 3325
Text GLabel 8875 3425 2    50   Input ~ 0
THR
Wire Wire Line
	7500 3425 8875 3425
Wire Wire Line
	8350 2000 8350 2075
Wire Wire Line
	6600 2000 6600 2775
Connection ~ 6600 2000
Wire Wire Line
	6600 2000 8350 2000
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 656F33C7
P 6600 2000
F 0 "#FLG0101" H 6600 2075 50  0001 C CNN
F 1 "PWR_FLAG" H 6600 2173 50  0000 C CNN
F 2 "" H 6600 2000 50  0001 C CNN
F 3 "~" H 6600 2000 50  0001 C CNN
	1    6600 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NO_Small JP1
U 1 1 657269D8
P 4225 3050
F 0 "JP1" H 4225 3235 50  0000 C CNN
F 1 "NO_VOL_DIV" H 4225 3144 50  0000 C CNN
F 2 "solder_bridge:bridge_open" H 4225 3050 50  0001 C CNN
F 3 "~" H 4225 3050 50  0001 C CNN
	1    4225 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3300 4400 3050
Wire Wire Line
	4400 3050 4325 3050
Wire Wire Line
	4125 3300 4050 3300
Wire Wire Line
	4050 3300 4050 3050
Wire Wire Line
	4050 3050 4125 3050
Wire Wire Line
	3500 3300 4050 3300
Connection ~ 4050 3300
Text Notes 3900 4200 0    50   ~ 0
Only short JP1 if signal voltage\nis safe for Digispark, R4 and R5\nwould then not be installed.
$Comp
L Diode:1N4001 D2
U 1 1 6573AEEF
P 5225 2000
F 0 "D2" H 5225 1783 50  0000 C CNN
F 1 "1N4001" H 5225 1874 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5225 1825 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 5225 2000 50  0001 C CNN
	1    5225 2000
	-1   0    0    1   
$EndComp
$Comp
L Device:Jumper_NC_Small JP2
U 1 1 65747905
P 5575 2000
F 0 "JP2" H 5575 2185 50  0000 C CNN
F 1 "POWER" H 5575 2094 50  0000 C CNN
F 2 "solder_bridge:bridge" H 5575 2000 50  0001 C CNN
F 3 "~" H 5575 2000 50  0001 C CNN
	1    5575 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5475 2000 5375 2000
Text Notes 5750 1625 0    50   ~ 0
JP2 is normally shorted so that power\nis taken from the receiver, only reason\nto not link it is when doing active code\ndevelopment.
Text Label 3450 3200 0    50   ~ 0
6v
Wire Wire Line
	3725 2000 3725 3200
Wire Wire Line
	3725 2000 5075 2000
Wire Wire Line
	5675 2000 6600 2000
Text Notes 9200 3350 0    50   ~ 0
WARNING: The Attiny85 has limited capability\nto sink current, resistors therefore need to be \nlimited to ensure a maximum combined current\nof around 60mA. Beyond that it will most likely\nburn out.\n\nUse an online calculator if you are unsure what\nto use. Input voltage 5v, around 15mA per LED\nand select forward voltage according to the\ncolour (Red, Green, Blue).
$EndSCHEMATC
