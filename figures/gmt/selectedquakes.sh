
clear

rm gmt.conf gmt.history

# Set GMT constants
# ------------------------------------------------------------------------------

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

# Set script constants
# ------------------------------------------------------------------------------

OUTNAME=selectedquakes
PSNAME=${OUTNAME}.ps

# Top Map - Notable
# ------------------------------------------------------------------------------

gmt grdgradient mytopo.grd -A300 -Gmytopo.grad -Nt
gmt grdhisteq mytopo.grad -Gmytopo.hist -N
gmt grdmath mytopo.hist 3 DIV = mytopo.norm

gmt psbasemap -R43.5/61.5/34/40 -JM5i -BWneS -Ba2f1 -Y8i -V -P -K > ${PSNAME}
gmt grdimage mytopo.grd -R -J -Bwnes -Imytopo.norm -Cgray -t50 -V -O -K >> ${PSNAME}
gmt pscoast -R -J -B -Dh -W0.25p -N1/0.25p -A500 -V -P -O -K >> ${PSNAME}
gmt pscoast -R -J -B -Slightblue -A500 -Dh -W0.25p -V -P -O -K >> ${PSNAME}

gmt psxy -Sa8p -W0.35p,black -Gyellow -R -J -B -V -O -K >> ${PSNAME} << END
46.3	38.1
46.3	38.1
45.5	38.5
46.7	37.9
46.0	38.2
45.6	38.3
45.2	38.3
47.9	37.8
48.05	38.08
46.87	38.55
49.35	36.99
51.1	36
50.7	35.7
52.1	35.7
52.5	35.7
58.44	37.79
58.3	38
END

gmt pstext -R -J -B -D5p -N -V -O >> ${PSNAME} << END
46.30	38.10	 8 0 1 TL	M6.0	858
46.30	38.10	 8 0 1 TL	M7.6	1042
45.50	38.50	 8 0 1 TL	M6.7	1304
46.70	37.90	 8 0 1 TL	M7.7	1721
46.00	38.20	 8 0 1 TL	M7.6	1780
45.60	38.30	 8 0 1 TL	M6.3	1786
45.20	38.30	 8 0 1 TL	M5.5	1807
47.90	37.80	 8 0 1 TL	M6.7	1879
48.05	38.08	 8 0 1 TL	M6.1	1997
46.87	38.55	 8 0 1 TL	M6.4	2012
49.35	36.99	 8 0 1 TL	M7.4	1990
51.10	36.00	 8 0 1 TL	M7.7	958
50.70	35.70	 8 0 1 TL	M7.1	1177
52.10	35.70	 8 0 1 TL	M6.5	1665
52.50	35.70	 8 0 1 TL	M7.1	1830
58.44	37.79	 8 0 1 TL	M7.3	1948
58.30	38.00	 8 0 1 TL	M7.1	10
END

# Creating PDF
# ------------------------------------------------------------------------------

gmt ps2raster ${PSNAME} -Tf -Au0.25c
rm ${PSNAME}
rm data.txt
rm mytopo.grad
rm mytopo.hist
rm mytopo.norm

# Opening PDF
# ------------------------------------------------------------------------------

open -a Adobe\ Acrobat\ Pro.app ${OUTNAME}.pdf

