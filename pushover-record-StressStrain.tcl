###########################################输出梁、柱端截面应力应变###################################################
##预应力筋单元应力应变
##第一层
recorder Element -file output/$xbff/$number/StressStrain/pres/ele34101StressStrain.out -time -ele 34101 section 1 fiber 0 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/pres/ele34106StressStrain.out -time -ele 34106 section 4 fiber 0 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/pres/ele34107StressStrain.out -time -ele 34107 section 1 fiber 0 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/pres/ele34112StressStrain.out -time -ele 34112 section 4 fiber 0 0 stressStrain;
##第二层
recorder Element -file output/$xbff/$number/StressStrain/pres/ele34201StressStrain.out -time -ele 34201 section 1 fiber 0 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/pres/ele34206StressStrain.out -time -ele 34206 section 4 fiber 0 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/pres/ele34207StressStrain.out -time -ele 34207 section 1 fiber 0 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/pres/ele34212StressStrain.out -time -ele 34212 section 4 fiber 0 0 stressStrain;
##第三层
recorder Element -file output/$xbff/$number/StressStrain/pres/ele34301StressStrain.out -time -ele 34301 section 1 fiber 0 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/pres/ele34306StressStrain.out -time -ele 34306 section 4 fiber 0 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/pres/ele34307StressStrain.out -time -ele 34307 section 1 fiber 0 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/pres/ele34312StressStrain.out -time -ele 34312 section 4 fiber 0 0 stressStrain;

##柱端钢筋应力应变
##第一层（top表示截面上部/左，down表示截面下部/右钢筋，单元号后S表示钢筋）
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31101StopStressStrain.out -time -ele 31101 section 1 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31101SdownStressStrain.out -time -ele 31101 section 1 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31104StopStressStrain.out -time -ele 31104 section 4 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31104SdownStressStrain.out -time -ele 31104 section 4 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/steel/ele31105StopStressStrain.out -time -ele 31105 section 1 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31105SdownStressStrain.out -time -ele 31105 section 1 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31108StopStressStrain.out -time -ele 31108 section 4 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31108SdownStressStrain.out -time -ele 31108 section 4 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/steel/ele31109StopStressStrain.out -time -ele 31109 section 1 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31109SdownStressStrain.out -time -ele 31109 section 1 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31112StopStressStrain.out -time -ele 31112 section 4 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31112SdownStressStrain.out -time -ele 31112 section 4 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;
##第二层
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31201StopStressStrain.out -time -ele 31201 section 1 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31201SdownStressStrain.out -time -ele 31201 section 1 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31204StopStressStrain.out -time -ele 31204 section 4 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31204SdownStressStrain.out -time -ele 31204 section 4 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/steel/ele31205StopStressStrain.out -time -ele 31205 section 1 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31205SdownStressStrain.out -time -ele 31205 section 1 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31208StopStressStrain.out -time -ele 31208 section 4 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31208SdownStressStrain.out -time -ele 31208 section 4 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/steel/ele31209StopStressStrain.out -time -ele 31209 section 1 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31209SdownStressStrain.out -time -ele 31209 section 1 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31212StopStressStrain.out -time -ele 31212 section 4 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31212SdownStressStrain.out -time -ele 31212 section 4 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;
##第三层
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31301StopStressStrain.out -time -ele 31301 section 1 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31301SdownStressStrain.out -time -ele 31301 section 1 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31304StopStressStrain.out -time -ele 31304 section 4 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31304SdownStressStrain.out -time -ele 31304 section 4 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/steel/ele31305StopStressStrain.out -time -ele 31305 section 1 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31305SdownStressStrain.out -time -ele 31305 section 1 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31308StopStressStrain.out -time -ele 31308 section 4 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31308SdownStressStrain.out -time -ele 31308 section 4 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/steel/ele31309StopStressStrain.out -time -ele 31309 section 1 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31309SdownStressStrain.out -time -ele 31309 section 1 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31312StopStressStrain.out -time -ele 31312 section 4 fiber [expr $cwidth/2-$cover-$DN_bar1/2] [expr $cdepth/2-$cover-$DN_bar1/2] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele31312SdownStressStrain.out -time -ele 31312 section 4 fiber [expr -$cwidth/2+$cover+$DN_bar1/2] [expr -$cdepth/2+$cover+$DN_bar1/2] stressStrain;

##柱端混凝土应力应变
##第一层（top表示截面上部/左，down表示截面下部/右混凝土，单元号后C表示混凝土）
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31101CtopStressStrain.out -time -ele 31101 section 1 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31101CdownStressStrain.out -time -ele 31101 section 1 fiber [expr -$cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31104CtopStressStrain.out -time -ele 31104 section 4 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31104CdownStressStrain.out -time -ele 31104 section 4 fiber [expr -$cwidth/2] 0 stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31105CtopStressStrain.out -time -ele 31105 section 1 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31105CdownStressStrain.out -time -ele 31105 section 1 fiber [expr -$cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31108CtopStressStrain.out -time -ele 31108 section 4 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31108CdownStressStrain.out -time -ele 31108 section 4 fiber [expr -$cwidth/2] 0 stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31109CtopStressStrain.out -time -ele 31109 section 1 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31109CdownStressStrain.out -time -ele 31109 section 1 fiber [expr -$cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31112CtopStressStrain.out -time -ele 31112 section 4 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31112CdownStressStrain.out -time -ele 31112 section 4 fiber [expr -$cwidth/2] 0 stressStrain;
##第二层
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31201CtopStressStrain.out -time -ele 31201 section 1 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31201CdownStressStrain.out -time -ele 31201 section 1 fiber [expr -$cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31204CtopStressStrain.out -time -ele 31204 section 4 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31204CdownStressStrain.out -time -ele 31204 section 4 fiber [expr -$cwidth/2] 0 stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31205CtopStressStrain.out -time -ele 31205 section 1 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31205CdownStressStrain.out -time -ele 31205 section 1 fiber [expr -$cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31208CtopStressStrain.out -time -ele 31208 section 4 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31208CdownStressStrain.out -time -ele 31208 section 4 fiber [expr -$cwidth/2] 0 stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31209CtopStressStrain.out -time -ele 31209 section 1 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31209CdownStressStrain.out -time -ele 31209 section 1 fiber [expr -$cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31212CtopStressStrain.out -time -ele 31212 section 4 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31212CdownStressStrain.out -time -ele 31212 section 4 fiber [expr -$cwidth/2] 0 stressStrain;
##第三层
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31301CtopStressStrain.out -time -ele 31301 section 1 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31301CdownStressStrain.out -time -ele 31301 section 1 fiber [expr -$cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31304CtopStressStrain.out -time -ele 31304 section 4 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31304CdownStressStrain.out -time -ele 31304 section 4 fiber [expr -$cwidth/2] 0 stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31305CtopStressStrain.out -time -ele 31305 section 1 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31305CdownStressStrain.out -time -ele 31305 section 1 fiber [expr -$cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31308CtopStressStrain.out -time -ele 31308 section 4 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31308CdownStressStrain.out -time -ele 31308 section 4 fiber [expr -$cwidth/2] 0 stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31309CtopStressStrain.out -time -ele 31309 section 1 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31309CdownStressStrain.out -time -ele 31309 section 1 fiber [expr -$cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31312CtopStressStrain.out -time -ele 31312 section 4 fiber [expr $cwidth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele31312CdownStressStrain.out -time -ele 31312 section 4 fiber [expr -$cwidth/2] 0 stressStrain;

##梁端钢筋应力应变
##第一层（top表示截面上部/左，down表示截面下部/右混凝土，单元号后S表示钢筋）
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32101StopStressStrain.out -time -ele 32101 section 1 fiber [expr  $bdepth/2-$cover] [expr $bwidth/2-$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32101SdownStressStrain.out -time -ele 32101 section 1 fiber [expr  -$bdepth/2+$cover] [expr -$bwidth/2+$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32106StopStressStrain.out -time -ele 32106 section 4 fiber [expr  $bdepth/2-$cover] [expr $bwidth/2-$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32106SdownStressStrain.out -time -ele 32106 section 4 fiber [expr  -$bdepth/2+$cover] [expr -$bwidth/2+$cover] stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/steel/ele32107StopStressStrain.out -time -ele 32107 section 1 fiber [expr  $bdepth/2-$cover] [expr $bwidth/2-$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32107SdownStressStrain.out -time -ele 32107 section 1 fiber [expr  -$bdepth/2+$cover] [expr -$bwidth/2+$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32112StopStressStrain.out -time -ele 32112 section 4 fiber [expr  $bdepth/2-$cover] [expr $bwidth/2-$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32112SdownStressStrain.out -time -ele 32112 section 4 fiber [expr  -$bdepth/2+$cover] [expr -$bwidth/2+$cover] stressStrain;
##第二层
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32201StopStressStrain.out -time -ele 32201 section 1 fiber [expr  $bdepth/2-$cover] [expr $bwidth/2-$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32201SdownStressStrain.out -time -ele 32201 section 1 fiber [expr  -$bdepth/2+$cover] [expr -$bwidth/2+$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32206StopStressStrain.out -time -ele 32206 section 4 fiber [expr  $bdepth/2-$cover] [expr $bwidth/2-$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32206SdownStressStrain.out -time -ele 32206 section 4 fiber [expr  -$bdepth/2+$cover] [expr -$bwidth/2+$cover] stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/steel/ele32207StopStressStrain.out -time -ele 32207 section 1 fiber [expr  $bdepth/2-$cover] [expr $bwidth/2-$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32207SdownStressStrain.out -time -ele 32207 section 1 fiber [expr  -$bdepth/2+$cover] [expr -$bwidth/2+$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32212StopStressStrain.out -time -ele 32212 section 4 fiber [expr  $bdepth/2-$cover] [expr $bwidth/2-$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32212SdownStressStrain.out -time -ele 32212 section 4 fiber [expr  -$bdepth/2+$cover] [expr -$bwidth/2+$cover] stressStrain;
##第三层
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32301StopStressStrain.out -time -ele 32301 section 1 fiber [expr  $bdepth/2-$cover] [expr $bwidth/2-$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32301SdownStressStrain.out -time -ele 32301 section 1 fiber [expr  -$bdepth/2+$cover] [expr -$bwidth/2+$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32306StopStressStrain.out -time -ele 32306 section 4 fiber [expr  $bdepth/2-$cover] [expr $bwidth/2-$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32306SdownStressStrain.out -time -ele 32306 section 4 fiber [expr  -$bdepth/2+$cover] [expr -$bwidth/2+$cover] stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/steel/ele32307StopStressStrain.out -time -ele 32307 section 1 fiber [expr  $bdepth/2-$cover] [expr $bwidth/2-$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32307SdownStressStrain.out -time -ele 32307 section 1 fiber [expr  -$bdepth/2+$cover] [expr -$bwidth/2+$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32312StopStressStrain.out -time -ele 32312 section 4 fiber [expr  $bdepth/2-$cover] [expr $bwidth/2-$cover] stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/steel/ele32312SdownStressStrain.out -time -ele 32312 section 4 fiber [expr  -$bdepth/2+$cover] [expr -$bwidth/2+$cover] stressStrain;

##梁端混凝土应力应变
##第一层（top表示截面上部/左，down表示截面下部/右混凝土，单元号后C表示混凝土）
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32101CtopStressStrain.out -time -ele 32101 section 1 fiber [expr  $bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32101CdownStressStrain.out -time -ele 32101 section 1 fiber [expr  -$bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32106CtopStressStrain.out -time -ele 32106 section 4 fiber [expr  $bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32106CdownStressStrain.out -time -ele 32106 section 4 fiber [expr  -$bdepth/2] 0 stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32107CtopStressStrain.out -time -ele 32107 section 1 fiber [expr  $bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32107CdownStressStrain.out -time -ele 32107 section 1 fiber [expr  -$bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32112CtopStressStrain.out -time -ele 32112 section 4 fiber [expr  $bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32112CdownStressStrain.out -time -ele 32112 section 4 fiber [expr  -$bdepth/2] 0 stressStrain;
##第二层
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32201CtopStressStrain.out -time -ele 32201 section 1 fiber [expr  $bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32201CdownStressStrain.out -time -ele 32201 section 1 fiber [expr  -$bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32206CtopStressStrain.out -time -ele 32206 section 4 fiber [expr  $bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32206CdownStressStrain.out -time -ele 32206 section 4 fiber [expr  -$bdepth/2] 0 stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32207CtopStressStrain.out -time -ele 32207 section 1 fiber [expr  $bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32207CdownStressStrain.out -time -ele 32207 section 1 fiber [expr  -$bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32212CtopStressStrain.out -time -ele 32212 section 4 fiber [expr  $bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32212CdownStressStrain.out -time -ele 32212 section 4 fiber [expr  -$bdepth/2] 0 stressStrain;
##第三层
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32301CtopStressStrain.out -time -ele 32301 section 1 fiber [expr  $bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32301CdownStressStrain.out -time -ele 32301 section 1 fiber [expr  -$bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32306CtopStressStrain.out -time -ele 32306 section 4 fiber [expr  $bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32306CdownStressStrain.out -time -ele 32306 section 4 fiber [expr  -$bdepth/2] 0 stressStrain;

recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32307CtopStressStrain.out -time -ele 32307 section 1 fiber [expr  $bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32307CdownStressStrain.out -time -ele 32307 section 1 fiber [expr  -$bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32312CtopStressStrain.out -time -ele 32312 section 4 fiber [expr  $bdepth/2] 0 stressStrain;
recorder Element -file output/$xbff/$number/StressStrain/concrete/ele32312CdownStressStrain.out -time -ele 32312 section 4 fiber [expr  -$bdepth/2] 0 stressStrain;
