EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A2 23386 16535
encoding utf-8
Sheet 1 1
Title "MZ-1500_SD"
Date "2022-01-14"
Rev "Rev1.4"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 1000 4300 0    50   ~ 0
~EXWAIT
Text Label 1000 3100 0    50   ~ 0
~M1
Text Label 1000 3400 0    50   ~ 0
~IORQ
Text Label 1000 3200 0    50   ~ 0
~WR
Text Label 1000 4000 0    50   ~ 0
RESET
Text Label 1900 3500 0    50   ~ 0
A9
Text Label 1900 3300 0    50   ~ 0
A11
Text Label 1900 3700 0    50   ~ 0
A7
Text Label 1900 3200 0    50   ~ 0
A12
Text Label 1900 3000 0    50   ~ 0
A14
Text Label 1900 4300 0    50   ~ 0
A1
Text Label 1900 4100 0    50   ~ 0
A3
Text Label 1900 3900 0    50   ~ 0
A5
Text Label 1900 2600 0    50   ~ 0
D1
Text Label 1000 2500 0    50   ~ 0
D3
Text Label 1000 2700 0    50   ~ 0
D5
Text Label 1000 2900 0    50   ~ 0
D7
Text Label 1900 4500 0    50   ~ 0
GND
Text Label 1000 3500 0    50   ~ 0
~MREQ
Text Label 1900 3400 0    50   ~ 0
A10
Text Label 1900 3800 0    50   ~ 0
A6
Text Label 1900 3600 0    50   ~ 0
A8
Text Label 1900 3100 0    50   ~ 0
A13
Text Label 1900 4400 0    50   ~ 0
A0
Text Label 1900 4200 0    50   ~ 0
A2
Text Label 1900 4000 0    50   ~ 0
A4
Text Label 1900 2700 0    50   ~ 0
D0
Text Label 1900 2500 0    50   ~ 0
D2
Wire Wire Line
	1900 3500 2100 3500
Wire Wire Line
	1000 4000 1400 4000
Wire Wire Line
	1000 3200 1400 3200
Wire Wire Line
	1000 3400 1400 3400
Wire Wire Line
	1000 3100 1400 3100
Wire Wire Line
	1000 4300 1400 4300
Wire Wire Line
	1000 3700 1400 3700
Wire Wire Line
	1900 3200 2100 3200
Wire Wire Line
	1900 3000 2100 3000
Wire Wire Line
	1900 4300 2100 4300
Wire Wire Line
	1900 4100 2100 4100
Wire Wire Line
	1900 3900 2100 3900
Wire Wire Line
	1900 2600 2100 2600
Wire Wire Line
	1000 2500 1400 2500
Wire Wire Line
	1000 2700 1400 2700
Wire Wire Line
	1900 2500 2100 2500
Wire Wire Line
	1000 2900 1400 2900
Wire Wire Line
	1900 2700 2100 2700
Wire Wire Line
	1900 4200 2100 4200
Wire Wire Line
	1900 4000 2100 4000
Wire Wire Line
	1900 3400 2100 3400
Wire Wire Line
	1900 3800 2100 3800
Wire Wire Line
	1900 3600 2100 3600
Wire Wire Line
	1900 3100 2100 3100
Wire Wire Line
	1900 3700 2100 3700
Wire Wire Line
	1900 3300 2100 3300
Wire Wire Line
	1000 3500 1400 3500
Wire Wire Line
	2100 2800 1900 2800
Wire Wire Line
	1400 2400 1000 2400
Text Label 1900 2800 0    50   ~ 0
GND
Text Label 1000 2400 0    50   ~ 0
+5V
Text Label 1900 2400 0    50   ~ 0
+5V
Wire Wire Line
	1000 4200 1400 4200
Wire Wire Line
	1000 3300 1400 3300
Wire Wire Line
	1900 2900 2100 2900
Wire Wire Line
	1000 2600 1400 2600
Wire Wire Line
	1000 2800 1400 2800
Wire Wire Line
	1000 3000 1400 3000
Text Label 1000 4200 0    50   ~ 0
~INT
Text Label 1000 3300 0    50   ~ 0
~RD
Text Label 1900 2900 0    50   ~ 0
A15
Text Label 1000 2600 0    50   ~ 0
D4
Text Label 1000 2800 0    50   ~ 0
D6
Text Label 1000 3000 0    50   ~ 0
CLK
$Comp
L Connector_Generic:Conn_02x25_Odd_Even J1
U 1 1 61ABAF01
P 1600 3600
F 0 "J1" H 1650 2175 50  0000 C CNN
F 1 "MZ-1500 BUS" H 1650 2266 50  0000 C CNN
F 2 "MZ-1500:BUS_50Pin" H 1600 3600 50  0001 C CNN
F 3 "~" H 1600 3600 50  0001 C CNN
	1    1600 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 1250 9000 1250
$Comp
L Interface:8255 U?
U 1 1 6690AC69
P 9700 2550
AR Path="/636550FF/6690AC69" Ref="U?"  Part="1" 
AR Path="/6690AC69" Ref="U7"  Part="1" 
AR Path="/6687DD68/6690AC69" Ref="U?"  Part="1" 
F 0 "U7" H 9300 4050 50  0000 C CNN
F 1 "8255" H 10100 4050 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 9700 2850 50  0001 C CNN
F 3 "http://aturing.umcs.maine.edu/~meadow/courses/cos335/Intel8255A.pdf" H 9700 2850 50  0001 C CNN
	1    9700 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 1750 9000 1750
Wire Wire Line
	7900 1650 9000 1650
$Comp
L Device:C C?
U 1 1 6690AC71
P 9200 4200
AR Path="/636550FF/6690AC71" Ref="C?"  Part="1" 
AR Path="/6690AC71" Ref="C8"  Part="1" 
AR Path="/6687DD68/6690AC71" Ref="C?"  Part="1" 
F 0 "C8" V 9050 4300 50  0000 C CNN
F 1 "0.1uF" V 9050 4050 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 9238 4050 50  0001 C CNN
F 3 "~" H 9200 4200 50  0001 C CNN
	1    9200 4200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6690AC77
P 9700 4250
AR Path="/636550FF/6690AC77" Ref="#PWR?"  Part="1" 
AR Path="/6690AC77" Ref="#PWR06"  Part="1" 
AR Path="/6687DD68/6690AC77" Ref="#PWR?"  Part="1" 
F 0 "#PWR06" H 9700 4000 50  0001 C CNN
F 1 "GND" H 9705 4077 50  0000 C CNN
F 2 "" H 9700 4250 50  0001 C CNN
F 3 "" H 9700 4250 50  0001 C CNN
	1    9700 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 4200 9700 4200
Wire Wire Line
	9700 4200 9700 4250
Wire Wire Line
	9700 4150 9700 4200
Connection ~ 9700 4200
Wire Wire Line
	9050 4200 8950 4200
Wire Wire Line
	8950 4200 8950 950 
Wire Wire Line
	8950 950  9700 950 
$Comp
L power:+5V #PWR?
U 1 1 6690AC84
P 9700 950
AR Path="/636550FF/6690AC84" Ref="#PWR?"  Part="1" 
AR Path="/6690AC84" Ref="#PWR05"  Part="1" 
AR Path="/6687DD68/6690AC84" Ref="#PWR?"  Part="1" 
F 0 "#PWR05" H 9700 800 50  0001 C CNN
F 1 "+5V" H 9715 1123 50  0000 C CNN
F 2 "" H 9700 950 50  0001 C CNN
F 3 "" H 9700 950 50  0001 C CNN
	1    9700 950 
	1    0    0    -1  
$EndComp
Connection ~ 9700 950 
Wire Wire Line
	10400 2850 10900 2850
Wire Wire Line
	10400 2750 10900 2750
Wire Wire Line
	10400 2350 10900 2350
Wire Wire Line
	10400 2250 10900 2250
Wire Wire Line
	10400 2150 10900 2150
Wire Wire Line
	10400 3750 12450 3750
Wire Wire Line
	12450 3750 12450 2450
Wire Wire Line
	12450 2450 12100 2450
Wire Wire Line
	10400 3250 10550 3250
Wire Wire Line
	10550 3250 10550 3850
Wire Wire Line
	10550 3850 12550 3850
Wire Wire Line
	12550 3850 12550 2350
Wire Wire Line
	12550 2350 12100 2350
Wire Wire Line
	10400 1250 12550 1250
Wire Wire Line
	12550 1250 12550 2250
Wire Wire Line
	12550 2250 12100 2250
Wire Wire Line
	10400 1350 12450 1350
Wire Wire Line
	12450 1350 12450 2150
Wire Wire Line
	12450 2150 12100 2150
Wire Wire Line
	10400 1450 10700 1450
Wire Wire Line
	10700 1450 10700 3350
Wire Wire Line
	10700 3350 11600 3350
Wire Wire Line
	11600 3350 11600 3250
Wire Wire Line
	10400 1550 10650 1550
Wire Wire Line
	10650 1550 10650 3450
Wire Wire Line
	10650 3450 11700 3450
Wire Wire Line
	11700 3450 11700 3250
$Comp
L power:GND #PWR?
U 1 1 6690ACA6
P 12200 3050
AR Path="/636550FF/6690ACA6" Ref="#PWR?"  Part="1" 
AR Path="/6690ACA6" Ref="#PWR08"  Part="1" 
AR Path="/6687DD68/6690ACA6" Ref="#PWR?"  Part="1" 
F 0 "#PWR08" H 12200 2800 50  0001 C CNN
F 1 "GND" H 12205 2877 50  0000 C CNN
F 2 "" H 12200 3050 50  0001 C CNN
F 3 "" H 12200 3050 50  0001 C CNN
	1    12200 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	12100 1850 12200 1850
Wire Wire Line
	12200 1850 12200 3050
$Comp
L power:+5V #PWR?
U 1 1 6690ACAE
P 12300 1750
AR Path="/636550FF/6690ACAE" Ref="#PWR?"  Part="1" 
AR Path="/6690ACAE" Ref="#PWR09"  Part="1" 
AR Path="/6687DD68/6690ACAE" Ref="#PWR?"  Part="1" 
F 0 "#PWR09" H 12300 1600 50  0001 C CNN
F 1 "+5V" H 12315 1923 50  0000 C CNN
F 2 "" H 12300 1750 50  0001 C CNN
F 3 "" H 12300 1750 50  0001 C CNN
	1    12300 1750
	1    0    0    -1  
$EndComp
NoConn ~ 10400 1650
NoConn ~ 10400 1750
NoConn ~ 10400 1850
NoConn ~ 10400 1950
NoConn ~ 10400 3050
NoConn ~ 10400 3150
NoConn ~ 10400 3350
NoConn ~ 10400 3450
NoConn ~ 10400 3550
NoConn ~ 10400 3650
Wire Wire Line
	12100 2550 12850 2550
Wire Wire Line
	12100 2650 12850 2650
Wire Wire Line
	12100 2750 12850 2750
Wire Wire Line
	12100 2850 12850 2850
NoConn ~ 12850 2250
NoConn ~ 12850 2350
NoConn ~ 12850 2950
$Comp
L power:+5V #PWR?
U 1 1 6690ACC5
P 12700 2000
AR Path="/636550FF/6690ACC5" Ref="#PWR?"  Part="1" 
AR Path="/6690ACC5" Ref="#PWR010"  Part="1" 
AR Path="/6687DD68/6690ACC5" Ref="#PWR?"  Part="1" 
F 0 "#PWR010" H 12700 1850 50  0001 C CNN
F 1 "+5V" H 12715 2173 50  0000 C CNN
F 2 "" H 12700 2000 50  0001 C CNN
F 3 "" H 12700 2000 50  0001 C CNN
	1    12700 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	12700 2000 12700 2150
Wire Wire Line
	12700 2150 12850 2150
$Comp
L power:GND #PWR?
U 1 1 6690ACCD
P 12700 3100
AR Path="/636550FF/6690ACCD" Ref="#PWR?"  Part="1" 
AR Path="/6690ACCD" Ref="#PWR011"  Part="1" 
AR Path="/6687DD68/6690ACCD" Ref="#PWR?"  Part="1" 
F 0 "#PWR011" H 12700 2850 50  0001 C CNN
F 1 "GND" H 12705 2927 50  0000 C CNN
F 2 "" H 12700 3100 50  0001 C CNN
F 3 "" H 12700 3100 50  0001 C CNN
	1    12700 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	12850 2450 12700 2450
Wire Wire Line
	12700 2450 12700 3100
NoConn ~ 12100 1750
NoConn ~ 12100 1950
NoConn ~ 11500 3250
NoConn ~ 11400 3250
NoConn ~ 10900 2050
NoConn ~ 10900 1850
NoConn ~ 10900 1750
Wire Wire Line
	12100 2050 12300 2050
Wire Wire Line
	12300 2050 12300 1750
$Comp
L 74xx:74LS245 U?
U 1 1 6690ACE4
P 18350 7200
AR Path="/6274F952/6690ACE4" Ref="U?"  Part="1" 
AR Path="/6690ACE4" Ref="U14"  Part="1" 
AR Path="/636550FF/6690ACE4" Ref="U?"  Part="1" 
AR Path="/6687DD68/6690ACE4" Ref="U?"  Part="1" 
F 0 "U14" H 18600 7900 50  0000 C CNN
F 1 "74LS245" H 18150 7900 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 18350 7200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 18350 7200 50  0001 C CNN
	1    18350 7200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	17600 6700 17850 6700
Wire Wire Line
	17600 6800 17850 6800
Wire Wire Line
	17600 6900 17850 6900
Wire Wire Line
	17600 7000 17850 7000
Wire Wire Line
	17600 7100 17850 7100
Wire Wire Line
	17600 7200 17850 7200
Wire Wire Line
	17600 7300 17850 7300
Wire Wire Line
	17600 7400 17850 7400
$Comp
L Device:C C?
U 1 1 6690ACF4
P 17750 8450
AR Path="/6274F952/6690ACF4" Ref="C?"  Part="1" 
AR Path="/6690ACF4" Ref="C13"  Part="1" 
AR Path="/636550FF/6690ACF4" Ref="C?"  Part="1" 
AR Path="/6687DD68/6690ACF4" Ref="C?"  Part="1" 
F 0 "C13" H 17865 8496 50  0000 L CNN
F 1 "0.1uF" H 17865 8405 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 17788 8300 50  0001 C CNN
F 3 "~" H 17750 8450 50  0001 C CNN
	1    17750 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	17200 6500 17200 6350
Wire Wire Line
	17200 6350 17750 6350
Wire Wire Line
	17750 6350 17750 8300
Wire Wire Line
	17750 8600 17750 8800
Wire Wire Line
	17750 8800 17200 8800
Wire Wire Line
	17200 8800 17200 8700
$Comp
L power:+5V #PWR?
U 1 1 6690AD00
P 17750 6250
AR Path="/6274F952/6690AD00" Ref="#PWR?"  Part="1" 
AR Path="/6690AD00" Ref="#PWR019"  Part="1" 
AR Path="/636550FF/6690AD00" Ref="#PWR?"  Part="1" 
AR Path="/6687DD68/6690AD00" Ref="#PWR?"  Part="1" 
F 0 "#PWR019" H 17750 6100 50  0001 C CNN
F 1 "+5V" H 17765 6423 50  0000 C CNN
F 2 "" H 17750 6250 50  0001 C CNN
F 3 "" H 17750 6250 50  0001 C CNN
	1    17750 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	17750 6250 17750 6350
Connection ~ 17750 6350
$Comp
L power:GND #PWR?
U 1 1 6690AD08
P 17750 8900
AR Path="/6274F952/6690AD08" Ref="#PWR?"  Part="1" 
AR Path="/6690AD08" Ref="#PWR020"  Part="1" 
AR Path="/636550FF/6690AD08" Ref="#PWR?"  Part="1" 
AR Path="/6687DD68/6690AD08" Ref="#PWR?"  Part="1" 
F 0 "#PWR020" H 17750 8650 50  0001 C CNN
F 1 "GND" H 17755 8727 50  0000 C CNN
F 2 "" H 17750 8900 50  0001 C CNN
F 3 "" H 17750 8900 50  0001 C CNN
	1    17750 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	17750 8900 17750 8800
Connection ~ 17750 8800
Wire Wire Line
	16800 8400 16700 8400
Wire Wire Line
	16700 8400 16700 8500
Wire Wire Line
	16700 8800 17200 8800
Connection ~ 17200 8800
$Comp
L Device:C C?
U 1 1 6690AD14
P 19050 7900
AR Path="/6274F952/6690AD14" Ref="C?"  Part="1" 
AR Path="/6690AD14" Ref="C14"  Part="1" 
AR Path="/636550FF/6690AD14" Ref="C?"  Part="1" 
AR Path="/6687DD68/6690AD14" Ref="C?"  Part="1" 
F 0 "C14" H 19165 7946 50  0000 L CNN
F 1 "0.1uF" H 19165 7855 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 19088 7750 50  0001 C CNN
F 3 "~" H 19050 7900 50  0001 C CNN
	1    19050 7900
	1    0    0    -1  
$EndComp
Wire Wire Line
	18350 6400 18350 6350
Wire Wire Line
	18350 6350 19050 6350
Wire Wire Line
	19050 6350 19050 7750
Wire Wire Line
	19050 8050 19050 8150
Wire Wire Line
	19050 8150 18900 8150
Wire Wire Line
	18350 8150 18350 8000
$Comp
L power:+5V #PWR?
U 1 1 6690AD20
P 19050 6250
AR Path="/6274F952/6690AD20" Ref="#PWR?"  Part="1" 
AR Path="/6690AD20" Ref="#PWR021"  Part="1" 
AR Path="/636550FF/6690AD20" Ref="#PWR?"  Part="1" 
AR Path="/6687DD68/6690AD20" Ref="#PWR?"  Part="1" 
F 0 "#PWR021" H 19050 6100 50  0001 C CNN
F 1 "+5V" H 19065 6423 50  0000 C CNN
F 2 "" H 19050 6250 50  0001 C CNN
F 3 "" H 19050 6250 50  0001 C CNN
	1    19050 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	19050 6250 19050 6350
Connection ~ 19050 6350
$Comp
L power:GND #PWR?
U 1 1 6690AD28
P 19050 8250
AR Path="/6274F952/6690AD28" Ref="#PWR?"  Part="1" 
AR Path="/6690AD28" Ref="#PWR022"  Part="1" 
AR Path="/636550FF/6690AD28" Ref="#PWR?"  Part="1" 
AR Path="/6687DD68/6690AD28" Ref="#PWR?"  Part="1" 
F 0 "#PWR022" H 19050 8000 50  0001 C CNN
F 1 "GND" H 19055 8077 50  0000 C CNN
F 2 "" H 19050 8250 50  0001 C CNN
F 3 "" H 19050 8250 50  0001 C CNN
	1    19050 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	19050 8250 19050 8150
Connection ~ 19050 8150
Wire Wire Line
	18850 7600 18900 7600
Wire Wire Line
	18900 7600 18900 8150
Connection ~ 18900 8150
Wire Wire Line
	18900 8150 18350 8150
Wire Wire Line
	10800 1950 10900 1950
$Comp
L Memory_EPROM:27C512 U?
U 1 1 6690AD36
P 17200 7600
AR Path="/636550FF/6690AD36" Ref="U?"  Part="1" 
AR Path="/6690AD36" Ref="U13"  Part="1" 
AR Path="/6687DD68/6690AD36" Ref="U?"  Part="1" 
F 0 "U13" H 16950 8700 50  0000 C CNN
F 1 "29C256/27C512" H 17250 8950 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 17200 7600 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0015.pdf" H 17200 7600 50  0001 C CNN
	1    17200 7600
	1    0    0    -1  
$EndComp
$Comp
L Memory_RAM2:SLIDE_SWITCH_3P S?
U 1 1 6690AD3C
P 17200 9400
AR Path="/636550FF/6690AD3C" Ref="S?"  Part="1" 
AR Path="/6690AD3C" Ref="S1"  Part="1" 
AR Path="/6687DD68/6690AD3C" Ref="S?"  Part="1" 
F 0 "S1" H 16950 9350 50  0000 C CNN
F 1 "A_B_CHANGE" H 17350 9400 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 17200 9425 50  0001 C CNN
F 3 "" H 17200 9425 50  0001 C CNN
	1    17200 9400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6690AD46
P 17500 9700
AR Path="/6274F952/6690AD46" Ref="#PWR?"  Part="1" 
AR Path="/6690AD46" Ref="#PWR018"  Part="1" 
AR Path="/636550FF/6690AD46" Ref="#PWR?"  Part="1" 
AR Path="/6687DD68/6690AD46" Ref="#PWR?"  Part="1" 
F 0 "#PWR018" H 17500 9450 50  0001 C CNN
F 1 "GND" H 17505 9527 50  0000 C CNN
F 2 "" H 17500 9700 50  0001 C CNN
F 3 "" H 17500 9700 50  0001 C CNN
	1    17500 9700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6690AD4C
P 16700 9500
AR Path="/6274F952/6690AD4C" Ref="#PWR?"  Part="1" 
AR Path="/6690AD4C" Ref="#PWR017"  Part="1" 
AR Path="/636550FF/6690AD4C" Ref="#PWR?"  Part="1" 
AR Path="/6687DD68/6690AD4C" Ref="#PWR?"  Part="1" 
F 0 "#PWR017" H 16700 9350 50  0001 C CNN
F 1 "+5V" H 16715 9673 50  0000 C CNN
F 2 "" H 16700 9500 50  0001 C CNN
F 3 "" H 16700 9500 50  0001 C CNN
	1    16700 9500
	1    0    0    -1  
$EndComp
Wire Wire Line
	16700 9500 16700 9600
Wire Wire Line
	16700 9600 17000 9600
Wire Wire Line
	17400 9600 17500 9600
Wire Wire Line
	17500 9600 17500 9700
Text Label 12650 2550 0    50   ~ 0
SCK
Text Label 12650 2650 0    50   ~ 0
MISO
Text Label 12650 2750 0    50   ~ 0
MOSI
Text Label 12650 2850 0    50   ~ 0
CS
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 6690AD5A
P 13750 3700
AR Path="/636550FF/6690AD5A" Ref="J?"  Part="1" 
AR Path="/6690AD5A" Ref="J3"  Part="1" 
AR Path="/6687DD68/6690AD5A" Ref="J?"  Part="1" 
F 0 "J3" H 13830 3692 50  0000 L CNN
F 1 "MicroSD Card Adapter" H 13350 3200 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 13750 3700 50  0001 C CNN
F 3 "~" H 13750 3700 50  0001 C CNN
	1    13750 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	13550 3500 13350 3500
Wire Wire Line
	13550 3600 13350 3600
Wire Wire Line
	13550 3700 13350 3700
Wire Wire Line
	13550 3800 13350 3800
Wire Wire Line
	13550 3900 13350 3900
Wire Wire Line
	13550 4000 13350 4000
Text Label 13350 3500 0    50   ~ 0
GND
Text Label 13350 3600 0    50   ~ 0
+5V
Text Label 13350 3700 0    50   ~ 0
MISO
Text Label 13350 3800 0    50   ~ 0
MOSI
Text Label 13350 3900 0    50   ~ 0
SCK
Text Label 13350 4000 0    50   ~ 0
CS
$Comp
L 74xx:74LS04 U?
U 1 1 6690AD6C
P 3700 7150
AR Path="/636550FF/6690AD6C" Ref="U?"  Part="1" 
AR Path="/6690AD6C" Ref="U1"  Part="1" 
AR Path="/6687DD68/6690AD6C" Ref="U?"  Part="1" 
F 0 "U1" H 3700 7467 50  0000 C CNN
F 1 "74LS04" H 3700 7376 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3700 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3700 7150 50  0001 C CNN
	1    3700 7150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS30 U?
U 1 1 6690AD72
P 6950 1550
AR Path="/636550FF/6690AD72" Ref="U?"  Part="1" 
AR Path="/6690AD72" Ref="U4"  Part="1" 
AR Path="/6687DD68/6690AD72" Ref="U?"  Part="1" 
F 0 "U4" H 6950 2075 50  0000 C CNN
F 1 "74LS30" H 6950 1984 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6950 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 6950 1550 50  0001 C CNN
	1    6950 1550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 2 1 6690AD78
P 3700 7800
AR Path="/636550FF/6690AD78" Ref="U?"  Part="2" 
AR Path="/6690AD78" Ref="U1"  Part="2" 
AR Path="/6687DD68/6690AD78" Ref="U?"  Part="2" 
F 0 "U1" H 3700 8117 50  0000 C CNN
F 1 "74LS04" H 3700 8026 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3700 7800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3700 7800 50  0001 C CNN
	2    3700 7800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 3 1 6690AD7E
P 3700 8350
AR Path="/636550FF/6690AD7E" Ref="U?"  Part="3" 
AR Path="/6690AD7E" Ref="U1"  Part="3" 
AR Path="/6687DD68/6690AD7E" Ref="U?"  Part="3" 
F 0 "U1" H 3700 8667 50  0000 C CNN
F 1 "74LS04" H 3700 8576 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3700 8350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3700 8350 50  0001 C CNN
	3    3700 8350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 4 1 6690AD84
P 9400 6550
AR Path="/636550FF/6690AD84" Ref="U?"  Part="4" 
AR Path="/6690AD84" Ref="U2"  Part="4" 
AR Path="/6687DD68/6690AD84" Ref="U?"  Part="4" 
F 0 "U2" H 9400 6867 50  0000 C CNN
F 1 "74LS04" H 9400 6776 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 9400 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 9400 6550 50  0001 C CNN
	4    9400 6550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 5 1 6690AD8A
P 7000 6400
AR Path="/636550FF/6690AD8A" Ref="U?"  Part="5" 
AR Path="/6690AD8A" Ref="U1"  Part="5" 
AR Path="/6687DD68/6690AD8A" Ref="U?"  Part="5" 
F 0 "U1" H 7000 6717 50  0000 C CNN
F 1 "74LS04" H 7000 6626 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7000 6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7000 6400 50  0001 C CNN
	5    7000 6400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 6 1 6690AD90
P 7050 5700
AR Path="/636550FF/6690AD90" Ref="U?"  Part="6" 
AR Path="/6690AD90" Ref="U1"  Part="6" 
AR Path="/6687DD68/6690AD90" Ref="U?"  Part="6" 
F 0 "U1" H 7050 6017 50  0000 C CNN
F 1 "74LS04" H 7050 5926 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7050 5700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7050 5700 50  0001 C CNN
	6    7050 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5750 4100 5550
Wire Wire Line
	4100 5550 4800 5550
Wire Wire Line
	4150 6050 4150 5650
Wire Wire Line
	4150 5650 4800 5650
Wire Wire Line
	4200 6350 4200 5750
Wire Wire Line
	4200 5750 4800 5750
Wire Wire Line
	4250 6700 4250 5850
Wire Wire Line
	4250 5850 4800 5850
Wire Wire Line
	4800 5950 4300 5950
Wire Wire Line
	3050 8350 3400 8350
Text Label 3050 5450 0    50   ~ 0
A7
Text Label 3050 5750 0    50   ~ 0
A6
Text Label 3050 6050 0    50   ~ 0
A5
Text Label 3050 6350 0    50   ~ 0
A4
Text Label 3050 6700 0    50   ~ 0
A3
Text Label 3050 8350 0    50   ~ 0
~IORQ
$Comp
L 74xx:74LS10 U?
U 1 1 6690ADA6
P 6400 11150
AR Path="/636550FF/6690ADA6" Ref="U?"  Part="1" 
AR Path="/6690ADA6" Ref="U5"  Part="1" 
AR Path="/6687DD68/6690ADA6" Ref="U?"  Part="1" 
F 0 "U5" H 6400 11475 50  0000 C CNN
F 1 "74LS10" H 6400 11384 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6400 11150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 6400 11150 50  0001 C CNN
	1    6400 11150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS10 U?
U 2 1 6690ADAC
P 8200 6550
AR Path="/636550FF/6690ADAC" Ref="U?"  Part="2" 
AR Path="/6690ADAC" Ref="U5"  Part="2" 
AR Path="/6687DD68/6690ADAC" Ref="U?"  Part="2" 
F 0 "U5" H 8200 6875 50  0000 C CNN
F 1 "74LS10" H 8200 6784 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 8200 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 8200 6550 50  0001 C CNN
	2    8200 6550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS10 U?
U 3 1 6690ADB2
P 8250 7400
AR Path="/636550FF/6690ADB2" Ref="U?"  Part="3" 
AR Path="/6690ADB2" Ref="U5"  Part="3" 
AR Path="/6687DD68/6690ADB2" Ref="U?"  Part="3" 
F 0 "U5" H 8250 7725 50  0000 C CNN
F 1 "74LS10" H 8250 7634 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 8250 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 8250 7400 50  0001 C CNN
	3    8250 7400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS30 U?
U 1 1 6690ADBE
P 5100 5750
AR Path="/636550FF/6690ADBE" Ref="U?"  Part="1" 
AR Path="/6690ADBE" Ref="U3"  Part="1" 
AR Path="/6687DD68/6690ADBE" Ref="U?"  Part="1" 
F 0 "U3" H 5100 6275 50  0000 C CNN
F 1 "74LS30" H 5100 6184 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5100 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 5100 5750 50  0001 C CNN
	1    5100 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 5750 6100 6650
Wire Wire Line
	7900 6650 6100 6650
Connection ~ 6100 6650
Wire Wire Line
	7500 6450 7900 6450
Text Label 6450 5700 0    50   ~ 0
A0
Wire Wire Line
	6700 6400 6450 6400
Text Label 6450 6400 0    50   ~ 0
~RD
Wire Wire Line
	6100 7500 7950 7500
Wire Wire Line
	6100 6650 6100 7500
Text Label 6450 7100 0    50   ~ 0
A0
$Comp
L 74xx:74LS04 U?
U 2 1 6690ADD8
P 5550 2450
AR Path="/636550FF/6690ADD8" Ref="U?"  Part="2" 
AR Path="/6690ADD8" Ref="U2"  Part="2" 
AR Path="/6687DD68/6690ADD8" Ref="U?"  Part="2" 
F 0 "U2" H 5550 2767 50  0000 C CNN
F 1 "74LS04" H 5550 2676 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5550 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5550 2450 50  0001 C CNN
	2    5550 2450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 3 1 6690ADDE
P 5550 3000
AR Path="/636550FF/6690ADDE" Ref="U?"  Part="3" 
AR Path="/6690ADDE" Ref="U2"  Part="3" 
AR Path="/6687DD68/6690ADDE" Ref="U?"  Part="3" 
F 0 "U2" H 5550 3317 50  0000 C CNN
F 1 "74LS04" H 5550 3226 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5550 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5550 3000 50  0001 C CNN
	3    5550 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 4950 10800 1950
$Comp
L 74xx:74LS04 U?
U 4 1 6690ADE9
P 5750 5750
AR Path="/636550FF/6690ADE9" Ref="U?"  Part="4" 
AR Path="/6690ADE9" Ref="U1"  Part="4" 
AR Path="/6687DD68/6690ADE9" Ref="U?"  Part="4" 
F 0 "U1" H 5750 6067 50  0000 C CNN
F 1 "74LS04" H 5750 5976 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5750 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5750 5750 50  0001 C CNN
	4    5750 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 2000 6200 1450
Wire Wire Line
	6200 1450 6650 1450
Wire Wire Line
	6650 1550 6250 1550
Wire Wire Line
	6650 1650 6300 1650
Wire Wire Line
	6650 1750 6350 1750
Wire Wire Line
	6350 1750 6350 3350
Wire Wire Line
	6650 1850 6400 1850
Wire Wire Line
	6400 1850 6400 3550
Wire Wire Line
	5000 1650 5250 1650
Wire Wire Line
	5000 2450 5250 2450
Wire Wire Line
	5000 3000 5250 3000
Text Label 5000 1250 0    50   ~ 0
A7
Text Label 5000 1650 0    50   ~ 0
A6
Text Label 5000 2000 0    50   ~ 0
A5
Text Label 5000 2450 0    50   ~ 0
A4
Text Label 5000 3000 0    50   ~ 0
A3
Wire Wire Line
	10400 2650 10900 2650
Wire Wire Line
	10400 2550 10900 2550
Wire Wire Line
	10400 2450 10900 2450
Text Label 7950 3150 0    50   ~ 0
D7
Text Label 7950 3050 0    50   ~ 0
D6
Text Label 7950 2950 0    50   ~ 0
D5
Text Label 7950 2850 0    50   ~ 0
D4
Text Label 7950 2750 0    50   ~ 0
D3
Wire Wire Line
	7900 2750 9000 2750
Wire Wire Line
	7900 2850 9000 2850
Wire Wire Line
	7900 2950 9000 2950
Wire Wire Line
	7900 3050 9000 3050
Wire Wire Line
	7900 3150 9000 3150
Text Label 7950 2650 0    50   ~ 0
D2
Text Label 7950 2550 0    50   ~ 0
D1
Text Label 7950 2450 0    50   ~ 0
D0
Wire Wire Line
	7900 2650 9000 2650
Wire Wire Line
	7900 2550 9000 2550
Wire Wire Line
	7900 2450 9000 2450
Text Label 7950 2050 0    50   ~ 0
A0
Text Label 7950 2150 0    50   ~ 0
A1
Text Label 19850 6700 0    50   ~ 0
D0
Text Label 19850 6800 0    50   ~ 0
D1
Text Label 19850 6900 0    50   ~ 0
D2
Text Label 19850 7000 0    50   ~ 0
D3
Text Label 19850 7100 0    50   ~ 0
D4
Text Label 19850 7200 0    50   ~ 0
D5
Text Label 19850 7300 0    50   ~ 0
D6
Text Label 19850 7400 0    50   ~ 0
D7
Text Label 7950 1750 0    50   ~ 0
~WR
Text Label 7950 1650 0    50   ~ 0
~RD
Wire Wire Line
	7900 2050 9000 2050
Wire Wire Line
	7900 2150 9000 2150
Wire Wire Line
	7250 1550 9000 1550
$Comp
L 74xx:74LS04 U1
U 7 1 6690AE28
P 1550 9850
F 0 "U1" H 1780 9896 50  0000 L CNN
F 1 "74LS04" H 1780 9805 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1550 9850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1550 9850 50  0001 C CNN
	7    1550 9850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U2
U 7 1 6690AE2E
P 2800 9850
F 0 "U2" H 3030 9896 50  0000 L CNN
F 1 "74LS04" H 3030 9805 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2800 9850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2800 9850 50  0001 C CNN
	7    2800 9850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS30 U3
U 2 1 6690AE34
P 4100 9850
F 0 "U3" H 4330 9896 50  0000 L CNN
F 1 "74LS30" H 4330 9805 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4100 9850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 4100 9850 50  0001 C CNN
	2    4100 9850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS30 U4
U 2 1 6690AE3A
P 5350 9850
F 0 "U4" H 5580 9896 50  0000 L CNN
F 1 "74LS30" H 5580 9805 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5350 9850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 5350 9850 50  0001 C CNN
	2    5350 9850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS10 U5
U 4 1 6690AE40
P 6500 9850
F 0 "U5" H 6730 9896 50  0000 L CNN
F 1 "74LS10" H 6730 9805 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6500 9850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS10" H 6500 9850 50  0001 C CNN
	4    6500 9850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 9350 1550 9250
Wire Wire Line
	1550 9250 2250 9250
Wire Wire Line
	2800 9250 2800 9350
Wire Wire Line
	2800 9250 3550 9250
Wire Wire Line
	4100 9250 4100 9350
Connection ~ 2800 9250
Wire Wire Line
	4100 9250 4800 9250
Wire Wire Line
	5350 9250 5350 9350
Connection ~ 4100 9250
Wire Wire Line
	5350 9250 5950 9250
Wire Wire Line
	6500 9250 6500 9350
Connection ~ 5350 9250
Wire Wire Line
	1550 10350 1550 10450
Wire Wire Line
	1550 10450 2250 10450
Wire Wire Line
	2800 10450 2800 10350
Wire Wire Line
	4100 10450 4100 10350
Connection ~ 2800 10450
Wire Wire Line
	4100 10450 4800 10450
Wire Wire Line
	5350 10450 5350 10350
Connection ~ 4100 10450
Wire Wire Line
	5350 10450 5950 10450
Wire Wire Line
	6500 10450 6500 10350
Connection ~ 5350 10450
$Comp
L power:GND #PWR?
U 1 1 6690AE5D
P 1550 10450
AR Path="/6274F952/6690AE5D" Ref="#PWR?"  Part="1" 
AR Path="/6690AE5D" Ref="#PWR02"  Part="1" 
AR Path="/636550FF/6690AE5D" Ref="#PWR?"  Part="1" 
AR Path="/6687DD68/6690AE5D" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 1550 10200 50  0001 C CNN
F 1 "GND" H 1555 10277 50  0000 C CNN
F 2 "" H 1550 10450 50  0001 C CNN
F 3 "" H 1550 10450 50  0001 C CNN
	1    1550 10450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6690AE63
P 1550 9250
AR Path="/6274F952/6690AE63" Ref="#PWR?"  Part="1" 
AR Path="/6690AE63" Ref="#PWR01"  Part="1" 
AR Path="/636550FF/6690AE63" Ref="#PWR?"  Part="1" 
AR Path="/6687DD68/6690AE63" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 1550 9100 50  0001 C CNN
F 1 "+5V" H 1565 9423 50  0000 C CNN
F 2 "" H 1550 9250 50  0001 C CNN
F 3 "" H 1550 9250 50  0001 C CNN
	1    1550 9250
	1    0    0    -1  
$EndComp
Connection ~ 1550 9250
$Comp
L Device:C C?
U 1 1 6690AE6A
P 1000 9750
AR Path="/6274F952/6690AE6A" Ref="C?"  Part="1" 
AR Path="/6690AE6A" Ref="C1"  Part="1" 
AR Path="/636550FF/6690AE6A" Ref="C?"  Part="1" 
AR Path="/6687DD68/6690AE6A" Ref="C?"  Part="1" 
F 0 "C1" H 1115 9796 50  0000 L CNN
F 1 "0.1uF" H 1115 9705 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 1038 9600 50  0001 C CNN
F 3 "~" H 1000 9750 50  0001 C CNN
	1    1000 9750
	1    0    0    -1  
$EndComp
Connection ~ 1550 10450
$Comp
L Device:C C?
U 1 1 6690AE71
P 2250 9750
AR Path="/6274F952/6690AE71" Ref="C?"  Part="1" 
AR Path="/6690AE71" Ref="C2"  Part="1" 
AR Path="/636550FF/6690AE71" Ref="C?"  Part="1" 
AR Path="/6687DD68/6690AE71" Ref="C?"  Part="1" 
F 0 "C2" H 2365 9796 50  0000 L CNN
F 1 "0.1uF" H 2365 9705 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 2288 9600 50  0001 C CNN
F 3 "~" H 2250 9750 50  0001 C CNN
	1    2250 9750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6690AE77
P 3550 9750
AR Path="/6274F952/6690AE77" Ref="C?"  Part="1" 
AR Path="/6690AE77" Ref="C4"  Part="1" 
AR Path="/636550FF/6690AE77" Ref="C?"  Part="1" 
AR Path="/6687DD68/6690AE77" Ref="C?"  Part="1" 
F 0 "C4" H 3665 9796 50  0000 L CNN
F 1 "0.1uF" H 3665 9705 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 3588 9600 50  0001 C CNN
F 3 "~" H 3550 9750 50  0001 C CNN
	1    3550 9750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6690AE7D
P 4800 9700
AR Path="/6274F952/6690AE7D" Ref="C?"  Part="1" 
AR Path="/6690AE7D" Ref="C5"  Part="1" 
AR Path="/636550FF/6690AE7D" Ref="C?"  Part="1" 
AR Path="/6687DD68/6690AE7D" Ref="C?"  Part="1" 
F 0 "C5" H 4915 9746 50  0000 L CNN
F 1 "0.1uF" H 4915 9655 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 4838 9550 50  0001 C CNN
F 3 "~" H 4800 9700 50  0001 C CNN
	1    4800 9700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6690AE83
P 5950 9700
AR Path="/6274F952/6690AE83" Ref="C?"  Part="1" 
AR Path="/6690AE83" Ref="C6"  Part="1" 
AR Path="/636550FF/6690AE83" Ref="C?"  Part="1" 
AR Path="/6687DD68/6690AE83" Ref="C?"  Part="1" 
F 0 "C6" H 6065 9746 50  0000 L CNN
F 1 "0.1uF" H 6065 9655 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 5988 9550 50  0001 C CNN
F 3 "~" H 5950 9700 50  0001 C CNN
	1    5950 9700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 9600 1000 9250
Wire Wire Line
	1000 9250 1550 9250
Wire Wire Line
	1000 10450 1550 10450
Wire Wire Line
	1000 9900 1000 10450
Wire Wire Line
	2250 9900 2250 10450
Connection ~ 2250 10450
Wire Wire Line
	2250 10450 2800 10450
Wire Wire Line
	2250 9600 2250 9250
Connection ~ 2250 9250
Wire Wire Line
	2250 9250 2800 9250
Wire Wire Line
	3550 9600 3550 9250
Connection ~ 3550 9250
Wire Wire Line
	3550 9250 4100 9250
Wire Wire Line
	2800 10450 3550 10450
Wire Wire Line
	3550 9900 3550 10450
Connection ~ 3550 10450
Wire Wire Line
	3550 10450 4100 10450
Wire Wire Line
	4800 9850 4800 10450
Connection ~ 4800 10450
Wire Wire Line
	4800 10450 5350 10450
Wire Wire Line
	4800 9550 4800 9250
Connection ~ 4800 9250
Wire Wire Line
	4800 9250 5350 9250
Wire Wire Line
	5950 9550 5950 9250
Connection ~ 5950 9250
Wire Wire Line
	5950 9250 6500 9250
Wire Wire Line
	5950 9850 5950 10450
Connection ~ 5950 10450
Wire Wire Line
	5950 10450 6500 10450
Wire Wire Line
	4800 6050 4350 6050
Wire Wire Line
	3400 7150 3050 7150
Wire Wire Line
	4800 6150 4400 6150
Wire Wire Line
	3400 7800 3050 7800
Text Label 3050 7150 0    50   ~ 0
A2
Text Label 3050 7800 0    50   ~ 0
A1
Wire Wire Line
	4350 6050 4350 7800
Wire Wire Line
	4350 7800 4000 7800
Wire Wire Line
	4400 6150 4400 8350
Wire Wire Line
	4400 8350 4000 8350
Wire Wire Line
	3050 5450 4800 5450
Wire Wire Line
	3050 5750 4100 5750
Wire Wire Line
	3050 6050 4150 6050
Wire Wire Line
	3050 6350 4200 6350
Wire Wire Line
	3050 6700 4250 6700
Wire Wire Line
	4300 5950 4300 7150
Wire Wire Line
	4300 7150 4000 7150
Wire Wire Line
	5400 5750 5450 5750
Wire Wire Line
	6050 5750 6100 5750
Wire Wire Line
	6450 7100 7350 7100
Wire Wire Line
	6450 5700 6750 5700
Wire Wire Line
	7300 6400 7350 6400
Wire Wire Line
	7350 6400 7350 6550
Wire Wire Line
	7350 7100 7350 7300
Wire Wire Line
	7350 7300 7950 7300
Wire Wire Line
	7750 7400 7950 7400
Wire Wire Line
	6400 3550 4400 3550
Wire Wire Line
	4400 3550 4400 6150
Connection ~ 4400 6150
Wire Wire Line
	5000 1250 6650 1250
Wire Wire Line
	5000 2000 6200 2000
Wire Wire Line
	5850 1650 5950 1650
Wire Wire Line
	5950 1650 5950 1350
Wire Wire Line
	5950 1350 6650 1350
Wire Wire Line
	6250 1550 6250 2450
Wire Wire Line
	6250 2450 5850 2450
Wire Wire Line
	6300 1650 6300 3000
Wire Wire Line
	6300 3000 5850 3000
Wire Wire Line
	4300 3350 4300 5950
Wire Wire Line
	4300 3350 6350 3350
Connection ~ 4300 5950
$Comp
L power:+5V #PWR?
U 1 1 6690AED7
P 6800 2250
AR Path="/636550FF/6690AED7" Ref="#PWR?"  Part="1" 
AR Path="/6690AED7" Ref="#PWR04"  Part="1" 
AR Path="/6687DD68/6690AED7" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 6800 2100 50  0001 C CNN
F 1 "+5V" H 6815 2423 50  0000 C CNN
F 2 "" H 6800 2250 50  0001 C CNN
F 3 "" H 6800 2250 50  0001 C CNN
	1    6800 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1950 6500 2350
Wire Wire Line
	6500 2350 6800 2350
Wire Wire Line
	6800 2350 6800 2250
Wire Wire Line
	6500 1950 6650 1950
Wire Wire Line
	18850 6700 19950 6700
Wire Wire Line
	18850 6800 19950 6800
Wire Wire Line
	18850 6900 19950 6900
Wire Wire Line
	18850 7000 19950 7000
Wire Wire Line
	18850 7100 19950 7100
Wire Wire Line
	18850 7200 19950 7200
Wire Wire Line
	18850 7300 19950 7300
Wire Wire Line
	18850 7400 19950 7400
Wire Wire Line
	1900 4400 2100 4400
Text Label 1000 3600 0    50   ~ 0
GND
Wire Wire Line
	1000 3600 1400 3600
Text Label 1000 3700 0    50   ~ 0
~HALT
Wire Wire Line
	1000 3800 1400 3800
Text Label 1000 3800 0    50   ~ 0
IE1
Wire Wire Line
	1000 3900 1400 3900
Text Label 1000 3900 0    50   ~ 0
IE0
Text Label 1000 4100 0    50   ~ 0
~EXRESET
Wire Wire Line
	1000 4100 1400 4100
Text Label 1000 4400 0    50   ~ 0
~NMI
Wire Wire Line
	1000 4400 1400 4400
Text Label 1000 4500 0    50   ~ 0
GND
Wire Wire Line
	1000 4500 1400 4500
Wire Wire Line
	10050 4950 10800 4950
Wire Wire Line
	8800 4950 9450 4950
$Comp
L 74xx:74LS04 U?
U 5 1 6690ADEF
P 9400 7400
AR Path="/636550FF/6690ADEF" Ref="U?"  Part="5" 
AR Path="/6690ADEF" Ref="U2"  Part="5" 
AR Path="/6687DD68/6690ADEF" Ref="U?"  Part="5" 
F 0 "U2" H 9400 7717 50  0000 C CNN
F 1 "74LS04" H 9400 7626 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 9400 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 9400 7400 50  0001 C CNN
	5    9400 7400
	1    0    0    -1  
$EndComp
Connection ~ 8800 4300
Wire Wire Line
	8800 4300 8800 4950
Wire Wire Line
	8800 4300 8800 1250
Text Label 7950 4300 0    50   ~ 0
RESET
Wire Wire Line
	7900 4300 8800 4300
NoConn ~ 1400 4600
NoConn ~ 1400 4700
NoConn ~ 1400 4800
NoConn ~ 1900 4600
NoConn ~ 1900 4700
NoConn ~ 1900 4800
NoConn ~ 1000 3500
NoConn ~ 1000 3700
NoConn ~ 1000 3800
NoConn ~ 1000 3900
NoConn ~ 1000 4100
NoConn ~ 1000 4200
NoConn ~ 1000 4300
NoConn ~ 1000 4400
NoConn ~ 2100 2900
NoConn ~ 2100 3000
NoConn ~ 2100 3100
NoConn ~ 2100 3200
NoConn ~ 2100 3300
NoConn ~ 2100 3400
NoConn ~ 2100 3500
NoConn ~ 2100 3600
NoConn ~ 1000 3000
NoConn ~ 1000 3100
Wire Wire Line
	2750 2400 2750 3800
Wire Wire Line
	1900 2400 2750 2400
Wire Wire Line
	2750 4500 2750 4100
Wire Wire Line
	1900 4500 2750 4500
$Comp
L power:PWR_FLAG #FLG01
U 1 1 668DA65A
P 2750 2400
F 0 "#FLG01" H 2750 2475 50  0001 C CNN
F 1 "PWR_FLAG" H 2750 2573 50  0000 C CNN
F 2 "" H 2750 2400 50  0001 C CNN
F 3 "~" H 2750 2400 50  0001 C CNN
	1    2750 2400
	1    0    0    -1  
$EndComp
Connection ~ 2750 2400
$Comp
L power:PWR_FLAG #FLG02
U 1 1 668DAEB5
P 3050 4500
F 0 "#FLG02" H 3050 4575 50  0001 C CNN
F 1 "PWR_FLAG" H 3050 4673 50  0000 C CNN
F 2 "" H 3050 4500 50  0001 C CNN
F 3 "~" H 3050 4500 50  0001 C CNN
	1    3050 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4500 3050 4500
Connection ~ 2750 4500
$Comp
L Arduino:Arduino_Pro_Mini U8
U 1 1 6690B269
P 11500 2350
F 0 "U8" H 11500 3239 60  0000 C CNN
F 1 "Arduino_Pro_Mini" H 11500 3133 60  0000 C CNN
F 2 "MZ-1500:Arduino_Pro_Mini" H 12300 1600 60  0001 C CNN
F 3 "https://www.sparkfun.com/products/11113" H 11700 1150 60  0001 C CNN
	1    11500 2350
	1    0    0    -1  
$EndComp
$Comp
L Memory_RAM2:Micro_SD_Card_Kit J2
U 1 1 66911760
P 13750 2450
F 0 "J2" H 14580 2446 50  0000 L CNN
F 1 "Micro_SD_Card_Kit" H 14580 2355 50  0000 L CNN
F 2 "MZ-1500:AE-microSD-LLCNV" H 14900 2750 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 13750 2450 50  0001 C CNN
	1    13750 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 66A5D063
P 2750 3950
F 0 "C3" H 2868 3996 50  0000 L CNN
F 1 "100uF" H 2868 3905 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 2788 3800 50  0001 C CNN
F 3 "~" H 2750 3950 50  0001 C CNN
	1    2750 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 6550 7750 6550
Wire Wire Line
	7750 7400 7750 6550
Connection ~ 7750 6550
Wire Wire Line
	7750 6550 7900 6550
Wire Wire Line
	9100 7400 8950 7400
Connection ~ 8950 7400
Connection ~ 16700 8500
Wire Wire Line
	16700 8500 16800 8500
Wire Wire Line
	16700 8500 16700 8800
Wire Wire Line
	18850 7700 19600 7700
$Comp
L 74xx:74LS193 U9
U 1 1 669102CC
P 13800 7100
F 0 "U9" H 13600 7700 50  0000 C CNN
F 1 "74LS193" H 14050 7700 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 13800 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls193.pdf" H 13800 7100 50  0001 C CNN
	1    13800 7100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS193 U10
U 1 1 66910E67
P 13800 9000
F 0 "U10" H 13500 9650 50  0000 C CNN
F 1 "74LS193" H 14100 9650 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 13800 9000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls193.pdf" H 13800 9000 50  0001 C CNN
	1    13800 9000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS193 U11
U 1 1 6691323D
P 13800 10900
F 0 "U11" H 13550 11550 50  0000 C CNN
F 1 "74LS193" H 14100 11550 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 13800 10900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls193.pdf" H 13800 10900 50  0001 C CNN
	1    13800 10900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS193 U12
U 1 1 66914013
P 13800 12850
F 0 "U12" H 13550 13450 50  0000 C CNN
F 1 "74LS193" H 14100 13450 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 13800 12850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls193.pdf" H 13800 12850 50  0001 C CNN
	1    13800 12850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U6
U 1 1 6691C232
P 6400 12000
F 0 "U6" H 6400 12317 50  0000 C CNN
F 1 "74LS14" H 6400 12226 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6400 12000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 6400 12000 50  0001 C CNN
	1    6400 12000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U6
U 2 1 6691CD6B
P 6400 12500
F 0 "U6" H 6400 12817 50  0000 C CNN
F 1 "74LS14" H 6400 12726 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6400 12500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 6400 12500 50  0001 C CNN
	2    6400 12500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U6
U 3 1 6691E294
P 6400 13050
F 0 "U6" H 6400 13367 50  0000 C CNN
F 1 "74LS14" H 6400 13276 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6400 13050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 6400 13050 50  0001 C CNN
	3    6400 13050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U6
U 4 1 6691F5E5
P 12300 7400
F 0 "U6" H 12300 7717 50  0000 C CNN
F 1 "74LS14" H 12300 7626 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 12300 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 12300 7400 50  0001 C CNN
	4    12300 7400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U6
U 5 1 6692264E
P 11550 7400
F 0 "U6" H 11550 7717 50  0000 C CNN
F 1 "74LS14" H 11550 7626 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 11550 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 11550 7400 50  0001 C CNN
	5    11550 7400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U6
U 6 1 669232E1
P 10250 7400
F 0 "U6" H 10250 7717 50  0000 C CNN
F 1 "74LS14" H 10250 7626 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 10250 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 10250 7400 50  0001 C CNN
	6    10250 7400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U6
U 7 1 66925098
P 7800 9850
F 0 "U6" H 8030 9896 50  0000 L CNN
F 1 "74LS14" H 8030 9805 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7800 9850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 7800 9850 50  0001 C CNN
	7    7800 9850
	1    0    0    -1  
$EndComp
Wire Wire Line
	13300 7200 12950 7200
Wire Wire Line
	12950 7200 12950 7500
Wire Wire Line
	12950 9100 13300 9100
Wire Wire Line
	12950 9100 12950 9400
Wire Wire Line
	12950 11000 13300 11000
Connection ~ 12950 9100
Wire Wire Line
	12950 11000 12950 11300
Wire Wire Line
	12950 12950 13300 12950
Connection ~ 12950 11000
Wire Wire Line
	12950 7200 12950 6250
Connection ~ 12950 7200
$Comp
L power:+5V #PWR?
U 1 1 669BAF75
P 12950 6050
AR Path="/636550FF/669BAF75" Ref="#PWR?"  Part="1" 
AR Path="/669BAF75" Ref="#PWR012"  Part="1" 
AR Path="/6687DD68/669BAF75" Ref="#PWR?"  Part="1" 
F 0 "#PWR012" H 12950 5900 50  0001 C CNN
F 1 "+5V" H 12965 6223 50  0000 C CNN
F 2 "" H 12950 6050 50  0001 C CNN
F 3 "" H 12950 6050 50  0001 C CNN
	1    12950 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	13300 7500 12950 7500
Connection ~ 12950 7500
Wire Wire Line
	12950 7500 12950 8200
Wire Wire Line
	13300 9400 12950 9400
Connection ~ 12950 9400
Wire Wire Line
	12950 9400 12950 10100
Wire Wire Line
	13300 11300 12950 11300
Connection ~ 12950 11300
Wire Wire Line
	12950 11300 12950 12000
Wire Wire Line
	13300 13250 12950 13250
Wire Wire Line
	12950 13250 12950 12950
Connection ~ 12950 12950
NoConn ~ 13300 12750
NoConn ~ 13300 12650
NoConn ~ 13300 12550
NoConn ~ 13300 12450
NoConn ~ 13300 10800
NoConn ~ 13300 10700
NoConn ~ 13300 10600
NoConn ~ 13300 10500
NoConn ~ 13300 8900
NoConn ~ 13300 8800
NoConn ~ 13300 8700
NoConn ~ 13300 8600
NoConn ~ 13300 7000
NoConn ~ 13300 6900
NoConn ~ 13300 6800
NoConn ~ 13300 6700
Wire Wire Line
	14300 7200 14500 7200
Wire Wire Line
	14500 7200 14500 8100
Wire Wire Line
	14500 8100 13050 8100
Wire Wire Line
	13050 8100 13050 9300
Wire Wire Line
	13050 9300 13300 9300
NoConn ~ 14300 7400
NoConn ~ 14300 9300
NoConn ~ 14300 11200
NoConn ~ 14300 13150
Wire Wire Line
	14300 9100 14500 9100
Wire Wire Line
	14500 9100 14500 10000
Wire Wire Line
	14500 10000 13050 10000
Wire Wire Line
	13050 10000 13050 11200
Wire Wire Line
	13050 11200 13300 11200
Wire Wire Line
	14300 11000 14500 11000
Wire Wire Line
	14500 11000 14500 11900
Wire Wire Line
	14500 11900 13050 11900
Wire Wire Line
	13050 11900 13050 13150
Wire Wire Line
	13050 13150 13300 13150
Wire Wire Line
	14300 6700 16800 6700
Wire Wire Line
	14300 6800 16800 6800
Wire Wire Line
	14300 6900 16800 6900
Wire Wire Line
	14300 7000 16800 7000
Wire Wire Line
	14300 8600 14650 8600
Wire Wire Line
	14650 8600 14650 7100
Wire Wire Line
	14650 7100 16800 7100
Wire Wire Line
	14300 8700 14750 8700
Wire Wire Line
	14750 8700 14750 7200
Wire Wire Line
	14750 7200 16800 7200
Wire Wire Line
	14300 8800 14850 8800
Wire Wire Line
	14850 8800 14850 7300
Wire Wire Line
	14850 7300 16800 7300
Wire Wire Line
	14300 8900 14950 8900
Wire Wire Line
	14950 8900 14950 7400
Wire Wire Line
	14950 7400 16800 7400
Wire Wire Line
	14300 10500 15050 10500
Wire Wire Line
	15050 10500 15050 7500
Wire Wire Line
	15050 7500 16800 7500
Wire Wire Line
	14300 10600 15150 10600
Wire Wire Line
	15150 10600 15150 7600
Wire Wire Line
	15150 7600 16800 7600
Wire Wire Line
	14300 10700 15250 10700
Wire Wire Line
	15250 10700 15250 7700
Wire Wire Line
	15250 7700 16800 7700
Wire Wire Line
	14300 10800 15350 10800
Wire Wire Line
	15350 10800 15350 7800
Wire Wire Line
	15350 7800 16800 7800
Wire Wire Line
	14300 12450 15450 12450
Wire Wire Line
	15450 12450 15450 7900
Wire Wire Line
	15450 7900 16800 7900
Wire Wire Line
	14300 12550 15550 12550
Wire Wire Line
	15550 12550 15550 8000
Wire Wire Line
	15550 8000 16800 8000
Wire Wire Line
	14300 12650 15650 12650
Wire Wire Line
	15650 12650 15650 8100
Wire Wire Line
	15650 8100 16800 8100
NoConn ~ 14300 12950
Wire Wire Line
	13300 7600 12850 7600
Wire Wire Line
	12850 7600 12850 9500
Wire Wire Line
	12850 9500 13300 9500
Wire Wire Line
	12850 9500 12850 11400
Wire Wire Line
	12850 11400 13300 11400
Connection ~ 12850 9500
Wire Wire Line
	12850 11400 12850 13350
Wire Wire Line
	12850 13350 13300 13350
Connection ~ 12850 11400
Wire Wire Line
	12600 7400 13300 7400
Wire Wire Line
	11850 7400 12000 7400
$Comp
L Device:R R1
U 1 1 6766FA01
P 10900 7400
F 0 "R1" V 11107 7400 50  0000 C CNN
F 1 "100" V 11016 7400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 10830 7400 50  0001 C CNN
F 3 "~" H 10900 7400 50  0001 C CNN
	1    10900 7400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11050 7400 11150 7400
$Comp
L Device:C C15
U 1 1 67706963
P 11150 7750
F 0 "C15" H 11265 7796 50  0000 L CNN
F 1 "220pF" H 11265 7705 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 11188 7600 50  0001 C CNN
F 3 "~" H 11150 7750 50  0001 C CNN
	1    11150 7750
	1    0    0    -1  
$EndComp
Wire Wire Line
	11150 7600 11150 7400
Connection ~ 11150 7400
Wire Wire Line
	11150 7400 11250 7400
$Comp
L power:GND #PWR?
U 1 1 6773F476
P 11150 7900
AR Path="/636550FF/6773F476" Ref="#PWR?"  Part="1" 
AR Path="/6773F476" Ref="#PWR07"  Part="1" 
AR Path="/6687DD68/6773F476" Ref="#PWR?"  Part="1" 
F 0 "#PWR07" H 11150 7650 50  0001 C CNN
F 1 "GND" H 11155 7727 50  0000 C CNN
F 2 "" H 11150 7900 50  0001 C CNN
F 3 "" H 11150 7900 50  0001 C CNN
	1    11150 7900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 67771105
P 13800 7900
AR Path="/636550FF/67771105" Ref="#PWR?"  Part="1" 
AR Path="/67771105" Ref="#PWR013"  Part="1" 
AR Path="/6687DD68/67771105" Ref="#PWR?"  Part="1" 
F 0 "#PWR013" H 13800 7650 50  0001 C CNN
F 1 "GND" H 13900 7900 50  0000 C CNN
F 2 "" H 13800 7900 50  0001 C CNN
F 3 "" H 13800 7900 50  0001 C CNN
	1    13800 7900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 677A6D54
P 13800 9800
AR Path="/636550FF/677A6D54" Ref="#PWR?"  Part="1" 
AR Path="/677A6D54" Ref="#PWR014"  Part="1" 
AR Path="/6687DD68/677A6D54" Ref="#PWR?"  Part="1" 
F 0 "#PWR014" H 13800 9550 50  0001 C CNN
F 1 "GND" H 13900 9800 50  0000 C CNN
F 2 "" H 13800 9800 50  0001 C CNN
F 3 "" H 13800 9800 50  0001 C CNN
	1    13800 9800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 677D877E
P 13800 11700
AR Path="/636550FF/677D877E" Ref="#PWR?"  Part="1" 
AR Path="/677D877E" Ref="#PWR015"  Part="1" 
AR Path="/6687DD68/677D877E" Ref="#PWR?"  Part="1" 
F 0 "#PWR015" H 13800 11450 50  0001 C CNN
F 1 "GND" H 13900 11700 50  0000 C CNN
F 2 "" H 13800 11700 50  0001 C CNN
F 3 "" H 13800 11700 50  0001 C CNN
	1    13800 11700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6780A1F6
P 13800 13650
AR Path="/636550FF/6780A1F6" Ref="#PWR?"  Part="1" 
AR Path="/6780A1F6" Ref="#PWR016"  Part="1" 
AR Path="/6687DD68/6780A1F6" Ref="#PWR?"  Part="1" 
F 0 "#PWR016" H 13800 13400 50  0001 C CNN
F 1 "GND" H 13900 13650 50  0000 C CNN
F 2 "" H 13800 13650 50  0001 C CNN
F 3 "" H 13800 13650 50  0001 C CNN
	1    13800 13650
	1    0    0    -1  
$EndComp
Wire Wire Line
	13800 12150 13800 12000
Wire Wire Line
	13800 12000 13150 12000
Connection ~ 12950 12000
Wire Wire Line
	12950 12000 12950 12950
Wire Wire Line
	13800 10200 13800 10100
Wire Wire Line
	13800 10100 13150 10100
Connection ~ 12950 10100
Wire Wire Line
	12950 10100 12950 11000
Wire Wire Line
	13800 8300 13800 8200
Wire Wire Line
	13800 8200 13150 8200
Connection ~ 12950 8200
Wire Wire Line
	12950 8200 12950 9100
Wire Wire Line
	13800 6400 13800 6250
Wire Wire Line
	13800 6250 13100 6250
Connection ~ 12950 6250
Wire Wire Line
	12950 6250 12950 6050
Wire Wire Line
	10550 7400 10750 7400
Wire Wire Line
	9700 7400 9950 7400
Wire Wire Line
	8550 7400 8950 7400
Wire Wire Line
	8950 14000 19600 14000
Wire Wire Line
	19600 7700 19600 14000
Wire Wire Line
	12850 6550 12850 7600
Connection ~ 12850 7600
$Comp
L 74xx:74LS04 U2
U 1 1 67E83B7A
P 5550 1650
F 0 "U2" H 5550 1967 50  0000 C CNN
F 1 "74LS04" H 5550 1876 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5550 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5550 1650 50  0001 C CNN
	1    5550 1650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U2
U 6 1 67E84BBD
P 9750 4950
F 0 "U2" H 9750 5267 50  0000 C CNN
F 1 "74LS04" H 9750 5176 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 9750 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 9750 4950 50  0001 C CNN
	6    9750 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 7400 8950 14000
Wire Wire Line
	8500 6550 9100 6550
Wire Wire Line
	9700 6550 12850 6550
Wire Wire Line
	6100 11050 6000 11050
Wire Wire Line
	6000 11050 6000 11150
Wire Wire Line
	6100 11150 6000 11150
Connection ~ 6000 11150
Wire Wire Line
	6000 11150 6000 11250
Wire Wire Line
	6100 11250 6000 11250
Connection ~ 6000 11250
$Comp
L power:GND #PWR?
U 1 1 68132EAB
P 6000 13300
AR Path="/636550FF/68132EAB" Ref="#PWR?"  Part="1" 
AR Path="/68132EAB" Ref="#PWR03"  Part="1" 
AR Path="/6687DD68/68132EAB" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 6000 13050 50  0001 C CNN
F 1 "GND" H 6005 13127 50  0000 C CNN
F 2 "" H 6000 13300 50  0001 C CNN
F 3 "" H 6000 13300 50  0001 C CNN
	1    6000 13300
	1    0    0    -1  
$EndComp
NoConn ~ 6700 11150
$Comp
L Device:C C?
U 1 1 6875519A
P 7200 9700
AR Path="/6274F952/6875519A" Ref="C?"  Part="1" 
AR Path="/6875519A" Ref="C7"  Part="1" 
AR Path="/636550FF/6875519A" Ref="C?"  Part="1" 
AR Path="/6687DD68/6875519A" Ref="C?"  Part="1" 
F 0 "C7" H 7315 9746 50  0000 L CNN
F 1 "0.1uF" H 7315 9655 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 7238 9550 50  0001 C CNN
F 3 "~" H 7200 9700 50  0001 C CNN
	1    7200 9700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 9850 7200 10450
Wire Wire Line
	6500 9250 7200 9250
Wire Wire Line
	7800 9250 7800 9350
Connection ~ 6500 9250
Wire Wire Line
	7800 10350 7800 10450
Wire Wire Line
	7800 10450 7200 10450
Connection ~ 6500 10450
Connection ~ 7200 10450
Wire Wire Line
	7200 10450 6500 10450
Wire Wire Line
	7200 9550 7200 9250
Connection ~ 7200 9250
Wire Wire Line
	7200 9250 7800 9250
Wire Wire Line
	6000 12000 6100 12000
Wire Wire Line
	6000 11250 6000 12000
Wire Wire Line
	6000 12000 6000 12500
Wire Wire Line
	6000 12500 6100 12500
Connection ~ 6000 12000
Wire Wire Line
	6000 12500 6000 13050
Wire Wire Line
	6000 13050 6100 13050
Connection ~ 6000 12500
Wire Wire Line
	6000 13050 6000 13300
Connection ~ 6000 13050
NoConn ~ 6700 12000
NoConn ~ 6700 12500
NoConn ~ 6700 13050
$Comp
L Device:C C?
U 1 1 68D5CC4D
P 13100 6500
AR Path="/6274F952/68D5CC4D" Ref="C?"  Part="1" 
AR Path="/68D5CC4D" Ref="C9"  Part="1" 
AR Path="/636550FF/68D5CC4D" Ref="C?"  Part="1" 
AR Path="/6687DD68/68D5CC4D" Ref="C?"  Part="1" 
F 0 "C9" H 13215 6546 50  0000 L CNN
F 1 "0.1uF" H 13215 6455 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 13138 6350 50  0001 C CNN
F 3 "~" H 13100 6500 50  0001 C CNN
	1    13100 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 68D8CCF9
P 13150 8400
AR Path="/6274F952/68D8CCF9" Ref="C?"  Part="1" 
AR Path="/68D8CCF9" Ref="C10"  Part="1" 
AR Path="/636550FF/68D8CCF9" Ref="C?"  Part="1" 
AR Path="/6687DD68/68D8CCF9" Ref="C?"  Part="1" 
F 0 "C10" H 13265 8446 50  0000 L CNN
F 1 "0.1uF" H 13265 8355 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 13188 8250 50  0001 C CNN
F 3 "~" H 13150 8400 50  0001 C CNN
	1    13150 8400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 68DBCF73
P 13150 10300
AR Path="/6274F952/68DBCF73" Ref="C?"  Part="1" 
AR Path="/68DBCF73" Ref="C11"  Part="1" 
AR Path="/636550FF/68DBCF73" Ref="C?"  Part="1" 
AR Path="/6687DD68/68DBCF73" Ref="C?"  Part="1" 
F 0 "C11" H 13265 10346 50  0000 L CNN
F 1 "0.1uF" H 13265 10255 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 13188 10150 50  0001 C CNN
F 3 "~" H 13150 10300 50  0001 C CNN
	1    13150 10300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 68E1E05F
P 13150 12250
AR Path="/6274F952/68E1E05F" Ref="C?"  Part="1" 
AR Path="/68E1E05F" Ref="C12"  Part="1" 
AR Path="/636550FF/68E1E05F" Ref="C?"  Part="1" 
AR Path="/6687DD68/68E1E05F" Ref="C?"  Part="1" 
F 0 "C12" H 13265 12296 50  0000 L CNN
F 1 "0.1uF" H 13265 12205 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 13188 12100 50  0001 C CNN
F 3 "~" H 13150 12250 50  0001 C CNN
	1    13150 12250
	1    0    0    -1  
$EndComp
Wire Wire Line
	13150 10150 13150 10100
Connection ~ 13150 10100
Wire Wire Line
	13150 10100 12950 10100
Wire Wire Line
	13150 11700 13800 11700
Wire Wire Line
	13150 10450 13150 11700
Connection ~ 13800 11700
Wire Wire Line
	13150 12100 13150 12000
Connection ~ 13150 12000
Wire Wire Line
	13150 12000 12950 12000
Wire Wire Line
	13150 13650 13800 13650
Wire Wire Line
	13150 12400 13150 13650
Connection ~ 13800 13650
Wire Wire Line
	13150 8250 13150 8200
Connection ~ 13150 8200
Wire Wire Line
	13150 8200 12950 8200
Wire Wire Line
	13150 9800 13800 9800
Wire Wire Line
	13150 8550 13150 9800
Connection ~ 13800 9800
Wire Wire Line
	13100 7900 13800 7900
Wire Wire Line
	13100 6650 13100 7900
Connection ~ 13800 7900
Wire Wire Line
	13100 6350 13100 6250
Connection ~ 13100 6250
Wire Wire Line
	13100 6250 12950 6250
Wire Wire Line
	16800 8200 16350 8200
Wire Wire Line
	7500 6450 7500 5700
Wire Wire Line
	7500 5700 7350 5700
NoConn ~ 14300 12750
Wire Wire Line
	16350 8200 16350 10050
Wire Wire Line
	16350 10050 17200 10050
Wire Wire Line
	17200 9750 17200 10050
$EndSCHEMATC
