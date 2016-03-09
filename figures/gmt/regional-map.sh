
clear

rm gmt.conf gmt.history

# Set GMT constants
# ------------------------------------------------------------------------------

gmt gmtset FONT_LABEL               10

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

# Set script constants
# ------------------------------------------------------------------------------

OUTNAME=regional-map
PSNAME=${OUTNAME}.ps

# The large Map
# ------------------------------------------------------------------------------

# downloaded etopo2 file from noaa's web site
# then extracted our region of interest

# gmt grdsample ETOPO2v2g_i2_LSB.g98 -Gmytopo.grd -R32/74/24/50

gmt grdgradient mytopo.grd -A300 -Gmytopo.grad -Nt
gmt grdhisteq mytopo.grad -Gmytopo.hist -N
gmt grdmath mytopo.hist 4.7 DIV = mytopo.norm

gmt psbasemap -R32/72/24/48 -JM4i -BWneS -Ba8f4 -V -P -K > ${PSNAME}

# gmt grdimage mytopo.grd -R -J -B -Imytopo.norm -Cgray -t50 -V -O -K >> ${PSNAME}
gmt grdimage mytopo.grd -R -J -B -Imytopo.norm -Ccolored_relief.cpt -V -O -K >> ${PSNAME}

gmt pscoast -R -J -Bwnes -Dh -W0.25p -N1/0.25p -A500 -V -P -O -K >> ${PSNAME}
gmt pscoast -R -J -B -Slightblue -A500 -Dh -W0.25p -V -P -O -K >> ${PSNAME}

# Region of Interest Box
# ------------------------------------------------------------------------------

gmt psxy -W0.75 -R -J -B -V -O -K >> ${PSNAME} << END
43.5	34
43.5	40
61.5    40
61.5    34
43.5	34
END

gmt psxy -W0.5,black,- -R -J -B -V -O -K >> ${PSNAME} << END
43		33.5
43		40.5
62		40.5
62		33.5
43		33.5
END

# The small Map
# ------------------------------------------------------------------------------

gmt grdgradient mytopo.grd -A300 -Gmytopo.grad -Nt
gmt grdhisteq mytopo.grad -Gmytopo.hist -N
gmt grdmath mytopo.hist 3 DIV = mytopo.norm

gmt psbasemap -R43.5/61.5/34/40 -JM5i -BWneS -Ba2f1 -Y3.5i -V -O -K >> ${PSNAME}

# gmt grdimage mytopo.grd -R -J -B -Imytopo.norm -Cgray -t50 -V -O -K >> ${PSNAME}
gmt grdimage mytopo.grd -R -J -B -Imytopo.norm -Ccolored_relief.cpt -V -O -K >> ${PSNAME}

gmt pscoast -R -J -Bwnes -Dh -W0.25p -N1/0.25p -A500 -V -P -O -K >> ${PSNAME}
gmt pscoast -R -J -B -Slightblue -A500 -Dh -W0.25p -V -P -O -K >> ${PSNAME}

gmt psxy flt2cg.gmt -R -J -B -W0.5p,red -V -P -O -K >> ${PSNAME}

gmt psxy -Sc5p -W0.5p,black -Gyellow -R -J -B -V -O -K >> ${PSNAME} << END
51.4231 35.6961
59.6000 36.3000
46.3000 38.0667
51.0103 35.8356
50.8764 34.6400
45.0725 37.5553
49.5831 37.2808
48.2833 38.2500
END

gmt pstext -R -J -B -D5p/0p -N -V -O >> ${PSNAME} << END
51.4231 35.6961 8 0 1 TL Theran
59.6000 36.3000 8 0 1 TR Mashhad
46.3000 38.0667 8 0 1 BR Tabriz
51.0103 35.8356 8 0 1 BR Karaj
50.8764 34.6400 8 0 1 TL Qom
45.0725 37.5553 8 0 1 TR Urmia
49.5831 37.2808 8 0 1 TL Rasht
48.2833 38.2500 8 0 1 TL Ardabil
END

# Creating PDF
# ------------------------------------------------------------------------------

gmt ps2raster ${PSNAME} -Tf -Au0.25c
rm ${PSNAME}

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
