#!/bin/sh
# Makes smoothed seismicity map from EQ catalog

filename=`echo $1`

gmt4 gmtset HEADER_FONT = 4
gmt4 gmtset HEADER_FONT_SIZE = 20
gmt4 gmtset GRID_CROSS_SIZE_PRIMARY = 1
gmt4 gmtset LABEL_FONT = 4
gmt4 gmtset LABEL_FONT_SIZE = 20



gmt4 psxy -R43.5/61.5/34/40 -Jm1.2c -Ba1f0.2/a1f0.2WSNE -W5t5_5:0 -K  -H  -Y5  sqrt.d >pgamap.ps
gmt4 blockmean $filename.txt -R -I.01>tempmean
gmt4 surface tempmean -R -I.01 -Gtempmap.grd -T0.3
gmt4 grdimage tempmap.grd -R -Jm1.2c -Ccont1.cpt -K -O >>pgamap.ps
gmt4 grdcontour tempmap.grd -Jm1.2c -R -O -K -C0.1 -A0.1 >> pgamap.ps
gmt4 pscoast -R -Jm1.2c -B2g2/2g2:."Northern Iran seismic zone 10% in 50y PGA Hazard Map": -Dh -W1 -K -O -Na >>pgamap.ps
gmt4 psscale -Ccont1.cpt -D14.0/3.5/6.0/0.3 -O -B:g: -X9 >>pgamap.ps

#ps2pdf pgamap.ps pgaMapO1.pdf

#ps2raster pgamap.ps -TG -Au -FpgaMapO1-png

ps2pdf pgamap.ps $filename.pdf


#gv pgamap.ps &

# uncomment to have png surface
#psxy -R43.5/61.5/34/40 -Jm1.2c -Ba1f0.2/a1f0.2WSNE -W5t5_5:0 -K  -H  -Y5  sqrt.d >pgamap.ps
#psbasemap -R -Jm1.2c -Bwesn  -K  -Y5 >pgamap.ps
#blockmean pga_2_50.txt -R -I.01>tempmean
#surface tempmean -R -I.01 -Gtempmap.grd -T0.3
#grdimage tempmap.grd -R -Jm1.2c -Ccont1.cpt -K  -O >>pgamap.ps
#psscale -Ccont1.cpt -D14.0/3.5/6.0/0.3 -O -B:g: -X9 >>pgamap.ps
#ps2raster pgamap.ps -TG -Au -FpgaMapO1-png
