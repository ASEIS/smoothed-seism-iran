
FILENAME=$1
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

# gmt makecpt -CcbcRdPu -Do -T0/1.0/0.05 > ${CPTFILE}
gmt makecpt -CcbcGreens -Do -T0/1.0/0.05 > ${CPTFILE}
# gmt makecpt -Ces_skywalker_18 -Do -T0/1.0/0.05 > ${CPTFILE}

gmt surface ${FILENAME}.txt -R43.5/61.5/34/40 -I0.01 -T0.3 -G${GRDFILE}

gmt grdimage ${GRDFILE} -R -JM5i -C${CPTFILE} -K -P -V > ${OUTFILE}
gmt grdcontour ${GRDFILE} -J -R -C0.2 -A0.2+f6p -W0.5p -O -K -V >> ${OUTFILE}
gmt psscale -C${CPTFILE} -D5.3i/1i/1.8i/0.15i -E -B0.1 -O -V >>${OUTFILE}

gmt ps2raster ${OUTFILE} -F${FILENAME}.pdf -Tf -Au0.5c 

gmt grdimage ${GRDFILE} -R43.5/61.5/34/40 -JM5i -C${CPTFILE} -P -V > ${OUTFILE}

gmt ps2raster ${OUTFILE} -F${FILENAME}.png -Tg -Au

rm tmp.cpt
rm tmp.grd
rm ${OUTFILE}

# Opening PDF
# ------------------------------------------------------------------------------

open -a Adobe\ Acrobat\ Pro.app ${FILENAME}.pdf
