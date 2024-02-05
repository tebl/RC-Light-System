EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "RC Light System Output Ports"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 "(if you used equal loading resistors)."
Comment4 "Each port is paired, and can be linked to essentially halve the resistance for that port"
$EndDescr
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64E4897F
P 3325 1850
AR Path="/64E4897F" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64E4897F" Ref="J3"  Part="1" 
F 0 "J3" H 3355 1725 50  0000 C CNN
F 1 "FL_A" H 3355 1816 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 3325 1850 50  0001 C CNN
F 3 "~" H 3325 1850 50  0001 C CNN
	1    3325 1850
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64E48992
P 3050 3150
AR Path="/64E48992" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64E48992" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 3050 2900 50  0001 C CNN
F 1 "GND" H 3055 2977 50  0000 C CNN
F 2 "" H 3050 3150 50  0001 C CNN
F 3 "" H 3050 3150 50  0001 C CNN
	1    3050 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64E489A0
P 3050 2575
AR Path="/64E489A0" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E489A0" Ref="R2"  Part="1" 
F 0 "R2" V 2854 2575 50  0000 C CNN
F 1 "51" V 2945 2575 50  0000 C CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3050 2575 50  0001 C CNN
F 3 "~" H 3050 2575 50  0001 C CNN
	1    3050 2575
	1    0    0    1   
$EndComp
Wire Wire Line
	3125 2050 3050 2050
Text GLabel 2950 1950 0    50   Input ~ 0
FL_A
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64E489AB
P 4900 1850
AR Path="/64E489AB" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64E489AB" Ref="J4"  Part="1" 
F 0 "J4" H 4930 1725 50  0000 C CNN
F 1 "FL_B" H 4930 1816 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 4900 1850 50  0001 C CNN
F 3 "~" H 4900 1850 50  0001 C CNN
	1    4900 1850
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64E489BE
P 4625 3150
AR Path="/64E489BE" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64E489BE" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 4625 2900 50  0001 C CNN
F 1 "GND" H 4630 2977 50  0000 C CNN
F 2 "" H 4625 3150 50  0001 C CNN
F 3 "" H 4625 3150 50  0001 C CNN
	1    4625 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64E489CC
P 4625 2575
AR Path="/64E489CC" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E489CC" Ref="R4"  Part="1" 
F 0 "R4" V 4429 2575 50  0000 C CNN
F 1 "51" V 4520 2575 50  0000 C CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4625 2575 50  0001 C CNN
F 3 "~" H 4625 2575 50  0001 C CNN
	1    4625 2575
	1    0    0    1   
$EndComp
Wire Wire Line
	4700 2050 4625 2050
Text GLabel 4525 1950 0    50   Input ~ 0
FL_B
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64E6F072
P 7625 1850
AR Path="/64E6F072" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64E6F072" Ref="J5"  Part="1" 
F 0 "J5" H 7655 1725 50  0000 C CNN
F 1 "BR_A" H 7655 1816 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 7625 1850 50  0001 C CNN
F 3 "~" H 7625 1850 50  0001 C CNN
	1    7625 1850
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64E6F085
P 7350 3150
AR Path="/64E6F085" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64E6F085" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 7350 2900 50  0001 C CNN
F 1 "GND" H 7355 2977 50  0000 C CNN
F 2 "" H 7350 3150 50  0001 C CNN
F 3 "" H 7350 3150 50  0001 C CNN
	1    7350 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64E6F093
P 7350 2575
AR Path="/64E6F093" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E6F093" Ref="R6"  Part="1" 
F 0 "R6" V 7154 2575 50  0000 C CNN
F 1 "200" V 7245 2575 50  0000 C CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 7350 2575 50  0001 C CNN
F 3 "~" H 7350 2575 50  0001 C CNN
	1    7350 2575
	1    0    0    1   
$EndComp
Wire Wire Line
	7425 2050 7350 2050
Text GLabel 7250 1950 0    50   Input ~ 0
BR_A
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64E6F09E
P 9200 1850
AR Path="/64E6F09E" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64E6F09E" Ref="J6"  Part="1" 
F 0 "J6" H 9230 1725 50  0000 C CNN
F 1 "BR_B" H 9230 1816 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 9200 1850 50  0001 C CNN
F 3 "~" H 9200 1850 50  0001 C CNN
	1    9200 1850
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64E6F0B1
P 8925 3150
AR Path="/64E6F0B1" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64E6F0B1" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 8925 2900 50  0001 C CNN
F 1 "GND" H 8930 2977 50  0000 C CNN
F 2 "" H 8925 3150 50  0001 C CNN
F 3 "" H 8925 3150 50  0001 C CNN
	1    8925 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64E6F0BF
P 8925 2575
AR Path="/64E6F0BF" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E6F0BF" Ref="R8"  Part="1" 
F 0 "R8" V 8729 2575 50  0000 C CNN
F 1 "200" V 8820 2575 50  0000 C CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 8925 2575 50  0001 C CNN
F 3 "~" H 8925 2575 50  0001 C CNN
	1    8925 2575
	1    0    0    1   
$EndComp
Wire Wire Line
	9000 2050 8925 2050
Text GLabel 8825 1950 0    50   Input ~ 0
BR_B
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64E9431B
P 3325 4825
AR Path="/64E9431B" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64E9431B" Ref="J7"  Part="1" 
F 0 "J7" H 3355 4700 50  0000 C CNN
F 1 "BL_L" H 3355 4791 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 3325 4825 50  0001 C CNN
F 3 "~" H 3325 4825 50  0001 C CNN
	1    3325 4825
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64E9432E
P 3050 6200
AR Path="/64E9432E" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64E9432E" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 3050 5950 50  0001 C CNN
F 1 "GND" H 3055 6027 50  0000 C CNN
F 2 "" H 3050 6200 50  0001 C CNN
F 3 "" H 3050 6200 50  0001 C CNN
	1    3050 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64E9433C
P 3050 5550
AR Path="/64E9433C" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E9433C" Ref="R10"  Part="1" 
F 0 "R10" V 2854 5550 50  0000 C CNN
F 1 "180" V 2945 5550 50  0000 C CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3050 5550 50  0001 C CNN
F 3 "~" H 3050 5550 50  0001 C CNN
	1    3050 5550
	1    0    0    1   
$EndComp
Wire Wire Line
	3125 5025 3050 5025
Text GLabel 2950 4925 0    50   Input ~ 0
BL_L
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64E94347
P 4900 4825
AR Path="/64E94347" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64E94347" Ref="J8"  Part="1" 
F 0 "J8" H 4930 4700 50  0000 C CNN
F 1 "BL_R" H 4930 4791 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 4900 4825 50  0001 C CNN
F 3 "~" H 4900 4825 50  0001 C CNN
	1    4900 4825
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64E9435A
P 4625 6200
AR Path="/64E9435A" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64E9435A" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 4625 5950 50  0001 C CNN
F 1 "GND" H 4630 6027 50  0000 C CNN
F 2 "" H 4625 6200 50  0001 C CNN
F 3 "" H 4625 6200 50  0001 C CNN
	1    4625 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64E94368
P 4625 5550
AR Path="/64E94368" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E94368" Ref="R12"  Part="1" 
F 0 "R12" V 4429 5550 50  0000 C CNN
F 1 "180" V 4520 5550 50  0000 C CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4625 5550 50  0001 C CNN
F 3 "~" H 4625 5550 50  0001 C CNN
	1    4625 5550
	1    0    0    1   
$EndComp
Wire Wire Line
	4700 5025 4625 5025
Text GLabel 4525 4925 0    50   Input ~ 0
BL_R
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64EAD0B8
P 7625 4825
AR Path="/64EAD0B8" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64EAD0B8" Ref="J9"  Part="1" 
F 0 "J9" H 7655 4700 50  0000 C CNN
F 1 "EX_A" H 7655 4791 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 7625 4825 50  0001 C CNN
F 3 "~" H 7625 4825 50  0001 C CNN
	1    7625 4825
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64EAD0CB
P 7350 6200
AR Path="/64EAD0CB" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64EAD0CB" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 7350 5950 50  0001 C CNN
F 1 "GND" H 7355 6027 50  0000 C CNN
F 2 "" H 7350 6200 50  0001 C CNN
F 3 "" H 7350 6200 50  0001 C CNN
	1    7350 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64EAD0D9
P 7350 5550
AR Path="/64EAD0D9" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64EAD0D9" Ref="R14"  Part="1" 
F 0 "R14" V 7154 5550 50  0000 C CNN
F 1 "10" V 7245 5550 50  0000 C CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 7350 5550 50  0001 C CNN
F 3 "~" H 7350 5550 50  0001 C CNN
	1    7350 5550
	1    0    0    1   
$EndComp
Wire Wire Line
	7425 5025 7350 5025
Text GLabel 7250 4925 0    50   Input ~ 0
EX_A
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64EAD0E4
P 9200 4825
AR Path="/64EAD0E4" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64EAD0E4" Ref="J10"  Part="1" 
F 0 "J10" H 9230 4700 50  0000 C CNN
F 1 "EX_B" H 9230 4791 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 9200 4825 50  0001 C CNN
F 3 "~" H 9200 4825 50  0001 C CNN
	1    9200 4825
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64EAD0F7
P 8925 6200
AR Path="/64EAD0F7" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64EAD0F7" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 8925 5950 50  0001 C CNN
F 1 "GND" H 8930 6027 50  0000 C CNN
F 2 "" H 8925 6200 50  0001 C CNN
F 3 "" H 8925 6200 50  0001 C CNN
	1    8925 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64EAD105
P 8925 5550
AR Path="/64EAD105" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64EAD105" Ref="R16"  Part="1" 
F 0 "R16" V 8729 5550 50  0000 C CNN
F 1 "10" V 8820 5550 50  0000 C CNN
F 2 "resistor:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 8925 5550 50  0001 C CNN
F 3 "~" H 8925 5550 50  0001 C CNN
	1    8925 5550
	1    0    0    1   
$EndComp
Wire Wire Line
	9000 5025 8925 5025
Text GLabel 8825 4925 0    50   Input ~ 0
EX_B
Text Notes 550  1100 0    50   ~ 0
VCC when calculating LED loading resistors\nhave been assumed to be at 8V, but you're\nreally supposed to do the actual calculations\nusing real information about how you're wiring\nit up and the components you're using.\n\nhttps://ledcalculator.net/
Wire Wire Line
	3050 2050 3050 2475
Wire Wire Line
	4625 2050 4625 2475
Wire Wire Line
	2950 1950 3125 1950
Wire Wire Line
	4525 1950 4700 1950
Wire Wire Line
	3050 2675 3050 3150
Wire Wire Line
	4625 2675 4625 3150
Wire Wire Line
	7350 2050 7350 2475
Wire Wire Line
	8925 2050 8925 2475
Wire Wire Line
	7250 1950 7425 1950
Wire Wire Line
	8825 1950 9000 1950
Wire Wire Line
	3050 5025 3050 5450
Wire Wire Line
	4625 5025 4625 5450
Wire Wire Line
	7350 5025 7350 5450
Wire Wire Line
	8925 5025 8925 5450
Wire Wire Line
	7250 4925 7425 4925
Wire Wire Line
	8825 4925 9000 4925
Wire Wire Line
	2950 4925 3125 4925
Wire Wire Line
	4525 4925 4700 4925
Wire Wire Line
	7350 2675 7350 3150
Wire Wire Line
	8925 2675 8925 3150
Wire Wire Line
	3050 5650 3050 6200
Wire Wire Line
	4625 5650 4625 6200
Wire Wire Line
	7350 5650 7350 6200
Wire Wire Line
	8925 5650 8925 6200
$EndSCHEMATC
