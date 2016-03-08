
clear

# Set GMT constants
# ------------------------------------------------------------------------------

gmt gmtset FONT_LABEL               = 12

# gmt gmtset MAP_FRAME_PEN            = 0.75p,black
# gmt gmtset MAP_FRAME_WIDTH          = 0.75p
# gmt gmtset MAP_TICK_PEN_PRIMARY     = 0.75p
# gmt gmtset MAP_GRID_PEN_PRIMARY     = 0.75p
# gmt gmtset MAP_TICK_PEN_PRIMARY     = 0.75p
# gmt gmtset MAP_TICK_LENGTH_PRIMARY  = 6p/3p
# gmt gmtset MAP_LABEL_OFFSET         = 8p
# gmt gmtset MAP_ANNOT_OFFSET_PRIMARY = 5p

# Set script constants
# ------------------------------------------------------------------------------

OUTNAME=regional-map
PSNAME=${OUTNAME}.ps

LONMIN=36
LONMAX=72
LATMIN=22
LATMAX=42

REGION=$LONMIN/$LONMAX/$LATMIN/$LATMAX

# ------------------------------------------------------------------------------

gmt pscoast -R${REGION} -JM -Slightblue -G255/211/155 -Dh -W0.25p -B4 -N1/0.25p --FORMAT_GEO_MAP=dddF -V -P -K > ${PSNAME}

# Region of Interest
# ------------------------------------------------------------------------------

gmt psxy -W0.5 -R -JM -V -O >> ${PSNAME} << END
43.5	34
43.5	40
61.5    40
61.5    34
43.5	34
END

# Creating PDF
# ------------------------------------------------------------------------------

gmt ps2raster ${PSNAME} -Tf -Au0.1c

# Opening PDF
# ------------------------------------------------------------------------------

open -a Adobe\ Acrobat\ Pro.app ${OUTNAME}.pdf



# PROJ=-JM16
# MOREPS=-K
# CONTINUEPS="-K -O"
# ENDPS=-O
# DATASET=9
# DATAGRID=-I30c
# LINE=-W1

# grdraster $DATASET -G$world.grd $DATAGRID -R$REGION -V
# CPTFILE=/usr/local/GMT4.5.7/share/cpt/GMT_globe.cpt
# TOPOILLUM=220

# grdgradient $world.grd -A$TOPOILLUM -GETOPO5.intns -N2 -V  # in this case Dataset = 9
# #grdgradient $world.grd -A$TOPOILLUM -GETOPO30s.intns -N2 -V

# grdimage $world.grd -IETOPO5.intns -C$CPTFILE -R$REGION $PROJ -N2   -K  -Y1 -X8  >  $0.ps

# pscoast -R$REGION $PROJ -N1 -B10f5/10f5  -Lf45/23/23/1000 -K -O -W2 >> $0.ps
