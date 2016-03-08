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


awk '{print $2,$3,$1,($4^4)/6000}' historical_7.txt|psxy -Sc -G51/51/255 -W1 -Ccolors.cpt -R$REGION $PROJ -K -O >> $0.ps
psscale -D3.5i/4.2i/6i/0.15ih -Ba100:"Earthquake Time": -Ccolors.cpt -K -O >>  $0.ps
#awk '{print $9,$10}' usgs_data.txt|psxy -Sc0.3 -G51/255/51 -W1 -R$REGION $PROJ -K -O >> $0.ps
#awk '{print $9,$10}' IIEES_data.txt|psxy -Sc0.2 -G250/51/51 -W1 -R$REGION $PROJ -K -O >> $0.ps


# magnitude scale


cat << EOF | awk '{print $2,$3,$1,($4^4)/6000}'|psxy -Sc -G51/51/255 -W1 -Ccolors.cpt -R$REGION $PROJ -K -O >> $0.ps

900 60 39     7
900 60 39.5     8

 
EOF



#cat << EOF |pstext -R$REGION $PROJ  -K -O  >> $0.ps
#  47.5 38.1 12  -60 1 c Ardabil
#  43   36.0 20  00 1 c Iraq
#  52   35.5 12  00 3 r Tehran
#  52   33.5 20  00 1 c Iran 
#  42.5 39.5 20  00 1 c Turkey
#  47.6 40.3 16  45 1 c Azerbaijan
#  51.4   39   16  00 7 c Caspian Sea
 
#EOF


#cat << EOF13 |psxy -Sa0.4 -G255/10/10 -W1 -R$REGION $PROJ -K -O  >> $0.ps
#48 38.4 
#EOF13

#cat << EOF12 |psmeca  -Sa1/6 -G200/1/1 -R$REGION $PROJ -K -O >> $0.ps
#-117 35 7 233 77 49 6 -117.55 35.2 
#EOF12






