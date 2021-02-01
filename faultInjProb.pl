#########################################################################################
# Description: 	This file generates fault injection probability of each gate 			#
#			   	in circuit.																#
#																						#
#				This program generates following file;									#
#					1):- .inj Fault injection probability of each gate					#
#																						#
#				Requires following file;												#
#					1):- .ipp Input pattern probability file of a circuit				#
#					2):- 45nm.pf and 45nm.scaling	or 				 					#
#																						#		
# USAGE: perl gatePOFs benchFile [without .bench extension]								#
# 																						#
# Author: Ahmad Tariq Sheikh.															#
#																						#
# Date: November 04, 2014																#
#																						#
#########################################################################################

#!/usr/bin/perl -w

use warnings;
use Cwd;
use Time::HiRes;
use File::Basename;
use Data::Dumper qw(Dumper);
use Storable qw(retrieve nstore);
#---------------------

sub intersect(\@\@) {
	my %e = map { $_ => undef } @{$_[0]};
	return grep { exists( $e{$_} ) } @{$_[1]};
}


sub computeFaultInjectionProbabilities {

	print "\n\n\t---Computing fault injection probabilities for $inputFile...\n";
	
	$inputBenchFile = $inputFile.".bench";
	
	print "\tReading $inputBenchFile file ... \n";
	my $start_time = [Time::HiRes::gettimeofday()];
	
	open (INPUT_BENCH, $inputBenchFile) or die $!;
	
	$inputs = 0;
	$cg = "g";
	
	while(<INPUT_BENCH>) {		
		if ($_ =~ m/=/) {			
			
			my @gateList = ($_ =~ m/(\w+)/g);				
			$gateName[0] = $gateList[1];			
			@gateList = ($gateList[0], @gateList[2..$#gateList]);		
						
			$currentGate = $gateList[0];
			$currentGateType = $gateName[0];
						
			if ($currentGateType =~ /\bOR\b/) {
				# print "CG = $currentGate \n";
				$sa0_inj_prob{$currentGate} = 1; #$inputPatternProbs{$currentGate}{'11'};
				$sa1_inj_prob{$currentGate} = 1; #$inputPatternProbs{$currentGate}{'00'};
				next;
			}
			elsif ($currentGateType =~ /\bDOR\b/) {
				# print "CG = $currentGate \n";
				$sa0_inj_prob{$currentGate} = 1; #$inputPatternProbs{$currentGate}{'11'};
				$sa1_inj_prob{$currentGate} = 1; #$inputPatternProbs{$currentGate}{'00'};
				next;
			}
				
			# print "GL = @gateList, $currentGate, $currentGateType\n";				
			
			# if ($currentGateType =~ /NOT11|NOT12|NAND21|NAND22|NAND23|NAND24|NAND31|NAND32|NAND33|NAND34|NAND35|NAND36|NAND41|NAND42|NAND43|NAND44|NAND45|NAND46|NAND47|NAND48|NOR21|NOR22|NOR23|NOR24|NOR31|NOR32|NOR33|NOR34|NOR35|NOR36|NOR41|NOR42|NOR43|NOR44|NOR45|NOR46|NOR47|NOR48/i) {
				# $inputs = scalar @gateList - 2;
			# }
			# else {
				$inputs = scalar @gateList - 1;
			# }

			my @inputs2CurrentGate = ();
			
			# Read the failed vectors for current gate in the current circuit
			for $vector ( keys %{ $inputPatternProbs{$currentGate} } ) {
				push @inputs2CurrentGate, $vector;	
			}						
			
			# Read original failed vector for current gate from tech. file
			foreach $i (1..$inputs) {			
				
				if ($currentGateType eq "NAND" or $currentGateType eq "NOR" or $currentGateType eq "NOT") {
					$nmos = $currentGateType.$inputs."-N".$i;
					$pmos = $currentGateType.$inputs."-P".$i;													
				}
				else {						
					$nmos = $currentGateType."-N".$i;
					$pmos = $currentGateType."-P".$i;													
				}
				
				if ($currentGate eq $cg) {
					print "Inputs = $inputs\n";
					print "Nmos = $nmos\n";
					print "Pmos = $pmos\n";
					print "GL = @gateList, $currentGate, $currentGateType\n\n";
				}
				
				my @originalFailedVectors_N = ();				
				my @originalFailedVectors_P = ();
				
				#####################################
				#Process NMOS
				#####################################					
				#check if the current input gateName and nmos pattern exists
				if (exists $propProbs_130nm{$nmos}) {
					
					# Read the generic failed vectors of N-Type from tech lib
					for $vector ( keys %{ $propProbs_130nm{$nmos} } ) {
						push @originalFailedVectors_N, $vector;				
					}		
								
					my @isect = intersect(@originalFailedVectors_N, @inputs2CurrentGate);
					
					if (scalar @isect==0) {
						$sa0_inj_prob{$currentGate} += 0;
					}
					else {
						foreach $value (@isect) {
							$sa0_inj_prob{$currentGate} += $inputPatternProbs{$currentGate}{$value}; 
						}
					}
											
					if ($currentGate eq $cg) {
						print "Nmos = $nmos\n";
						print "OFV_N = @originalFailedVectors_N\n";
						print "Inputs to $currentGate  = @inputs2CurrentGate\n";
						print "Common_N = @isect\nFreq = $sa0_inj_prob{$currentGate}\n\n"; 						
					}
				}
				else {					
					$sa0_inj_prob{$currentGate} += 0;
				}
				##########################################
				#Process PMOS
				##########################################					
				#check if the current input gateName and nmos pattern exists
				if (exists($propProbs_130nm{$pmos})) {						
					
					# Read the generic failed vectors of P-Type from tech lib
					for $vector ( keys %{ $propProbs_130nm{$pmos} } ) {
						push @originalFailedVectors_P, $vector;				
					}
					
					my @isect = intersect(@originalFailedVectors_P, @inputs2CurrentGate);
					
					if (scalar @isect==0) {
						$sa1_inj_prob{$currentGate} += 0;
					}
					else {
						foreach $value (@isect) {
							$sa1_inj_prob{$currentGate} += $inputPatternProbs{$currentGate}{$value}; 
						}
					}				
											
					if ($currentGate eq $cg) {
						print "Pmos = $pmos\n";
						print "OFV_P = @originalFailedVectors_P\n";
						print "Inputs to $currentGate  = @inputs2CurrentGate\n";
						print "Common_P = @isect\nFreq = $sa1_inj_prob{$currentGate}\n\n"; 						
					}
				}
				else {					
					$sa1_inj_prob{$currentGate} += 0;
				}
			}
			
			############################################################
						
			#$baseGateName is a gate name without protection e.g. NAND32 = NAND, NOR45 = NOR etc 
			@bn  = ($currentGateType =~ m/(\D+)/g);
			$baseGateName = $bn[0];
			
			$nmos = $baseGateName.$inputs."-N1";
			$pmos = $baseGateName.$inputs."-P1";	
			
			$sum_N = 0;
			$sum_P = 0;											
			
			# Sum the probability of fault that generate sa0 faults
			if (exists($propProbs_130nm{$nmos})) {
				for $vector ( keys %{ $propProbs_130nm{$nmos} } ) {
					if (exists($inputPatternProbs{$currentGate}{$vector})) {
						$sum_N += $inputPatternProbs{$currentGate}{$vector};										
					}
				}
			}
			
			# Sum the probability of fault that generate sa1 faults
			if (exists($propProbs_130nm{$pmos})) {
				for $vector ( keys %{ $propProbs_130nm{$pmos} } ) {
					if (exists($inputPatternProbs{$currentGate}{$vector})) {
						$sum_P += $inputPatternProbs{$currentGate}{$vector};
					}
				}
			}
			
			if ($sum_N == 0) { $sum_N = 1; }
			if ($sum_P == 0) { $sum_P = 1; }
			
			$sa0_inj_prob{$currentGate} /= $sum_N;
			$sa1_inj_prob{$currentGate} /= $sum_P;
			
			if ($currentGate eq $cg) {
				print "\n==>BN = $baseGateName, $currentGateType,  $nmos, $pmos, $inputs, $currentGate\n"; 
				print "SUM_N = $sum_N\n";
				print "SUM_P = $sum_P\n";
				print "SA0-INJ-$currentGate = $sa0_inj_prob{$currentGate}\n";
				print "SA1-INJ-$currentGate = $sa1_inj_prob{$currentGate}\n"; 	
			}		
			
			########################################################################
			#Scale the fault injection probabilities
			if ($currentGateType =~ m/\bDNOT\b|\bDNAND\b|\bDNOR\b/) {
				$sa0_inj_prob{$currentGate} = 0;
				$sa1_inj_prob{$currentGate} = 0;				
			}
			elsif ($currentGateType eq "NOT") {
				$sa0_inj_prob{$currentGate} = 1;
				$sa1_inj_prob{$currentGate} = 1;				
			}
			elsif ($currentGateType eq "NOT11") {
				$sa0_inj_prob{$currentGate} = 0;
				$sa1_inj_prob{$currentGate} = 1;				
			}
			elsif ($currentGateType eq "NOT12") {
				$sa0_inj_prob{$currentGate} = 1;
				$sa1_inj_prob{$currentGate} = 0;				
			}			
			elsif ($currentGateType =~ m/\bNAND\b/) {
				$CGT = $currentGateType.$inputs;
				$sa0_inj_prob{$currentGate} *= $scaling_130nm{$CGT};
				$sa1_inj_prob{$currentGate} = 1;				
			}
			elsif ($currentGateType =~ m/\bNOR\b/) {
				$CGT = $currentGateType.$inputs;
				$sa0_inj_prob{$currentGate} = 1;
				$sa1_inj_prob{$currentGate} *= $scaling_130nm{$CGT};									
			}			
			elsif ($currentGateType =~ m/\bNAND21\b|\bNAND22\b|\bNAND31\b|\bNAND32\b|\bNAND33\b|\bNAND41\b|\bNAND42\b|\bNAND43\b|\bNAND44\b/) {				
				$sa0_inj_prob{$currentGate} *= $scaling_130nm{$currentGateType};
				$sa1_inj_prob{$currentGate} = 1;								
			}			
			elsif ($currentGateType =~ m/\bNOR21\b|\bNOR22\b|\bNOR31\b|\bNOR32\b|\bNOR33\b|\bNOR41\b|\bNOR42\b|\bNOR43\b|\bNOR44\b/) {				
				$sa0_inj_prob{$currentGate} = 1;
				$sa1_inj_prob{$currentGate} *= $scaling_130nm{$currentGateType};					
			}			
			elsif ($currentGateType =~ m/\bNAND23\b|\bNAND24\b|\bNAND34\b|\bNAND35\b|\bNAND36\b|\bNAND45\b|\bNAND46\b|\bNAND47\b|\bNAND48\b/) {
				$sa0_inj_prob{$currentGate} *= $scaling_130nm{$currentGateType};
				$sa1_inj_prob{$currentGate} = 0;								
			}
			elsif ($currentGateType =~ m/\bNOR23\b|\bNOR24\b|\bNOR34\b|\bNOR35\b|\bNOR36\b|\bNOR45\b|\bNOR46\b|\bNOR47\b|\bNOR48\b/) {
				$sa0_inj_prob{$currentGate} = 0;
				$sa1_inj_prob{$currentGate} *= $scaling_130nm{$currentGateType};				
			}
			########################################################################			
			
			if ($currentGate eq $cg) {
				print "\nFINAL: SA0-INJ-$currentGate = $sa0_inj_prob{$currentGate}\n";
				print "FINAL: SA1-INJ-$currentGate = $sa1_inj_prob{$currentGate}\n\n"; 	
			}	
		}
	} #END of file iteration loop.	
	
	my $run_time = Time::HiRes::tv_interval($start_time);
	print "\tTime taken computing fault injection = $run_time sec.\n\n";	
}
#######################################################

#-----------------------------------------------
#		Main Program
#-----------------------------------------------

$cwd = getcwd; #get Current Working Directory
$inputFile = $ARGV[0]; #input bench file

@in = split("_", $inputFile);
$in[0] =~ s/R//;

$baseInputFile = $in[0];

#Read general probability of failures file for tech
# %propProbs_45nm = %{retrieve('45nm.pf')};
%propProbs_130nm = %{retrieve('130nm.pf')};

#Read the scaling required for tech file
# %scaling_45nm = %{retrieve('45nm.scaling')};
%scaling_130nm = %{retrieve('130nm.scaling')};

#Read general input pattern probability (.ipp) file 
#of current circuit.
%inputPatternProbs = %{retrieve($baseInputFile.'.ipp')}; 

%sa0_inj_prob = ();
%sa1_inj_prob = ();

computeFaultInjectionProbabilities();
# print Dumper \%propProbs_45nm;
# print Dumper \%inputPatternProbs;
# print Dumper \%sa0_inj_prob;
# print Dumper \%sa1_inj_prob;
nstore \%sa0_inj_prob, $inputFile.'_sa0.inj';
nstore \%sa1_inj_prob, $inputFile.'_sa1.inj';
####################################################################################################
