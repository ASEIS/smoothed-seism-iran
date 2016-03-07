#!/bin/bash
# Set stuff up
# World Topography
# By : Naeem Khoshnevis
 

LONMIN=25
LONMAX=80
LATMIN=20
LATMAX=45
REGION=$LONMIN/$LONMAX/$LATMIN/$LATMAX
PROJ=-JM16
MOREPS=-K
CONTINUEPS="-K -O"
ENDPS=-O
DATASET=9
DATAGRID=-I30c
LINE=-W1

grdraster $DATASET -G$world.grd $DATAGRID -R$REGION -V
CPTFILE=/usr/local/GMT4.5.7/share/cpt/GMT_globe.cpt
TOPOILLUM=220

grdgradient $world.grd -A$TOPOILLUM -GETOPO5.intns -N2 -V  # in this case Dataset = 9
#grdgradient $world.grd -A$TOPOILLUM -GETOPO30s.intns -N2 -V

grdimage $world.grd -IETOPO5.intns -C$CPTFILE -R$REGION $PROJ -N2   -K  -Y1 -X8  >  $0.ps

pscoast -R$REGION $PROJ -N1 -B10f5/10f5  -Lf45/23/23/1000 -K -O -W2 >> $0.ps





cat << EOF13 |psxy  -Sc0.05  -W1 -R$REGION $PROJ -K -O  >> $0.ps

43.5	34
43.5	40
61.5    40
61.5    34
44.228  39.4
48.971  31.136
60.173  36.429
61.435  25.075

EOF13







