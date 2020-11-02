wipe;
set number 762;
source prec3-model.tcl;
#######################################################################		                            
#动力时程分析
loadConst -time 0.0;
set nPts 7998;
set dt  [expr 0.005*$s];
set G2  [expr 0.5533*$g];
set Gaccel "Series -dt $dt -filePath er/1Chinese_code/RSN762_LOMAP_FRE000.txt -factor $G2";                
pattern UniformExcitation 10100 1 -accel $Gaccel;

constraints Transformation;          
numberer Plain;   	    
system UmfPack;	                
test EnergyIncr 1.0e-4 200;
algorithm Newton;
integrator Newmark 0.5 0.25;
analysis Transient;

variable TolDynamic 1.e-4;                        
variable maxNumIterDynamic 200;         
variable testTypeDynamic EnergyIncr ;
variable algorithmTypeDynamic Newton ;

set tFinal [expr $nPts*$dt];
set tCurrent [getTime];
set ok 0;
set ok [analyze $nPts $dt];
if {$ok != 0} {     					# analysis was not successful.
	# --------------------------------------------------------------------------------------------------
	# change some analysis parameters to achieve convergence
	# performance is slower inside this loop
	#    Time-controlled analysis
	set ok 0;
	set tCurrent [getTime];
	while {$tCurrent < $tFinal && $ok == 0} {
		set tCurrent [getTime]
		set ok [analyze 1 $dt]
		if {$ok != 0} {
			puts "Trying Newton with Initial Tangent .."
			test NormDispIncr   1.0e-3 1000  0
			algorithm Newton -initial
			set ok [analyze 1 $dt]
			test $testTypeDynamic $TolDynamic $maxNumIterDynamic  0
			algorithm $algorithmTypeDynamic
		}
		if {$ok != 0} {
			puts "Trying Broyden .."
			algorithm Broyden 8
			set ok [analyze 1 $dt]
			algorithm $algorithmTypeDynamic
		}
		if {$ok != 0} {
			puts "Trying NewtonWithLineSearch .."
			algorithm NewtonLineSearch .8
			set ok [analyze 1 $dt]
			algorithm $algorithmTypeDynamic
		}
	}
};      # end if ok !0


puts "Ground Motion Done. End Time: [getTime]"


# Print a message to indicate if analysis succesfull or not
if {$ok == 0} {
   puts "Transient analysis completed SUCCESSFULLY";
} else {
   puts "Transient analysis completed FAILED";    
}
puts "||Transient analysis completed||"
##################################################################################
