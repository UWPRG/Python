#!/bin/bash
startx=46.1
endx=48.6
starty=24.4
endy=30.5
npts=100
stepx=`echo \( ${endx} - \(${startx} \)\)\/${npts} | bc -l`
stepy=`echo \( ${endy} - \(${starty} \)\)\/${npts} | bc -l`
#echo $stepx $stepy 
#for i in `seq 0 $npts`
for i in ` echo $npts | awk '{for(i=0;i<=$1;i++){print i}}' `
do
x=` echo $i\*\($stepx \) +\($startx \) | bc -l `
y=` echo  $i\*\($stepy  \)+\($starty \) | bc -l `
echo pt $x $y
done
