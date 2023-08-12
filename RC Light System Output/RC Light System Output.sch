EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "RC Light System Output"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 "skipped doing the math). Modules can be chained for more outputs."
Comment3 "this can work to create a brighter mode for the LEDs connected (or burn something if you"
Comment4 "Takes serial input then outputs it onto LED \"ports\". Each port is paired and can be linked, "
$EndDescr
$Comp
L 74xx:74HC595 U1
U 1 1 64D415B9
P 6175 3350
F 0 "U1" H 6225 4000 50  0000 L CNN
F 1 "74HC595" H 6225 3925 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" H 6175 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 6175 3350 50  0001 C CNN
	1    6175 3350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0101
U 1 1 64D420C9
P 6500 7050
F 0 "#PWR0101" H 6500 6900 50  0001 C CNN
F 1 "+5V" H 6515 7223 50  0000 C CNN
F 2 "" H 6500 7050 50  0001 C CNN
F 3 "" H 6500 7050 50  0001 C CNN
	1    6500 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 64D42668
P 6500 7150
F 0 "C1" H 6592 7196 50  0000 L CNN
F 1 "100nF" H 6592 7105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6500 7150 50  0001 C CNN
F 3 "~" H 6500 7150 50  0001 C CNN
	1    6500 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 64D42CAD
P 6500 7250
F 0 "#PWR0102" H 6500 7000 50  0001 C CNN
F 1 "GND" H 6505 7077 50  0000 C CNN
F 2 "" H 6500 7250 50  0001 C CNN
F 3 "" H 6500 7250 50  0001 C CNN
	1    6500 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 64D4324B
P 6175 2600
F 0 "#PWR0103" H 6175 2450 50  0001 C CNN
F 1 "+5V" H 6190 2773 50  0000 C CNN
F 2 "" H 6175 2600 50  0001 C CNN
F 3 "" H 6175 2600 50  0001 C CNN
	1    6175 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 64D450A8
P 6175 4200
F 0 "#PWR0104" H 6175 3950 50  0001 C CNN
F 1 "GND" H 6180 4027 50  0000 C CNN
F 2 "" H 6175 4200 50  0001 C CNN
F 3 "" H 6175 4200 50  0001 C CNN
	1    6175 4200
	1    0    0    -1  
$EndComp
Text Label 4875 3175 0    50   ~ 0
SER_DATA
Text Label 4875 3275 0    50   ~ 0
SER_CLK
Wire Wire Line
	5700 2675 5700 3250
Wire Wire Line
	5700 3250 5775 3250
Wire Wire Line
	5700 2675 6175 2675
Wire Wire Line
	6175 2600 6175 2675
Wire Wire Line
	6175 2750 6175 2675
Connection ~ 6175 2675
Wire Wire Line
	5775 3550 5700 3550
Wire Wire Line
	6175 4050 6175 4125
Wire Wire Line
	6175 4125 5700 4125
Wire Wire Line
	5700 3550 5700 4125
Wire Wire Line
	6175 4200 6175 4125
Connection ~ 6175 4125
Text Label 4875 3375 0    50   ~ 0
SER_LATCH
$Comp
L rc_light_system:Conn_Light_Input J1
U 1 1 64D5880E
P 3925 3075
F 0 "J1" H 4025 3450 50  0000 C CNN
F 1 "INPUT" H 4025 3375 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B6B-XH-A_1x06_P2.50mm_Vertical" H 3925 3075 50  0001 C CNN
F 3 "~" H 3925 3075 50  0001 C CNN
	1    3925 3075
	-1   0    0    -1  
$EndComp
$Comp
L rc_light_system:Conn_Light_Output J2
U 1 1 64D5BE1E
P 3925 4525
F 0 "J2" H 4025 4900 50  0000 C CNN
F 1 "CHAIN" H 4025 4825 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B6B-XH-A_1x06_P2.50mm_Vertical" H 3925 4525 50  0001 C CNN
F 3 "~" H 3925 4525 50  0001 C CNN
	1    3925 4525
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4125 2875 4200 2875
Wire Wire Line
	4200 4325 4125 4325
Wire Wire Line
	4125 2975 4275 2975
Wire Wire Line
	4275 2975 4275 2600
$Comp
L power:+5V #PWR0105
U 1 1 64D600E3
P 4275 2600
F 0 "#PWR0105" H 4275 2450 50  0001 C CNN
F 1 "+5V" H 4290 2773 50  0000 C CNN
F 2 "" H 4275 2600 50  0001 C CNN
F 3 "" H 4275 2600 50  0001 C CNN
	1    4275 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4275 4425 4125 4425
Connection ~ 4275 2975
$Comp
L power:VCC #PWR0106
U 1 1 64D62764
P 4500 2600
F 0 "#PWR0106" H 4500 2450 50  0001 C CNN
F 1 "VCC" H 4515 2773 50  0000 C CNN
F 2 "" H 4500 2600 50  0001 C CNN
F 3 "" H 4500 2600 50  0001 C CNN
	1    4500 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2600 4500 3075
Wire Wire Line
	4500 3075 4125 3075
Wire Wire Line
	4500 4525 4125 4525
Connection ~ 4500 3075
Wire Wire Line
	4125 3275 4650 3275
Wire Wire Line
	4650 4725 4125 4725
Connection ~ 4650 3275
Wire Wire Line
	4125 3375 4725 3375
Wire Wire Line
	4725 4825 4125 4825
Wire Wire Line
	4200 2875 4200 4325
Wire Wire Line
	4275 2975 4275 4425
Wire Wire Line
	4500 3075 4500 4525
Wire Wire Line
	4650 3275 4650 4725
Wire Wire Line
	4725 3375 4725 4825
Wire Wire Line
	6650 4625 6650 3850
Wire Wire Line
	6650 3850 6575 3850
Wire Wire Line
	4125 4625 6650 4625
Wire Wire Line
	4200 4325 4200 4925
Connection ~ 4200 4325
$Comp
L power:GND #PWR0107
U 1 1 64D78207
P 4200 4925
F 0 "#PWR0107" H 4200 4675 50  0001 C CNN
F 1 "GND" H 4205 4752 50  0000 C CNN
F 2 "" H 4200 4925 50  0001 C CNN
F 3 "" H 4200 4925 50  0001 C CNN
	1    4200 4925
	1    0    0    -1  
$EndComp
Connection ~ 4725 3375
Wire Wire Line
	4725 3375 5550 3375
Wire Wire Line
	5625 3275 5625 3150
Wire Wire Line
	5625 3150 5775 3150
Wire Wire Line
	4650 3275 5625 3275
Wire Wire Line
	5550 3175 5550 2950
Wire Wire Line
	5550 2950 5775 2950
Wire Wire Line
	4125 3175 5550 3175
Wire Wire Line
	5550 3375 5550 3450
Wire Wire Line
	5550 3450 5775 3450
Text GLabel 7400 2950 2    50   Output ~ 0
FL_A
Text GLabel 7400 3050 2    50   Output ~ 0
FL_B
Text GLabel 7400 3150 2    50   Output ~ 0
BR_A
Text GLabel 7400 3250 2    50   Output ~ 0
BR_B
Text GLabel 7400 3350 2    50   Output ~ 0
BL_L
Text GLabel 7400 3450 2    50   Output ~ 0
BL_R
$Sheet
S 7200 2825 1375 1125
U 64E3CE93
F0 "Ports" 50
F1 "Ports.sch" 50
$EndSheet
Wire Wire Line
	6575 2950 7400 2950
Wire Wire Line
	6575 3050 7400 3050
Wire Wire Line
	6575 3150 7400 3150
Wire Wire Line
	6575 3250 7400 3250
Wire Wire Line
	6575 3350 7400 3350
Wire Wire Line
	6575 3450 7400 3450
Text GLabel 7400 3550 2    50   Output ~ 0
EX_A
Text GLabel 7400 3650 2    50   Output ~ 0
EX_B
Wire Wire Line
	6575 3550 7400 3550
Wire Wire Line
	6575 3650 7400 3650
$EndSCHEMATC
