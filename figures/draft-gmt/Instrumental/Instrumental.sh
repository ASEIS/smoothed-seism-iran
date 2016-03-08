#!/bin/bash
# Set stuff up
# World Topography
# By : Naeem Khoshnevis


 

LONMIN=43.5
LONMAX=61.5
LATMIN=34
LATMAX=40
REGION=$LONMIN/$LONMAX/$LATMIN/$LATMAX
PROJ=-JM18
MOREPS=-K
CONTINUEPS="-K -O"
ENDPS=-O
DATASET=11
DATAGRID=-I30c
LINE=-W1

grdraster $DATASET -G$world.grd $DATAGRID -R$REGION -V
CPTFILE=/usr/local/GMT4.5.7/share/cpt/GMT_globe.cpt
TOPOILLUM=220

#grdgradient $world.grd -A$TOPOILLUM -GETOPO5.intns -N2 -V   in this case Dataset = 9
grdgradient $world.grd -A$TOPOILLUM -GETOPO30s.intns -N2 -V

grdimage $world.grd -IETOPO5.intns -C$CPTFILE -R$REGION $PROJ -N1/4 -K -B4f2/4f2 -Y8 -X8  >  $0.ps

pscoast -R$REGION $PROJ -N1/4 -B4f2/4f2 -K -O -W2 >> $0.ps


awk '{print $1,$2,($3^3.2)/1000}' instrumental.txt|psxy -Sc -G196/19/19 -W2  -R$REGION $PROJ -K -O >> $0.ps

cat << EOF |awk '{print $1,$2,($3^3.2)/1000}' |psxy -Sc -G196/19/19 -W2  -R$REGION $PROJ -K -O >> $0.ps

61 37.7   3
61 38.0   4
61 38.2   5
61 38.6   6
61 39.0   7
61 39.7   8

 
 
EOF






