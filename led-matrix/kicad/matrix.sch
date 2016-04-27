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
LIBS:matrix-parts
LIBS:led-matrix-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L TPIC6B595 U1
U 1 1 57210DF1
P 3250 3400
F 0 "U1" H 3250 4500 60  0000 C CNN
F 1 "TPIC6B595" H 3250 3350 60  0000 C CNN
F 2 "" H 3250 3400 60  0000 C CNN
F 3 "" H 3250 3400 60  0000 C CNN
	1    3250 3400
	1    0    0    -1  
$EndComp
$Comp
L BC857 Q7
U 1 1 57210DF8
P 2150 2000
F 0 "Q7" H 2350 2075 50  0000 L CNN
F 1 "BC857" H 2350 2000 50  0000 L CNN
F 2 "SOT-23" H 2350 1925 50  0000 L CIN
F 3 "" H 2150 2000 50  0000 L CNN
	1    2150 2000
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 57210DFF
P 1950 2450
F 0 "R7" V 2030 2450 50  0000 C CNN
F 1 "1k" V 1950 2450 50  0000 C CNN
F 2 "" V 1880 2450 50  0000 C CNN
F 3 "" H 1950 2450 50  0000 C CNN
	1    1950 2450
	-1   0    0    1   
$EndComp
Text GLabel 2300 1600 2    60   Input ~ 0
ROW_A1
$Comp
L VCC #PWR09
U 1 1 57210E0A
P 2250 2350
F 0 "#PWR09" H 2250 2200 50  0001 C CNN
F 1 "VCC" H 2250 2500 50  0000 C CNN
F 2 "" H 2250 2350 50  0000 C CNN
F 3 "" H 2250 2350 50  0000 C CNN
	1    2250 2350
	-1   0    0    1   
$EndComp
$Comp
L BC857 Q5
U 1 1 57210E10
P 1750 1700
F 0 "Q5" H 1950 1775 50  0000 L CNN
F 1 "BC857" H 1950 1700 50  0000 L CNN
F 2 "SOT-23" H 1950 1625 50  0000 L CIN
F 3 "" H 1750 1700 50  0000 L CNN
	1    1750 1700
	1    0    0    -1  
$EndComp
Text GLabel 1900 1300 2    60   Input ~ 0
ROW_A2
$Comp
L R R5
U 1 1 57210E18
P 1550 2450
F 0 "R5" V 1630 2450 50  0000 C CNN
F 1 "1k" V 1550 2450 50  0000 C CNN
F 2 "" V 1480 2450 50  0000 C CNN
F 3 "" H 1550 2450 50  0000 C CNN
	1    1550 2450
	-1   0    0    1   
$EndComp
$Comp
L BC857 Q3
U 1 1 57210E22
P 1350 1400
F 0 "Q3" H 1550 1475 50  0000 L CNN
F 1 "BC857" H 1550 1400 50  0000 L CNN
F 2 "SOT-23" H 1550 1325 50  0000 L CIN
F 3 "" H 1350 1400 50  0000 L CNN
	1    1350 1400
	1    0    0    -1  
$EndComp
$Comp
L BC857 Q1
U 1 1 57210E29
P 950 1100
F 0 "Q1" H 1150 1175 50  0000 L CNN
F 1 "BC857" H 1150 1100 50  0000 L CNN
F 2 "SOT-23" H 1150 1025 50  0000 L CIN
F 3 "" H 950 1100 50  0000 L CNN
	1    950  1100
	1    0    0    -1  
$EndComp
Text GLabel 1500 1050 2    60   Input ~ 0
ROW_A3
$Comp
L R R3
U 1 1 57210E31
P 1150 2450
F 0 "R3" V 1230 2450 50  0000 C CNN
F 1 "1k" V 1150 2450 50  0000 C CNN
F 2 "" V 1080 2450 50  0000 C CNN
F 3 "" H 1150 2450 50  0000 C CNN
	1    1150 2450
	-1   0    0    1   
$EndComp
Text GLabel 1100 700  2    60   Input ~ 0
ROW_A4
$Comp
L R R1
U 1 1 57210E3E
P 750 2450
F 0 "R1" V 830 2450 50  0000 C CNN
F 1 "1k" V 750 2450 50  0000 C CNN
F 2 "" V 680 2450 50  0000 C CNN
F 3 "" H 750 2450 50  0000 C CNN
	1    750  2450
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR010
U 1 1 57210E48
P 1850 2050
F 0 "#PWR010" H 1850 1900 50  0001 C CNN
F 1 "VCC" H 1850 2200 50  0000 C CNN
F 2 "" H 1850 2050 50  0000 C CNN
F 3 "" H 1850 2050 50  0000 C CNN
	1    1850 2050
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR011
U 1 1 57210E4E
P 1450 1750
F 0 "#PWR011" H 1450 1600 50  0001 C CNN
F 1 "VCC" H 1450 1900 50  0000 C CNN
F 2 "" H 1450 1750 50  0000 C CNN
F 3 "" H 1450 1750 50  0000 C CNN
	1    1450 1750
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR012
U 1 1 57210E54
P 1050 1450
F 0 "#PWR012" H 1050 1300 50  0001 C CNN
F 1 "VCC" H 1050 1600 50  0000 C CNN
F 2 "" H 1050 1450 50  0000 C CNN
F 3 "" H 1050 1450 50  0000 C CNN
	1    1050 1450
	-1   0    0    1   
$EndComp
$Comp
L BC857 Q15
U 1 1 57210E60
P 5400 2000
F 0 "Q15" H 5600 2075 50  0000 L CNN
F 1 "BC857" H 5600 2000 50  0000 L CNN
F 2 "SOT-23" H 5600 1925 50  0000 L CIN
F 3 "" H 5400 2000 50  0000 L CNN
	1    5400 2000
	1    0    0    -1  
$EndComp
Text GLabel 5550 1600 2    60   Input ~ 0
ROW_A5
$Comp
L BC857 Q13
U 1 1 57210E68
P 5000 1700
F 0 "Q13" H 5200 1775 50  0000 L CNN
F 1 "BC857" H 5200 1700 50  0000 L CNN
F 2 "SOT-23" H 5200 1625 50  0000 L CIN
F 3 "" H 5000 1700 50  0000 L CNN
	1    5000 1700
	1    0    0    -1  
$EndComp
Text GLabel 5150 1300 2    60   Input ~ 0
ROW_A6
$Comp
L BC857 Q11
U 1 1 57210E70
P 4600 1400
F 0 "Q11" H 4800 1475 50  0000 L CNN
F 1 "BC857" H 4800 1400 50  0000 L CNN
F 2 "SOT-23" H 4800 1325 50  0000 L CIN
F 3 "" H 4600 1400 50  0000 L CNN
	1    4600 1400
	1    0    0    -1  
$EndComp
$Comp
L BC857 Q9
U 1 1 57210E77
P 4200 1100
F 0 "Q9" H 4400 1175 50  0000 L CNN
F 1 "BC857" H 4400 1100 50  0000 L CNN
F 2 "SOT-23" H 4400 1025 50  0000 L CIN
F 3 "" H 4200 1100 50  0000 L CNN
	1    4200 1100
	1    0    0    -1  
$EndComp
Text GLabel 4750 1050 2    60   Input ~ 0
ROW_A7
$Comp
L VCC #PWR013
U 1 1 57210E80
P 5100 2050
F 0 "#PWR013" H 5100 1900 50  0001 C CNN
F 1 "VCC" H 5100 2200 50  0000 C CNN
F 2 "" H 5100 2050 50  0000 C CNN
F 3 "" H 5100 2050 50  0000 C CNN
	1    5100 2050
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR014
U 1 1 57210E86
P 4700 1750
F 0 "#PWR014" H 4700 1600 50  0001 C CNN
F 1 "VCC" H 4700 1900 50  0000 C CNN
F 2 "" H 4700 1750 50  0000 C CNN
F 3 "" H 4700 1750 50  0000 C CNN
	1    4700 1750
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR015
U 1 1 57210E8C
P 4300 1450
F 0 "#PWR015" H 4300 1300 50  0001 C CNN
F 1 "VCC" H 4300 1600 50  0000 C CNN
F 2 "" H 4300 1450 50  0000 C CNN
F 3 "" H 4300 1450 50  0000 C CNN
	1    4300 1450
	-1   0    0    1   
$EndComp
Text GLabel 4350 700  2    60   Input ~ 0
ROW_A8
$Comp
L R R9
U 1 1 57210E98
P 4000 2450
F 0 "R9" V 4080 2450 50  0000 C CNN
F 1 "1k" V 4000 2450 50  0000 C CNN
F 2 "" V 3930 2450 50  0000 C CNN
F 3 "" H 4000 2450 50  0000 C CNN
	1    4000 2450
	-1   0    0    1   
$EndComp
$Comp
L R R13
U 1 1 57210EA2
P 4400 2450
F 0 "R13" V 4480 2450 50  0000 C CNN
F 1 "1k" V 4400 2450 50  0000 C CNN
F 2 "" V 4330 2450 50  0000 C CNN
F 3 "" H 4400 2450 50  0000 C CNN
	1    4400 2450
	-1   0    0    1   
$EndComp
$Comp
L R R17
U 1 1 57210EAC
P 4800 2450
F 0 "R17" V 4880 2450 50  0000 C CNN
F 1 "1k" V 4800 2450 50  0000 C CNN
F 2 "" V 4730 2450 50  0000 C CNN
F 3 "" H 4800 2450 50  0000 C CNN
	1    4800 2450
	-1   0    0    1   
$EndComp
$Comp
L R R21
U 1 1 57210EB7
P 5200 2450
F 0 "R21" V 5280 2450 50  0000 C CNN
F 1 "1k" V 5200 2450 50  0000 C CNN
F 2 "" V 5130 2450 50  0000 C CNN
F 3 "" H 5200 2450 50  0000 C CNN
	1    5200 2450
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR016
U 1 1 57210EC1
P 5500 2350
F 0 "#PWR016" H 5500 2200 50  0001 C CNN
F 1 "VCC" H 5500 2500 50  0000 C CNN
F 2 "" H 5500 2350 50  0000 C CNN
F 3 "" H 5500 2350 50  0000 C CNN
	1    5500 2350
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR017
U 1 1 57210EC8
P 3850 2300
F 0 "#PWR017" H 3850 2050 50  0001 C CNN
F 1 "GND" H 3850 2150 50  0000 C CNN
F 2 "" H 3850 2300 50  0000 C CNN
F 3 "" H 3850 2300 50  0000 C CNN
	1    3850 2300
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR018
U 1 1 57210ED0
P 2650 2350
F 0 "#PWR018" H 2650 2200 50  0001 C CNN
F 1 "VCC" H 2650 2500 50  0000 C CNN
F 2 "" H 2650 2350 50  0000 C CNN
F 3 "" H 2650 2350 50  0000 C CNN
	1    2650 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 57210ED8
P 2700 3550
F 0 "#PWR019" H 2700 3300 50  0001 C CNN
F 1 "GND" H 2700 3400 50  0000 C CNN
F 2 "" H 2700 3550 50  0000 C CNN
F 3 "" H 2700 3550 50  0000 C CNN
	1    2700 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 57210EDE
P 3800 3550
F 0 "#PWR020" H 3800 3300 50  0001 C CNN
F 1 "GND" H 3800 3400 50  0000 C CNN
F 2 "" H 3800 3550 50  0000 C CNN
F 3 "" H 3800 3550 50  0000 C CNN
	1    3800 3550
	1    0    0    -1  
$EndComp
Text Notes 600  600  0    60   ~ 0
ROW_A
$Comp
L VCC #PWR021
U 1 1 57210F01
P 2250 2350
F 0 "#PWR021" H 2250 2200 50  0001 C CNN
F 1 "VCC" H 2250 2500 50  0000 C CNN
F 2 "" H 2250 2350 50  0000 C CNN
F 3 "" H 2250 2350 50  0000 C CNN
	1    2250 2350
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR022
U 1 1 57210F34
P 1850 2050
F 0 "#PWR022" H 1850 1900 50  0001 C CNN
F 1 "VCC" H 1850 2200 50  0000 C CNN
F 2 "" H 1850 2050 50  0000 C CNN
F 3 "" H 1850 2050 50  0000 C CNN
	1    1850 2050
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR023
U 1 1 57210F3A
P 1450 1750
F 0 "#PWR023" H 1450 1600 50  0001 C CNN
F 1 "VCC" H 1450 1900 50  0000 C CNN
F 2 "" H 1450 1750 50  0000 C CNN
F 3 "" H 1450 1750 50  0000 C CNN
	1    1450 1750
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR024
U 1 1 57210F40
P 1050 1450
F 0 "#PWR024" H 1050 1300 50  0001 C CNN
F 1 "VCC" H 1050 1600 50  0000 C CNN
F 2 "" H 1050 1450 50  0000 C CNN
F 3 "" H 1050 1450 50  0000 C CNN
	1    1050 1450
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR025
U 1 1 57210F65
P 5100 2050
F 0 "#PWR025" H 5100 1900 50  0001 C CNN
F 1 "VCC" H 5100 2200 50  0000 C CNN
F 2 "" H 5100 2050 50  0000 C CNN
F 3 "" H 5100 2050 50  0000 C CNN
	1    5100 2050
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR026
U 1 1 57210F6B
P 4700 1750
F 0 "#PWR026" H 4700 1600 50  0001 C CNN
F 1 "VCC" H 4700 1900 50  0000 C CNN
F 2 "" H 4700 1750 50  0000 C CNN
F 3 "" H 4700 1750 50  0000 C CNN
	1    4700 1750
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR027
U 1 1 57210F71
P 4300 1450
F 0 "#PWR027" H 4300 1300 50  0001 C CNN
F 1 "VCC" H 4300 1600 50  0000 C CNN
F 2 "" H 4300 1450 50  0000 C CNN
F 3 "" H 4300 1450 50  0000 C CNN
	1    4300 1450
	-1   0    0    1   
$EndComp
$Comp
L R R10
U 1 1 57210F78
P 4000 2450
F 0 "R10" V 4080 2450 50  0000 C CNN
F 1 "1k" V 4000 2450 50  0000 C CNN
F 2 "" V 3930 2450 50  0000 C CNN
F 3 "" H 4000 2450 50  0000 C CNN
	1    4000 2450
	-1   0    0    1   
$EndComp
$Comp
L R R14
U 1 1 57210F7F
P 4400 2450
F 0 "R14" V 4480 2450 50  0000 C CNN
F 1 "1k" V 4400 2450 50  0000 C CNN
F 2 "" V 4330 2450 50  0000 C CNN
F 3 "" H 4400 2450 50  0000 C CNN
	1    4400 2450
	-1   0    0    1   
$EndComp
$Comp
L R R18
U 1 1 57210F86
P 4800 2450
F 0 "R18" V 4880 2450 50  0000 C CNN
F 1 "1k" V 4800 2450 50  0000 C CNN
F 2 "" V 4730 2450 50  0000 C CNN
F 3 "" H 4800 2450 50  0000 C CNN
	1    4800 2450
	-1   0    0    1   
$EndComp
$Comp
L R R22
U 1 1 57210F8D
P 5200 2450
F 0 "R22" V 5280 2450 50  0000 C CNN
F 1 "1k" V 5200 2450 50  0000 C CNN
F 2 "" V 5130 2450 50  0000 C CNN
F 3 "" H 5200 2450 50  0000 C CNN
	1    5200 2450
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR028
U 1 1 57210F94
P 5500 2350
F 0 "#PWR028" H 5500 2200 50  0001 C CNN
F 1 "VCC" H 5500 2500 50  0000 C CNN
F 2 "" H 5500 2350 50  0000 C CNN
F 3 "" H 5500 2350 50  0000 C CNN
	1    5500 2350
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR029
U 1 1 57210F9A
P 3850 2300
F 0 "#PWR029" H 3850 2050 50  0001 C CNN
F 1 "GND" H 3850 2150 50  0000 C CNN
F 2 "" H 3850 2300 50  0000 C CNN
F 3 "" H 3850 2300 50  0000 C CNN
	1    3850 2300
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR030
U 1 1 57210FA0
P 2650 2350
F 0 "#PWR030" H 2650 2200 50  0001 C CNN
F 1 "VCC" H 2650 2500 50  0000 C CNN
F 2 "" H 2650 2350 50  0000 C CNN
F 3 "" H 2650 2350 50  0000 C CNN
	1    2650 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR031
U 1 1 57210FA6
P 2700 3550
F 0 "#PWR031" H 2700 3300 50  0001 C CNN
F 1 "GND" H 2700 3400 50  0000 C CNN
F 2 "" H 2700 3550 50  0000 C CNN
F 3 "" H 2700 3550 50  0000 C CNN
	1    2700 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR032
U 1 1 57210FAC
P 3800 3550
F 0 "#PWR032" H 3800 3300 50  0001 C CNN
F 1 "GND" H 3800 3400 50  0000 C CNN
F 2 "" H 3800 3550 50  0000 C CNN
F 3 "" H 3800 3550 50  0000 C CNN
	1    3800 3550
	1    0    0    -1  
$EndComp
$Comp
L TPIC6B595 U2
U 1 1 57215063
P 3250 6900
F 0 "U2" H 3250 8000 60  0000 C CNN
F 1 "TPIC6B595" H 3250 6850 60  0000 C CNN
F 2 "" H 3250 6900 60  0000 C CNN
F 3 "" H 3250 6900 60  0000 C CNN
	1    3250 6900
	1    0    0    -1  
$EndComp
$Comp
L BC857 Q8
U 1 1 57215069
P 2150 5500
F 0 "Q8" H 2350 5575 50  0000 L CNN
F 1 "BC857" H 2350 5500 50  0000 L CNN
F 2 "SOT-23" H 2350 5425 50  0000 L CIN
F 3 "" H 2150 5500 50  0000 L CNN
	1    2150 5500
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 5721506F
P 1950 5950
F 0 "R8" V 2030 5950 50  0000 C CNN
F 1 "1k" V 1950 5950 50  0000 C CNN
F 2 "" V 1880 5950 50  0000 C CNN
F 3 "" H 1950 5950 50  0000 C CNN
	1    1950 5950
	-1   0    0    1   
$EndComp
Text GLabel 2300 5100 2    60   Input ~ 0
ROW_B1
$Comp
L VCC #PWR033
U 1 1 57215079
P 2250 5850
F 0 "#PWR033" H 2250 5700 50  0001 C CNN
F 1 "VCC" H 2250 6000 50  0000 C CNN
F 2 "" H 2250 5850 50  0000 C CNN
F 3 "" H 2250 5850 50  0000 C CNN
	1    2250 5850
	-1   0    0    1   
$EndComp
$Comp
L BC857 Q6
U 1 1 5721507F
P 1750 5200
F 0 "Q6" H 1950 5275 50  0000 L CNN
F 1 "BC857" H 1950 5200 50  0000 L CNN
F 2 "SOT-23" H 1950 5125 50  0000 L CIN
F 3 "" H 1750 5200 50  0000 L CNN
	1    1750 5200
	1    0    0    -1  
$EndComp
Text GLabel 1900 4800 2    60   Input ~ 0
ROW_B2
$Comp
L R R6
U 1 1 57215086
P 1550 5950
F 0 "R6" V 1630 5950 50  0000 C CNN
F 1 "1k" V 1550 5950 50  0000 C CNN
F 2 "" V 1480 5950 50  0000 C CNN
F 3 "" H 1550 5950 50  0000 C CNN
	1    1550 5950
	-1   0    0    1   
$EndComp
$Comp
L BC857 Q4
U 1 1 5721508F
P 1350 4900
F 0 "Q4" H 1550 4975 50  0000 L CNN
F 1 "BC857" H 1550 4900 50  0000 L CNN
F 2 "SOT-23" H 1550 4825 50  0000 L CIN
F 3 "" H 1350 4900 50  0000 L CNN
	1    1350 4900
	1    0    0    -1  
$EndComp
$Comp
L BC857 Q2
U 1 1 57215095
P 950 4600
F 0 "Q2" H 1150 4675 50  0000 L CNN
F 1 "BC857" H 1150 4600 50  0000 L CNN
F 2 "SOT-23" H 1150 4525 50  0000 L CIN
F 3 "" H 950 4600 50  0000 L CNN
	1    950  4600
	1    0    0    -1  
$EndComp
Text GLabel 1500 4550 2    60   Input ~ 0
ROW_B3
$Comp
L R R4
U 1 1 5721509C
P 1150 5950
F 0 "R4" V 1230 5950 50  0000 C CNN
F 1 "1k" V 1150 5950 50  0000 C CNN
F 2 "" V 1080 5950 50  0000 C CNN
F 3 "" H 1150 5950 50  0000 C CNN
	1    1150 5950
	-1   0    0    1   
$EndComp
Text GLabel 1100 4200 2    60   Input ~ 0
ROW_B4
$Comp
L R R2
U 1 1 572150A6
P 750 5950
F 0 "R2" V 830 5950 50  0000 C CNN
F 1 "1k" V 750 5950 50  0000 C CNN
F 2 "" V 680 5950 50  0000 C CNN
F 3 "" H 750 5950 50  0000 C CNN
	1    750  5950
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR034
U 1 1 572150AF
P 1850 5550
F 0 "#PWR034" H 1850 5400 50  0001 C CNN
F 1 "VCC" H 1850 5700 50  0000 C CNN
F 2 "" H 1850 5550 50  0000 C CNN
F 3 "" H 1850 5550 50  0000 C CNN
	1    1850 5550
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR035
U 1 1 572150B5
P 1450 5250
F 0 "#PWR035" H 1450 5100 50  0001 C CNN
F 1 "VCC" H 1450 5400 50  0000 C CNN
F 2 "" H 1450 5250 50  0000 C CNN
F 3 "" H 1450 5250 50  0000 C CNN
	1    1450 5250
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR036
U 1 1 572150BB
P 1050 4950
F 0 "#PWR036" H 1050 4800 50  0001 C CNN
F 1 "VCC" H 1050 5100 50  0000 C CNN
F 2 "" H 1050 4950 50  0000 C CNN
F 3 "" H 1050 4950 50  0000 C CNN
	1    1050 4950
	-1   0    0    1   
$EndComp
$Comp
L BC857 Q16
U 1 1 572150C5
P 5400 5500
F 0 "Q16" H 5600 5575 50  0000 L CNN
F 1 "BC857" H 5600 5500 50  0000 L CNN
F 2 "SOT-23" H 5600 5425 50  0000 L CIN
F 3 "" H 5400 5500 50  0000 L CNN
	1    5400 5500
	1    0    0    -1  
$EndComp
Text GLabel 5550 5100 2    60   Input ~ 0
ROW_B5
$Comp
L BC857 Q14
U 1 1 572150CC
P 5000 5200
F 0 "Q14" H 5200 5275 50  0000 L CNN
F 1 "BC857" H 5200 5200 50  0000 L CNN
F 2 "SOT-23" H 5200 5125 50  0000 L CIN
F 3 "" H 5000 5200 50  0000 L CNN
	1    5000 5200
	1    0    0    -1  
$EndComp
Text GLabel 5150 4800 2    60   Input ~ 0
ROW_B6
$Comp
L BC857 Q12
U 1 1 572150D3
P 4600 4900
F 0 "Q12" H 4800 4975 50  0000 L CNN
F 1 "BC857" H 4800 4900 50  0000 L CNN
F 2 "SOT-23" H 4800 4825 50  0000 L CIN
F 3 "" H 4600 4900 50  0000 L CNN
	1    4600 4900
	1    0    0    -1  
$EndComp
$Comp
L BC857 Q10
U 1 1 572150D9
P 4200 4600
F 0 "Q10" H 4400 4675 50  0000 L CNN
F 1 "BC857" H 4400 4600 50  0000 L CNN
F 2 "SOT-23" H 4400 4525 50  0000 L CIN
F 3 "" H 4200 4600 50  0000 L CNN
	1    4200 4600
	1    0    0    -1  
$EndComp
Text GLabel 4750 4550 2    60   Input ~ 0
ROW_B7
$Comp
L VCC #PWR037
U 1 1 572150E0
P 5100 5550
F 0 "#PWR037" H 5100 5400 50  0001 C CNN
F 1 "VCC" H 5100 5700 50  0000 C CNN
F 2 "" H 5100 5550 50  0000 C CNN
F 3 "" H 5100 5550 50  0000 C CNN
	1    5100 5550
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR038
U 1 1 572150E6
P 4700 5250
F 0 "#PWR038" H 4700 5100 50  0001 C CNN
F 1 "VCC" H 4700 5400 50  0000 C CNN
F 2 "" H 4700 5250 50  0000 C CNN
F 3 "" H 4700 5250 50  0000 C CNN
	1    4700 5250
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR039
U 1 1 572150EC
P 4300 4950
F 0 "#PWR039" H 4300 4800 50  0001 C CNN
F 1 "VCC" H 4300 5100 50  0000 C CNN
F 2 "" H 4300 4950 50  0000 C CNN
F 3 "" H 4300 4950 50  0000 C CNN
	1    4300 4950
	-1   0    0    1   
$EndComp
Text GLabel 4350 4200 2    60   Input ~ 0
ROW_B8
$Comp
L R R11
U 1 1 572150F6
P 4000 5950
F 0 "R11" V 4080 5950 50  0000 C CNN
F 1 "1k" V 4000 5950 50  0000 C CNN
F 2 "" V 3930 5950 50  0000 C CNN
F 3 "" H 4000 5950 50  0000 C CNN
	1    4000 5950
	-1   0    0    1   
$EndComp
$Comp
L R R15
U 1 1 572150FF
P 4400 5950
F 0 "R15" V 4480 5950 50  0000 C CNN
F 1 "1k" V 4400 5950 50  0000 C CNN
F 2 "" V 4330 5950 50  0000 C CNN
F 3 "" H 4400 5950 50  0000 C CNN
	1    4400 5950
	-1   0    0    1   
$EndComp
$Comp
L R R19
U 1 1 57215108
P 4800 5950
F 0 "R19" V 4880 5950 50  0000 C CNN
F 1 "1k" V 4800 5950 50  0000 C CNN
F 2 "" V 4730 5950 50  0000 C CNN
F 3 "" H 4800 5950 50  0000 C CNN
	1    4800 5950
	-1   0    0    1   
$EndComp
$Comp
L R R23
U 1 1 57215111
P 5200 5950
F 0 "R23" V 5280 5950 50  0000 C CNN
F 1 "1k" V 5200 5950 50  0000 C CNN
F 2 "" V 5130 5950 50  0000 C CNN
F 3 "" H 5200 5950 50  0000 C CNN
	1    5200 5950
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR040
U 1 1 5721511A
P 5500 5850
F 0 "#PWR040" H 5500 5700 50  0001 C CNN
F 1 "VCC" H 5500 6000 50  0000 C CNN
F 2 "" H 5500 5850 50  0000 C CNN
F 3 "" H 5500 5850 50  0000 C CNN
	1    5500 5850
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR041
U 1 1 57215121
P 3850 5800
F 0 "#PWR041" H 3850 5550 50  0001 C CNN
F 1 "GND" H 3850 5650 50  0000 C CNN
F 2 "" H 3850 5800 50  0000 C CNN
F 3 "" H 3850 5800 50  0000 C CNN
	1    3850 5800
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR042
U 1 1 57215129
P 2650 5850
F 0 "#PWR042" H 2650 5700 50  0001 C CNN
F 1 "VCC" H 2650 6000 50  0000 C CNN
F 2 "" H 2650 5850 50  0000 C CNN
F 3 "" H 2650 5850 50  0000 C CNN
	1    2650 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR043
U 1 1 57215131
P 2700 7050
F 0 "#PWR043" H 2700 6800 50  0001 C CNN
F 1 "GND" H 2700 6900 50  0000 C CNN
F 2 "" H 2700 7050 50  0000 C CNN
F 3 "" H 2700 7050 50  0000 C CNN
	1    2700 7050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR044
U 1 1 57215137
P 3800 7050
F 0 "#PWR044" H 3800 6800 50  0001 C CNN
F 1 "GND" H 3800 6900 50  0000 C CNN
F 2 "" H 3800 7050 50  0000 C CNN
F 3 "" H 3800 7050 50  0000 C CNN
	1    3800 7050
	1    0    0    -1  
$EndComp
Text Notes 600  4100 0    60   ~ 0
ROW_B
$Comp
L VCC #PWR045
U 1 1 57215144
P 2250 5850
F 0 "#PWR045" H 2250 5700 50  0001 C CNN
F 1 "VCC" H 2250 6000 50  0000 C CNN
F 2 "" H 2250 5850 50  0000 C CNN
F 3 "" H 2250 5850 50  0000 C CNN
	1    2250 5850
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR046
U 1 1 5721514A
P 1850 5550
F 0 "#PWR046" H 1850 5400 50  0001 C CNN
F 1 "VCC" H 1850 5700 50  0000 C CNN
F 2 "" H 1850 5550 50  0000 C CNN
F 3 "" H 1850 5550 50  0000 C CNN
	1    1850 5550
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR047
U 1 1 57215150
P 1450 5250
F 0 "#PWR047" H 1450 5100 50  0001 C CNN
F 1 "VCC" H 1450 5400 50  0000 C CNN
F 2 "" H 1450 5250 50  0000 C CNN
F 3 "" H 1450 5250 50  0000 C CNN
	1    1450 5250
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR048
U 1 1 57215156
P 1050 4950
F 0 "#PWR048" H 1050 4800 50  0001 C CNN
F 1 "VCC" H 1050 5100 50  0000 C CNN
F 2 "" H 1050 4950 50  0000 C CNN
F 3 "" H 1050 4950 50  0000 C CNN
	1    1050 4950
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR049
U 1 1 5721515C
P 5100 5550
F 0 "#PWR049" H 5100 5400 50  0001 C CNN
F 1 "VCC" H 5100 5700 50  0000 C CNN
F 2 "" H 5100 5550 50  0000 C CNN
F 3 "" H 5100 5550 50  0000 C CNN
	1    5100 5550
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR050
U 1 1 57215162
P 4700 5250
F 0 "#PWR050" H 4700 5100 50  0001 C CNN
F 1 "VCC" H 4700 5400 50  0000 C CNN
F 2 "" H 4700 5250 50  0000 C CNN
F 3 "" H 4700 5250 50  0000 C CNN
	1    4700 5250
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR051
U 1 1 57215168
P 4300 4950
F 0 "#PWR051" H 4300 4800 50  0001 C CNN
F 1 "VCC" H 4300 5100 50  0000 C CNN
F 2 "" H 4300 4950 50  0000 C CNN
F 3 "" H 4300 4950 50  0000 C CNN
	1    4300 4950
	-1   0    0    1   
$EndComp
$Comp
L R R12
U 1 1 5721516E
P 4000 5950
F 0 "R12" V 4080 5950 50  0000 C CNN
F 1 "1k" V 4000 5950 50  0000 C CNN
F 2 "" V 3930 5950 50  0000 C CNN
F 3 "" H 4000 5950 50  0000 C CNN
	1    4000 5950
	-1   0    0    1   
$EndComp
$Comp
L R R16
U 1 1 57215174
P 4400 5950
F 0 "R16" V 4480 5950 50  0000 C CNN
F 1 "1k" V 4400 5950 50  0000 C CNN
F 2 "" V 4330 5950 50  0000 C CNN
F 3 "" H 4400 5950 50  0000 C CNN
	1    4400 5950
	-1   0    0    1   
$EndComp
$Comp
L R R20
U 1 1 5721517A
P 4800 5950
F 0 "R20" V 4880 5950 50  0000 C CNN
F 1 "1k" V 4800 5950 50  0000 C CNN
F 2 "" V 4730 5950 50  0000 C CNN
F 3 "" H 4800 5950 50  0000 C CNN
	1    4800 5950
	-1   0    0    1   
$EndComp
$Comp
L R R24
U 1 1 57215180
P 5200 5950
F 0 "R24" V 5280 5950 50  0000 C CNN
F 1 "1k" V 5200 5950 50  0000 C CNN
F 2 "" V 5130 5950 50  0000 C CNN
F 3 "" H 5200 5950 50  0000 C CNN
	1    5200 5950
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR052
U 1 1 57215186
P 5500 5850
F 0 "#PWR052" H 5500 5700 50  0001 C CNN
F 1 "VCC" H 5500 6000 50  0000 C CNN
F 2 "" H 5500 5850 50  0000 C CNN
F 3 "" H 5500 5850 50  0000 C CNN
	1    5500 5850
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR053
U 1 1 5721518C
P 3850 5800
F 0 "#PWR053" H 3850 5550 50  0001 C CNN
F 1 "GND" H 3850 5650 50  0000 C CNN
F 2 "" H 3850 5800 50  0000 C CNN
F 3 "" H 3850 5800 50  0000 C CNN
	1    3850 5800
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR054
U 1 1 57215192
P 2650 5850
F 0 "#PWR054" H 2650 5700 50  0001 C CNN
F 1 "VCC" H 2650 6000 50  0000 C CNN
F 2 "" H 2650 5850 50  0000 C CNN
F 3 "" H 2650 5850 50  0000 C CNN
	1    2650 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR055
U 1 1 57215198
P 2700 7050
F 0 "#PWR055" H 2700 6800 50  0001 C CNN
F 1 "GND" H 2700 6900 50  0000 C CNN
F 2 "" H 2700 7050 50  0000 C CNN
F 3 "" H 2700 7050 50  0000 C CNN
	1    2700 7050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR056
U 1 1 5721519E
P 3800 7050
F 0 "#PWR056" H 3800 6800 50  0001 C CNN
F 1 "GND" H 3800 6900 50  0000 C CNN
F 2 "" H 3800 7050 50  0000 C CNN
F 3 "" H 3800 7050 50  0000 C CNN
	1    3800 7050
	1    0    0    -1  
$EndComp
Text GLabel 4000 6650 2    60   Input ~ 0
SRCK
Text GLabel 4000 6750 2    60   Input ~ 0
RCK
Text GLabel 4000 3150 2    60   Input ~ 0
SRCK
Text GLabel 4000 3250 2    60   Input ~ 0
RCK
Text HLabel 2100 3250 0    60   Input ~ 0
ROW_A_SERIN
Text HLabel 4800 3250 2    60   Output ~ 0
ROW_A_SEROUT
Wire Wire Line
	1950 2000 1950 2300
Wire Wire Line
	1950 2600 1950 2750
Wire Wire Line
	1950 2750 2700 2750
Wire Wire Line
	1550 2300 1550 1700
Wire Wire Line
	1550 2600 1550 2850
Wire Wire Line
	1550 2850 2700 2850
Wire Wire Line
	1150 2600 1150 2950
Wire Wire Line
	1150 2950 2700 2950
Wire Wire Line
	1150 1400 1150 2300
Wire Wire Line
	750  1100 750  2300
Wire Wire Line
	750  2600 750  3050
Wire Wire Line
	750  3050 2700 3050
Wire Wire Line
	2250 2200 2250 2350
Wire Wire Line
	1850 1900 1850 2050
Wire Wire Line
	1450 1600 1450 1750
Wire Wire Line
	1050 1300 1050 1450
Wire Wire Line
	5100 1900 5100 2050
Wire Wire Line
	4700 1600 4700 1750
Wire Wire Line
	4300 1300 4300 1450
Wire Wire Line
	3800 2750 4000 2750
Wire Wire Line
	4000 2750 4000 2600
Wire Wire Line
	4000 2300 4000 1100
Wire Wire Line
	4400 2300 4400 1400
Wire Wire Line
	3800 2850 4400 2850
Wire Wire Line
	4400 2850 4400 2600
Wire Wire Line
	4800 1700 4800 2300
Wire Wire Line
	3800 2950 4800 2950
Wire Wire Line
	4800 2950 4800 2600
Wire Wire Line
	5200 2000 5200 2300
Wire Wire Line
	5200 2600 5200 3050
Wire Wire Line
	5200 3050 3800 3050
Wire Wire Line
	5500 2350 5500 2200
Wire Wire Line
	3850 2300 3850 2550
Wire Wire Line
	3850 2550 3800 2550
Wire Wire Line
	2650 2350 2650 3150
Wire Wire Line
	2650 2550 2700 2550
Wire Wire Line
	3800 3550 3800 3350
Wire Wire Line
	2700 3250 2700 3550
Wire Notes Line
	600  600  600  3750
Wire Notes Line
	600  3750 6000 3750
Wire Notes Line
	6000 3750 6000 600 
Wire Notes Line
	6000 600  600  600 
Wire Wire Line
	1450 1200 1450 1050
Wire Wire Line
	1450 1050 1500 1050
Wire Wire Line
	1050 900  1050 700 
Wire Wire Line
	1050 700  1100 700 
Wire Wire Line
	1850 1500 1850 1300
Wire Wire Line
	1850 1300 1900 1300
Wire Wire Line
	2250 1800 2250 1600
Wire Wire Line
	2250 1600 2300 1600
Wire Wire Line
	4300 900  4300 700 
Wire Wire Line
	4300 700  4350 700 
Wire Wire Line
	4700 1200 4700 1050
Wire Wire Line
	4700 1050 4750 1050
Wire Wire Line
	5100 1500 5100 1300
Wire Wire Line
	5100 1300 5150 1300
Wire Wire Line
	5500 1800 5500 1600
Wire Wire Line
	5500 1600 5550 1600
Wire Wire Line
	1950 5500 1950 5800
Wire Wire Line
	1950 6100 1950 6250
Wire Wire Line
	1950 6250 2700 6250
Wire Wire Line
	1550 5800 1550 5200
Wire Wire Line
	1550 6100 1550 6350
Wire Wire Line
	1550 6350 2700 6350
Wire Wire Line
	1150 6100 1150 6450
Wire Wire Line
	1150 6450 2700 6450
Wire Wire Line
	1150 4900 1150 5800
Wire Wire Line
	750  4600 750  5800
Wire Wire Line
	750  6100 750  6550
Wire Wire Line
	750  6550 2700 6550
Wire Wire Line
	2250 5700 2250 5850
Wire Wire Line
	1850 5400 1850 5550
Wire Wire Line
	1450 5100 1450 5250
Wire Wire Line
	1050 4800 1050 4950
Wire Wire Line
	5100 5400 5100 5550
Wire Wire Line
	4700 5100 4700 5250
Wire Wire Line
	4300 4800 4300 4950
Wire Wire Line
	3800 6250 4000 6250
Wire Wire Line
	4000 6250 4000 6100
Wire Wire Line
	4000 5800 4000 4600
Wire Wire Line
	4400 5800 4400 4900
Wire Wire Line
	3800 6350 4400 6350
Wire Wire Line
	4400 6350 4400 6100
Wire Wire Line
	4800 5200 4800 5800
Wire Wire Line
	3800 6450 4800 6450
Wire Wire Line
	4800 6450 4800 6100
Wire Wire Line
	5200 5500 5200 5800
Wire Wire Line
	5200 6100 5200 6550
Wire Wire Line
	5200 6550 3800 6550
Wire Wire Line
	5500 5850 5500 5700
Wire Wire Line
	3850 5800 3850 6050
Wire Wire Line
	3850 6050 3800 6050
Wire Wire Line
	2650 5850 2650 6650
Wire Wire Line
	2650 6050 2700 6050
Wire Wire Line
	3800 7050 3800 6850
Wire Wire Line
	2700 6750 2700 7050
Wire Notes Line
	600  4100 600  7250
Wire Notes Line
	600  7250 6000 7250
Wire Notes Line
	6000 7250 6000 4100
Wire Notes Line
	6000 4100 600  4100
Wire Wire Line
	1450 4700 1450 4550
Wire Wire Line
	1450 4550 1500 4550
Wire Wire Line
	1050 4400 1050 4200
Wire Wire Line
	1050 4200 1100 4200
Wire Wire Line
	1850 5000 1850 4800
Wire Wire Line
	1850 4800 1900 4800
Wire Wire Line
	2250 5300 2250 5100
Wire Wire Line
	2250 5100 2300 5100
Wire Wire Line
	4300 4400 4300 4200
Wire Wire Line
	4300 4200 4350 4200
Wire Wire Line
	4700 4700 4700 4550
Wire Wire Line
	4700 4550 4750 4550
Wire Wire Line
	5100 5000 5100 4800
Wire Wire Line
	5100 4800 5150 4800
Wire Wire Line
	5500 5300 5500 5100
Wire Wire Line
	5500 5100 5550 5100
Connection ~ 2700 6850
Wire Wire Line
	2650 6650 2700 6650
Connection ~ 2650 6050
Connection ~ 2700 3350
Wire Wire Line
	2650 3150 2700 3150
Connection ~ 2650 2550
Wire Wire Line
	4000 6650 3800 6650
Wire Wire Line
	4000 6750 3800 6750
Wire Wire Line
	4000 3250 3800 3250
Wire Wire Line
	3800 3150 4000 3150
Wire Wire Line
	2700 2650 2400 2650
Wire Wire Line
	2400 2650 2400 3250
Wire Wire Line
	2400 3250 2100 3250
Wire Wire Line
	3800 2650 4700 2650
Text HLabel 2100 6750 0    60   Input ~ 0
ROW_B_SERIN
Wire Wire Line
	2100 6750 2400 6750
Wire Wire Line
	2400 6750 2400 6150
Wire Wire Line
	2400 6150 2700 6150
Text HLabel 4800 6750 2    60   Output ~ 0
ROW_B_SEROUT
Wire Wire Line
	4700 2650 4700 3250
Wire Wire Line
	4700 3250 4800 3250
Wire Wire Line
	3800 6150 4700 6150
Wire Wire Line
	4700 6150 4700 6750
Wire Wire Line
	4700 6750 4800 6750
$Comp
L TPIC6B595 U3
U 1 1 5720EA0E
P 8600 2700
F 0 "U3" H 8600 3800 60  0000 C CNN
F 1 "TPIC6B595" H 8600 2650 60  0000 C CNN
F 2 "" H 8600 2700 60  0000 C CNN
F 3 "" H 8600 2700 60  0000 C CNN
	1    8600 2700
	1    0    0    -1  
$EndComp
$Comp
L R R31
U 1 1 5720EA15
P 7750 1800
F 0 "R31" V 7830 1800 50  0000 C CNN
F 1 "330" V 7750 1800 50  0000 C CNN
F 2 "" V 7680 1800 50  0000 C CNN
F 3 "" H 7750 1800 50  0000 C CNN
	1    7750 1800
	-1   0    0    1   
$EndComp
$Comp
L R R29
U 1 1 5720EA1C
P 7550 1800
F 0 "R29" V 7630 1800 50  0000 C CNN
F 1 "330" V 7550 1800 50  0000 C CNN
F 2 "" V 7480 1800 50  0000 C CNN
F 3 "" H 7550 1800 50  0000 C CNN
	1    7550 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	7750 1950 7750 2050
Wire Wire Line
	7750 2050 8050 2050
$Comp
L R R27
U 1 1 5720EA25
P 7350 1800
F 0 "R27" V 7430 1800 50  0000 C CNN
F 1 "330" V 7350 1800 50  0000 C CNN
F 2 "" V 7280 1800 50  0000 C CNN
F 3 "" H 7350 1800 50  0000 C CNN
	1    7350 1800
	-1   0    0    1   
$EndComp
$Comp
L R R25
U 1 1 5720EA2C
P 7150 1800
F 0 "R25" V 7230 1800 50  0000 C CNN
F 1 "330" V 7150 1800 50  0000 C CNN
F 2 "" V 7080 1800 50  0000 C CNN
F 3 "" H 7150 1800 50  0000 C CNN
	1    7150 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	7550 1950 7550 2150
Wire Wire Line
	7550 2150 8050 2150
Wire Wire Line
	7350 1950 7350 2250
Wire Wire Line
	7350 2250 8050 2250
Wire Wire Line
	7150 1950 7150 2350
Wire Wire Line
	7150 2350 8050 2350
$Comp
L VCC #PWR057
U 1 1 5720EA39
P 8000 1600
F 0 "#PWR057" H 8000 1450 50  0001 C CNN
F 1 "VCC" H 8000 1750 50  0000 C CNN
F 2 "" H 8000 1600 50  0000 C CNN
F 3 "" H 8000 1600 50  0000 C CNN
	1    8000 1600
	1    0    0    -1  
$EndComp
Text GLabel 7750 1500 1    60   Input ~ 0
COL_C1
Text GLabel 7550 1500 1    60   Input ~ 0
COL_C2
Text GLabel 7350 1500 1    60   Input ~ 0
COL_C3
Text GLabel 7150 1500 1    60   Input ~ 0
COL_C4
Wire Wire Line
	7750 1500 7750 1650
Wire Wire Line
	7550 1500 7550 1650
Wire Wire Line
	7350 1500 7350 1650
Wire Wire Line
	7150 1500 7150 1650
$Comp
L R R33
U 1 1 5720EA47
P 9450 1800
F 0 "R33" V 9530 1800 50  0000 C CNN
F 1 "330" V 9450 1800 50  0000 C CNN
F 2 "" V 9380 1800 50  0000 C CNN
F 3 "" H 9450 1800 50  0000 C CNN
	1    9450 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	9150 2050 9450 2050
Wire Wire Line
	9450 2050 9450 1950
$Comp
L R R35
U 1 1 5720EA50
P 9650 1800
F 0 "R35" V 9730 1800 50  0000 C CNN
F 1 "330" V 9650 1800 50  0000 C CNN
F 2 "" V 9580 1800 50  0000 C CNN
F 3 "" H 9650 1800 50  0000 C CNN
	1    9650 1800
	-1   0    0    1   
$EndComp
$Comp
L R R37
U 1 1 5720EA57
P 9850 1800
F 0 "R37" V 9930 1800 50  0000 C CNN
F 1 "330" V 9850 1800 50  0000 C CNN
F 2 "" V 9780 1800 50  0000 C CNN
F 3 "" H 9850 1800 50  0000 C CNN
	1    9850 1800
	-1   0    0    1   
$EndComp
$Comp
L R R39
U 1 1 5720EA5E
P 10050 1800
F 0 "R39" V 10130 1800 50  0000 C CNN
F 1 "330" V 10050 1800 50  0000 C CNN
F 2 "" V 9980 1800 50  0000 C CNN
F 3 "" H 10050 1800 50  0000 C CNN
	1    10050 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	9150 2150 9650 2150
Wire Wire Line
	9650 2150 9650 1950
Wire Wire Line
	9850 1950 9850 2250
Wire Wire Line
	9850 2250 9150 2250
Wire Wire Line
	9150 2350 10050 2350
Wire Wire Line
	10050 2350 10050 1950
Text GLabel 9450 1500 1    60   Input ~ 0
COL_C8
Text GLabel 9650 1500 1    60   Input ~ 0
COL_C7
Text GLabel 9850 1500 1    60   Input ~ 0
COL_C6
Text GLabel 10050 1500 1    60   Input ~ 0
COL_C5
Wire Wire Line
	10050 1500 10050 1650
Wire Wire Line
	9850 1500 9850 1650
Wire Wire Line
	9650 1500 9650 1650
Wire Wire Line
	9450 1500 9450 1650
$Comp
L GND #PWR058
U 1 1 5720EA73
P 9200 1600
F 0 "#PWR058" H 9200 1350 50  0001 C CNN
F 1 "GND" H 9200 1450 50  0000 C CNN
F 2 "" H 9200 1600 50  0000 C CNN
F 3 "" H 9200 1600 50  0000 C CNN
	1    9200 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	9200 1850 9150 1850
Wire Wire Line
	9200 1850 9200 1600
Wire Wire Line
	8050 1850 8000 1850
Wire Wire Line
	8000 1600 8000 2450
$Comp
L GND #PWR059
U 1 1 5720EA7D
P 8050 2800
F 0 "#PWR059" H 8050 2550 50  0001 C CNN
F 1 "GND" H 8050 2650 50  0000 C CNN
F 2 "" H 8050 2800 50  0000 C CNN
F 3 "" H 8050 2800 50  0000 C CNN
	1    8050 2800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR060
U 1 1 5720EA83
P 9150 2800
F 0 "#PWR060" H 9150 2550 50  0001 C CNN
F 1 "GND" H 9150 2650 50  0000 C CNN
F 2 "" H 9150 2800 50  0000 C CNN
F 3 "" H 9150 2800 50  0000 C CNN
	1    9150 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 2550 8050 2800
Wire Wire Line
	9150 2650 9150 2800
Wire Wire Line
	8000 2450 8050 2450
Connection ~ 8000 1850
Connection ~ 8050 2650
Text GLabel 9350 2450 2    60   Input ~ 0
SRCK
Wire Wire Line
	9350 2450 9150 2450
Text GLabel 9350 2550 2    60   Input ~ 0
RCK
Wire Wire Line
	9350 2550 9150 2550
Text HLabel 7700 2550 0    60   Input ~ 0
COL_C_SERIN
Wire Wire Line
	8050 1950 7850 1950
Wire Wire Line
	7850 1950 7850 2550
Wire Wire Line
	7850 2550 7700 2550
Text HLabel 8900 1300 0    60   Output ~ 0
COL_C_SEROUT
Wire Wire Line
	9150 1950 9300 1950
Wire Wire Line
	9300 1950 9300 1300
Wire Wire Line
	9300 1300 8900 1300
Wire Notes Line
	7000 1000 10150 1000
Wire Notes Line
	10150 1000 10150 3000
Wire Notes Line
	10150 3000 7000 3000
Wire Notes Line
	7000 3000 7000 1000
Text Notes 7000 1000 0    60   ~ 0
COL_C
$Comp
L TPIC6B595 U4
U 1 1 5720F595
P 8600 5800
F 0 "U4" H 8600 6900 60  0000 C CNN
F 1 "TPIC6B595" H 8600 5750 60  0000 C CNN
F 2 "" H 8600 5800 60  0000 C CNN
F 3 "" H 8600 5800 60  0000 C CNN
	1    8600 5800
	1    0    0    -1  
$EndComp
$Comp
L R R32
U 1 1 5720F59B
P 7750 4900
F 0 "R32" V 7830 4900 50  0000 C CNN
F 1 "330" V 7750 4900 50  0000 C CNN
F 2 "" V 7680 4900 50  0000 C CNN
F 3 "" H 7750 4900 50  0000 C CNN
	1    7750 4900
	-1   0    0    1   
$EndComp
$Comp
L R R30
U 1 1 5720F5A1
P 7550 4900
F 0 "R30" V 7630 4900 50  0000 C CNN
F 1 "330" V 7550 4900 50  0000 C CNN
F 2 "" V 7480 4900 50  0000 C CNN
F 3 "" H 7550 4900 50  0000 C CNN
	1    7550 4900
	-1   0    0    1   
$EndComp
Wire Wire Line
	7750 5050 7750 5150
Wire Wire Line
	7750 5150 8050 5150
$Comp
L R R28
U 1 1 5720F5A9
P 7350 4900
F 0 "R28" V 7430 4900 50  0000 C CNN
F 1 "330" V 7350 4900 50  0000 C CNN
F 2 "" V 7280 4900 50  0000 C CNN
F 3 "" H 7350 4900 50  0000 C CNN
	1    7350 4900
	-1   0    0    1   
$EndComp
$Comp
L R R26
U 1 1 5720F5AF
P 7150 4900
F 0 "R26" V 7230 4900 50  0000 C CNN
F 1 "330" V 7150 4900 50  0000 C CNN
F 2 "" V 7080 4900 50  0000 C CNN
F 3 "" H 7150 4900 50  0000 C CNN
	1    7150 4900
	-1   0    0    1   
$EndComp
Wire Wire Line
	7550 5050 7550 5250
Wire Wire Line
	7550 5250 8050 5250
Wire Wire Line
	7350 5050 7350 5350
Wire Wire Line
	7350 5350 8050 5350
Wire Wire Line
	7150 5050 7150 5450
Wire Wire Line
	7150 5450 8050 5450
$Comp
L VCC #PWR061
U 1 1 5720F5BB
P 8000 4700
F 0 "#PWR061" H 8000 4550 50  0001 C CNN
F 1 "VCC" H 8000 4850 50  0000 C CNN
F 2 "" H 8000 4700 50  0000 C CNN
F 3 "" H 8000 4700 50  0000 C CNN
	1    8000 4700
	1    0    0    -1  
$EndComp
Text GLabel 7750 4600 1    60   Input ~ 0
COL_D1
Text GLabel 7550 4600 1    60   Input ~ 0
COL_D2
Text GLabel 7350 4600 1    60   Input ~ 0
COL_D3
Text GLabel 7150 4600 1    60   Input ~ 0
COL_D4
Wire Wire Line
	7750 4600 7750 4750
Wire Wire Line
	7550 4600 7550 4750
Wire Wire Line
	7350 4600 7350 4750
Wire Wire Line
	7150 4600 7150 4750
$Comp
L R R34
U 1 1 5720F5C9
P 9450 4900
F 0 "R34" V 9530 4900 50  0000 C CNN
F 1 "330" V 9450 4900 50  0000 C CNN
F 2 "" V 9380 4900 50  0000 C CNN
F 3 "" H 9450 4900 50  0000 C CNN
	1    9450 4900
	-1   0    0    1   
$EndComp
Wire Wire Line
	9150 5150 9450 5150
Wire Wire Line
	9450 5150 9450 5050
$Comp
L R R36
U 1 1 5720F5D1
P 9650 4900
F 0 "R36" V 9730 4900 50  0000 C CNN
F 1 "330" V 9650 4900 50  0000 C CNN
F 2 "" V 9580 4900 50  0000 C CNN
F 3 "" H 9650 4900 50  0000 C CNN
	1    9650 4900
	-1   0    0    1   
$EndComp
$Comp
L R R38
U 1 1 5720F5D7
P 9850 4900
F 0 "R38" V 9930 4900 50  0000 C CNN
F 1 "330" V 9850 4900 50  0000 C CNN
F 2 "" V 9780 4900 50  0000 C CNN
F 3 "" H 9850 4900 50  0000 C CNN
	1    9850 4900
	-1   0    0    1   
$EndComp
$Comp
L R R40
U 1 1 5720F5DD
P 10050 4900
F 0 "R40" V 10130 4900 50  0000 C CNN
F 1 "330" V 10050 4900 50  0000 C CNN
F 2 "" V 9980 4900 50  0000 C CNN
F 3 "" H 10050 4900 50  0000 C CNN
	1    10050 4900
	-1   0    0    1   
$EndComp
Wire Wire Line
	9150 5250 9650 5250
Wire Wire Line
	9650 5250 9650 5050
Wire Wire Line
	9850 5050 9850 5350
Wire Wire Line
	9850 5350 9150 5350
Wire Wire Line
	9150 5450 10050 5450
Wire Wire Line
	10050 5450 10050 5050
Text GLabel 9450 4600 1    60   Input ~ 0
COL_D8
Text GLabel 9650 4600 1    60   Input ~ 0
COL_D7
Text GLabel 9850 4600 1    60   Input ~ 0
COL_D6
Text GLabel 10050 4600 1    60   Input ~ 0
COL_D5
Wire Wire Line
	10050 4600 10050 4750
Wire Wire Line
	9850 4600 9850 4750
Wire Wire Line
	9650 4600 9650 4750
Wire Wire Line
	9450 4600 9450 4750
$Comp
L GND #PWR062
U 1 1 5720F5F1
P 9200 4700
F 0 "#PWR062" H 9200 4450 50  0001 C CNN
F 1 "GND" H 9200 4550 50  0000 C CNN
F 2 "" H 9200 4700 50  0000 C CNN
F 3 "" H 9200 4700 50  0000 C CNN
	1    9200 4700
	-1   0    0    1   
$EndComp
Wire Wire Line
	9200 4950 9150 4950
Wire Wire Line
	9200 4950 9200 4700
Wire Wire Line
	8050 4950 8000 4950
Wire Wire Line
	8000 4700 8000 5550
$Comp
L GND #PWR063
U 1 1 5720F5FB
P 8050 5900
F 0 "#PWR063" H 8050 5650 50  0001 C CNN
F 1 "GND" H 8050 5750 50  0000 C CNN
F 2 "" H 8050 5900 50  0000 C CNN
F 3 "" H 8050 5900 50  0000 C CNN
	1    8050 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR064
U 1 1 5720F601
P 9150 5900
F 0 "#PWR064" H 9150 5650 50  0001 C CNN
F 1 "GND" H 9150 5750 50  0000 C CNN
F 2 "" H 9150 5900 50  0000 C CNN
F 3 "" H 9150 5900 50  0000 C CNN
	1    9150 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 5650 8050 5900
Wire Wire Line
	9150 5750 9150 5900
Wire Wire Line
	8000 5550 8050 5550
Connection ~ 8000 4950
Connection ~ 8050 5750
Text GLabel 9350 5550 2    60   Input ~ 0
SRCK
Wire Wire Line
	9350 5550 9150 5550
Text GLabel 9350 5650 2    60   Input ~ 0
RCK
Wire Wire Line
	9350 5650 9150 5650
Text HLabel 7700 5650 0    60   Input ~ 0
COL_D_SERIN
Wire Wire Line
	8050 5050 7850 5050
Wire Wire Line
	7850 5050 7850 5650
Wire Wire Line
	7850 5650 7700 5650
Text HLabel 8900 4400 0    60   Output ~ 0
COL_D_SEROUT
Wire Wire Line
	9150 5050 9300 5050
Wire Wire Line
	9300 5050 9300 4400
Wire Wire Line
	9300 4400 8900 4400
Wire Notes Line
	7000 4100 10150 4100
Wire Notes Line
	10150 4100 10150 6100
Wire Notes Line
	10150 6100 7000 6100
Wire Notes Line
	7000 6100 7000 4100
Text Notes 7000 4100 0    60   ~ 0
COL_D
$EndSCHEMATC