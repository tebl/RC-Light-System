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
L Jumper:SolderJumper_2_Open JP?
U 1 1 64E48979
P 3850 2325
AR Path="/64E48979" Ref="JP?"  Part="1" 
AR Path="/64E3CE93/64E48979" Ref="JP1"  Part="1" 
F 0 "JP1" H 3850 2100 50  0000 C CNN
F 1 "FL_LINK" H 3850 2191 50  0000 C CNN
F 2 "" H 3850 2325 50  0001 C CNN
F 3 "~" H 3850 2325 50  0001 C CNN
	1    3850 2325
	-1   0    0    1   
$EndComp
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64E4897F
P 3325 1850
AR Path="/64E4897F" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64E4897F" Ref="J3"  Part="1" 
F 0 "J3" H 3355 1725 50  0000 C CNN
F 1 "FL_A" H 3355 1816 50  0000 C CNN
F 2 "" H 3325 1850 50  0001 C CNN
F 3 "~" H 3325 1850 50  0001 C CNN
	1    3325 1850
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64E48985
P 2575 2875
AR Path="/64E48985" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E48985" Ref="R1"  Part="1" 
F 0 "R1" V 2379 2875 50  0000 C CNN
F 1 "4k7" V 2470 2875 50  0000 C CNN
F 2 "" H 2575 2875 50  0001 C CNN
F 3 "~" H 2575 2875 50  0001 C CNN
	1    2575 2875
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 64E4898B
P 2950 2875
AR Path="/64E4898B" Ref="Q?"  Part="1" 
AR Path="/64E3CE93/64E4898B" Ref="Q1"  Part="1" 
F 0 "Q1" H 3140 2921 50  0000 L CNN
F 1 "2N2222" H 3140 2830 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 3150 2800 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 2950 2875 50  0001 L CNN
	1    2950 2875
	1    0    0    -1  
$EndComp
Wire Wire Line
	2675 2875 2750 2875
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
Wire Wire Line
	3050 3075 3050 3150
$Comp
L power:VCC #PWR?
U 1 1 64E48999
P 3050 1875
AR Path="/64E48999" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64E48999" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 3050 1725 50  0001 C CNN
F 1 "VCC" H 3065 2048 50  0000 C CNN
F 2 "" H 3050 1875 50  0001 C CNN
F 3 "" H 3050 1875 50  0001 C CNN
	1    3050 1875
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1875 3050 1950
$Comp
L Device:R_Small R?
U 1 1 64E489A0
P 3050 2575
AR Path="/64E489A0" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E489A0" Ref="R2"  Part="1" 
F 0 "R2" V 2854 2575 50  0000 C CNN
F 1 "51" V 2945 2575 50  0000 C CNN
F 2 "" H 3050 2575 50  0001 C CNN
F 3 "~" H 3050 2575 50  0001 C CNN
	1    3050 2575
	1    0    0    1   
$EndComp
Wire Wire Line
	3050 1950 3125 1950
Wire Wire Line
	3125 2050 3050 2050
Text GLabel 2375 2875 0    50   Input ~ 0
FL_A
Wire Wire Line
	2375 2875 2475 2875
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64E489AB
P 4900 1850
AR Path="/64E489AB" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64E489AB" Ref="J4"  Part="1" 
F 0 "J4" H 4930 1725 50  0000 C CNN
F 1 "FL_B" H 4930 1816 50  0000 C CNN
F 2 "" H 4900 1850 50  0001 C CNN
F 3 "~" H 4900 1850 50  0001 C CNN
	1    4900 1850
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64E489B1
P 4150 2875
AR Path="/64E489B1" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E489B1" Ref="R3"  Part="1" 
F 0 "R3" V 3954 2875 50  0000 C CNN
F 1 "4k7" V 4045 2875 50  0000 C CNN
F 2 "" H 4150 2875 50  0001 C CNN
F 3 "~" H 4150 2875 50  0001 C CNN
	1    4150 2875
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 64E489B7
P 4525 2875
AR Path="/64E489B7" Ref="Q?"  Part="1" 
AR Path="/64E3CE93/64E489B7" Ref="Q2"  Part="1" 
F 0 "Q2" H 4715 2921 50  0000 L CNN
F 1 "2N2222" H 4715 2830 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4725 2800 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 4525 2875 50  0001 L CNN
	1    4525 2875
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2875 4325 2875
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
Wire Wire Line
	4625 3075 4625 3150
$Comp
L power:VCC #PWR?
U 1 1 64E489C5
P 4625 1875
AR Path="/64E489C5" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64E489C5" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 4625 1725 50  0001 C CNN
F 1 "VCC" H 4640 2048 50  0000 C CNN
F 2 "" H 4625 1875 50  0001 C CNN
F 3 "" H 4625 1875 50  0001 C CNN
	1    4625 1875
	1    0    0    -1  
$EndComp
Wire Wire Line
	4625 1875 4625 1950
$Comp
L Device:R_Small R?
U 1 1 64E489CC
P 4625 2575
AR Path="/64E489CC" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E489CC" Ref="R4"  Part="1" 
F 0 "R4" V 4429 2575 50  0000 C CNN
F 1 "51" V 4520 2575 50  0000 C CNN
F 2 "" H 4625 2575 50  0001 C CNN
F 3 "~" H 4625 2575 50  0001 C CNN
	1    4625 2575
	1    0    0    1   
$EndComp
Wire Wire Line
	4625 1950 4700 1950
Wire Wire Line
	4700 2050 4625 2050
Text GLabel 3950 2875 0    50   Input ~ 0
FL_B
Wire Wire Line
	3950 2875 4050 2875
Wire Wire Line
	3700 2325 3050 2325
Wire Wire Line
	3050 2475 3050 2325
Connection ~ 3050 2325
Wire Wire Line
	4000 2325 4625 2325
Wire Wire Line
	4625 2325 4625 2475
Connection ~ 4625 2325
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 64E6F06C
P 8150 2325
AR Path="/64E6F06C" Ref="JP?"  Part="1" 
AR Path="/64E3CE93/64E6F06C" Ref="JP2"  Part="1" 
F 0 "JP2" H 8150 2100 50  0000 C CNN
F 1 "BR_LINK" H 8150 2191 50  0000 C CNN
F 2 "" H 8150 2325 50  0001 C CNN
F 3 "~" H 8150 2325 50  0001 C CNN
	1    8150 2325
	-1   0    0    1   
$EndComp
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64E6F072
P 7625 1850
AR Path="/64E6F072" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64E6F072" Ref="J5"  Part="1" 
F 0 "J5" H 7655 1725 50  0000 C CNN
F 1 "BR_A" H 7655 1816 50  0000 C CNN
F 2 "" H 7625 1850 50  0001 C CNN
F 3 "~" H 7625 1850 50  0001 C CNN
	1    7625 1850
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64E6F078
P 6875 2875
AR Path="/64E6F078" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E6F078" Ref="R5"  Part="1" 
F 0 "R5" V 6679 2875 50  0000 C CNN
F 1 "4k7" V 6770 2875 50  0000 C CNN
F 2 "" H 6875 2875 50  0001 C CNN
F 3 "~" H 6875 2875 50  0001 C CNN
	1    6875 2875
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 64E6F07E
P 7250 2875
AR Path="/64E6F07E" Ref="Q?"  Part="1" 
AR Path="/64E3CE93/64E6F07E" Ref="Q3"  Part="1" 
F 0 "Q3" H 7440 2921 50  0000 L CNN
F 1 "2N2222" H 7440 2830 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7450 2800 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 7250 2875 50  0001 L CNN
	1    7250 2875
	1    0    0    -1  
$EndComp
Wire Wire Line
	6975 2875 7050 2875
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
Wire Wire Line
	7350 3075 7350 3150
$Comp
L power:VCC #PWR?
U 1 1 64E6F08C
P 7350 1875
AR Path="/64E6F08C" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64E6F08C" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 7350 1725 50  0001 C CNN
F 1 "VCC" H 7365 2048 50  0000 C CNN
F 2 "" H 7350 1875 50  0001 C CNN
F 3 "" H 7350 1875 50  0001 C CNN
	1    7350 1875
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 1875 7350 1950
$Comp
L Device:R_Small R?
U 1 1 64E6F093
P 7350 2575
AR Path="/64E6F093" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E6F093" Ref="R6"  Part="1" 
F 0 "R6" V 7154 2575 50  0000 C CNN
F 1 "200" V 7245 2575 50  0000 C CNN
F 2 "" H 7350 2575 50  0001 C CNN
F 3 "~" H 7350 2575 50  0001 C CNN
	1    7350 2575
	1    0    0    1   
$EndComp
Wire Wire Line
	7350 1950 7425 1950
Wire Wire Line
	7425 2050 7350 2050
Text GLabel 6675 2875 0    50   Input ~ 0
BR_A
Wire Wire Line
	6675 2875 6775 2875
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64E6F09E
P 9200 1850
AR Path="/64E6F09E" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64E6F09E" Ref="J6"  Part="1" 
F 0 "J6" H 9230 1725 50  0000 C CNN
F 1 "BR_B" H 9230 1816 50  0000 C CNN
F 2 "" H 9200 1850 50  0001 C CNN
F 3 "~" H 9200 1850 50  0001 C CNN
	1    9200 1850
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64E6F0A4
P 8450 2875
AR Path="/64E6F0A4" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E6F0A4" Ref="R7"  Part="1" 
F 0 "R7" V 8254 2875 50  0000 C CNN
F 1 "4k7" V 8345 2875 50  0000 C CNN
F 2 "" H 8450 2875 50  0001 C CNN
F 3 "~" H 8450 2875 50  0001 C CNN
	1    8450 2875
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 64E6F0AA
P 8825 2875
AR Path="/64E6F0AA" Ref="Q?"  Part="1" 
AR Path="/64E3CE93/64E6F0AA" Ref="Q4"  Part="1" 
F 0 "Q4" H 9015 2921 50  0000 L CNN
F 1 "2N2222" H 9015 2830 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 9025 2800 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 8825 2875 50  0001 L CNN
	1    8825 2875
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 2875 8625 2875
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
Wire Wire Line
	8925 3075 8925 3150
$Comp
L power:VCC #PWR?
U 1 1 64E6F0B8
P 8925 1875
AR Path="/64E6F0B8" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64E6F0B8" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 8925 1725 50  0001 C CNN
F 1 "VCC" H 8940 2048 50  0000 C CNN
F 2 "" H 8925 1875 50  0001 C CNN
F 3 "" H 8925 1875 50  0001 C CNN
	1    8925 1875
	1    0    0    -1  
$EndComp
Wire Wire Line
	8925 1875 8925 1950
$Comp
L Device:R_Small R?
U 1 1 64E6F0BF
P 8925 2575
AR Path="/64E6F0BF" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E6F0BF" Ref="R8"  Part="1" 
F 0 "R8" V 8729 2575 50  0000 C CNN
F 1 "200" V 8820 2575 50  0000 C CNN
F 2 "" H 8925 2575 50  0001 C CNN
F 3 "~" H 8925 2575 50  0001 C CNN
	1    8925 2575
	1    0    0    1   
$EndComp
Wire Wire Line
	8925 1950 9000 1950
Wire Wire Line
	9000 2050 8925 2050
Text GLabel 8250 2875 0    50   Input ~ 0
BR_B
Wire Wire Line
	8250 2875 8350 2875
Wire Wire Line
	8000 2325 7350 2325
Wire Wire Line
	7350 2475 7350 2325
Connection ~ 7350 2325
Wire Wire Line
	8300 2325 8925 2325
Wire Wire Line
	8925 2325 8925 2475
Connection ~ 8925 2325
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 64E94315
P 3850 5300
AR Path="/64E94315" Ref="JP?"  Part="1" 
AR Path="/64E3CE93/64E94315" Ref="JP3"  Part="1" 
F 0 "JP3" H 3850 5075 50  0000 C CNN
F 1 "BL_LINK" H 3850 5166 50  0000 C CNN
F 2 "" H 3850 5300 50  0001 C CNN
F 3 "~" H 3850 5300 50  0001 C CNN
	1    3850 5300
	-1   0    0    1   
$EndComp
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64E9431B
P 3325 4825
AR Path="/64E9431B" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64E9431B" Ref="J7"  Part="1" 
F 0 "J7" H 3355 4700 50  0000 C CNN
F 1 "BL_L" H 3355 4791 50  0000 C CNN
F 2 "" H 3325 4825 50  0001 C CNN
F 3 "~" H 3325 4825 50  0001 C CNN
	1    3325 4825
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64E94321
P 2575 5925
AR Path="/64E94321" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E94321" Ref="R9"  Part="1" 
F 0 "R9" V 2379 5925 50  0000 C CNN
F 1 "4k7" V 2470 5925 50  0000 C CNN
F 2 "" H 2575 5925 50  0001 C CNN
F 3 "~" H 2575 5925 50  0001 C CNN
	1    2575 5925
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 64E94327
P 2950 5925
AR Path="/64E94327" Ref="Q?"  Part="1" 
AR Path="/64E3CE93/64E94327" Ref="Q5"  Part="1" 
F 0 "Q5" H 3140 5971 50  0000 L CNN
F 1 "2N2222" H 3140 5880 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 3150 5850 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 2950 5925 50  0001 L CNN
	1    2950 5925
	1    0    0    -1  
$EndComp
Wire Wire Line
	2675 5925 2750 5925
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
Wire Wire Line
	3050 6125 3050 6200
$Comp
L power:VCC #PWR?
U 1 1 64E94335
P 3050 4850
AR Path="/64E94335" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64E94335" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 3050 4700 50  0001 C CNN
F 1 "VCC" H 3065 5023 50  0000 C CNN
F 2 "" H 3050 4850 50  0001 C CNN
F 3 "" H 3050 4850 50  0001 C CNN
	1    3050 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4850 3050 4925
$Comp
L Device:R_Small R?
U 1 1 64E9433C
P 3050 5550
AR Path="/64E9433C" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E9433C" Ref="R10"  Part="1" 
F 0 "R10" V 2854 5550 50  0000 C CNN
F 1 "180" V 2945 5550 50  0000 C CNN
F 2 "" H 3050 5550 50  0001 C CNN
F 3 "~" H 3050 5550 50  0001 C CNN
	1    3050 5550
	1    0    0    1   
$EndComp
Wire Wire Line
	3050 4925 3125 4925
Wire Wire Line
	3125 5025 3050 5025
Wire Wire Line
	3050 5725 3050 5650
Text GLabel 2375 5925 0    50   Input ~ 0
BL_L
Wire Wire Line
	2375 5925 2475 5925
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64E94347
P 4900 4825
AR Path="/64E94347" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64E94347" Ref="J8"  Part="1" 
F 0 "J8" H 4930 4700 50  0000 C CNN
F 1 "BL_R" H 4930 4791 50  0000 C CNN
F 2 "" H 4900 4825 50  0001 C CNN
F 3 "~" H 4900 4825 50  0001 C CNN
	1    4900 4825
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64E9434D
P 4150 5925
AR Path="/64E9434D" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E9434D" Ref="R11"  Part="1" 
F 0 "R11" V 3954 5925 50  0000 C CNN
F 1 "4k7" V 4045 5925 50  0000 C CNN
F 2 "" H 4150 5925 50  0001 C CNN
F 3 "~" H 4150 5925 50  0001 C CNN
	1    4150 5925
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 64E94353
P 4525 5925
AR Path="/64E94353" Ref="Q?"  Part="1" 
AR Path="/64E3CE93/64E94353" Ref="Q6"  Part="1" 
F 0 "Q6" H 4715 5971 50  0000 L CNN
F 1 "2N2222" H 4715 5880 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4725 5850 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 4525 5925 50  0001 L CNN
	1    4525 5925
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 5925 4325 5925
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
Wire Wire Line
	4625 6125 4625 6200
$Comp
L power:VCC #PWR?
U 1 1 64E94361
P 4625 4850
AR Path="/64E94361" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64E94361" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 4625 4700 50  0001 C CNN
F 1 "VCC" H 4640 5023 50  0000 C CNN
F 2 "" H 4625 4850 50  0001 C CNN
F 3 "" H 4625 4850 50  0001 C CNN
	1    4625 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4625 4850 4625 4925
$Comp
L Device:R_Small R?
U 1 1 64E94368
P 4625 5550
AR Path="/64E94368" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64E94368" Ref="R12"  Part="1" 
F 0 "R12" V 4429 5550 50  0000 C CNN
F 1 "180" V 4520 5550 50  0000 C CNN
F 2 "" H 4625 5550 50  0001 C CNN
F 3 "~" H 4625 5550 50  0001 C CNN
	1    4625 5550
	1    0    0    1   
$EndComp
Wire Wire Line
	4625 4925 4700 4925
Wire Wire Line
	4700 5025 4625 5025
Wire Wire Line
	4625 5725 4625 5650
Text GLabel 3950 5925 0    50   Input ~ 0
BL_R
Wire Wire Line
	3950 5925 4050 5925
Wire Wire Line
	3700 5300 3050 5300
Wire Wire Line
	3050 5450 3050 5300
Connection ~ 3050 5300
Wire Wire Line
	4000 5300 4625 5300
Wire Wire Line
	4625 5300 4625 5450
Connection ~ 4625 5300
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 64EAD0B2
P 8150 5300
AR Path="/64EAD0B2" Ref="JP?"  Part="1" 
AR Path="/64E3CE93/64EAD0B2" Ref="JP4"  Part="1" 
F 0 "JP4" H 8150 5075 50  0000 C CNN
F 1 "EX_LINK" H 8150 5166 50  0000 C CNN
F 2 "" H 8150 5300 50  0001 C CNN
F 3 "~" H 8150 5300 50  0001 C CNN
	1    8150 5300
	-1   0    0    1   
$EndComp
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64EAD0B8
P 7625 4825
AR Path="/64EAD0B8" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64EAD0B8" Ref="J9"  Part="1" 
F 0 "J9" H 7655 4700 50  0000 C CNN
F 1 "EX_A" H 7655 4791 50  0000 C CNN
F 2 "" H 7625 4825 50  0001 C CNN
F 3 "~" H 7625 4825 50  0001 C CNN
	1    7625 4825
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64EAD0BE
P 6875 5925
AR Path="/64EAD0BE" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64EAD0BE" Ref="R13"  Part="1" 
F 0 "R13" V 6679 5925 50  0000 C CNN
F 1 "4k7" V 6770 5925 50  0000 C CNN
F 2 "" H 6875 5925 50  0001 C CNN
F 3 "~" H 6875 5925 50  0001 C CNN
	1    6875 5925
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 64EAD0C4
P 7250 5925
AR Path="/64EAD0C4" Ref="Q?"  Part="1" 
AR Path="/64E3CE93/64EAD0C4" Ref="Q7"  Part="1" 
F 0 "Q7" H 7440 5971 50  0000 L CNN
F 1 "2N2222" H 7440 5880 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7450 5850 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 7250 5925 50  0001 L CNN
	1    7250 5925
	1    0    0    -1  
$EndComp
Wire Wire Line
	6975 5925 7050 5925
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
Wire Wire Line
	7350 6125 7350 6200
$Comp
L power:VCC #PWR?
U 1 1 64EAD0D2
P 7350 4850
AR Path="/64EAD0D2" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64EAD0D2" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 7350 4700 50  0001 C CNN
F 1 "VCC" H 7365 5023 50  0000 C CNN
F 2 "" H 7350 4850 50  0001 C CNN
F 3 "" H 7350 4850 50  0001 C CNN
	1    7350 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4850 7350 4925
$Comp
L Device:R_Small R?
U 1 1 64EAD0D9
P 7350 5550
AR Path="/64EAD0D9" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64EAD0D9" Ref="R14"  Part="1" 
F 0 "R14" V 7154 5550 50  0000 C CNN
F 1 "4k7" V 7245 5550 50  0000 C CNN
F 2 "" H 7350 5550 50  0001 C CNN
F 3 "~" H 7350 5550 50  0001 C CNN
	1    7350 5550
	1    0    0    1   
$EndComp
Wire Wire Line
	7350 4925 7425 4925
Wire Wire Line
	7425 5025 7350 5025
Wire Wire Line
	7350 5725 7350 5650
Text GLabel 6675 5925 0    50   Input ~ 0
EX_A
Wire Wire Line
	6675 5925 6775 5925
$Comp
L rc_light_system:Conn_Light_Port J?
U 1 1 64EAD0E4
P 9200 4825
AR Path="/64EAD0E4" Ref="J?"  Part="1" 
AR Path="/64E3CE93/64EAD0E4" Ref="J10"  Part="1" 
F 0 "J10" H 9230 4700 50  0000 C CNN
F 1 "EX_B" H 9230 4791 50  0000 C CNN
F 2 "" H 9200 4825 50  0001 C CNN
F 3 "~" H 9200 4825 50  0001 C CNN
	1    9200 4825
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 64EAD0EA
P 8450 5925
AR Path="/64EAD0EA" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64EAD0EA" Ref="R15"  Part="1" 
F 0 "R15" V 8254 5925 50  0000 C CNN
F 1 "4k7" V 8345 5925 50  0000 C CNN
F 2 "" H 8450 5925 50  0001 C CNN
F 3 "~" H 8450 5925 50  0001 C CNN
	1    8450 5925
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 64EAD0F0
P 8825 5925
AR Path="/64EAD0F0" Ref="Q?"  Part="1" 
AR Path="/64E3CE93/64EAD0F0" Ref="Q8"  Part="1" 
F 0 "Q8" H 9015 5971 50  0000 L CNN
F 1 "2N2222" H 9015 5880 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 9025 5850 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 8825 5925 50  0001 L CNN
	1    8825 5925
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 5925 8625 5925
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
Wire Wire Line
	8925 6125 8925 6200
$Comp
L power:VCC #PWR?
U 1 1 64EAD0FE
P 8925 4850
AR Path="/64EAD0FE" Ref="#PWR?"  Part="1" 
AR Path="/64E3CE93/64EAD0FE" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 8925 4700 50  0001 C CNN
F 1 "VCC" H 8940 5023 50  0000 C CNN
F 2 "" H 8925 4850 50  0001 C CNN
F 3 "" H 8925 4850 50  0001 C CNN
	1    8925 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8925 4850 8925 4925
$Comp
L Device:R_Small R?
U 1 1 64EAD105
P 8925 5550
AR Path="/64EAD105" Ref="R?"  Part="1" 
AR Path="/64E3CE93/64EAD105" Ref="R16"  Part="1" 
F 0 "R16" V 8729 5550 50  0000 C CNN
F 1 "4k7" V 8820 5550 50  0000 C CNN
F 2 "" H 8925 5550 50  0001 C CNN
F 3 "~" H 8925 5550 50  0001 C CNN
	1    8925 5550
	1    0    0    1   
$EndComp
Wire Wire Line
	8925 4925 9000 4925
Wire Wire Line
	9000 5025 8925 5025
Wire Wire Line
	8925 5725 8925 5650
Text GLabel 8250 5925 0    50   Input ~ 0
EX_B
Wire Wire Line
	8250 5925 8350 5925
Wire Wire Line
	8000 5300 7350 5300
Wire Wire Line
	7350 5450 7350 5300
Connection ~ 7350 5300
Wire Wire Line
	8300 5300 8925 5300
Wire Wire Line
	8925 5300 8925 5450
Connection ~ 8925 5300
Wire Wire Line
	3050 2050 3050 2325
Wire Wire Line
	4625 2050 4625 2325
Wire Wire Line
	7350 2050 7350 2325
Wire Wire Line
	8925 2050 8925 2325
Wire Notes Line
	4400 1575 4400 2250
Wire Notes Line
	4400 2250 5350 2250
Wire Notes Line
	5350 2250 5350 1575
Wire Notes Line
	5350 1575 4400 1575
Text Notes 4400 1525 0    50   ~ 0
When linking the ports,\nyou would generally not\ninstall these parts.
Wire Notes Line
	8700 1575 8700 2250
Wire Notes Line
	8700 2250 9650 2250
Wire Notes Line
	9650 2250 9650 1575
Wire Notes Line
	9650 1575 8700 1575
Wire Notes Line
	8700 4550 8700 5225
Wire Notes Line
	8700 5225 9650 5225
Wire Notes Line
	9650 5225 9650 4550
Wire Notes Line
	9650 4550 8700 4550
Text Notes 8700 4500 0    50   ~ 0
When linking the ports,\nyou would generally not\ninstall these parts.
Wire Notes Line
	4400 4550 4400 5225
Wire Notes Line
	4400 5225 5350 5225
Wire Notes Line
	5350 5225 5350 4550
Wire Notes Line
	5350 4550 4400 4550
Wire Wire Line
	8925 5025 8925 5300
Wire Wire Line
	4625 5025 4625 5300
Wire Wire Line
	7350 5025 7350 5300
Wire Wire Line
	3050 5025 3050 5300
Text Notes 2775 1200 0    50   ~ 0
Assuming 2 WHITE LEDs in series,\n3.5V voltage drop and 20mA current.
Text Notes 2775 1525 0    50   ~ 0
When linked, double R2/R4 value as\nstarting point. Unlinked, 2x LEDs for\nFL_A and FL_B if needed.
Text Notes 8700 1525 0    50   ~ 0
When linking the ports,\nyou would generally not\ninstall these parts.
Text Notes 7075 1200 0    50   ~ 0
Assuming 2 RED LEDs in series,\n2.1V voltage drop and 20mA current.
Text Notes 7075 1525 0    50   ~ 0
When linked, double R6/R8 value as\nstarting point. Unlinked, 2x LEDs for\nBR_A and BR_B if needed.
Text Notes 4400 4500 0    50   ~ 0
When linking the ports,\nyou would generally not\ninstall these parts.
Text Notes 2775 4175 0    50   ~ 0
Assuming 2 ORANGE LEDs in series,\n2.2V voltage drop and 20mA current.
Text Notes 2775 4500 0    50   ~ 0
When linked, double R10/R12 value as\nstarting point. Unlinked, 2x LEDs for\nBL_L and BL_R if needed.
Text Notes 550  1100 0    50   ~ 0
VCC when calculating LED loading resistors\nhave been assumed to be at 8V, but you're\nreally supposed to do the actual calculations\nusing real information about how you're wiring\nit up and the components you're using.\n\nhttps://ledcalculator.net/
$EndSCHEMATC
