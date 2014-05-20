
[
 Attempting to get a license: %s
78*common2"
Implementation2default:defaultZ17-78
Q
Feature available: %s
81*common2"
Implementation2default:defaultZ17-81
|
+Loading parts and site information from %s
36*device28
$C:/Vivado/2013.4/data/parts/arch.xml2default:defaultZ21-36
‰
!Parsing RTL primitives file [%s]
14*netlist2N
:C:/Vivado/2013.4/data/parts/xilinx/rtl/prims/rtl_prims.xml2default:defaultZ29-14
’
*Finished parsing RTL primitives file [%s]
11*netlist2N
:C:/Vivado/2013.4/data/parts/xilinx/rtl/prims/rtl_prims.xml2default:defaultZ29-11
5
Refreshing IP repositories
234*coregenZ19-234
>
"No user IP repositories specified
1154*coregenZ19-1704
l
"Loaded Vivado IP repository '%s'.
1332*coregen2,
C:/Vivado/2013.4/data/ip2default:defaultZ19-2313
‚
Command: %s
53*	vivadotcl2Z
Fsynth_design -top clk_wiz_0 -part xc7z010clg400-1 -mode out_of_context2default:defaultZ4-113
/

Starting synthesis...

3*	vivadotclZ4-3
¯
%IP '%s' is locked. Locked reason: %s
1260*coregen2
	clk_wiz_02default:default2M
9Property 'IS_LOCKED' is set to true by the system or user2default:defaultZ19-2162
•
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7z0102default:defaultZ17-347
…
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7z0102default:defaultZ17-349
›
%s*synth2‹
wStarting RTL Elaboration : Time (s): cpu = 00:00:09 ; elapsed = 00:00:34 . Memory (MB): peak = 341.313 ; gain = 82.566
2default:default
ê
synthesizing module '%s'638*oasys2
	clk_wiz_02default:default2|
fc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.v2default:default2
692default:default8@Z8-638
û
synthesizing module '%s'638*oasys2%
clk_wiz_0_clk_wiz2default:default2„
nc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v2default:default2
672default:default8@Z8-638
°
synthesizing module '%s'638*oasys2
IBUF2default:default2D
.C:/Vivado/2013.4/scripts/rt/data/unisim_comp.v2default:default2
105802default:default8@Z8-638
^
%s*synth2O
;	Parameter CAPACITANCE bound to: DONT_CARE - type: string 
2default:default
[
%s*synth2L
8	Parameter IBUF_DELAY_VALUE bound to: 0 - type: string 
2default:default
Z
%s*synth2K
7	Parameter IBUF_LOW_PWR bound to: TRUE - type: string 
2default:default
]
%s*synth2N
:	Parameter IFD_DELAY_VALUE bound to: AUTO - type: string 
2default:default
[
%s*synth2L
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
2default:default
ë
%done synthesizing module '%s' (%s#%s)256*oasys2
IBUF2default:default2
12default:default2
12default:default2D
.C:/Vivado/2013.4/scripts/rt/data/unisim_comp.v2default:default2
105802default:default8@Z8-256
¶
synthesizing module '%s'638*oasys2

MMCME2_ADV2default:default2D
.C:/Vivado/2013.4/scripts/rt/data/unisim_comp.v2default:default2
162812default:default8@Z8-638
\
%s*synth2M
9	Parameter BANDWIDTH bound to: OPTIMIZED - type: string 
2default:default
c
%s*synth2T
@	Parameter CLKFBOUT_USE_FINE_PS bound to: FALSE - type: string 
2default:default
b
%s*synth2S
?	Parameter CLKOUT0_USE_FINE_PS bound to: FALSE - type: string 
2default:default
b
%s*synth2S
?	Parameter CLKOUT1_USE_FINE_PS bound to: FALSE - type: string 
2default:default
b
%s*synth2S
?	Parameter CLKOUT2_USE_FINE_PS bound to: FALSE - type: string 
2default:default
b
%s*synth2S
?	Parameter CLKOUT3_USE_FINE_PS bound to: FALSE - type: string 
2default:default
^
%s*synth2O
;	Parameter CLKOUT4_CASCADE bound to: FALSE - type: string 
2default:default
b
%s*synth2S
?	Parameter CLKOUT4_USE_FINE_PS bound to: FALSE - type: string 
2default:default
b
%s*synth2S
?	Parameter CLKOUT5_USE_FINE_PS bound to: FALSE - type: string 
2default:default
b
%s*synth2S
?	Parameter CLKOUT6_USE_FINE_PS bound to: FALSE - type: string 
2default:default
[
%s*synth2L
8	Parameter COMPENSATION bound to: ZHOLD - type: string 
2default:default
T
%s*synth2E
1	Parameter SS_EN bound to: FALSE - type: string 
2default:default
\
%s*synth2M
9	Parameter SS_MODE bound to: CENTER_HIGH - type: string 
2default:default
[
%s*synth2L
8	Parameter STARTUP_WAIT bound to: FALSE - type: string 
2default:default
S
%s*synth2D
0	Parameter IS_CLKINSEL_INVERTED bound to: 1'b0 
2default:default
O
%s*synth2@
,	Parameter IS_PSEN_INVERTED bound to: 1'b0 
2default:default
S
%s*synth2D
0	Parameter IS_PSINCDEC_INVERTED bound to: 1'b0 
2default:default
Q
%s*synth2B
.	Parameter IS_PWRDWN_INVERTED bound to: 1'b0 
2default:default
N
%s*synth2?
+	Parameter IS_RST_INVERTED bound to: 1'b0 
2default:default
Z
%s*synth2K
7	Parameter CLKOUT1_DIVIDE bound to: 1 - type: integer 
2default:default
Z
%s*synth2K
7	Parameter CLKOUT2_DIVIDE bound to: 1 - type: integer 
2default:default
Z
%s*synth2K
7	Parameter CLKOUT3_DIVIDE bound to: 1 - type: integer 
2default:default
Z
%s*synth2K
7	Parameter CLKOUT4_DIVIDE bound to: 1 - type: integer 
2default:default
Z
%s*synth2K
7	Parameter CLKOUT5_DIVIDE bound to: 1 - type: integer 
2default:default
Z
%s*synth2K
7	Parameter CLKOUT6_DIVIDE bound to: 1 - type: integer 
2default:default
Y
%s*synth2J
6	Parameter DIVCLK_DIVIDE bound to: 1 - type: integer 
2default:default
]
%s*synth2N
:	Parameter SS_MOD_PERIOD bound to: 10000 - type: integer 
2default:default
a
%s*synth2R
>	Parameter CLKFBOUT_MULT_F bound to: 10.000000 - type: float 
2default:default
_
%s*synth2P
<	Parameter CLKFBOUT_PHASE bound to: 0.000000 - type: float 
2default:default
_
%s*synth2P
<	Parameter CLKIN1_PERIOD bound to: 10.000000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKIN2_PERIOD bound to: 0.000000 - type: float 
2default:default
b
%s*synth2S
?	Parameter CLKOUT0_DIVIDE_F bound to: 10.000000 - type: float 
2default:default
c
%s*synth2T
@	Parameter CLKOUT0_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKOUT0_PHASE bound to: 0.000000 - type: float 
2default:default
c
%s*synth2T
@	Parameter CLKOUT1_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKOUT1_PHASE bound to: 0.000000 - type: float 
2default:default
c
%s*synth2T
@	Parameter CLKOUT2_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKOUT2_PHASE bound to: 0.000000 - type: float 
2default:default
c
%s*synth2T
@	Parameter CLKOUT3_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKOUT3_PHASE bound to: 0.000000 - type: float 
2default:default
c
%s*synth2T
@	Parameter CLKOUT4_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKOUT4_PHASE bound to: 0.000000 - type: float 
2default:default
c
%s*synth2T
@	Parameter CLKOUT5_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKOUT5_PHASE bound to: 0.000000 - type: float 
2default:default
c
%s*synth2T
@	Parameter CLKOUT6_DUTY_CYCLE bound to: 0.500000 - type: float 
2default:default
^
%s*synth2O
;	Parameter CLKOUT6_PHASE bound to: 0.000000 - type: float 
2default:default
\
%s*synth2M
9	Parameter REF_JITTER1 bound to: 0.010000 - type: float 
2default:default
\
%s*synth2M
9	Parameter REF_JITTER2 bound to: 0.010000 - type: float 
2default:default
ñ
%done synthesizing module '%s' (%s#%s)256*oasys2

MMCME2_ADV2default:default2
22default:default2
12default:default2D
.C:/Vivado/2013.4/scripts/rt/data/unisim_comp.v2default:default2
162812default:default8@Z8-256
®
synthesizing module '%s'638*oasys2
BUFG2default:default2D
.C:/Vivado/2013.4/scripts/rt/data/unisim_comp.v2default:default2
6122default:default8@Z8-638
é
%done synthesizing module '%s' (%s#%s)256*oasys2
BUFG2default:default2
32default:default2
12default:default2D
.C:/Vivado/2013.4/scripts/rt/data/unisim_comp.v2default:default2
6122default:default8@Z8-256
¶
%done synthesizing module '%s' (%s#%s)256*oasys2%
clk_wiz_0_clk_wiz2default:default2
42default:default2
12default:default2„
nc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v2default:default2
672default:default8@Z8-256
¥
%done synthesizing module '%s' (%s#%s)256*oasys2
	clk_wiz_02default:default2
52default:default2
12default:default2|
fc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.v2default:default2
692default:default8@Z8-256
œ
%s*synth2Œ
xFinished RTL Elaboration : Time (s): cpu = 00:00:11 ; elapsed = 00:00:36 . Memory (MB): peak = 364.621 ; gain = 105.875
2default:default
;
%s*synth2,

Report Check Netlist: 
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
l
%s*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
l
%s*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
\
-Analyzing %s Unisim elements for replacement
17*netlist2
22default:defaultZ29-17
a
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28

Loading clock regions from %s
13*device2X
DC:/Vivado/2013.4/data\parts/xilinx/zynq/zynq/xc7z010/ClockRegion.xml2default:defaultZ21-13

Loading clock buffers from %s
11*device2Y
EC:/Vivado/2013.4/data\parts/xilinx/zynq/zynq/xc7z010/ClockBuffers.xml2default:defaultZ21-11

&Loading clock placement rules from %s
318*place2P
<C:/Vivado/2013.4/data/parts/xilinx/zynq/ClockPlacerRules.xml2default:defaultZ30-318
Ž
)Loading package pin functions from %s...
17*device2L
8C:/Vivado/2013.4/data\parts/xilinx/zynq/PinFunctions.xml2default:defaultZ21-17
Œ
Loading package from %s
16*device2[
GC:/Vivado/2013.4/data\parts/xilinx/zynq/zynq/xc7z010/clg400/Package.xml2default:defaultZ21-16
ƒ
Loading io standards from %s
15*device2M
9C:/Vivado/2013.4/data\./parts/xilinx/zynq/IOStandards.xml2default:defaultZ21-15
5

Processing XDC Constraints
244*projectZ1-262
ß
$Parsing XDC File [%s] for cell '%s'
848*designutils2€
lc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_OOC.xdc2default:default2
inst2default:defaultZ20-848
è
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2€
lc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_OOC.xdc2default:default2
inst2default:defaultZ20-847
Ú
$Parsing XDC File [%s] for cell '%s'
848*designutils2|
hc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2default:default2
inst2default:defaultZ20-848
ã
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2|
hc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2default:default2
inst2default:defaultZ20-847
/
Deriving generated clocks
2*timingZ38-2
ù
ÙImplementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2|
hc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2default:default2…
qC:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.runs/clk_wiz_0_synth_1/.Xil/clk_wiz_0_propImpl.xdc2default:defaultZ1-236
á
$Parsing XDC File [%s] for cell '%s'
848*designutils2‚
nc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc2default:default2
inst2default:defaultZ20-848
ê
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2‚
nc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc2default:default2
inst2default:defaultZ20-847
®
Parsing XDC File [%s]
179*designutils2x
dC:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.runs/clk_wiz_0_synth_1/dont_touch.xdc2default:defaultZ20-179
·
Finished Parsing XDC File [%s]
178*designutils2x
dC:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.runs/clk_wiz_0_synth_1/dont_touch.xdc2default:defaultZ20-178
?
&Completed Processing XDC Constraints

245*projectZ1-263
u
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111
µ
%s*synth2¥
Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:29 ; elapsed = 00:00:57 . Memory (MB): peak = 478.844 ; gain = 220.098
2default:default

%s*synth2
yFinished RTL Optimization : Time (s): cpu = 00:00:29 ; elapsed = 00:00:57 . Memory (MB): peak = 478.844 ; gain = 220.098
2default:default
<
%s*synth2-

Report RTL Partitions: 
2default:default
N
%s*synth2?
++-+--------------+------------+----------+
2default:default
N
%s*synth2?
+| |RTL Partition |Replication |Instances |
2default:default
N
%s*synth2?
++-+--------------+------------+----------+
2default:default
N
%s*synth2?
++-+--------------+------------+----------+
2default:default
y
%s*synth2j
VPart Resources:
DSPs: 80 (col length:40)
BRAMs: 120 (col length: RAMB18 40 RAMB36 20)
2default:default
±
%s*synth2¡
ŒFinished Loading Part and Timing Information : Time (s): cpu = 00:00:48 ; elapsed = 00:01:17 . Memory (MB): peak = 516.500 ; gain = 257.754
2default:default
B
%s*synth23
Detailed RTL Component Info : 
2default:default
F
%s*synth27
#Hierarchical RTL Component report 
2default:default
5
%s*synth2&
Module clk_wiz_0 
2default:default
B
%s*synth23
Detailed RTL Component Info : 
2default:default
=
%s*synth2.
Module clk_wiz_0_clk_wiz 
2default:default
B
%s*synth23
Detailed RTL Component Info : 
2default:default
©
%s*synth2™
„Finished Cross Boundary Optimization : Time (s): cpu = 00:00:48 ; elapsed = 00:01:17 . Memory (MB): peak = 516.500 ; gain = 257.754
2default:default
¢
%s*synth2’
~---------------------------------------------------------------------------------
Start RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
¦
%s*synth2–
---------------------------------------------------------------------------------
Finished RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
ž
%s*synth2Ž
zFinished Area Optimization : Time (s): cpu = 00:00:48 ; elapsed = 00:01:17 . Memory (MB): peak = 517.535 ; gain = 258.789
2default:default
­
%s*synth2
ˆFinished Applying XDC Timing Constraints : Time (s): cpu = 00:00:48 ; elapsed = 00:01:17 . Memory (MB): peak = 517.535 ; gain = 258.789
2default:default
 
%s*synth2
|Finished Timing Optimization : Time (s): cpu = 00:00:48 ; elapsed = 00:01:17 . Memory (MB): peak = 517.535 ; gain = 258.789
2default:default
Ÿ
%s*synth2
{Finished Technology Mapping : Time (s): cpu = 00:00:48 ; elapsed = 00:01:17 . Memory (MB): peak = 523.059 ; gain = 264.313
2default:default
D
%s*synth25
!Gated Clock Conversion mode: off
2default:default
™
%s*synth2‰
uFinished IO Insertion : Time (s): cpu = 00:00:49 ; elapsed = 00:01:17 . Memory (MB): peak = 523.059 ; gain = 264.313
2default:default
;
%s*synth2,

Report Check Netlist: 
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
l
%s*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
l
%s*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
ª
%s*synth2š
…Finished Renaming Generated Instances : Time (s): cpu = 00:00:49 ; elapsed = 00:01:17 . Memory (MB): peak = 523.059 ; gain = 264.313
2default:default
§
%s*synth2—
‚Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:49 ; elapsed = 00:01:17 . Memory (MB): peak = 523.059 ; gain = 264.313
2default:default
¢
%s*synth2’
~---------------------------------------------------------------------------------
Start RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
¦
%s*synth2–
---------------------------------------------------------------------------------
Finished RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
8
%s*synth2)

Report BlackBoxes: 
2default:default
A
%s*synth22
+-+--------------+----------+
2default:default
A
%s*synth22
| |BlackBox name |Instances |
2default:default
A
%s*synth22
+-+--------------+----------+
2default:default
A
%s*synth22
+-+--------------+----------+
2default:default
8
%s*synth2)

Report Cell Usage: 
2default:default
?
%s*synth20
+------+-----------+------+
2default:default
?
%s*synth20
|      |Cell       |Count |
2default:default
?
%s*synth20
+------+-----------+------+
2default:default
?
%s*synth20
|1     |BUFG       |     2|
2default:default
?
%s*synth20
|2     |MMCME2_ADV |     1|
2default:default
?
%s*synth20
|3     |IBUF       |     1|
2default:default
?
%s*synth20
+------+-----------+------+
2default:default
<
%s*synth2-

Report Instance Areas: 
2default:default
P
%s*synth2A
-+------+---------+------------------+------+
2default:default
P
%s*synth2A
-|      |Instance |Module            |Cells |
2default:default
P
%s*synth2A
-+------+---------+------------------+------+
2default:default
P
%s*synth2A
-|1     |top      |                  |     4|
2default:default
P
%s*synth2A
-|2     |  inst   |clk_wiz_0_clk_wiz |     4|
2default:default
P
%s*synth2A
-+------+---------+------------------+------+
2default:default
¦
%s*synth2–
Finished Writing Synthesis Report : Time (s): cpu = 00:00:49 ; elapsed = 00:01:17 . Memory (MB): peak = 523.059 ; gain = 264.313
2default:default
i
%s*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 0 warnings.
2default:default
£
%s*synth2“
Synthesis Optimization Complete : Time (s): cpu = 00:00:49 ; elapsed = 00:01:17 . Memory (MB): peak = 523.059 ; gain = 264.313
2default:default
\
-Analyzing %s Unisim elements for replacement
17*netlist2
22default:defaultZ29-17
a
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28
ß
$Parsing XDC File [%s] for cell '%s'
848*designutils2€
lc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_OOC.xdc2default:default2
inst2default:defaultZ20-848
è
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2€
lc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_OOC.xdc2default:default2
inst2default:defaultZ20-847
Ú
$Parsing XDC File [%s] for cell '%s'
848*designutils2|
hc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2default:default2
inst2default:defaultZ20-848
Ú
%Done setting XDC timing constraints.
35*timing2~
hc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2default:default2
562default:default8@Z38-35
Í
Deriving generated clocks
2*timing2~
hc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2default:default2
562default:default8@Z38-2
ã
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2|
hc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2default:default2
inst2default:defaultZ20-847
á
$Parsing XDC File [%s] for cell '%s'
848*designutils2‚
nc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc2default:default2
inst2default:defaultZ20-848
ê
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2‚
nc:/Users/kowalsif/Desktop/neural/neural_network/Neural_Network.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc2default:default2
inst2default:defaultZ20-847
C
Pushed %s inverter(s).
98*opt2
02default:defaultZ31-138
u
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111
L
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83
½
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
242default:default2
02default:default2
02default:default2
02default:defaultZ4-41
U
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42
ü
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:01:092default:default2
00:01:162default:default2
747.2812default:default2
432.9732default:defaultZ17-268

sreport_utilization: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.050 . Memory (MB): peak = 747.281 ; gain = 0.000
*common
w
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sat May 17 18:19:42 20142default:defaultZ17-206