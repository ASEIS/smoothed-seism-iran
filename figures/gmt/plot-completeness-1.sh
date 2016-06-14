
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

# Read arguments
# ------------------------------------------------------------------------------

  MAG=$1
MINYR=$2
MAXYR=$3
 MAXN=$4

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


# Captures the columns necessary for plotting
# ------------------------------------------------------------------------------

awk -F' ' '{print $1, $'$1'}' ${AZER}.txt > ${AZER}.tmp
awk -F' ' '{print $1, $'$1'}' ${ALBO}.txt > ${ALBO}.tmp
awk -F' ' '{print $1, $'$1'}' ${KOPE}.txt > ${KOPE}.tmp
awk -F' ' '{print $1, $'$1'}' ${ZAGR}.txt > ${ZAGR}.tmp
awk -F' ' '{print $1, $'$1'}' ${CENT}.txt > ${CENT}.tmp


# ==============================================================================================================
# COMPLETE PLOT IN PDF
# ==============================================================================================================

gmt psbasemap -JX3i/2i -BWeSn -R${MINYR}/${MAXYR}/0/${MAXN} -Y5i -K -P -V > ${OUTPUTFILE}

gmt psxy ${AZER}.tmp -J -B -R  -W1p,red -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ALBO}.tmp -J -B -R  -W1p,blue -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${KOPE}.tmp -J -B -R  -W1p,cyan -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ZAGR}.tmp -J -B -R  -W1p,green -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${CENT}.tmp -J -B -R  -W1p,magenta -K -O -P -V >> ${OUTPUTFILE}

gmt psbasemap -J -Bxaf+l"Year" -Byaf+l"Cumulative Num. of Events" -BWeSn -R -K -O -P -V >> ${OUTPUTFILE}

gmt psbasemap -JX3i/2i -BWeSn -R${MINYR}/${MAXYR}/0/${MAXN} -Y2.6i -K -O -P -V >> ${OUTPUTFILE}

gmt psxy ${AZER}.tmp -J -B -R  -W1p,red -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ALBO}.tmp -J -B -R  -W1p,blue -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${KOPE}.tmp -J -B -R  -W1p,cyan -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ZAGR}.tmp -J -B -R  -W1p,green -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${CENT}.tmp -J -B -R  -W1p,magenta -K -O -P -V >> ${OUTPUTFILE}

gmt psbasemap -J -Bxaf -Byaf+l"Cumulative Num. of Events" -BWeSn -R -K -O -P -V >> ${OUTPUTFILE}

gmt psbasemap -JX3i/2i -BWeSn -R${MINYR}/${MAXYR}/0/${MAXN} -X3.6i -K -O -P -V >> ${OUTPUTFILE}

gmt psxy ${AZER}.tmp -J -B -R  -W1p,red -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ALBO}.tmp -J -B -R  -W1p,blue -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${KOPE}.tmp -J -B -R  -W1p,cyan -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ZAGR}.tmp -J -B -R  -W1p,green -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${CENT}.tmp -J -B -R  -W1p,magenta -K -O -P -V >> ${OUTPUTFILE}

gmt psbasemap -J -Bxaf -Byaf -BWeSn -R -K -O -P -V >> ${OUTPUTFILE}

gmt psbasemap -JX3i/2i -BWeSn -R${MINYR}/${MAXYR}/0/${MAXN} -Y-2.6i -K -O -P -V >> ${OUTPUTFILE}

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
