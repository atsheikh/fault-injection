#########################################################################################
# Description: 	This file takes a bench file and generates another bench file 			#
#				with all intermediate gate outputs declared as primary outputs. 		#
#				This file is used further by HOPE to observe the intermediate			#
#				net values of the circuit.												#
#																						#
#																						#
# USAGE: perl interGatesAsOutputs benchFile [without .bench extension]					#
# 																						#
# Author: Ahmad Tariq Sheikh.															#
#																						#
# Date: October 28, 2014																#
#																						#
#########################################################################################

#!/usr/bin/perl -w

use warnings;
use Cwd;
use Time::HiRes;
use File::Basename;
#---------------------

sub readBenchFile {
	print "\tReading $benchFile file ... \n";
	my $start_time = [Time::HiRes::gettimeofday()];
	
	open (INPUT_FILE, $benchFile) or die $!;
	
	my %tempCompleteGates = ();	
	
	while(<INPUT_FILE>) {
		if ($_ =~ m/INPUT(.*)/) {		
			if ($1 =~ m/(\w+)/) {
				push (@inputGates, $1);	
			}
		}
		elsif ($_ =~ m/OUTPUT(.*)/) {
			if ($1 =~ m/(\w+)/) {
				push (@outputGates, $1);	
			}
		}
		elsif ($_ =~ /#/ or $_ =~ /^\s/) {
			next;
		}		
		elsif ($_ =~ m/=/) {			
			
			my @temp = ($_ =~ m/(\w+)/g);							
			push @inter_IO_Gates, $temp[0];				
		}		
	}	
	close(INPUT_FILE);	
	my $run_time = Time::HiRes::tv_interval($start_time);
	print "\tTime taken Reading Bench file = $run_time sec.\n\n";	
	
	@inter_IO_Gates = reverse(@inter_IO_Gates);		
}
#######################################################

sub createBenchFileWithAllNetsAsOutputs {
	print "\tReading $benchFile file ... \n";
	my $start_time = [Time::HiRes::gettimeofday()];
	
	@inter_IO_Gates = reverse(@inter_IO_Gates);	
	
	open (OUT_FILE, ">$newFile") or die $!;
	
	open (INPUT_FILE, $benchFile) or die $!;
	
	print OUT_FILE "\n";
	
	foreach $k (0..scalar @inputGates - 1) {
		print OUT_FILE "INPUT($inputGates[$k])\n";
	}
	print OUT_FILE "\n";
	foreach $k (0..scalar @outputGates - 1) {
		print OUT_FILE "OUTPUT($outputGates[$k])\n";
	}
	print OUT_FILE "\n";
	foreach $k (0..scalar @inter_IO_Gates - 1) {		
		if (grep {$_ eq $inter_IO_Gates[$k]} @outputGates) {
			next;
		}
		else { #only print the internal gate outputs			
			print OUT_FILE "OUTPUT($inter_IO_Gates[$k])\n";			
		}
	}
	print OUT_FILE "\n";
	
	while(<INPUT_FILE>) {		
		if ($_ =~ m/=/) {
			print OUT_FILE $_;
		}			
	}	
	print OUT_FILE "\nEND";
	
	close(INPUT_FILE);		
	close(OUT_FILE);	
	
	system("dos2unix $newFile"); 
	
	my $run_time = Time::HiRes::tv_interval($start_time);
	
	print "\tTime taken Reading Bench file = $run_time sec.\n\n";		
}
#######################################################


#-----------------------------------------------
#		Main Program
#-----------------------------------------------

$cwd = getcwd; #get Current Working Directory
$inputFile = $ARGV[0]; #input bench file

$newFile = $inputFile."-FO.bench";
$benchFile = $inputFile.".bench";

#-----------------------------------------------
#		Variables Initialization
#-----------------------------------------------
@outputGates = ();
@inputGates = ();
@inter_IO_Gates = ();

readBenchFile();
createBenchFileWithAllNetsAsOutputs();
