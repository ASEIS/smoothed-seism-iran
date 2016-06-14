
clear

# Set GMT constants
# ------------------------------------------------------------------------------

gmt gmtset FONT               = 8

gmt gmtset MAP_FRAME_PEN            = 0.75p,black
gmt gmtset MAP_FRAME_WIDTH          = 0.75p
gmt gmtset MAP_TICK_PEN_PRIMARY     = 0.75p
gmt gmtset MAP_GRID_PEN_PRIMARY     = 0.75p
gmt gmtset MAP_TICK_PEN_PRIMARY     = 0.75p
gmt gmtset MAP_TICK_LENGTH_PRIMARY  = 6p/3p
gmt gmtset MAP_LABEL_OFFSET         = 8p
gmt gmtset MAP_ANNOT_OFFSET_PRIMARY = 5p

MINYR=0
MAXYR=2020
 MAXN=100

# Assign static files data
# ------------------------------------------------------------------------------

AZER=azerbaijan
ALBO=alborz
KOPE=kopeh-dagh
ZAGR=zagros
CENT=central-east

OUTPUTNAME=completeness
OUTPUTFILE=${OUTPUTNAME}.ps

# ==============================================================================================================
# PREPARING ALL THE DATA
# ==============================================================================================================

awk -F' ' '{print $1, $2}' ${AZER}.txt > ${AZER}.tmp
awk -F' ' '{print $1, $2}' ${ALBO}.txt > ${ALBO}.tmp
awk -F' ' '{print $1, $2}' ${KOPE}.txt > ${KOPE}.tmp
awk -F' ' '{print $1, $2}' ${ZAGR}.txt > ${ZAGR}.tmp
awk -F' ' '{print $1, $2}' ${CENT}.txt > ${CENT}.tmp

gmt psbasemap -JX3i/2i -BWeSn -R1950/${MAXYR}/0/1650 -Y5i -K -P -V > ${OUTPUTFILE}

gmt psxy ${AZER}.tmp -J -B -R  -W1p,red -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ALBO}.tmp -J -B -R  -W1p,blue -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${KOPE}.tmp -J -B -R  -W1p,cyan -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ZAGR}.tmp -J -B -R  -W1p,green -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${CENT}.tmp -J -B -R  -W1p,magenta -K -O -P -V >> ${OUTPUTFILE}

gmt psbasemap -J -Bxaf+l"Year" -Byaf+l"Cumulative Num. of Events" -BWeSn -R -K -O -P -V >> ${OUTPUTFILE}

awk -F' ' '{print $1, $3}' ${AZER}.txt > ${AZER}.tmp
awk -F' ' '{print $1, $3}' ${ALBO}.txt > ${ALBO}.tmp
awk -F' ' '{print $1, $3}' ${KOPE}.txt > ${KOPE}.tmp
awk -F' ' '{print $1, $3}' ${ZAGR}.txt > ${ZAGR}.tmp
awk -F' ' '{print $1, $3}' ${CENT}.txt > ${CENT}.tmp

gmt psbasemap -JX3i/2i -BWeSn -R1600/${MAXYR}/0/1200 -Y2.6i -K -O -P -V >> ${OUTPUTFILE}

gmt psxy ${AZER}.tmp -J -B -R  -W1p,red -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ALBO}.tmp -J -B -R  -W1p,blue -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${KOPE}.tmp -J -B -R  -W1p,cyan -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ZAGR}.tmp -J -B -R  -W1p,green -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${CENT}.tmp -J -B -R  -W1p,magenta -K -O -P -V >> ${OUTPUTFILE}

gmt psbasemap -J -Bxaf -Byaf+l"Cumulative Num. of Events" -BWeSn -R -K -O -P -V >> ${OUTPUTFILE}

awk -F' ' '{print $1, $4}' ${AZER}.txt > ${AZER}.tmp
awk -F' ' '{print $1, $4}' ${ALBO}.txt > ${ALBO}.tmp
awk -F' ' '{print $1, $4}' ${KOPE}.txt > ${KOPE}.tmp
awk -F' ' '{print $1, $4}' ${ZAGR}.txt > ${ZAGR}.tmp
awk -F' ' '{print $1, $4}' ${CENT}.txt > ${CENT}.tmp

gmt psbasemap -JX3i/2i -BWeSn -R800/${MAXYR}/0/400 -X3.6i -K -O -P -V >> ${OUTPUTFILE}

gmt psxy ${AZER}.tmp -J -B -R  -W1p,red -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ALBO}.tmp -J -B -R  -W1p,blue -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${KOPE}.tmp -J -B -R  -W1p,cyan -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ZAGR}.tmp -J -B -R  -W1p,green -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${CENT}.tmp -J -B -R  -W1p,magenta -K -O -P -V >> ${OUTPUTFILE}

gmt psbasemap -J -Bxaf -Byaf -BWeSn -R -K -O -P -V >> ${OUTPUTFILE}

awk -F' ' '{print $1, $5}' ${AZER}.txt > ${AZER}.tmp
awk -F' ' '{print $1, $5}' ${ALBO}.txt > ${ALBO}.tmp
awk -F' ' '{print $1, $5}' ${KOPE}.txt > ${KOPE}.tmp
awk -F' ' '{print $1, $5}' ${ZAGR}.txt > ${ZAGR}.tmp
awk -F' ' '{print $1, $5}' ${CENT}.txt > ${CENT}.tmp

gmt psbasemap -JX3i/2i -BWeSn -R-500/${MAXYR}/0/60 -Y-2.6i -K -O -P -V >> ${OUTPUTFILE}

gmt psxy ${AZER}.tmp -J -B -R  -W1p,red -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ALBO}.tmp -J -B -R  -W1p,blue -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${KOPE}.tmp -J -B -R  -W1p,cyan -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ZAGR}.tmp -J -B -R  -W1p,green -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${CENT}.tmp -J -B -R  -W1p,magenta -K -O -P -V >> ${OUTPUTFILE}

gmt psbasemap -J -Bxaf+l"Year" -Byaf -BWeSn -R -O -P -V >> ${OUTPUTFILE}

# Converting to EPS and PDF
# ------------------------------------------------------------------------------

gmt ps2raster ${OUTPUTFILE} -Tf -Au0.1c -F${OUTPUTNAME}.pdf

# Opening PDF
# ------------------------------------------------------------------------------

# open -a Adobe\ Acrobat\ Pro.app /Users/shima/Documents/Shima/Research/GOF-plot/${METRIC}/${RUN}/2-${RUN}-${METRIC}-${COLUMN}.pdf
open -a Adobe\ Acrobat\ Pro.app ${OUTPUTNAME}.pdf

rm *.tmp
