
KEY=$1
CPTFILE=tmp.cpt
OUTFILE=tmp.ps
GRDFILE=tmp.grd

gmt gmtset FONT                     8

gmt gmtset MAP_DEFAULT_PEN          0.75p
gmt gmtset MAP_FRAME_PEN            0.75p
gmt gmtset MAP_FRAME_WIDTH          3p
gmt gmtset MAP_TICK_PEN             0.75p
gmt gmtset MAP_TICK_PEN_PRIMARY     0.75p
gmt gmtset MAP_TICK_PEN_SECONDARY   0.75p
gmt gmtset MAP_GRID_PEN_PRIMARY     0.75p
gmt gmtset MAP_TICK_LENGTH_PRIMARY  6p/3p
gmt gmtset MAP_LABEL_OFFSET         8p
gmt gmtset MAP_ANNOT_OFFSET_PRIMARY 5p

gmt makecpt -Ces_skywalker_18 -Do -T0/1/0.05 > ${CPTFILE}

gmt surface         pga_${KEY}_50_mean_m_55.txt -R43.5/61.5/34/40 -I0.01 -T0.3 -Gtmp1.grd
gmt surface         pga_${KEY}_50_mean_m_65.txt -R43.5/61.5/34/40 -I0.01 -T0.3 -Gtmp2.grd
gmt surface uniform_pga_${KEY}_50_mean_m_55.txt -R43.5/61.5/34/40 -I0.01 -T0.3 -Gtmp3.grd
gmt surface uniform_pga_${KEY}_50_mean_m_65.txt -R43.5/61.5/34/40 -I0.01 -T0.3 -Gtmp4.grd

gmt grdmath tmp1.grd tmp2.grd ADD tmp3.grd ADD tmp4.grd ADD 0.25 MUL = ${GRDFILE}

gmt grdimage ${GRDFILE} -R -JM5i -C${CPTFILE} -K -P -V > ${OUTFILE}
gmt grdcontour ${GRDFILE} -J -R -A0.2+f6p -W0.5p -O -K -V >> ${OUTFILE}
gmt psscale -C${CPTFILE} -D5.3i/1i/1.8i/0.15i -E -B0.1 -O -V >>${OUTFILE}

gmt ps2raster ${OUTFILE} -Fpga-uniform-${KEY}-all-avg.pdf -Tf -Au0.5c 

gmt grdimage ${GRDFILE} -R43.5/61.5/34/40 -JM5i -C${CPTFILE} -P -V > ${OUTFILE}

gmt ps2raster ${OUTFILE} -Fpga-uniform-${KEY}-all-avg.png -Tg -Au

rm tmp.cpt
rm tmp.grd tmp1.grd tmp2.grd
rm ${OUTFILE}

# Opening PDF
# ------------------------------------------------------------------------------

open -a Adobe\ Acrobat\ Pro.app pga-uniform-${KEY}-all-avg.pdf
