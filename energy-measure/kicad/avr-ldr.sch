EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:avr-ldr-parts
LIBS:avr-ldr-cache
EELAYER 25 0
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
L ATTINY2313-P IC1
U 1 1 571521B1
P 6000 2900
F 0 "IC1" H 5050 3900 50  0000 C CNN
F 1 "ATTINY2313-P" H 6800 2000 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm" H 6000 2900 50  0000 C CIN
F 3 "" H 6000 2900 50  0000 C CNN
	1    6000 2900
	1    0    0    -1  
$EndComp
Text GLabel 7450 2600 2    60   Input ~ 0
MOSI
Text GLabel 7450 2700 2    60   Input ~ 0
MISO
Text GLabel 7450 2800 2    60   Input ~ 0
SCK
Text GLabel 4400 4850 0    60   Input ~ 0
MISO
$Comp
L AVR-ISP-6 CON1
U 1 1 5715221D
P 4850 4950
F 0 "CON1" H 4750 5200 50  0000 C CNN
F 1 "AVR-ISP-6" H 4585 4720 50  0000 L BNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03" V 4330 4990 50  0001 C CNN
F 3 "" H 4825 4950 50  0000 C CNN
	1    4850 4950
	1    0    0    -1  
$EndComp
Text GLabel 4400 4950 0    60   Input ~ 0
SCK
Text GLabel 4550 2100 0    60   Input ~ 0
RST
Text GLabel 4400 5050 0    60   Input ~ 0
RST
Text GLabel 5300 4950 2    60   Input ~ 0
MOSI
$Comp
L VCC #PWR01
U 1 1 5715245A
P 6000 1550
F 0 "#PWR01" H 6000 1400 50  0001 C CNN
F 1 "VCC" H 6000 1700 50  0000 C CNN
F 2 "" H 6000 1550 50  0000 C CNN
F 3 "" H 6000 1550 50  0000 C CNN
	1    6000 1550
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 571524A5
P 5750 1650
F 0 "C3" H 5775 1750 50  0000 L CNN
F 1 "0.1uF" H 5775 1550 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5788 1500 50  0001 C CNN
F 3 "" H 5750 1650 50  0000 C CNN
	1    5750 1650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR02
U 1 1 5715256C
P 5500 1650
F 0 "#PWR02" H 5500 1400 50  0001 C CNN
F 1 "GND" H 5500 1500 50  0000 C CNN
F 2 "" H 5500 1650 50  0000 C CNN
F 3 "" H 5500 1650 50  0000 C CNN
	1    5500 1650
	0    1    1    0   
$EndComp
$Comp
L Crystal Y1
U 1 1 57152665
P 4600 2550
F 0 "Y1" H 4600 2700 50  0000 C CNN
F 1 "4MHz" H 4600 2400 50  0000 C CNN
F 2 "Crystals:Crystal_HC49-U_Vertical" H 4600 2550 50  0001 C CNN
F 3 "" H 4600 2550 50  0000 C CNN
	1    4600 2550
	0    -1   -1   0   
$EndComp
$Comp
L C C1
U 1 1 57152702
P 4100 2350
F 0 "C1" H 4125 2450 50  0000 L CNN
F 1 "22pF" H 4125 2250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4138 2200 50  0001 C CNN
F 3 "" H 4100 2350 50  0000 C CNN
	1    4100 2350
	0    1    1    0   
$EndComp
$Comp
L C C2
U 1 1 57152817
P 4100 2750
F 0 "C2" H 4125 2850 50  0000 L CNN
F 1 "22pF" H 4125 2650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4138 2600 50  0001 C CNN
F 3 "" H 4100 2750 50  0000 C CNN
	1    4100 2750
	0    1    1    0   
$EndComp
$Comp
L GND #PWR03
U 1 1 57152930
P 3600 2550
F 0 "#PWR03" H 3600 2300 50  0001 C CNN
F 1 "GND" H 3600 2400 50  0000 C CNN
F 2 "" H 3600 2550 50  0000 C CNN
F 3 "" H 3600 2550 50  0000 C CNN
	1    3600 2550
	0    1    1    0   
$EndComp
$Comp
L PCA82C250 U1
U 1 1 571529EA
P 7100 5450
F 0 "U1" H 6900 6150 60  0000 C CNN
F 1 "PCA82C250" H 7100 5400 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 7100 5450 60  0001 C CNN
F 3 "" H 7100 5450 60  0000 C CNN
	1    7100 5450
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 57152A3D
P 7850 4850
F 0 "R3" V 7930 4850 50  0000 C CNN
F 1 "60" V 7850 4850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 7780 4850 50  0001 C CNN
F 3 "" H 7850 4850 50  0000 C CNN
	1    7850 4850
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 57152AD0
P 8150 4850
F 0 "R5" V 8230 4850 50  0000 C CNN
F 1 "60" V 8150 4850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 8080 4850 50  0001 C CNN
F 3 "" H 8150 4850 50  0000 C CNN
	1    8150 4850
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 57152CBF
P 7850 5350
F 0 "R4" V 7930 5350 50  0000 C CNN
F 1 "60" V 7850 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 7780 5350 50  0001 C CNN
F 3 "" H 7850 5350 50  0000 C CNN
	1    7850 5350
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 57152CF4
P 8150 5350
F 0 "R6" V 8230 5350 50  0000 C CNN
F 1 "60" V 8150 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 8080 5350 50  0001 C CNN
F 3 "" H 8150 5350 50  0000 C CNN
	1    8150 5350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 57152DB8
P 8650 5100
F 0 "#PWR04" H 8650 4850 50  0001 C CNN
F 1 "GND" H 8650 4950 50  0000 C CNN
F 2 "" H 8650 5100 50  0000 C CNN
F 3 "" H 8650 5100 50  0000 C CNN
	1    8650 5100
	0    -1   -1   0   
$EndComp
Text GLabel 8300 4600 2    60   Input ~ 0
CANH
Text GLabel 8250 5700 2    60   Input ~ 0
CANL
Text GLabel 6400 4600 0    60   Input ~ 0
AVR_TXD
Text GLabel 6450 5600 0    60   Input ~ 0
AVR_RXD
$Comp
L GND #PWR05
U 1 1 571530DE
P 6150 4900
F 0 "#PWR05" H 6150 4650 50  0001 C CNN
F 1 "GND" H 6150 4750 50  0000 C CNN
F 2 "" H 6150 4900 50  0000 C CNN
F 3 "" H 6150 4900 50  0000 C CNN
	1    6150 4900
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR06
U 1 1 5715317C
P 6150 5200
F 0 "#PWR06" H 6150 5050 50  0001 C CNN
F 1 "VCC" H 6150 5350 50  0000 C CNN
F 2 "" H 6150 5200 50  0000 C CNN
F 3 "" H 6150 5200 50  0000 C CNN
	1    6150 5200
	0    -1   -1   0   
$EndComp
Text GLabel 7450 3000 2    60   Input ~ 0
AVR_RXD
Text GLabel 7450 3100 2    60   Input ~ 0
AVR_TXD
$Comp
L C C4
U 1 1 57153474
P 6350 5050
F 0 "C4" H 6375 5150 50  0000 L CNN
F 1 "0.1uF" H 6375 4950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6388 4900 50  0001 C CNN
F 3 "" H 6350 5050 50  0000 C CNN
	1    6350 5050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 57153876
P 7550 4700
F 0 "#PWR07" H 7550 4450 50  0001 C CNN
F 1 "GND" H 7550 4550 50  0000 C CNN
F 2 "" H 7550 4700 50  0000 C CNN
F 3 "" H 7550 4700 50  0000 C CNN
	1    7550 4700
	-1   0    0    1   
$EndComp
NoConn ~ 7550 5350
$Comp
L R R1
U 1 1 571539D3
P 4700 1800
F 0 "R1" V 4780 1800 50  0000 C CNN
F 1 "10k" V 4700 1800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 4630 1800 50  0001 C CNN
F 3 "" H 4700 1800 50  0000 C CNN
	1    4700 1800
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR08
U 1 1 57153B40
P 4700 1500
F 0 "#PWR08" H 4700 1350 50  0001 C CNN
F 1 "VCC" H 4700 1650 50  0000 C CNN
F 2 "" H 4700 1500 50  0000 C CNN
F 3 "" H 4700 1500 50  0000 C CNN
	1    4700 1500
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X05 P2
U 1 1 57153DB5
P 3500 5150
F 0 "P2" H 3500 5450 50  0000 C CNN
F 1 "CONN_01X05" V 3600 5150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05" H 3500 5150 50  0001 C CNN
F 3 "" H 3500 5150 50  0000 C CNN
	1    3500 5150
	1    0    0    -1  
$EndComp
Text GLabel 3150 4950 0    60   Input ~ 0
LDR_OUT
Text GLabel 3150 5150 0    60   Input ~ 0
INPUT_A
Text GLabel 2600 5250 0    60   Input ~ 0
INPUT_B
$Comp
L GND #PWR09
U 1 1 5715439A
P 3300 5450
F 0 "#PWR09" H 3300 5200 50  0001 C CNN
F 1 "GND" H 3300 5300 50  0000 C CNN
F 2 "" H 3300 5450 50  0000 C CNN
F 3 "" H 3300 5450 50  0000 C CNN
	1    3300 5450
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR010
U 1 1 571547A2
P 8400 1950
F 0 "#PWR010" H 8400 1800 50  0001 C CNN
F 1 "VCC" H 8400 2100 50  0000 C CNN
F 2 "" H 8400 1950 50  0000 C CNN
F 3 "" H 8400 1950 50  0000 C CNN
	1    8400 1950
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 57154876
P 7600 2100
F 0 "R2" V 7680 2100 50  0000 C CNN
F 1 "10k" V 7600 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 7530 2100 50  0001 C CNN
F 3 "" H 7600 2100 50  0000 C CNN
	1    7600 2100
	0    1    1    0   
$EndComp
Text GLabel 7250 1850 1    60   Input ~ 0
LDR_OUT
$Comp
L GND #PWR011
U 1 1 57154EFC
P 8000 2100
F 0 "#PWR011" H 8000 1850 50  0001 C CNN
F 1 "GND" H 8000 1950 50  0000 C CNN
F 2 "" H 8000 2100 50  0000 C CNN
F 3 "" H 8000 2100 50  0000 C CNN
	1    8000 2100
	0    -1   -1   0   
$EndComp
$Comp
L POT RV1
U 1 1 57154F98
P 8400 2200
F 0 "RV1" H 8400 2120 50  0000 C CNN
F 1 "10k" H 8400 2200 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Triwood_RM-065" H 8400 2200 50  0001 C CNN
F 3 "" H 8400 2200 50  0000 C CNN
	1    8400 2200
	0    -1   -1   0   
$EndComp
$Comp
L R R7
U 1 1 571552DC
P 8400 2600
F 0 "R7" V 8480 2600 50  0000 C CNN
F 1 "0" V 8400 2600 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 8330 2600 50  0001 C CNN
F 3 "" H 8400 2600 50  0000 C CNN
	1    8400 2600
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR012
U 1 1 571554AF
P 8400 2900
F 0 "#PWR012" H 8400 2650 50  0001 C CNN
F 1 "GND" H 8400 2750 50  0000 C CNN
F 2 "" H 8400 2900 50  0000 C CNN
F 3 "" H 8400 2900 50  0000 C CNN
	1    8400 2900
	1    0    0    -1  
$EndComp
Text GLabel 7450 3200 2    60   Input ~ 0
INPUT_A
Text GLabel 7450 3300 2    60   Input ~ 0
INPUT_B
$Comp
L CONN_01X06 P1
U 1 1 57155DC7
P 3300 3900
F 0 "P1" H 3300 4250 50  0000 C CNN
F 1 "RJ11" V 3400 3900 50  0000 C CNN
F 2 "SparkFun-Connectors:RJ11-6" H 3300 3900 50  0001 C CNN
F 3 "" H 3300 3900 50  0000 C CNN
	1    3300 3900
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR013
U 1 1 57155E5C
P 3000 3250
F 0 "#PWR013" H 3000 3100 50  0001 C CNN
F 1 "VCC" H 3000 3400 50  0000 C CNN
F 2 "" H 3000 3250 50  0000 C CNN
F 3 "" H 3000 3250 50  0000 C CNN
	1    3000 3250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 57156027
P 2450 4150
F 0 "#PWR014" H 2450 3900 50  0001 C CNN
F 1 "GND" H 2450 4000 50  0000 C CNN
F 2 "" H 2450 4150 50  0000 C CNN
F 3 "" H 2450 4150 50  0000 C CNN
	1    2450 4150
	0    1    1    0   
$EndComp
Text GLabel 2850 3850 0    60   Input ~ 0
CANL
Text GLabel 2500 3950 0    60   Input ~ 0
CANH
$Comp
L VCC #PWR015
U 1 1 5715640C
P 5350 4700
F 0 "#PWR015" H 5350 4550 50  0001 C CNN
F 1 "VCC" H 5350 4850 50  0000 C CNN
F 2 "" H 5350 4700 50  0000 C CNN
F 3 "" H 5350 4700 50  0000 C CNN
	1    5350 4700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 571564B2
P 5350 5250
F 0 "#PWR016" H 5350 5000 50  0001 C CNN
F 1 "GND" H 5350 5100 50  0000 C CNN
F 2 "" H 5350 5250 50  0000 C CNN
F 3 "" H 5350 5250 50  0000 C CNN
	1    5350 5250
	1    0    0    -1  
$EndComp
NoConn ~ 7150 3600
NoConn ~ 7150 2300
NoConn ~ 7150 2400
NoConn ~ 7150 2500
Text Notes 5900 4450 0    60   ~ 0
CAN<->TTL
Text Notes 2100 4500 0    60   ~ 0
Interface connector
Text Notes 4050 4500 0    60   ~ 0
ISP header
Text Notes 2100 3050 0    60   ~ 0
RJ11 connector
Entry Bus Bus
	4750 7750 4850 7850
$Comp
L C C5
U 1 1 57166636
P 8500 5100
F 0 "C5" H 8525 5200 50  0000 L CNN
F 1 "100nF" H 8525 5000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 8538 4950 50  0001 C CNN
F 3 "" H 8500 5100 50  0000 C CNN
	1    8500 5100
	0    1    1    0   
$EndComp
$Comp
L LED D1
U 1 1 57166E68
P 8050 3400
F 0 "D1" H 8050 3500 50  0000 C CNN
F 1 "LED" H 8050 3300 50  0000 C CNN
F 2 "LEDs:LED_0603" H 8050 3400 50  0001 C CNN
F 3 "" H 8050 3400 50  0000 C CNN
	1    8050 3400
	-1   0    0    1   
$EndComp
$Comp
L LED D2
U 1 1 57167246
P 8050 3700
F 0 "D2" H 8050 3800 50  0000 C CNN
F 1 "LED" H 8050 3600 50  0000 C CNN
F 2 "LEDs:LED_0603" H 8050 3700 50  0001 C CNN
F 3 "" H 8050 3700 50  0000 C CNN
	1    8050 3700
	-1   0    0    1   
$EndComp
$Comp
L R R8
U 1 1 571673AA
P 8550 3400
F 0 "R8" V 8630 3400 50  0000 C CNN
F 1 "330" V 8550 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 8480 3400 50  0001 C CNN
F 3 "" H 8550 3400 50  0000 C CNN
	1    8550 3400
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 57167445
P 8550 3700
F 0 "R9" V 8630 3700 50  0000 C CNN
F 1 "330" V 8550 3700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 8480 3700 50  0001 C CNN
F 3 "" H 8550 3700 50  0000 C CNN
	1    8550 3700
	0    1    1    0   
$EndComp
$Comp
L GND #PWR017
U 1 1 57167913
P 6000 4000
F 0 "#PWR017" H 6000 3750 50  0001 C CNN
F 1 "GND" H 6000 3850 50  0000 C CNN
F 2 "" H 6000 4000 50  0000 C CNN
F 3 "" H 6000 4000 50  0000 C CNN
	1    6000 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 5716853A
P 8850 3400
F 0 "#PWR018" H 8850 3150 50  0001 C CNN
F 1 "GND" H 8850 3250 50  0000 C CNN
F 2 "" H 8850 3400 50  0000 C CNN
F 3 "" H 8850 3400 50  0000 C CNN
	1    8850 3400
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR019
U 1 1 571685AA
P 8850 3700
F 0 "#PWR019" H 8850 3450 50  0001 C CNN
F 1 "GND" H 8850 3550 50  0000 C CNN
F 2 "" H 8850 3700 50  0000 C CNN
F 3 "" H 8850 3700 50  0000 C CNN
	1    8850 3700
	0    -1   -1   0   
$EndComp
$Comp
L C C6
U 1 1 5718EF45
P 4650 3350
F 0 "C6" H 4675 3450 50  0000 L CNN
F 1 "2.2uF" H 4675 3250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4688 3200 50  0001 C CNN
F 3 "" H 4650 3350 50  0000 C CNN
	1    4650 3350
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR020
U 1 1 5718EF94
P 4650 3100
F 0 "#PWR020" H 4650 2950 50  0001 C CNN
F 1 "VCC" H 4650 3250 50  0000 C CNN
F 2 "" H 4650 3100 50  0000 C CNN
F 3 "" H 4650 3100 50  0000 C CNN
	1    4650 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR021
U 1 1 5718F138
P 4650 3650
F 0 "#PWR021" H 4650 3400 50  0001 C CNN
F 1 "GND" H 4650 3500 50  0000 C CNN
F 2 "" H 4650 3650 50  0000 C CNN
F 3 "" H 4650 3650 50  0000 C CNN
	1    4650 3650
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR022
U 1 1 57153FBF
P 3300 4800
F 0 "#PWR022" H 3300 4650 50  0001 C CNN
F 1 "VCC" H 3300 4950 50  0000 C CNN
F 2 "" H 3300 4800 50  0000 C CNN
F 3 "" H 3300 4800 50  0000 C CNN
	1    3300 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 2600 7450 2600
Wire Wire Line
	7150 2700 7450 2700
Wire Wire Line
	7150 2800 7450 2800
Wire Wire Line
	4700 4850 4400 4850
Wire Wire Line
	4700 4950 4400 4950
Wire Wire Line
	4550 2100 4850 2100
Wire Wire Line
	4700 5050 4400 5050
Wire Wire Line
	4950 4950 5300 4950
Wire Wire Line
	6000 1550 6000 1800
Wire Wire Line
	6000 1650 5900 1650
Connection ~ 6000 1650
Wire Wire Line
	5500 1650 5600 1650
Wire Wire Line
	4250 2400 4850 2400
Wire Wire Line
	4250 2400 4250 2350
Wire Wire Line
	4250 2700 4850 2700
Wire Wire Line
	4250 2700 4250 2750
Wire Wire Line
	3950 2350 3800 2350
Wire Wire Line
	3800 2350 3800 2750
Wire Wire Line
	3800 2750 3950 2750
Wire Wire Line
	3800 2550 3600 2550
Connection ~ 3800 2550
Connection ~ 4600 2400
Wire Wire Line
	4850 2700 4850 2600
Connection ~ 4600 2700
Wire Wire Line
	7850 4700 8150 4700
Wire Wire Line
	8000 4700 8000 4600
Wire Wire Line
	7700 4600 8300 4600
Wire Wire Line
	7700 4600 7700 5050
Wire Wire Line
	7700 5050 7550 5050
Connection ~ 8000 4700
Wire Wire Line
	7850 5000 8150 5000
Wire Wire Line
	7850 5500 8150 5500
Wire Wire Line
	7850 5200 8150 5200
Wire Wire Line
	8000 5000 8000 5200
Connection ~ 8000 5200
Connection ~ 8000 5000
Connection ~ 8000 5100
Wire Wire Line
	8000 5500 8000 5700
Wire Wire Line
	7700 5700 8250 5700
Wire Wire Line
	7700 5700 7700 5200
Wire Wire Line
	7700 5200 7550 5200
Connection ~ 8000 5500
Connection ~ 8000 4600
Connection ~ 8000 5700
Wire Wire Line
	6650 5350 6650 5600
Wire Wire Line
	6650 5600 6450 5600
Wire Wire Line
	7150 3000 7450 3000
Wire Wire Line
	7150 3100 7450 3100
Wire Wire Line
	6650 4900 6600 4900
Wire Wire Line
	6600 4900 6600 4600
Wire Wire Line
	6600 4600 6400 4600
Wire Wire Line
	6650 5050 6500 5050
Wire Wire Line
	6500 5050 6500 4900
Wire Wire Line
	6500 4900 6150 4900
Connection ~ 6350 4900
Wire Wire Line
	6150 5200 6650 5200
Connection ~ 6350 5200
Wire Wire Line
	7550 4700 7550 4900
Wire Wire Line
	4700 1500 4700 1650
Wire Wire Line
	4700 1950 4700 2100
Connection ~ 4700 2100
Wire Wire Line
	3300 5050 3200 5050
Wire Wire Line
	3200 5050 3200 4950
Wire Wire Line
	3200 4950 3150 4950
Wire Wire Line
	3150 5150 3300 5150
Wire Wire Line
	3300 5450 3300 5350
Wire Wire Line
	7150 2100 7450 2100
Wire Wire Line
	7250 1850 7250 2100
Connection ~ 7250 2100
Wire Wire Line
	7750 2100 8000 2100
Wire Wire Line
	7150 2200 8250 2200
Wire Wire Line
	8400 1950 8400 2050
Wire Wire Line
	8400 2350 8400 2450
Wire Wire Line
	8400 2750 8400 2900
Wire Wire Line
	3300 5250 2600 5250
Wire Wire Line
	7450 3200 7150 3200
Wire Wire Line
	7450 3300 7150 3300
Wire Wire Line
	3000 3750 3100 3750
Wire Wire Line
	2900 4150 3100 4150
Wire Wire Line
	3000 4050 3100 4050
Connection ~ 3000 4150
Wire Wire Line
	3100 3850 2850 3850
Wire Wire Line
	2500 3950 3100 3950
Wire Wire Line
	5350 4700 5350 4850
Wire Wire Line
	5350 4850 4950 4850
Wire Wire Line
	5350 5250 5350 5050
Wire Wire Line
	5350 5050 4950 5050
Wire Notes Line
	5900 5800 8900 5800
Wire Notes Line
	5900 5800 5900 4450
Wire Notes Line
	5650 4500 4050 4500
Wire Notes Line
	4050 4500 4050 5500
Wire Notes Line
	4050 5500 5650 5500
Wire Notes Line
	5650 5500 5650 4500
Wire Notes Line
	2100 4250 3450 4250
Wire Wire Line
	8000 5100 8350 5100
Wire Notes Line
	5900 4450 8900 4450
Wire Notes Line
	8900 4450 8900 5800
Wire Wire Line
	7150 3400 7850 3400
Wire Wire Line
	7150 3500 7850 3500
Wire Wire Line
	7850 3500 7850 3700
Wire Wire Line
	8250 3400 8400 3400
Wire Wire Line
	8250 3700 8400 3700
Wire Wire Line
	6000 3900 6000 4000
Wire Notes Line
	2100 4500 2100 5650
Wire Notes Line
	2100 5650 3650 5650
Wire Notes Line
	3650 5650 3650 4500
Wire Wire Line
	8850 3700 8700 3700
Wire Wire Line
	8700 3400 8850 3400
Wire Wire Line
	4650 3100 4650 3200
Wire Wire Line
	4650 3650 4650 3500
Wire Notes Line
	3650 4500 2100 4500
Wire Wire Line
	3300 4950 3300 4800
$Comp
L R R10
U 1 1 571908F9
P 3000 3450
F 0 "R10" V 3080 3450 50  0000 C CNN
F 1 "FB" V 3000 3450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2930 3450 50  0001 C CNN
F 3 "" H 3000 3450 50  0000 C CNN
	1    3000 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3250 3000 3300
Wire Wire Line
	3000 3600 3000 3750
Wire Wire Line
	3000 3650 3100 3650
Connection ~ 3000 3650
$Comp
L PWR_FLAG #FLG023
U 1 1 57190D9C
P 2600 3300
F 0 "#FLG023" H 2600 3395 50  0001 C CNN
F 1 "PWR_FLAG" H 2600 3480 50  0000 C CNN
F 2 "" H 2600 3300 50  0000 C CNN
F 3 "" H 2600 3300 50  0000 C CNN
	1    2600 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3300 2600 3300
$Comp
L R R11
U 1 1 57191014
P 2750 4150
F 0 "R11" V 2830 4150 50  0000 C CNN
F 1 "FB" V 2750 4150 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2680 4150 50  0001 C CNN
F 3 "" H 2750 4150 50  0000 C CNN
	1    2750 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 4050 3000 4150
Wire Wire Line
	2450 4150 2600 4150
Wire Notes Line
	2100 4250 2100 3050
Wire Notes Line
	2100 3050 3450 3050
Wire Notes Line
	3450 3050 3450 4250
$EndSCHEMATC
