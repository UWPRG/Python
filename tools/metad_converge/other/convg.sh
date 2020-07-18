#!/bin/bash

Tinit=300.0
Tfinal=600.0
nfinal=0
#k=`echo | awk '{print log(TF/TI)/numf}' TF=$Tfinal TI=$Tinit numf=$nfinal`


#dir=$1
#file=$dir\_TEMP.txt
#rm -rf $file 
for ((i=0;i<=$nfinal;i++)); do
  count=$i
  #temp=`echo | awk '{printf "%3.3f\n",TI*exp(i*k)}' TI=$Tinit k=$k i=$i` 
   temp=300
  kt=`echo "0.001987*$temp*4.184" | bc -l`
  #cd $dir
  #plumed sum_hills --hills HILLS.$i --outfile fes.$i --kt $kt

  xfl=-2.0
  xfh=-1.0
  yfl=0.5
  yfh=1.5

  xul=.5
  xuh=1.5
  yul=-1.0
  yuh=0.0
  rm -rf hold
  mv fes.$i hold
  cat hold | grep -v \# >> fes.$i
  rm -rf hold
  U=`awk 'BEGIN{tot=0}{fes=$3; if($3 <0.0 && $1 > xl && $1 < xh && $2 > yl && $2 < yh) tot=tot+exp(-fes/kt)}END{print -kt*log(tot)}' kt=${kt} xl=${xfl} xh=${xfh} yl=${yfl} yh=${yfh} fes.$i`
  F=`awk 'BEGIN{tot=0}{fes=$3; if($3 <0.0 && $1 > xl && $1 < xh && $2 > yl && $2 < yh) tot=tot+exp(-fes/kt)}END{print -kt*log(tot)}' kt=${kt} xl=${xul} xh=${xuh} yl=${yul} yh=${yuh} fes.$i`

    delta=`echo "(${U} - ${F}) / 4.184" | bc -l`
    echo $temp $delta 
  cd ..
 done


