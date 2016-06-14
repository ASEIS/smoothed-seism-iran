
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
MAXYR=2016
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

awk 'FNR==NR{max=($2+0>max)?$2:max;next} {print $1,$2/max}' ${AZER}.txt ${AZER}.txt > ${AZER}.tmp
awk 'FNR==NR{max=($2+0>max)?$2:max;next} {print $1,$2/max}' ${ALBO}.txt ${ALBO}.txt > ${ALBO}.tmp
awk 'FNR==NR{max=($2+0>max)?$2:max;next} {print $1,$2/max}' ${KOPE}.txt ${KOPE}.txt > ${KOPE}.tmp
awk 'FNR==NR{max=($2+0>max)?$2:max;next} {print $1,$2/max}' ${ZAGR}.txt ${ZAGR}.txt > ${ZAGR}.tmp
awk 'FNR==NR{max=($2+0>max)?$2:max;next} {print $1,$2/max}' ${CENT}.txt ${CENT}.txt > ${CENT}.tmp

gmt psbasemap -JX3i/2i -BWeSn -R1950/${MAXYR}/0/1 -Y7.55i -K -P -V > ${OUTPUTFILE}

gmt psxy ${AZER}.tmp -J -B -R  -W1p,red -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ALBO}.tmp -J -B -R  -W1p,blue -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${KOPE}.tmp -J -B -R  -W1p,cyan -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ZAGR}.tmp -J -B -R  -W1p,green -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${CENT}.tmp -J -B -R  -W1p,magenta -K -O -P -V >> ${OUTPUTFILE}

gmt psbasemap -J -Bxa10f5 -Byaf+l"Cumulative Num. of Events" -BWeSn -R -K -O -P -V >> ${OUTPUTFILE}

# ==============================================================================================================

awk 'FNR==NR{max=($3+0>max)?$3:max;next} {print $1,$3/max}' ${AZER}.txt ${AZER}.txt > ${AZER}.tmp
awk 'FNR==NR{max=($3+0>max)?$3:max;next} {print $1,$3/max}' ${ALBO}.txt ${ALBO}.txt > ${ALBO}.tmp
awk 'FNR==NR{max=($3+0>max)?$3:max;next} {print $1,$3/max}' ${KOPE}.txt ${KOPE}.txt > ${KOPE}.tmp
awk 'FNR==NR{max=($3+0>max)?$3:max;next} {print $1,$3/max}' ${ZAGR}.txt ${ZAGR}.txt > ${ZAGR}.tmp
awk 'FNR==NR{max=($3+0>max)?$3:max;next} {print $1,$3/max}' ${CENT}.txt ${CENT}.txt > ${CENT}.tmp

gmt psbasemap -JX3i/2i -BWeSn -R1900/${MAXYR}/0/1 -X3.55i -K -O -P -V >> ${OUTPUTFILE}

gmt psxy ${AZER}.tmp -J -B -R  -W1p,red -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ALBO}.tmp -J -B -R  -W1p,blue -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${KOPE}.tmp -J -B -R  -W1p,cyan -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ZAGR}.tmp -J -B -R  -W1p,green -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${CENT}.tmp -J -B -R  -W1p,magenta -K -O -P -V >> ${OUTPUTFILE}

gmt psbasemap -J -Bxa20f10 -Byaf -BweSn -R -K -O -P -V >> ${OUTPUTFILE}

# ==============================================================================================================

awk 'FNR==NR{max=($4+0>max)?$4:max;next} {print $1,$4/max}' ${AZER}.txt ${AZER}.txt > ${AZER}.tmp
awk 'FNR==NR{max=($4+0>max)?$4:max;next} {print $1,$4/max}' ${ALBO}.txt ${ALBO}.txt > ${ALBO}.tmp
awk 'FNR==NR{max=($4+0>max)?$4:max;next} {print $1,$4/max}' ${KOPE}.txt ${KOPE}.txt > ${KOPE}.tmp
awk 'FNR==NR{max=($4+0>max)?$4:max;next} {print $1,$4/max}' ${ZAGR}.txt ${ZAGR}.txt > ${ZAGR}.tmp
awk 'FNR==NR{max=($4+0>max)?$4:max;next} {print $1,$4/max}' ${CENT}.txt ${CENT}.txt > ${CENT}.tmp

gmt psbasemap -JX3i/2i -BWeSn -R1700/${MAXYR}/0/1 -X-3.55i -Y-2.55i -K -O -P -V >> ${OUTPUTFILE}

gmt psxy ${AZER}.tmp -J -B -R  -W1p,red -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ALBO}.tmp -J -B -R  -W1p,blue -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${KOPE}.tmp -J -B -R  -W1p,cyan -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ZAGR}.tmp -J -B -R  -W1p,green -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${CENT}.tmp -J -B -R  -W1p,magenta -K -O -P -V >> ${OUTPUTFILE}

gmt psbasemap -J -Bxa50f25+l"Year" -Byaf+l"Cumulative Num. of Events" -BWeSn -R -K -O -P -V >> ${OUTPUTFILE}

# ==============================================================================================================

awk 'FNR==NR{max=($5+0>max)?$5:max;next} {print $1,$5/max}' ${AZER}.txt ${AZER}.txt > ${AZER}.tmp
awk 'FNR==NR{max=($5+0>max)?$5:max;next} {print $1,$5/max}' ${ALBO}.txt ${ALBO}.txt > ${ALBO}.tmp
awk 'FNR==NR{max=($5+0>max)?$5:max;next} {print $1,$5/max}' ${KOPE}.txt ${KOPE}.txt > ${KOPE}.tmp
awk 'FNR==NR{max=($5+0>max)?$5:max;next} {print $1,$5/max}' ${ZAGR}.txt ${ZAGR}.txt > ${ZAGR}.tmp
awk 'FNR==NR{max=($5+0>max)?$5:max;next} {print $1,$5/max}' ${CENT}.txt ${CENT}.txt > ${CENT}.tmp

gmt psbasemap -JX3i/2i -BWeSn -R800/${MAXYR}/0/1 -X3.55i -K -O -P -V >> ${OUTPUTFILE}

gmt psxy ${AZER}.tmp -J -B -R  -W1p,red -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ALBO}.tmp -J -B -R  -W1p,blue -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${KOPE}.tmp -J -B -R  -W1p,cyan -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${ZAGR}.tmp -J -B -R  -W1p,green -K -O -P -V >> ${OUTPUTFILE}
gmt psxy ${CENT}.tmp -J -B -R  -W1p,magenta -K -O -P -V >> ${OUTPUTFILE}

gmt psbasemap -J -Bxa200f100+l"Year" -Byaf -BweSn -R -O -P -V >> ${OUTPUTFILE}

# ==============================================================================================================

# Converting to EPS and PDF
# ------------------------------------------------------------------------------

gmt ps2raster ${OUTPUTFILE} -Tf -Au0.1c -F${OUTPUTNAME}.pdf

# Opening PDF
# ------------------------------------------------------------------------------

# open -a Adobe\ Acrobat\ Pro.app /Users/shima/Documents/Shima/Research/GOF-plot/${METRIC}/${RUN}/2-${RUN}-${METRIC}-${COLUMN}.pdf
open -a Adobe\ Acrobat\ Pro.app ${OUTPUTNAME}.pdf

rm *.tmp
