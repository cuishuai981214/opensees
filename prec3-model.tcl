wipe;
model basic -ndm 2 -ndf 3;
set mm 1;
set s 1;
set kg 1;
set m   [expr 1000*$mm];
set N   [expr $kg*$m/pow($s,2)];
set kN  [expr 1000*$N];        
set MPa [expr 1.0*$N/pow($mm,2)];
set mm2 [expr $mm*$mm];
set mm4 [expr $mm*$mm*$mm*$mm];
set cm  [expr 10*$mm];
set PI  [expr 2*asin(1.0)];
set g   [expr 9.8*$m/pow($s,2)];
set width [expr 18000*$mm];
set botheight [expr 6000*$mm];
set othheight [expr 4800*$mm];
set a1 [expr 2250*$mm];
set a2 [expr 6000*$mm];
set a3 [expr 9000*$mm];

#支座
node 3001 0                   0;
node 3007 $width              0;
node 3013 [expr 2*$width]     0;

#一层
node 3101 0                   [expr $botheight];
node 3102 $a1                 [expr $botheight];
node 3103 $a2                 [expr $botheight];
node 3104 $a3                 [expr $botheight];
node 3105 [expr $width-$a2]   [expr $botheight];
node 3106 [expr $width-$a1]   [expr $botheight];
node 3107 [expr $width]       [expr $botheight];
node 3108 [expr $width+$a1]   [expr $botheight];
node 3109 [expr $width+$a2]   [expr $botheight];
node 3110 [expr $width+$a3]   [expr $botheight];
node 3111 [expr 2*$width-$a2] [expr $botheight];
node 3112 [expr 2*$width-$a1] [expr $botheight];
node 3113 [expr 2*$width]     [expr $botheight];

#二层
node 3201 0                   [expr $botheight+$othheight];
node 3202 $a1                 [expr $botheight+$othheight];
node 3203 $a2                 [expr $botheight+$othheight];
node 3204 $a3                 [expr $botheight+$othheight];
node 3205 [expr $width-$a2]   [expr $botheight+$othheight];
node 3206 [expr $width-$a1]   [expr $botheight+$othheight];
node 3207 [expr $width]       [expr $botheight+$othheight];
node 3208 [expr $width+$a1]   [expr $botheight+$othheight];
node 3209 [expr $width+$a2]   [expr $botheight+$othheight];
node 3210 [expr $width+$a3]   [expr $botheight+$othheight];
node 3211 [expr 2*$width-$a2] [expr $botheight+$othheight];
node 3212 [expr 2*$width-$a1] [expr $botheight+$othheight];
node 3213 [expr 2*$width]     [expr $botheight+$othheight];

#三层
node 3301 0                   [expr $botheight+2*$othheight];
node 3302 $a1                 [expr $botheight+2*$othheight];
node 3303 $a2                 [expr $botheight+2*$othheight];
node 3304 $a3                 [expr $botheight+2*$othheight];
node 3305 [expr $width-$a2]   [expr $botheight+2*$othheight];
node 3306 [expr $width-$a1]   [expr $botheight+2*$othheight];
node 3307 [expr $width]       [expr $botheight+2*$othheight];
node 3308 [expr $width+$a1]   [expr $botheight+2*$othheight];
node 3309 [expr $width+$a2]   [expr $botheight+2*$othheight];
node 3310 [expr $width+$a3]   [expr $botheight+2*$othheight];
node 3311 [expr 2*$width-$a2] [expr $botheight+2*$othheight];
node 3312 [expr 2*$width-$a1] [expr $botheight+2*$othheight];
node 3313 [expr 2*$width]     [expr $botheight+2*$othheight];

#固定约束
fix 3001 1 1 1;
fix 3007 1 1 1;
fix 3013 1 1 1;

#定义材料
set ID_corecon  1;
set ID_covercon 2;
set fpc2 [expr -39.30*$MPa];   #29.6/(1-1.645*0.15)
set epsc02 -0.0026;
set fpcu2 [expr -0*$MPa];
set epsU2 -0.004;
set lambda2 0.1;
set ft2 [expr 3.90*$MPa];
set Ets2 [expr 3023*$MPa];
uniaxialMaterial Concrete02 $ID_covercon $fpc2 $epsc02 $fpcu2 $epsU2 $lambda2 $ft2 $Ets2;
set fpc1 [expr -41.66*$MPa];
set epsc01 -0.0028;
set fpcu1 [expr -8.33*$MPa];
set epsU1 -0.01;
set lambda1 0.1;
set ft1 [expr 3.90*$MPa];
set Ets1 [expr 3023*$MPa];
uniaxialMaterial Concrete02 $ID_corecon $fpc1 $epsc01 $fpcu1 $epsU1 $lambda1 $ft1 $Ets1;
set ID_bar1 3;
set DN_bar1 [expr 25*$mm];
set AN_bar1 [expr $PI*pow($DN_bar1,2)/4.0];    
set Fy_bar1 [expr 463.6*$MPa];                 
set Es_bar1 [expr 200000*$MPa];
set b 0.01;
set R0 18;
set cR1 0.925;
set cR2 0.15;
set ID_bar2 4;
set DN_bar2 [expr 28*$mm];
set AN_bar2 [expr $PI*pow($DN_bar2,2)/4.0];    
set Fy_bar2 [expr 463.6*$MPa];                 
set Es_bar2 [expr 200000*$MPa];
set ID_bar12 12;
set DN_bar12 [expr 12*$mm];
set AN_bar12 [expr $PI*pow($DN_bar12,2)/4.0];    
set Fy_bar12 [expr 463.6*$MPa];                 
set Es_bar12 [expr 200000*$MPa];
uniaxialMaterial Steel02 $ID_bar1 $Fy_bar1 $Es_bar1 $b $R0 $cR1 $cR2;
uniaxialMaterial Steel02 $ID_bar2 $Fy_bar2 $Es_bar2 $b $R0 $cR1 $cR2;
uniaxialMaterial Steel02 $ID_bar12 $Fy_bar12 $Es_bar12 $b $R0 $cR1 $cR2;
set ID_prebar 5;
set s1p [expr 1684*$MPa];
set e1p 0.0085;
set s2p [expr 1760*$MPa];
set e2p 0.014;
set s3p [expr 1982*$MPa];
set e3p 0.05;
set s1n [expr -1180*$MPa];
set e1n -0.006;
set s2n [expr -1200*$MPa];
set e2n -0.01;
set s3n [expr -1200*$MPa];
set e3n -0.05;
set PInchX 0.055;
set PInchY 0.75;
set damage1 0.017;
set damage2 0.017;
uniaxialMaterial Hysteretic $ID_prebar $s1p $e1p $s2p $e2p $s3p $e3p $s1n $e1n $s2n $e2n $s3n $e3n $PInchX $PInchY $damage1 $damage2;
uniaxialMaterial InitStrainMaterial    550   $ID_prebar   [expr 0.55*1860*1.0E-6/195000];
uniaxialMaterial InitStrainMaterial    555   550          [expr 0.55*1860/195000];

#柱截面
set cwidth [expr 700*$mm];
set cdepth [expr 700*$mm];
set cover  [expr 40*$mm];
section Fiber 1 {
patch rect $ID_corecon 10 10 [expr -$cwidth/2+$cover] [expr -$cdepth/2+$cover] [expr $cwidth/2-$cover] [expr $cdepth/2-$cover];
patch rect $ID_covercon 10 1 [expr -$cwidth/2] [expr -$cdepth/2] [expr $cwidth/2] [expr -$cdepth/2+$cover];
patch rect $ID_covercon 10 1 [expr -$cwidth/2] [expr $cdepth/2-$cover] [expr $cwidth/2] [expr $cdepth/2];
patch rect $ID_covercon 1 10 [expr -$cwidth/2] [expr -$cdepth/2+$cover] [expr -$cwidth/2+$cover] [expr $cdepth/2-$cover];
patch rect $ID_covercon 1 10 [expr $cwidth/2-$cover] [expr -$cdepth/2+$cover] [expr $cwidth/2] [expr $cdepth/2-$cover/2];
layer straight $ID_bar2 8 $AN_bar2 [expr -$cwidth/2+$cover+$DN_bar2/2] [expr -$cdepth/2+$cover+$DN_bar2/2] [expr -$cwidth/2+$cover+$DN_bar2/2] [expr $cdepth/2-$cover-$DN_bar2/2];
layer straight $ID_bar2 8 $AN_bar2 [expr $cwidth/2-$cover-$DN_bar2/2] [expr -$cdepth/2+$cover+$DN_bar2/2] [expr $cwidth/2-$cover-$DN_bar2/2] [expr $cdepth/2-$cover-$DN_bar2/2];
layer straight $ID_bar2 4 $AN_bar2 [expr -$cwidth/2+$cover+$DN_bar2/2+50] [expr -$cdepth/2+$cover+$DN_bar2/2] [expr $cwidth/2-$cover-$DN_bar2/2-50] [expr -$cdepth/2+$cover+$DN_bar2/2];
layer straight $ID_bar2 4 $AN_bar2 [expr -$cwidth/2+$cover+$DN_bar2/2+50] [expr $cdepth/2-$cover-$DN_bar2/2] [expr $cwidth/2-$cover-$DN_bar2/2-50] [expr $cdepth/2-$cover-$DN_bar2/2];
};

#梁截面
set bwidth    [expr 500*$mm];
set bdepth    [expr 1200*$mm];
set bf        [expr 1940*$mm];
set hf        [expr 120*$mm];
section Fiber 2 {
patch rect $ID_corecon  2 12        [expr $bdepth/2]         [expr  $bwidth/2]       [expr $bdepth/2-$hf]     [expr  $bf/2];
patch rect $ID_corecon  2 12        [expr $bdepth/2]         [expr -$bwidth/2]       [expr $bdepth/2-$hf]     [expr -$bf/2];
patch rect $ID_corecon  10 10       [expr $bdepth/2-$cover]  [expr $bwidth/2-$cover] [expr -$bdepth/2+$cover] [expr -$bwidth/2+$cover];
patch rect $ID_covercon 10 1        [expr $bdepth/2]         [expr $bwidth/2]        [expr -$bdepth/2]        [expr $bwidth/2-$cover];
patch rect $ID_covercon 10 1        [expr $bdepth/2]         [expr -$bwidth/2]       [expr -$bdepth/2]        [expr -$bwidth/2+$cover];
patch rect $ID_covercon 1 10        [expr -$bdepth/2+$cover] [expr $bwidth/2-$cover] [expr -$bdepth/2]        [expr -$bwidth/2+$cover];
patch rect $ID_covercon 1 10        [expr  $bdepth/2-$cover] [expr $bwidth/2-$cover] [expr  $bdepth/2]        [expr -$bwidth/2+$cover];
layer straight $ID_bar1 6 $AN_bar1  [expr  $bdepth/2-$cover] [expr $bwidth/2-$cover] [expr $bdepth/2-$cover]  [expr -$bwidth/2+$cover];
layer straight $ID_bar1 6 $AN_bar1  [expr -$bdepth/2+$cover] [expr $bwidth/2-$cover] [expr -$bdepth/2+$cover] [expr -$bwidth/2+$cover];
layer straight $ID_bar12 6 $AN_bar12  [expr -$bdepth/2+$cover+120] [expr $bwidth/2-$cover] [expr $bdepth/2-$cover-120]  [expr $bwidth/2-$cover];
layer straight $ID_bar12 6 $AN_bar12  [expr -$bdepth/2+$cover+120] [expr -$bwidth/2+$cover] [expr $bdepth/2-$cover-120] [expr -$bwidth/2+$cover];
layer straight $ID_bar12 4 $AN_bar12  [expr $bdepth/2-25] [expr $bwidth/2+25] [expr $bdepth/2-25]  [expr $bf/2-25];
layer straight $ID_bar12 4 $AN_bar12  [expr $bdepth/2-25] [expr -$bwidth/2-25] [expr $bdepth/2-25] [expr -$bf/2+25];
};

#预应力筋
set areaBar [expr 140*$mm2];              
section Fiber 3 {
layer circ 555 13 $areaBar 0 0 0
};

#柱单元
set np 4;
geomTransf Linear 1;
geomTransf PDelta 2;
set addbot [expr 0.25*$botheight];
set addoth [expr 0.25*$othheight];
node 4101        0         [expr $addbot];
node 4102        0         [expr 2*$addbot];
node 4103        0         [expr 3*$addbot];
node 4104 [expr $width]    [expr $addbot];
node 4105 [expr $width]    [expr 2*$addbot];
node 4106 [expr $width]    [expr 3*$addbot];
node 4107 [expr 2*$width]  [expr $addbot];
node 4108 [expr 2*$width]  [expr 2*$addbot];
node 4109 [expr 2*$width]  [expr 3*$addbot];

node 4201        0         [expr $botheight+$addoth];
node 4202        0         [expr $botheight+2*$addoth];
node 4203        0         [expr $botheight+3*$addoth];
node 4204 [expr $width]    [expr $botheight+$addoth];
node 4205 [expr $width]    [expr $botheight+2*$addoth];
node 4206 [expr $width]    [expr $botheight+3*$addoth];
node 4207 [expr 2*$width]  [expr $botheight+$addoth];
node 4208 [expr 2*$width]  [expr $botheight+2*$addoth];
node 4209 [expr 2*$width]  [expr $botheight+3*$addoth];

node 4301        0         [expr $botheight+$othheight+$addoth];
node 4302        0         [expr $botheight+$othheight+2*$addoth];
node 4303        0         [expr $botheight+$othheight+3*$addoth];
node 4304 [expr $width]    [expr $botheight+$othheight+$addoth];
node 4305 [expr $width]    [expr $botheight+$othheight+2*$addoth];
node 4306 [expr $width]    [expr $botheight+$othheight+3*$addoth];
node 4307 [expr 2*$width]  [expr $botheight+$othheight+$addoth];
node 4308 [expr 2*$width]  [expr $botheight+$othheight+2*$addoth];
node 4309 [expr 2*$width]  [expr $botheight+$othheight+3*$addoth];

element dispBeamColumn 31101 3001  4101  $np 1 2;
element dispBeamColumn 31102 4101  4102  $np 1 2;
element dispBeamColumn 31103 4102  4103  $np 1 2;
element dispBeamColumn 31104 4103  3101  $np 1 2;
element dispBeamColumn 31105 3007  4104  $np 1 2;
element dispBeamColumn 31106 4104  4105  $np 1 2;
element dispBeamColumn 31107 4105  4106  $np 1 2;
element dispBeamColumn 31108 4106  3107  $np 1 2;
element dispBeamColumn 31109 3013  4107  $np 1 2;
element dispBeamColumn 31110 4107  4108  $np 1 2;
element dispBeamColumn 31111 4108  4109  $np 1 2;
element dispBeamColumn 31112 4109  3113  $np 1 2;

element dispBeamColumn 31201 3101  4201  $np 1 2;
element dispBeamColumn 31202 4201  4202  $np 1 2;
element dispBeamColumn 31203 4202  4203  $np 1 2;
element dispBeamColumn 31204 4203  3201  $np 1 2;
element dispBeamColumn 31205 3107  4204  $np 1 2;
element dispBeamColumn 31206 4204  4205  $np 1 2;
element dispBeamColumn 31207 4205  4206  $np 1 2;
element dispBeamColumn 31208 4206  3207  $np 1 2;
element dispBeamColumn 31209 3113  4207  $np 1 2;
element dispBeamColumn 31210 4207  4208  $np 1 2;
element dispBeamColumn 31211 4208  4209  $np 1 2;
element dispBeamColumn 31212 4209  3213  $np 1 2;

element dispBeamColumn 31301 3201  4301  $np 1 2;
element dispBeamColumn 31302 4301  4302  $np 1 2;
element dispBeamColumn 31303 4302  4303  $np 1 2;
element dispBeamColumn 31304 4303  3301  $np 1 2;
element dispBeamColumn 31305 3207  4304  $np 1 2;
element dispBeamColumn 31306 4304  4305  $np 1 2;
element dispBeamColumn 31307 4305  4306  $np 1 2;
element dispBeamColumn 31308 4306  3307  $np 1 2;
element dispBeamColumn 31309 3213  4307  $np 1 2;
element dispBeamColumn 31310 4307  4308  $np 1 2;
element dispBeamColumn 31311 4308  4309  $np 1 2;
element dispBeamColumn 31312 4309  3313  $np 1 2;

#梁单元
set np2 4;
geomTransf Linear 3;
element dispBeamColumn 32101 3101 3102 $np2 2 3;
element dispBeamColumn 32102 3102 3103 $np2 2 3;
element dispBeamColumn 32103 3103 3104 $np2 2 3;
element dispBeamColumn 32104 3104 3105 $np2 2 3;
element dispBeamColumn 32105 3105 3106 $np2 2 3;
element dispBeamColumn 32106 3106 3107 $np2 2 3;
element dispBeamColumn 32107 3107 3108 $np2 2 3;
element dispBeamColumn 32108 3108 3109 $np2 2 3;
element dispBeamColumn 32109 3109 3110 $np2 2 3;
element dispBeamColumn 32110 3110 3111 $np2 2 3;
element dispBeamColumn 32111 3111 3112 $np2 2 3;
element dispBeamColumn 32112 3112 3113 $np2 2 3;

element dispBeamColumn 32201 3201 3202 $np2 2 3;
element dispBeamColumn 32202 3202 3203 $np2 2 3;
element dispBeamColumn 32203 3203 3204 $np2 2 3;
element dispBeamColumn 32204 3204 3205 $np2 2 3;
element dispBeamColumn 32205 3205 3206 $np2 2 3;
element dispBeamColumn 32206 3206 3207 $np2 2 3;
element dispBeamColumn 32207 3207 3208 $np2 2 3;
element dispBeamColumn 32208 3208 3209 $np2 2 3;
element dispBeamColumn 32209 3209 3210 $np2 2 3;
element dispBeamColumn 32210 3210 3211 $np2 2 3;
element dispBeamColumn 32211 3211 3212 $np2 2 3;
element dispBeamColumn 32212 3212 3213 $np2 2 3;

element dispBeamColumn 32301 3301 3302 $np2 2 3;
element dispBeamColumn 32302 3302 3303 $np2 2 3;
element dispBeamColumn 32303 3303 3304 $np2 2 3;
element dispBeamColumn 32304 3304 3305 $np2 2 3;
element dispBeamColumn 32305 3305 3306 $np2 2 3;
element dispBeamColumn 32306 3306 3307 $np2 2 3;
element dispBeamColumn 32307 3307 3308 $np2 2 3;
element dispBeamColumn 32308 3308 3309 $np2 2 3;
element dispBeamColumn 32309 3309 3310 $np2 2 3;
element dispBeamColumn 32310 3310 3311 $np2 2 3;
element dispBeamColumn 32311 3311 3312 $np2 2 3;
element dispBeamColumn 32312 3312 3313 $np2 2 3;

#预应力筋节点
set K1 [expr 450*$mm];            
set S1 [expr 212*$mm];            
set P1 [expr -359*$mm];            
set Q1 [expr -500*$mm];

node 5101 0                    [expr $botheight+$K1];
node 5102 $a1                  [expr $botheight+$S1];
node 5103 $a2                  [expr $botheight+$P1];
node 5104 $a3                  [expr $botheight+$Q1];
node 5105 [expr $width-$a2]    [expr $botheight+$P1];
node 5106 [expr $width-$a1]    [expr $botheight+$S1];
node 5107 [expr $width]        [expr $botheight+$K1];
node 5108 [expr $width+$a1]    [expr $botheight+$S1];
node 5109 [expr $width+$a2]    [expr $botheight+$P1];
node 5110 [expr $width+$a3]    [expr $botheight+$Q1];
node 5111 [expr 2*$width-$a2]  [expr $botheight+$P1];
node 5112 [expr 2*$width-$a1]  [expr $botheight+$S1];
node 5113 [expr 2*$width]      [expr $botheight+$K1];

node 5201 0                    [expr $botheight+$othheight+$K1];
node 5202 $a1                  [expr $botheight+$othheight+$S1];
node 5203 $a2                  [expr $botheight+$othheight+$P1];
node 5204 $a3                  [expr $botheight+$othheight+$Q1];
node 5205 [expr $width-$a2]    [expr $botheight+$othheight+$P1];
node 5206 [expr $width-$a1]    [expr $botheight+$othheight+$S1];
node 5207 [expr $width]        [expr $botheight+$othheight+$K1];
node 5208 [expr $width+$a1]    [expr $botheight+$othheight+$S1];
node 5209 [expr $width+$a2]    [expr $botheight+$othheight+$P1];
node 5210 [expr $width+$a3]    [expr $botheight+$othheight+$Q1];
node 5211 [expr 2*$width-$a2]  [expr $botheight+$othheight+$P1];
node 5212 [expr 2*$width-$a1]  [expr $botheight+$othheight+$S1];
node 5213 [expr 2*$width]      [expr $botheight+$othheight+$K1];

node 5301 0                    [expr $botheight+2*$othheight+$K1];
node 5302 $a1                  [expr $botheight+2*$othheight+$S1];
node 5303 $a2                  [expr $botheight+2*$othheight+$P1];
node 5304 $a3                  [expr $botheight+2*$othheight+$Q1];
node 5305 [expr $width-$a2]    [expr $botheight+2*$othheight+$P1];
node 5306 [expr $width-$a1]    [expr $botheight+2*$othheight+$S1];
node 5307 [expr $width]        [expr $botheight+2*$othheight+$K1];
node 5308 [expr $width+$a1]    [expr $botheight+2*$othheight+$S1];
node 5309 [expr $width+$a2]    [expr $botheight+2*$othheight+$P1];
node 5310 [expr $width+$a3]    [expr $botheight+2*$othheight+$Q1];
node 5311 [expr 2*$width-$a2]  [expr $botheight+2*$othheight+$P1];
node 5312 [expr 2*$width-$a1]  [expr $botheight+2*$othheight+$S1];
node 5313 [expr 2*$width]      [expr $botheight+2*$othheight+$K1];

#刚臂单元
element elasticBeamColumn 33101  3101  5101  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33102  3102  5102  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33103  3103  5103  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33104  3104  5104  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33105  3105  5105  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33106  3106  5106  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33107  3107  5107  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33108  3108  5108  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33109  3109  5109  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33110  3110  5110  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33111  3111  5111  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33112  3112  5112  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33113  3113  5113  1.520E+004 1.999E+12 7.690E+004 1;

element elasticBeamColumn 33201  3201  5201  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33202  3202  5202  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33203  3203  5203  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33204  3204  5204  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33205  3205  5205  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33206  3206  5206  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33207  3207  5207  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33208  3208  5208  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33209  3209  5209  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33210  3210  5210  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33211  3211  5211  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33212  3212  5212  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33213  3213  5213  1.520E+004 1.999E+12 7.690E+004 1;

element elasticBeamColumn 33301  3301  5301  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33302  3302  5302  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33303  3303  5303  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33304  3304  5304  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33305  3305  5305  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33306  3306  5306  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33307  3307  5307  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33308  3308  5308  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33309  3309  5309  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33310  3310  5310  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33311  3311  5311  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33312  3312  5312  1.520E+004 1.999E+12 7.690E+004 1;
element elasticBeamColumn 33313  3313  5313  1.520E+004 1.999E+12 7.690E+004 1;

#定义预应力单元
set np3 4;
element dispBeamColumn 34101 5101 5102 $np3 3 3;
element dispBeamColumn 34102 5102 5103 $np3 3 3;
element dispBeamColumn 34103 5103 5104 $np3 3 3;
element dispBeamColumn 34104 5104 5105 $np3 3 3;
element dispBeamColumn 34105 5105 5106 $np3 3 3;
element dispBeamColumn 34106 5106 5107 $np3 3 3;
element dispBeamColumn 34107 5107 5108 $np3 3 3;
element dispBeamColumn 34108 5108 5109 $np3 3 3;
element dispBeamColumn 34109 5109 5110 $np3 3 3;
element dispBeamColumn 34110 5110 5111 $np3 3 3;
element dispBeamColumn 34111 5111 5112 $np3 3 3;
element dispBeamColumn 34112 5112 5113 $np3 3 3;

element dispBeamColumn 34201 5201 5202 $np3 3 3;
element dispBeamColumn 34202 5202 5203 $np3 3 3;
element dispBeamColumn 34203 5203 5204 $np3 3 3;
element dispBeamColumn 34204 5204 5205 $np3 3 3;
element dispBeamColumn 34205 5205 5206 $np3 3 3;
element dispBeamColumn 34206 5206 5207 $np3 3 3;
element dispBeamColumn 34207 5207 5208 $np3 3 3;
element dispBeamColumn 34208 5208 5209 $np3 3 3;
element dispBeamColumn 34209 5209 5210 $np3 3 3;
element dispBeamColumn 34210 5210 5211 $np3 3 3;
element dispBeamColumn 34211 5211 5212 $np3 3 3;
element dispBeamColumn 34212 5212 5213 $np3 3 3;

element dispBeamColumn 34301 5301 5302 $np3 3 3;
element dispBeamColumn 34302 5302 5303 $np3 3 3;
element dispBeamColumn 34303 5303 5304 $np3 3 3;
element dispBeamColumn 34304 5304 5305 $np3 3 3;
element dispBeamColumn 34305 5305 5306 $np3 3 3;
element dispBeamColumn 34306 5306 5307 $np3 3 3;
element dispBeamColumn 34307 5307 5308 $np3 3 3;
element dispBeamColumn 34308 5308 5309 $np3 3 3;
element dispBeamColumn 34309 5309 5310 $np3 3 3;
element dispBeamColumn 34310 5310 5311 $np3 3 3;
element dispBeamColumn 34311 5311 5312 $np3 3 3;
element dispBeamColumn 34312 5312 5313 $np3 3 3;

puts "||model is completed||"
##################################################################################################
##查看图形
#source DisplayModel2D.tcl;
#source DisplayPlane.tcl;
#set viewscale 5;
#DisplayModel2D DeformedShape $viewscale;
#DisplayModel2D DeformedShape $viewscale;
#################################################################################################

#################################################################################################
#集中恒荷载
set F51 [expr -141*$kN];      set F52 [expr -132*$kN];      set F53 [expr -132*$kN];     set F54 [expr -135*$kN];
set F61 [expr -102.8*$kN];    set F62 [expr -146.2*$kN];    set F63 [expr -144*$kN];     set F64 [expr -148.5*$kN];
pattern Plain  1 Linear {

load 3101 0 $F51 0;  load 3102 0 $F52 0;   load 3103 0 $F53 0;  load 3104 0 $F53 0;
load 3105 0 $F53 0;  load 3106 0 $F52 0;   load 3107 0 $F54 0;  load 3108 0 $F52 0;
load 3109 0 $F53 0;  load 3110 0 $F53 0;   load 3111 0 $F53 0;  load 3112 0 $F52 0;   load 3113 0 $F51 0;

load 3201 0 $F51 0;  load 3202 0 $F52 0;   load 3203 0 $F53 0;  load 3204 0 $F53 0;
load 3205 0 $F53 0;  load 3206 0 $F52 0;   load 3207 0 $F54 0;  load 3208 0 $F52 0;
load 3209 0 $F53 0;  load 3210 0 $F53 0;   load 3211 0 $F53 0;  load 3212 0 $F52 0;   load 3213 0 $F51 0;

load 3301 0 $F61 0;  load 3302 0 $F62 0;   load 3303 0 $F63 0;  load 3304 0 $F63 0;
load 3305 0 $F63 0;  load 3306 0 $F62 0;   load 3307 0 $F64 0;  load 3308 0 $F62 0;
load 3309 0 $F63 0;  load 3310 0 $F63 0;   load 3311 0 $F63 0;  load 3312 0 $F62 0;   load 3313 0 $F61 0;
}; 

#均布恒荷载
set BQ1 [expr -12*$kN/$m]; set BQ2 [expr -13.5*$kN/$m]; 
set BQ5 [expr -15.6*$kN/$m];
set BQ6 [expr $BQ1+$BQ5];  set BQ7 [expr $BQ2+$BQ5];
set CQ1 [expr -12.7*$kN/$m];
pattern Plain 2 Linear  {
for {set i 1} {$i<=12} {incr i 1} {
eleLoad -ele [expr 32100+$i] -type -beamUniform $BQ6;
eleLoad -ele [expr 32200+$i] -type -beamUniform $BQ6;
eleLoad -ele [expr 32300+$i] -type -beamUniform $BQ7;
eleLoad -ele [expr 31100+$i] -type -beamUniform 0 $CQ1;
eleLoad -ele [expr 31200+$i] -type -beamUniform 0 $CQ1;
eleLoad -ele [expr 31300+$i] -type -beamUniform 0 $CQ1;
};
};

#################################抗震分析用重力荷载代表值计算，活载取1/2#######################################
#集中活荷载
set F31 [expr -0.5*20.3*$kN];   set F32 [expr -0.5*42*$kN];    set F33 [expr -0.5*40.5*$kN];
set F21 [expr -0.5*13.5*$kN];   set F22 [expr -0.5*28*$kN];    set F23 [expr -0.5*27*$kN];
pattern Plain  3 Linear {

load 3101 0 $F31 0;  load 3102 0 $F32 0;   load 3103 0 $F32 0;  load 3104 0 $F32 0;
load 3105 0 $F32 0;  load 3106 0 $F32 0;   load 3107 0 $F33 0;  load 3108 0 $F32 0;
load 3109 0 $F32 0;  load 3110 0 $F32 0;   load 3111 0 $F32 0;  load 3112 0 $F32 0;   load 3113 0 $F31 0;

load 3201 0 $F31 0;  load 3202 0 $F32 0;   load 3203 0 $F32 0;  load 3204 0 $F32 0;
load 3205 0 $F32 0;  load 3206 0 $F32 0;   load 3207 0 $F33 0;  load 3208 0 $F32 0;
load 3209 0 $F32 0;  load 3210 0 $F32 0;   load 3211 0 $F32 0;  load 3212 0 $F32 0;   load 3213 0 $F31 0;

load 3301 0 $F21 0;  load 3302 0 $F22 0;   load 3303 0 $F22 0;  load 3304 0 $F22 0;
load 3305 0 $F22 0;  load 3306 0 $F22 0;   load 3307 0 $F23 0;  load 3308 0 $F22 0;
load 3309 0 $F22 0;  load 3310 0 $F22 0;   load 3311 0 $F22 0;  load 3312 0 $F22 0;   load 3313 0 $F21 0;
}; 

#均布活荷载
set BQ3 [expr -0.5*4.5*$kN/$m]; set BQ4 [expr -0.5*3*$kN/$m];
pattern Plain 4 Linear  {
for {set i 1} {$i<=12} {incr i 1} {
eleLoad -ele [expr 32100+$i] -type -beamUniform $BQ3;
eleLoad -ele [expr 32200+$i] -type -beamUniform $BQ3;
eleLoad -ele [expr 32300+$i] -type -beamUniform $BQ4;
};
} ;
#################################################################################################

#定义质量源
set girder      [expr 18*1.2*0.5*26*100*$kg];         #主梁的质量
set masscolumn1 [expr 0.5*4.8*0.7*0.7*26*100*$kg];    #2,3层柱子一半质量
set masscolumn2 [expr 6*0.7*0.7*26*100*$kg];          #底层柱子质量
set m1 [expr 0.5*$girder];          #边界点承担的质量，未加柱重
set m2 [expr $girder];              #中间点承担的质量，未加柱重
set DFor_mass_3_b   [expr (-1*($F61+$F62+1.5*$F63)-0.5*$BQ2*18)/$g];
set DFor_mass_3_z   [expr (-1*($F64+2*$F62+3*$F63)-$BQ2*18)/$g];
set DFor_mass_1_2_b [expr (-1*($F51+$F52+1.5*$F53)-0.5*$BQ1*18)/$g];
set DFor_mass_1_2_z [expr (-1*($F54+2*$F52+3*$F53)-$BQ1*18)/$g];
set LFor_mass_3_b   [expr (-1*($F21+2.5*$F22)-0.5*$BQ4*18)/$g];
set LFor_mass_3_z   [expr (-1*($F23+5*$F22)-$BQ4*18)/$g];
set LFor_mass_1_2_b [expr (-1*($F31+2.5*$F32)-0.5*$BQ3*18)/$g];
set LFor_mass_1_2_z [expr (-1*($F33+5*$F32)-$BQ3*18)/$g];
set For_mass_3_b    [expr $DFor_mass_3_b+$LFor_mass_3_b];
set For_mass_3_z    [expr $DFor_mass_3_z+$LFor_mass_3_z];
set For_mass_1_2_b  [expr $DFor_mass_1_2_b+$LFor_mass_1_2_b];
set For_mass_1_2_z  [expr $DFor_mass_1_2_z+$LFor_mass_1_2_z];

mass 3101 [expr $m1+$masscolumn2+$masscolumn1+$For_mass_1_2_b]   [expr $m1+$masscolumn2+$masscolumn1+$For_mass_1_2_b] 0;    
mass 3107 [expr $m2+$masscolumn2+$masscolumn1+$For_mass_1_2_z]   [expr $m2+$masscolumn2+$masscolumn1+$For_mass_1_2_z] 0;  
mass 3113 [expr $m1+$masscolumn2+$masscolumn1+$For_mass_1_2_b]   [expr $m1+$masscolumn2+$masscolumn1+$For_mass_1_2_b] 0;   

mass 3201 [expr $m1+2*$masscolumn1+$For_mass_1_2_b]   [expr $m1+2*$masscolumn1+$For_mass_1_2_b] 0;
mass 3207 [expr $m2+2*$masscolumn1+$For_mass_1_2_z]   [expr $m2+2*$masscolumn1+$For_mass_1_2_z] 0;  
mass 3213 [expr $m1+2*$masscolumn1+$For_mass_1_2_b]   [expr $m1+2*$masscolumn1+$For_mass_1_2_b] 0;

mass 3301 [expr $m1+$masscolumn1+$For_mass_3_b]   [expr $m1+$masscolumn1+$For_mass_3_b] 0;  
mass 3307 [expr $m2+$masscolumn1+$For_mass_3_z]   [expr $m2+$masscolumn1+$For_mass_3_z] 0;  
mass 3313 [expr $m1+$masscolumn1+$For_mass_3_b]   [expr $m1+$masscolumn1+$For_mass_3_b] 0;

#################################################################################################
#set a3101 [expr $m1+$masscolumn2+$masscolumn1+$For_mass_1_2_b]    
#set a3107 [expr $m2+$masscolumn2+$masscolumn1+$For_mass_1_2_z]  
#set a3113 [expr $m1+$masscolumn2+$masscolumn1+$For_mass_1_2_b]
#set a3100 [expr $a3101+$a3107+$a3113]
#
#set a3201 [expr $m1+2*$masscolumn1+$For_mass_1_2_b]  
#set a3207 [expr $m2+2*$masscolumn1+$For_mass_1_2_z]    
#set a3213 [expr $m1+2*$masscolumn1+$For_mass_1_2_b]
#set a3200 [expr $a3201+$a3207+$a3213]
#
#set a3301 [expr $m1+$masscolumn1+$For_mass_3_b]    
#set a3307 [expr $m2+$masscolumn1+$For_mass_3_z]   
#set a3313 [expr $m1+$masscolumn1+$For_mass_3_b] 
#set a3300 [expr $a3301+$a3307+$a3313]
#
#set a31 [expr $a3100/$a3100]
#set a32 [expr $a3200/$a3100]
#set a33 [expr $a3300/$a3100]
#
#puts "$a3100"
#puts "$a3200"
#puts "$a3300"
#puts "$a31"
#puts "$a32"
#puts "$a33"
#################################################################################################
#记录
##############################pushover分析
#set xbff pushover;
#set number 1
#source pushover-record-StressStrain.tcl; ##梁、柱端钢筋混凝土应力应变
##############################IDA分析
#set xbff IDA;
set xbff IDA2;  ##近场地震
##############################多遇地震
#set xbff 1Chinese_code;
#set xbff 2dual_band;
#set xbff 3area_method;
#set xbff 4Harmony_Search;
##############################罕遇地震
#set xbff 1Chinese_code_h;
#set xbff 2dual_band_h;
#set xbff 3area_method_h;
#set xbff 4Harmony_Search_h;
##############################极罕遇地震
#set xbff 5extremely_rarely_earthquake;
##############################
#recorder Node -file output/$xbff/$number/disp3313.out -time -node 3313 -dof 1  disp;
#recorder Node -file output/$xbff/$number/disp3213.out -time -node 3213 -dof 1  disp;
#recorder Node -file output/$xbff/$number/disp3113.out -time -node 3113 -dof 1  disp;
#recorder Node -file output/$xbff/$number/disp3307.out -time -node 3307 -dof 1  disp;
#recorder Node -file output/$xbff/$number/disp3207.out -time -node 3207 -dof 1  disp;
#recorder Node -file output/$xbff/$number/disp3107.out -time -node 3107 -dof 1  disp;
recorder Node -file output/$xbff/$number/disp3301.out -time -node 3301 -dof 1  disp;
recorder Node -file output/$xbff/$number/disp3201.out -time -node 3201 -dof 1  disp;
recorder Node -file output/$xbff/$number/disp3101.out -time -node 3101 -dof 1  disp;

recorder Element -file output/$xbff/$number/reac3001.out -time -ele 31101 -dof 1 globalForce;
recorder Element -file output/$xbff/$number/reac3007.out -time -ele 31105 -dof 1 globalForce;
recorder Element -file output/$xbff/$number/reac3013.out -time -ele 31109 -dof 1 globalForce;
recorder Element -file output/$xbff/$number/reac3101.out -time -ele 31201 -dof 1 globalForce;
recorder Element -file output/$xbff/$number/reac3107.out -time -ele 31205 -dof 1 globalForce;
recorder Element -file output/$xbff/$number/reac3113.out -time -ele 31209 -dof 1 globalForce;
recorder Element -file output/$xbff/$number/reac3201.out -time -ele 31301 -dof 1 globalForce;
recorder Element -file output/$xbff/$number/reac3207.out -time -ele 31305 -dof 1 globalForce;
recorder Element -file output/$xbff/$number/reac3213.out -time -ele 31309 -dof 1 globalForce;

recorder Drift -file output/$xbff/$number/drift_3.out -time -iNode 3201 -jNode 3301  -dof 1  -perpDirn 2;
recorder Drift -file output/$xbff/$number/drift_2.out -time -iNode 3101 -jNode 3201  -dof 1  -perpDirn 2;
recorder Drift -file output/$xbff/$number/drift_1.out -time -iNode 3001 -jNode 3101  -dof 1  -perpDirn 2;
#recorder Drift -file output/$xbff/$number/drift_6.out -time -iNode 3207 -jNode 3307  -dof 1  -perpDirn 2;
#recorder Drift -file output/$xbff/$number/drift_5.out -time -iNode 3107 -jNode 3207  -dof 1  -perpDirn 2;
#recorder Drift -file output/$xbff/$number/drift_4.out -time -iNode 3007 -jNode 3107  -dof 1  -perpDirn 2;
#recorder Drift -file output/$xbff/$number/drift_9.out -time -iNode 3213 -jNode 3313  -dof 1  -perpDirn 2;
#recorder Drift -file output/$xbff/$number/drift_8.out -time -iNode 3113 -jNode 3213  -dof 1  -perpDirn 2;
#recorder Drift -file output/$xbff/$number/drift_7.out -time -iNode 3013 -jNode 3113  -dof 1  -perpDirn 2;
################################################################################################

################################################################################################
#重力分析
constraints Plain;          
numberer RCM;   	    
system BandGeneral;	    
set Tol 1.0e-8;	            
test NormDispIncr $Tol 1000;
#algorithm NewtonLineSearch 0.6;
#algorithm Linear	
#algorithm KrylovNewton
#algorithm Broyden 8
algorithm Newton;
integrator LoadControl 0.1;
analysis Static;	
analyze 10;
loadConst -time 0.0;
puts "||gravity analyse completed||"
##################################################################################################

################################################################################################
#瑞雷阻尼、模态分析
#recorder Node -file output/eigen1_node0.out -time -node 3101 3201 3301 -dof 1  "eigen 1"
#recorder Node -file output/eigen2_node0.out -time -node 3101 3201 3301 -dof 1  "eigen 2"
#recorder Node -file output/eigen3_node0.out -time -node 3101 3201 3301 -dof 1  "eigen 3"
set theta 0.03;
set lamda [eigen 3];
set omega {}
set f {}
set T {}
foreach lam $lamda {
     lappend omega [expr sqrt($lam)]
     lappend f [expr sqrt($lam)/(2*$PI)]
     lappend T [expr (2*$PI)/sqrt($lam)]
}
puts "periods is $T"
set aa0 [expr 2*$theta*[lindex $omega 0]*[lindex $omega 1]/([lindex $omega 0]+[lindex $omega 1])]
set aa1 [expr 2*$theta/([lindex $omega 0]+[lindex $omega 1])]
puts "$aa0"
puts "$aa1"
rayleigh $aa0 0 0 $aa1

set period "Periods.txt"
set Periods [open $period "w"]
foreach t $T {
	puts $Periods " $t"
}
close $Periods
record
puts "||model analyse completed||"
puts "||rayleigh damping defined||"
################################################################################################

##################################################################################################
#pushover分析
#loadConst -time 0.0;				                                                               
#pattern Plain 5 Linear {
#	load 3101   0.38 0.0 0.0;			                                                              
#	load 3201   0.69 0.0 0.0;
#	load 3301   1.00 0.0 0.0;	
#};                                                                                                             
#integrator DisplacementControl 3301 1 1;		                                                       
#analyze 550;
#puts "||pushover completed||"
##################################################################################################

