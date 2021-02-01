#!/usr/bin/perl -w

use warnings;
use Data::Dumper qw(Dumper);
use Storable qw(retrieve nstore);

###########################################
#Scaling normalized

#############
#NOT
#############
$scaling_130nm{"NOT1"}[0] = 1;
$scaling_130nm{"NOT1"}[1] = 1;

$scaling_130nm{"NOT11"}[0] = 0;
$scaling_130nm{"NOT11"}[1] = 1;

$scaling_130nm{"NOT12"}[0] = 1;
$scaling_130nm{"NOT12"}[1] = 0;

#############
#NAND
#############

$scaling_130nm{"NAND2"} = 1/2;
$scaling_130nm{"NAND21"} = 1/2;
$scaling_130nm{"NAND22"} = 0;
$scaling_130nm{"NAND23"} = 1/2;
$scaling_130nm{"NAND24"} = 1/2;

$scaling_130nm{"NAND3"} = 1/3;
$scaling_130nm{"NAND31"} = 1/3;
$scaling_130nm{"NAND32"} = 1/3;
$scaling_130nm{"NAND33"} = 0;
$scaling_130nm{"NAND34"} = 1/3;
$scaling_130nm{"NAND35"} = 1/3;
$scaling_130nm{"NAND36"} = 1/3;

$scaling_130nm{"NAND4"} = 1/4;
$scaling_130nm{"NAND41"} = 1/4;
$scaling_130nm{"NAND42"} = 1/4;
$scaling_130nm{"NAND43"} = 1/4;
$scaling_130nm{"NAND44"} = 0;
$scaling_130nm{"NAND45"} = 1/4;
$scaling_130nm{"NAND46"} = 1/4;
$scaling_130nm{"NAND47"} = 1/4;
$scaling_130nm{"NAND48"} = 1/4;

$scaling_130nm{"NOR2"} = 1/2;
$scaling_130nm{"NOR21"} = 1/2;
$scaling_130nm{"NOR22"} = 0;
$scaling_130nm{"NOR23"} = 1/2;
$scaling_130nm{"NOR24"} = 1/2;

$scaling_130nm{"NOR3"} = 1/3;
$scaling_130nm{"NOR31"} = 1/3;
$scaling_130nm{"NOR32"} = 1/3;
$scaling_130nm{"NOR33"} = 0;
$scaling_130nm{"NOR34"} = 1/3;
$scaling_130nm{"NOR35"} = 1/3;
$scaling_130nm{"NOR36"} = 1/3;

$scaling_130nm{"NOR4"} = 1/4;
$scaling_130nm{"NOR41"} = 1/4;
$scaling_130nm{"NOR42"} = 1/4;
$scaling_130nm{"NOR43"} = 1/4;
$scaling_130nm{"NOR44"} = 0;
$scaling_130nm{"NOR45"} = 1/4;
$scaling_130nm{"NOR46"} = 1/4;
$scaling_130nm{"NOR47"} = 1/4;
$scaling_130nm{"NOR48"} = 1/4;

nstore \%scaling_130nm, '130nm.scaling';
###########################################

#######################################################################
#The following are specific to the 130nm tech. with Q=0.3pC 

#-------
#NOT
#-------
$propProbs_130nm{"NOT1-N1"}{"0"} = "1"; 
$propProbs_130nm{"NOT1-P1"}{"1"} = "1"; 

#-------
#NOT1
#-------
$propProbs_130nm{"NOT11-P1"}{"1"} = "1"; 

#-------
#NOT2
#-------
$propProbs_130nm{"NOT12-N1"}{"0"} = "1"; 


#-------
#NAND2
#-------
$propProbs_130nm{"NAND2-N1"}{"00"} = "1"; 
$propProbs_130nm{"NAND2-N1"}{"01"} = "1"; 
$propProbs_130nm{"NAND2-N1"}{"10"} = "1"; 

$propProbs_130nm{"NAND2-N2"}{"10"} = "1"; 

$propProbs_130nm{"NAND2-P1"}{"11"} = "1"; 
$propProbs_130nm{"NAND2-P2"}{"11"} = "1"; 

#-------
#NAND21
#-------
$propProbs_130nm{"NAND21-N1"}{"10"} = "1"; 

$propProbs_130nm{"NAND21-N2"}{"10"} = "1"; 

$propProbs_130nm{"NAND21-P1"}{"11"} = "1"; 
$propProbs_130nm{"NAND21-P2"}{"11"} = "1"; 

#-------
#NAND22
#-------
$propProbs_130nm{"NAND22-P1"}{"11"} = "1"; 
$propProbs_130nm{"NAND22-P2"}{"11"} = "1"; 

#-------
#NAND23
#-------
$propProbs_130nm{"NAND23-N1"}{"00"} = "1"; 
$propProbs_130nm{"NAND23-N1"}{"01"} = "1"; 
$propProbs_130nm{"NAND23-N1"}{"10"} = "1"; 

$propProbs_130nm{"NAND23-N2"}{"00"} = "1"; 
$propProbs_130nm{"NAND23-N2"}{"10"} = "1"; 

#-------
#NAND24
#-------
$propProbs_130nm{"NAND24-N1"}{"10"} = "1"; 

$propProbs_130nm{"NAND24-N2"}{"10"} = "1"; 

#-------
#NAND3
#-------
$propProbs_130nm{"NAND3-N1"}{"000"} = "1"; 
$propProbs_130nm{"NAND3-N1"}{"001"} = "1"; 
$propProbs_130nm{"NAND3-N1"}{"010"} = "1"; 
$propProbs_130nm{"NAND3-N1"}{"011"} = "1"; 
$propProbs_130nm{"NAND3-N1"}{"100"} = "1"; 
$propProbs_130nm{"NAND3-N1"}{"101"} = "1"; 
$propProbs_130nm{"NAND3-N1"}{"110"} = "1"; 

$propProbs_130nm{"NAND3-N2"}{"100"} = "1"; 
$propProbs_130nm{"NAND3-N2"}{"101"} = "1"; 
$propProbs_130nm{"NAND3-N2"}{"110"} = "1"; 

$propProbs_130nm{"NAND3-N3"}{"110"} = "1"; 

$propProbs_130nm{"NAND3-P1"}{"111"} = "1"; 
$propProbs_130nm{"NAND3-P2"}{"111"} = "1"; 
$propProbs_130nm{"NAND3-P3"}{"111"} = "1"; 

#-------
#NAND31
#-------
$propProbs_130nm{"NAND31-N1"}{"100"} = "1"; 
$propProbs_130nm{"NAND31-N1"}{"101"} = "1"; 
$propProbs_130nm{"NAND31-N1"}{"110"} = "1"; 

$propProbs_130nm{"NAND31-N2"}{"100"} = "1"; 
$propProbs_130nm{"NAND31-N2"}{"101"} = "1"; 
$propProbs_130nm{"NAND31-N2"}{"110"} = "1"; 

$propProbs_130nm{"NAND31-N3"}{"110"} = "1"; 

$propProbs_130nm{"NAND31-P1"}{"111"} = "1"; 
$propProbs_130nm{"NAND31-P2"}{"111"} = "1"; 
$propProbs_130nm{"NAND31-P3"}{"111"} = "1"; 

#-------
#NAND32
#-------
$propProbs_130nm{"NAND32-N1"}{"110"} = "1"; 
$propProbs_130nm{"NAND32-N2"}{"110"} = "1"; 
$propProbs_130nm{"NAND32-N3"}{"110"} = "1"; 

$propProbs_130nm{"NAND32-P1"}{"111"} = "1"; 
$propProbs_130nm{"NAND32-P2"}{"111"} = "1"; 
$propProbs_130nm{"NAND32-P3"}{"111"} = "1"; 

#-------
#NAND33
#-------

$propProbs_130nm{"NAND33-P1"}{"111"} = "1"; 
$propProbs_130nm{"NAND33-P2"}{"111"} = "1"; 
$propProbs_130nm{"NAND33-P3"}{"111"} = "1"; 

#-------
#NAND34
#-------
$propProbs_130nm{"NAND34-N1"}{"000"} = "1"; 
$propProbs_130nm{"NAND34-N1"}{"001"} = "1"; 
$propProbs_130nm{"NAND34-N1"}{"010"} = "1"; 
$propProbs_130nm{"NAND34-N1"}{"011"} = "1"; 
$propProbs_130nm{"NAND34-N1"}{"100"} = "1"; 
$propProbs_130nm{"NAND34-N1"}{"101"} = "1"; 
$propProbs_130nm{"NAND34-N1"}{"110"} = "1"; 

$propProbs_130nm{"NAND34-N2"}{"000"} = "1"; 
$propProbs_130nm{"NAND34-N2"}{"001"} = "1"; 
$propProbs_130nm{"NAND34-N2"}{"010"} = "1"; 
$propProbs_130nm{"NAND34-N2"}{"100"} = "1"; 
$propProbs_130nm{"NAND34-N2"}{"101"} = "1"; 
$propProbs_130nm{"NAND34-N2"}{"110"} = "1"; 

$propProbs_130nm{"NAND34-N3"}{"010"} = "1"; 
$propProbs_130nm{"NAND34-N3"}{"100"} = "1"; 
$propProbs_130nm{"NAND34-N3"}{"110"} = "1"; 

#-------
#NAND35
#-------
$propProbs_130nm{"NAND35-N1"}{"100"} = "1"; 
$propProbs_130nm{"NAND35-N1"}{"101"} = "1"; 
$propProbs_130nm{"NAND35-N1"}{"110"} = "1"; 

$propProbs_130nm{"NAND35-N2"}{"100"} = "1"; 
$propProbs_130nm{"NAND35-N2"}{"101"} = "1"; 
$propProbs_130nm{"NAND35-N2"}{"110"} = "1"; 

$propProbs_130nm{"NAND35-N3"}{"100"} = "1"; 
$propProbs_130nm{"NAND35-N3"}{"110"} = "1"; 

#-------
#NAND36
#-------
$propProbs_130nm{"NAND36-N1"}{"110"} = "1"; 
$propProbs_130nm{"NAND36-N2"}{"110"} = "1"; 
$propProbs_130nm{"NAND36-N3"}{"110"} = "1"; 

#-------
#NAND4
#-------
$propProbs_130nm{"NAND4-N1"}{"0000"} = "1"; 
$propProbs_130nm{"NAND4-N1"}{"0001"} = "1"; 
$propProbs_130nm{"NAND4-N1"}{"0010"} = "1"; 
$propProbs_130nm{"NAND4-N1"}{"0011"} = "1"; 
$propProbs_130nm{"NAND4-N1"}{"0100"} = "1"; 
$propProbs_130nm{"NAND4-N1"}{"0101"} = "1"; 
$propProbs_130nm{"NAND4-N1"}{"0110"} = "1"; 
$propProbs_130nm{"NAND4-N1"}{"0111"} = "1"; 
$propProbs_130nm{"NAND4-N1"}{"1000"} = "1"; 
$propProbs_130nm{"NAND4-N1"}{"1001"} = "1"; 
$propProbs_130nm{"NAND4-N1"}{"1010"} = "1"; 
$propProbs_130nm{"NAND4-N1"}{"1011"} = "1"; 
$propProbs_130nm{"NAND4-N1"}{"1100"} = "1"; 
$propProbs_130nm{"NAND4-N1"}{"1101"} = "1"; 
$propProbs_130nm{"NAND4-N1"}{"1110"} = "1"; 

$propProbs_130nm{"NAND4-N2"}{"1001"} = "1"; 
$propProbs_130nm{"NAND4-N2"}{"1010"} = "1"; 
$propProbs_130nm{"NAND4-N2"}{"1011"} = "1"; 
$propProbs_130nm{"NAND4-N2"}{"1100"} = "1"; 
$propProbs_130nm{"NAND4-N2"}{"1101"} = "1"; 
$propProbs_130nm{"NAND4-N2"}{"1110"} = "1"; 

$propProbs_130nm{"NAND4-N3"}{"1101"} = "1"; 
$propProbs_130nm{"NAND4-N3"}{"1110"} = "1"; 

$propProbs_130nm{"NAND4-N4"}{"1110"} = "1"; 

$propProbs_130nm{"NAND4-P1"}{"1111"} = "1"; 
$propProbs_130nm{"NAND4-P2"}{"1111"} = "1"; 
$propProbs_130nm{"NAND4-P3"}{"1111"} = "1"; 
$propProbs_130nm{"NAND4-P4"}{"1111"} = "1"; 

#-------
#NAND41
#-------
$propProbs_130nm{"NAND41-N1"}{"1000"} = "1"; 
$propProbs_130nm{"NAND41-N1"}{"1001"} = "1"; 
$propProbs_130nm{"NAND41-N1"}{"1010"} = "1"; 
$propProbs_130nm{"NAND41-N1"}{"1011"} = "1"; 
$propProbs_130nm{"NAND41-N1"}{"1100"} = "1"; 
$propProbs_130nm{"NAND41-N1"}{"1101"} = "1"; 
$propProbs_130nm{"NAND41-N1"}{"1110"} = "1"; 

$propProbs_130nm{"NAND41-N2"}{"1001"} = "1"; 
$propProbs_130nm{"NAND41-N2"}{"1010"} = "1"; 
$propProbs_130nm{"NAND41-N2"}{"1011"} = "1"; 
$propProbs_130nm{"NAND41-N2"}{"1100"} = "1"; 
$propProbs_130nm{"NAND41-N2"}{"1101"} = "1"; 
$propProbs_130nm{"NAND41-N2"}{"1110"} = "1"; 

$propProbs_130nm{"NAND41-N3"}{"1101"} = "1"; 
$propProbs_130nm{"NAND41-N3"}{"1110"} = "1"; 

$propProbs_130nm{"NAND41-N4"}{"1110"} = "1"; 

$propProbs_130nm{"NAND41-P1"}{"1111"} = "1"; 
$propProbs_130nm{"NAND41-P2"}{"1111"} = "1"; 
$propProbs_130nm{"NAND41-P3"}{"1111"} = "1"; 
$propProbs_130nm{"NAND41-P4"}{"1111"} = "1"; 

#-------
#NAND42
#-------
$propProbs_130nm{"NAND42-N1"}{"1100"} = "1"; 
$propProbs_130nm{"NAND42-N1"}{"1101"} = "1"; 
$propProbs_130nm{"NAND42-N1"}{"1110"} = "1"; 

$propProbs_130nm{"NAND42-N2"}{"1100"} = "1"; 
$propProbs_130nm{"NAND42-N2"}{"1101"} = "1"; 
$propProbs_130nm{"NAND42-N2"}{"1110"} = "1"; 

$propProbs_130nm{"NAND42-N3"}{"1101"} = "1"; 
$propProbs_130nm{"NAND42-N3"}{"1110"} = "1"; 

$propProbs_130nm{"NAND42-N4"}{"1110"} = "1"; 

$propProbs_130nm{"NAND42-P1"}{"1111"} = "1"; 
$propProbs_130nm{"NAND42-P2"}{"1111"} = "1"; 
$propProbs_130nm{"NAND42-P3"}{"1111"} = "1"; 
$propProbs_130nm{"NAND42-P4"}{"1111"} = "1"; 

#-------
#NAND43
#-------
$propProbs_130nm{"NAND43-N1"}{"1100"} = "1"; 
$propProbs_130nm{"NAND43-N1"}{"1101"} = "1"; 
$propProbs_130nm{"NAND43-N1"}{"1110"} = "1"; 

$propProbs_130nm{"NAND43-N2"}{"1100"} = "1"; 
$propProbs_130nm{"NAND43-N2"}{"1101"} = "1"; 
$propProbs_130nm{"NAND43-N2"}{"1110"} = "1"; 

$propProbs_130nm{"NAND43-N3"}{"1100"} = "1"; 
$propProbs_130nm{"NAND43-N3"}{"1101"} = "1"; 
$propProbs_130nm{"NAND43-N3"}{"1110"} = "1"; 

$propProbs_130nm{"NAND43-N4"}{"1100"} = "1"; 
$propProbs_130nm{"NAND43-N4"}{"1101"} = "1"; 
$propProbs_130nm{"NAND43-N4"}{"1110"} = "1"; 

$propProbs_130nm{"NAND43-P1"}{"1111"} = "1"; 
$propProbs_130nm{"NAND43-P2"}{"1111"} = "1"; 
$propProbs_130nm{"NAND43-P3"}{"1111"} = "1"; 
$propProbs_130nm{"NAND43-P4"}{"1111"} = "1";

#-------
#NAND44
#-------
$propProbs_130nm{"NAND44-P1"}{"1111"} = "1"; 
$propProbs_130nm{"NAND44-P2"}{"1111"} = "1"; 
$propProbs_130nm{"NAND44-P3"}{"1111"} = "1"; 
$propProbs_130nm{"NAND44-P4"}{"1111"} = "1";

#-------
#NAND45
#-------
$propProbs_130nm{"NAND45-N1"}{"0000"} = "1"; 
$propProbs_130nm{"NAND45-N1"}{"0001"} = "1"; 
$propProbs_130nm{"NAND45-N1"}{"0010"} = "1"; 
$propProbs_130nm{"NAND45-N1"}{"0011"} = "1"; 
$propProbs_130nm{"NAND45-N1"}{"0100"} = "1"; 
$propProbs_130nm{"NAND45-N1"}{"0101"} = "1"; 
$propProbs_130nm{"NAND45-N1"}{"0110"} = "1"; 
$propProbs_130nm{"NAND45-N1"}{"0111"} = "1"; 
$propProbs_130nm{"NAND45-N1"}{"1000"} = "1"; 
$propProbs_130nm{"NAND45-N1"}{"1001"} = "1"; 
$propProbs_130nm{"NAND45-N1"}{"1010"} = "1"; 
$propProbs_130nm{"NAND45-N1"}{"1011"} = "1"; 
$propProbs_130nm{"NAND45-N1"}{"1100"} = "1"; 
$propProbs_130nm{"NAND45-N1"}{"1101"} = "1"; 
$propProbs_130nm{"NAND45-N1"}{"1110"} = "1"; 

$propProbs_130nm{"NAND45-N2"}{"0001"} = "1"; 
$propProbs_130nm{"NAND45-N2"}{"0010"} = "1"; 
$propProbs_130nm{"NAND45-N2"}{"0011"} = "1"; 
$propProbs_130nm{"NAND45-N2"}{"0100"} = "1"; 
$propProbs_130nm{"NAND45-N2"}{"0101"} = "1"; 
$propProbs_130nm{"NAND45-N2"}{"0110"} = "1"; 
$propProbs_130nm{"NAND45-N2"}{"1000"} = "1"; 
$propProbs_130nm{"NAND45-N2"}{"1001"} = "1"; 
$propProbs_130nm{"NAND45-N2"}{"1010"} = "1"; 
$propProbs_130nm{"NAND45-N2"}{"1011"} = "1"; 
$propProbs_130nm{"NAND45-N2"}{"1100"} = "1"; 
$propProbs_130nm{"NAND45-N2"}{"1101"} = "1"; 
$propProbs_130nm{"NAND45-N2"}{"1110"} = "1";

$propProbs_130nm{"NAND45-N3"}{"0101"} = "1"; 
$propProbs_130nm{"NAND45-N3"}{"0110"} = "1"; 
$propProbs_130nm{"NAND45-N3"}{"1000"} = "1"; 
$propProbs_130nm{"NAND45-N3"}{"1001"} = "1"; 
$propProbs_130nm{"NAND45-N3"}{"1010"} = "1"; 
$propProbs_130nm{"NAND45-N3"}{"1100"} = "1"; 
$propProbs_130nm{"NAND45-N3"}{"1101"} = "1"; 
$propProbs_130nm{"NAND45-N3"}{"1110"} = "1";

$propProbs_130nm{"NAND45-N4"}{"1010"} = "1"; 
$propProbs_130nm{"NAND45-N4"}{"1100"} = "1"; 
$propProbs_130nm{"NAND45-N4"}{"1110"} = "1"; 

#-------
#NAND46
#-------
$propProbs_130nm{"NAND46-N1"}{"1000"} = "1"; 
$propProbs_130nm{"NAND46-N1"}{"1001"} = "1"; 
$propProbs_130nm{"NAND46-N1"}{"1010"} = "1"; 
$propProbs_130nm{"NAND46-N1"}{"1011"} = "1"; 
$propProbs_130nm{"NAND46-N1"}{"1100"} = "1"; 
$propProbs_130nm{"NAND46-N1"}{"1101"} = "1"; 
$propProbs_130nm{"NAND46-N1"}{"1110"} = "1"; 

$propProbs_130nm{"NAND46-N2"}{"1000"} = "1"; 
$propProbs_130nm{"NAND46-N2"}{"1001"} = "1"; 
$propProbs_130nm{"NAND46-N2"}{"1010"} = "1"; 
$propProbs_130nm{"NAND46-N2"}{"1011"} = "1"; 
$propProbs_130nm{"NAND46-N2"}{"1100"} = "1"; 
$propProbs_130nm{"NAND46-N2"}{"1101"} = "1"; 
$propProbs_130nm{"NAND46-N2"}{"1110"} = "1"; 

$propProbs_130nm{"NAND46-N3"}{"1000"} = "1"; 
$propProbs_130nm{"NAND46-N3"}{"1001"} = "1"; 
$propProbs_130nm{"NAND46-N3"}{"1010"} = "1"; 
$propProbs_130nm{"NAND46-N3"}{"1100"} = "1"; 
$propProbs_130nm{"NAND46-N3"}{"1101"} = "1"; 
$propProbs_130nm{"NAND46-N3"}{"1110"} = "1"; 

$propProbs_130nm{"NAND46-N4"}{"1010"} = "1"; 
$propProbs_130nm{"NAND46-N4"}{"1100"} = "1"; 
$propProbs_130nm{"NAND46-N4"}{"1110"} = "1"; 

#-------
#NAND47
#-------
$propProbs_130nm{"NAND47-N1"}{"1100"} = "1"; 
$propProbs_130nm{"NAND47-N1"}{"1101"} = "1"; 
$propProbs_130nm{"NAND47-N1"}{"1110"} = "1"; 

$propProbs_130nm{"NAND47-N2"}{"1100"} = "1"; 
$propProbs_130nm{"NAND47-N2"}{"1101"} = "1"; 
$propProbs_130nm{"NAND47-N2"}{"1110"} = "1"; 

$propProbs_130nm{"NAND47-N3"}{"1100"} = "1"; 
$propProbs_130nm{"NAND47-N3"}{"1101"} = "1"; 
$propProbs_130nm{"NAND47-N3"}{"1110"} = "1"; 

$propProbs_130nm{"NAND47-N4"}{"1100"} = "1"; 
$propProbs_130nm{"NAND47-N4"}{"1110"} = "1"; 

#-------
#NAND48
#-------
$propProbs_130nm{"NAND48-N1"}{"1110"} = "1"; 
$propProbs_130nm{"NAND48-N2"}{"1110"} = "1"; 
$propProbs_130nm{"NAND48-N3"}{"1110"} = "1"; 
$propProbs_130nm{"NAND48-N4"}{"1110"} = "1"; 


#-------
#NOR2
#-------
$propProbs_130nm{"NOR2-P1"}{"01"} = "1"; 
$propProbs_130nm{"NOR2-P1"}{"10"} = "1"; 
$propProbs_130nm{"NOR2-P1"}{"11"} = "1"; 

$propProbs_130nm{"NOR2-P2"}{"01"} = "1"; 

$propProbs_130nm{"NOR2-N1"}{"00"} = "1"; 
$propProbs_130nm{"NOR2-N2"}{"00"} = "1"; 

#-------
#NOR21
#-------
$propProbs_130nm{"NOR21-P1"}{"01"} = "1"; 

$propProbs_130nm{"NOR21-P2"}{"01"} = "1"; 

$propProbs_130nm{"NOR21-N1"}{"00"} = "1"; 
$propProbs_130nm{"NOR21-N2"}{"00"} = "1"; 

#-------
#NOR22
#-------
$propProbs_130nm{"NOR22-N1"}{"00"} = "1"; 
$propProbs_130nm{"NOR22-N2"}{"00"} = "1"; 

#-------
#NOR23
#-------
$propProbs_130nm{"NOR23-P1"}{"01"} = "1"; 
$propProbs_130nm{"NOR23-P1"}{"10"} = "1"; 
$propProbs_130nm{"NOR23-P1"}{"11"} = "1"; 

$propProbs_130nm{"NOR23-P2"}{"01"} = "1"; 
$propProbs_130nm{"NOR23-P2"}{"11"} = "1"; 

#-------
#NOR24
#-------
$propProbs_130nm{"NOR24-P1"}{"01"} = "1"; 
$propProbs_130nm{"NOR24-P2"}{"01"} = "1"; 

#-------
#NOR3
#-------
$propProbs_130nm{"NOR3-P1"}{"001"} = "1"; 
$propProbs_130nm{"NOR3-P1"}{"010"} = "1"; 
$propProbs_130nm{"NOR3-P1"}{"011"} = "1"; 
$propProbs_130nm{"NOR3-P1"}{"100"} = "1"; 
$propProbs_130nm{"NOR3-P1"}{"101"} = "1"; 
$propProbs_130nm{"NOR3-P1"}{"110"} = "1"; 
$propProbs_130nm{"NOR3-P1"}{"111"} = "1"; 

$propProbs_130nm{"NOR3-P2"}{"001"} = "1"; 
$propProbs_130nm{"NOR3-P2"}{"010"} = "1"; 

$propProbs_130nm{"NOR3-P3"}{"001"} = "1"; 

$propProbs_130nm{"NOR3-N1"}{"000"} = "1"; 
$propProbs_130nm{"NOR3-N2"}{"000"} = "1"; 
$propProbs_130nm{"NOR3-N3"}{"000"} = "1"; 

#-------
#NOR31
#-------
$propProbs_130nm{"NOR31-P1"}{"001"} = "1"; 
$propProbs_130nm{"NOR31-P1"}{"010"} = "1"; 
$propProbs_130nm{"NOR31-P1"}{"011"} = "1"; 

$propProbs_130nm{"NOR31-P2"}{"001"} = "1"; 
$propProbs_130nm{"NOR31-P2"}{"010"} = "1"; 

$propProbs_130nm{"NOR31-P3"}{"001"} = "1"; 

$propProbs_130nm{"NOR31-N1"}{"000"} = "1"; 
$propProbs_130nm{"NOR31-N2"}{"000"} = "1"; 
$propProbs_130nm{"NOR31-N3"}{"000"} = "1"; 

#-------
#NOR32
#-------
$propProbs_130nm{"NOR32-P1"}{"001"} = "1"; 
$propProbs_130nm{"NOR32-P2"}{"001"} = "1"; 
$propProbs_130nm{"NOR32-P3"}{"001"} = "1"; 

$propProbs_130nm{"NOR32-N1"}{"000"} = "1"; 
$propProbs_130nm{"NOR32-N2"}{"000"} = "1"; 
$propProbs_130nm{"NOR32-N3"}{"000"} = "1"; 

#-------
#NOR33
#-------
$propProbs_130nm{"NOR33-N1"}{"000"} = "1"; 
$propProbs_130nm{"NOR33-N2"}{"000"} = "1"; 
$propProbs_130nm{"NOR33-N3"}{"000"} = "1"; 

#-------
#NOR34
#-------
$propProbs_130nm{"NOR34-P1"}{"001"} = "1"; 
$propProbs_130nm{"NOR34-P1"}{"010"} = "1"; 
$propProbs_130nm{"NOR34-P1"}{"011"} = "1"; 
$propProbs_130nm{"NOR34-P1"}{"100"} = "1"; 
$propProbs_130nm{"NOR34-P1"}{"101"} = "1"; 
$propProbs_130nm{"NOR34-P1"}{"110"} = "1"; 
$propProbs_130nm{"NOR34-P1"}{"111"} = "1"; 

$propProbs_130nm{"NOR34-P2"}{"001"} = "1"; 
$propProbs_130nm{"NOR34-P2"}{"010"} = "1"; 
$propProbs_130nm{"NOR34-P2"}{"011"} = "1"; 
$propProbs_130nm{"NOR34-P2"}{"101"} = "1"; 
$propProbs_130nm{"NOR34-P2"}{"110"} = "1"; 

$propProbs_130nm{"NOR34-P3"}{"001"} = "1"; 
$propProbs_130nm{"NOR34-P3"}{"011"} = "1"; 

#-------
#NOR35
#-------
$propProbs_130nm{"NOR35-P1"}{"001"} = "1"; 
$propProbs_130nm{"NOR35-P1"}{"010"} = "1"; 
$propProbs_130nm{"NOR35-P1"}{"011"} = "1"; 

$propProbs_130nm{"NOR35-P2"}{"001"} = "1"; 
$propProbs_130nm{"NOR35-P2"}{"010"} = "1"; 
$propProbs_130nm{"NOR35-P2"}{"011"} = "1"; 

$propProbs_130nm{"NOR35-P3"}{"001"} = "1"; 
$propProbs_130nm{"NOR35-P3"}{"011"} = "1"; 

#-------
#NOR36
#-------
$propProbs_130nm{"NOR36-P1"}{"001"} = "1"; 
$propProbs_130nm{"NOR36-P2"}{"001"} = "1"; 
$propProbs_130nm{"NOR36-P3"}{"001"} = "1"; 


#-------
#NOR4
#-------
$propProbs_130nm{"NOR4-P1"}{"0001"} = "1"; 
$propProbs_130nm{"NOR4-P1"}{"0010"} = "1"; 
$propProbs_130nm{"NOR4-P1"}{"0011"} = "1"; 
$propProbs_130nm{"NOR4-P1"}{"0100"} = "1"; 
$propProbs_130nm{"NOR4-P1"}{"0101"} = "1"; 
$propProbs_130nm{"NOR4-P1"}{"0110"} = "1"; 
$propProbs_130nm{"NOR4-P1"}{"0111"} = "1"; 
$propProbs_130nm{"NOR4-P1"}{"1000"} = "1"; 
$propProbs_130nm{"NOR4-P1"}{"1001"} = "1"; 
$propProbs_130nm{"NOR4-P1"}{"1010"} = "1"; 
$propProbs_130nm{"NOR4-P1"}{"1011"} = "1"; 
$propProbs_130nm{"NOR4-P1"}{"1100"} = "1"; 
$propProbs_130nm{"NOR4-P1"}{"1101"} = "1"; 
$propProbs_130nm{"NOR4-P1"}{"1110"} = "1"; 
$propProbs_130nm{"NOR4-P1"}{"1111"} = "1"; 

$propProbs_130nm{"NOR4-P2"}{"0001"} = "1"; 
$propProbs_130nm{"NOR4-P2"}{"0010"} = "1"; 
$propProbs_130nm{"NOR4-P2"}{"0100"} = "1"; 

$propProbs_130nm{"NOR4-P3"}{"0001"} = "1"; 
$propProbs_130nm{"NOR4-P3"}{"0010"} = "1"; 

$propProbs_130nm{"NOR4-N1"}{"0000"} = "1"; 
$propProbs_130nm{"NOR4-N2"}{"0000"} = "1"; 
$propProbs_130nm{"NOR4-N3"}{"0000"} = "1"; 
$propProbs_130nm{"NOR4-N4"}{"0000"} = "1"; 

#-------
#NOR41
#-------
$propProbs_130nm{"NOR41-P1"}{"0001"} = "1"; 
$propProbs_130nm{"NOR41-P1"}{"0010"} = "1"; 
$propProbs_130nm{"NOR41-P1"}{"0011"} = "1"; 
$propProbs_130nm{"NOR41-P1"}{"0100"} = "1"; 
$propProbs_130nm{"NOR41-P1"}{"0101"} = "1"; 
$propProbs_130nm{"NOR41-P1"}{"0110"} = "1"; 
$propProbs_130nm{"NOR41-P1"}{"0111"} = "1"; 

$propProbs_130nm{"NOR41-P2"}{"0001"} = "1"; 
$propProbs_130nm{"NOR41-P2"}{"0010"} = "1"; 
$propProbs_130nm{"NOR41-P2"}{"0100"} = "1"; 

$propProbs_130nm{"NOR41-P3"}{"0001"} = "1"; 
$propProbs_130nm{"NOR41-P3"}{"0010"} = "1"; 

$propProbs_130nm{"NOR41-N1"}{"0000"} = "1"; 
$propProbs_130nm{"NOR41-N2"}{"0000"} = "1"; 
$propProbs_130nm{"NOR41-N3"}{"0000"} = "1"; 
$propProbs_130nm{"NOR41-N4"}{"0000"} = "1"; 

#-------
#NOR42
#-------
$propProbs_130nm{"NOR42-P1"}{"0001"} = "1"; 
$propProbs_130nm{"NOR42-P1"}{"0010"} = "1"; 
$propProbs_130nm{"NOR42-P1"}{"0011"} = "1"; 

$propProbs_130nm{"NOR42-P2"}{"0001"} = "1"; 
$propProbs_130nm{"NOR42-P2"}{"0010"} = "1"; 

$propProbs_130nm{"NOR42-P3"}{"0001"} = "1"; 
$propProbs_130nm{"NOR42-P3"}{"0010"} = "1"; 

$propProbs_130nm{"NOR42-N1"}{"0000"} = "1"; 
$propProbs_130nm{"NOR42-N2"}{"0000"} = "1"; 
$propProbs_130nm{"NOR42-N3"}{"0000"} = "1"; 
$propProbs_130nm{"NOR42-N4"}{"0000"} = "1";

#-------
#NOR43
#-------
$propProbs_130nm{"NOR43-P1"}{"0000"} = "1"; 
$propProbs_130nm{"NOR43-P1"}{"0001"} = "1"; 
$propProbs_130nm{"NOR43-P1"}{"0010"} = "1"; 
$propProbs_130nm{"NOR43-P1"}{"0011"} = "1"; 

$propProbs_130nm{"NOR43-P2"}{"0000"} = "1"; 
$propProbs_130nm{"NOR43-P2"}{"0001"} = "1"; 
$propProbs_130nm{"NOR43-P2"}{"0010"} = "1"; 
$propProbs_130nm{"NOR43-P2"}{"0011"} = "1"; 

$propProbs_130nm{"NOR43-P3"}{"0000"} = "1"; 
$propProbs_130nm{"NOR43-P3"}{"0001"} = "1"; 
$propProbs_130nm{"NOR43-P3"}{"0010"} = "1"; 
$propProbs_130nm{"NOR43-P3"}{"0011"} = "1"; 

$propProbs_130nm{"NOR43-P4"}{"0000"} = "1"; 
$propProbs_130nm{"NOR43-P4"}{"0001"} = "1"; 
$propProbs_130nm{"NOR43-P4"}{"0010"} = "1"; 
$propProbs_130nm{"NOR43-P4"}{"0011"} = "1"; 

$propProbs_130nm{"NOR43-N1"}{"0000"} = "1"; 
$propProbs_130nm{"NOR43-N2"}{"0000"} = "1"; 
$propProbs_130nm{"NOR43-N3"}{"0000"} = "1"; 
$propProbs_130nm{"NOR43-N4"}{"0000"} = "1";

#-------
#NOR44
#-------
$propProbs_130nm{"NOR44-N1"}{"0000"} = "1"; 
$propProbs_130nm{"NOR44-N2"}{"0000"} = "1"; 
$propProbs_130nm{"NOR44-N3"}{"0000"} = "1"; 
$propProbs_130nm{"NOR44-N4"}{"0000"} = "1";

#-------
#NOR45
#-------
$propProbs_130nm{"NOR45-P1"}{"0001"} = "1"; 
$propProbs_130nm{"NOR45-P1"}{"0010"} = "1"; 
$propProbs_130nm{"NOR45-P1"}{"0011"} = "1"; 
$propProbs_130nm{"NOR45-P1"}{"0100"} = "1"; 
$propProbs_130nm{"NOR45-P1"}{"0101"} = "1"; 
$propProbs_130nm{"NOR45-P1"}{"0110"} = "1"; 
$propProbs_130nm{"NOR45-P1"}{"0111"} = "1"; 
$propProbs_130nm{"NOR45-P1"}{"1000"} = "1"; 
$propProbs_130nm{"NOR45-P1"}{"1001"} = "1"; 
$propProbs_130nm{"NOR45-P1"}{"1010"} = "1"; 
$propProbs_130nm{"NOR45-P1"}{"1011"} = "1"; 
$propProbs_130nm{"NOR45-P1"}{"1100"} = "1"; 
$propProbs_130nm{"NOR45-P1"}{"1101"} = "1"; 
$propProbs_130nm{"NOR45-P1"}{"1110"} = "1"; 

$propProbs_130nm{"NOR45-P2"}{"0001"} = "1"; 
$propProbs_130nm{"NOR45-P2"}{"0010"} = "1"; 
$propProbs_130nm{"NOR45-P2"}{"0011"} = "1"; 
$propProbs_130nm{"NOR45-P2"}{"0100"} = "1"; 
$propProbs_130nm{"NOR45-P2"}{"0101"} = "1"; 
$propProbs_130nm{"NOR45-P2"}{"0110"} = "1"; 
$propProbs_130nm{"NOR45-P2"}{"0111"} = "1"; 
$propProbs_130nm{"NOR45-P2"}{"1001"} = "1"; 
$propProbs_130nm{"NOR45-P2"}{"1010"} = "1"; 
$propProbs_130nm{"NOR45-P2"}{"1100"} = "1"; 

$propProbs_130nm{"NOR45-P3"}{"0001"} = "1"; 
$propProbs_130nm{"NOR45-P3"}{"0010"} = "1"; 
$propProbs_130nm{"NOR45-P3"}{"0011"} = "1"; 
$propProbs_130nm{"NOR45-P3"}{"0101"} = "1"; 
$propProbs_130nm{"NOR45-P3"}{"0110"} = "1"; 
$propProbs_130nm{"NOR45-P3"}{"1001"} = "1"; 

$propProbs_130nm{"NOR45-P4"}{"0001"} = "1"; 


#-------
#NOR46
#-------
$propProbs_130nm{"NOR46-P1"}{"0001"} = "1"; 
$propProbs_130nm{"NOR46-P1"}{"0010"} = "1"; 
$propProbs_130nm{"NOR46-P1"}{"0011"} = "1"; 
$propProbs_130nm{"NOR46-P1"}{"0100"} = "1"; 
$propProbs_130nm{"NOR46-P1"}{"0101"} = "1"; 
$propProbs_130nm{"NOR46-P1"}{"0110"} = "1"; 
$propProbs_130nm{"NOR46-P1"}{"0111"} = "1"; 

$propProbs_130nm{"NOR46-P2"}{"0001"} = "1"; 
$propProbs_130nm{"NOR46-P2"}{"0010"} = "1"; 
$propProbs_130nm{"NOR46-P2"}{"0011"} = "1"; 
$propProbs_130nm{"NOR46-P2"}{"0100"} = "1"; 
$propProbs_130nm{"NOR46-P2"}{"0101"} = "1"; 
$propProbs_130nm{"NOR46-P2"}{"0110"} = "1"; 
$propProbs_130nm{"NOR46-P2"}{"0111"} = "1"; 

$propProbs_130nm{"NOR46-P3"}{"0001"} = "1"; 
$propProbs_130nm{"NOR46-P3"}{"0010"} = "1"; 
$propProbs_130nm{"NOR46-P3"}{"0011"} = "1"; 
$propProbs_130nm{"NOR46-P3"}{"0101"} = "1"; 
$propProbs_130nm{"NOR46-P3"}{"0110"} = "1"; 

$propProbs_130nm{"NOR46-P4"}{"0001"} = "1"; 

#-------
#NOR47
#-------
$propProbs_130nm{"NOR47-P1"}{"0001"} = "1"; 
$propProbs_130nm{"NOR47-P1"}{"0010"} = "1"; 
$propProbs_130nm{"NOR47-P1"}{"0011"} = "1"; 

$propProbs_130nm{"NOR47-P2"}{"0001"} = "1"; 
$propProbs_130nm{"NOR47-P2"}{"0010"} = "1"; 
$propProbs_130nm{"NOR47-P2"}{"0011"} = "1"; 

$propProbs_130nm{"NOR47-P3"}{"0001"} = "1"; 
$propProbs_130nm{"NOR47-P3"}{"0010"} = "1"; 
$propProbs_130nm{"NOR47-P3"}{"0011"} = "1"; 

$propProbs_130nm{"NOR47-P4"}{"0001"} = "1"; 

#-------
#NOR48
#-------
$propProbs_130nm{"NOR48-P1"}{"0001"} = "1"; 
$propProbs_130nm{"NOR48-P2"}{"0001"} = "1"; 
$propProbs_130nm{"NOR48-P3"}{"0001"} = "1"; 
$propProbs_130nm{"NOR48-P4"}{"0001"} = "1"; 
#############################################################################

nstore \%propProbs_130nm, '130nm.pf';
# print Dumper \%propProbs_130nm;