#!/bin/bash
tapedir=/Users/njlindsey/MATLAB/compearth/momenttensor/plot/gmt
gmt gmtset PAPER_MEDIA letter PAGE_ORIENTATION portrait MEASURE_UNIT inch BASEMAP_TYPE plain PLOT_DEGREE_FORMAT D TICK_LENGTH 0.0c LABEL_FONT_SIZE 10 ANOT_FONT_SIZE 10 HEADER_FONT 1 ANOT_FONT 1 LABEL_FONT 1 HEADER_FONT_SIZE 18 FRAME_PEN 2p TICK_PEN 2p
gmt psbasemap -JH0/2.8i -R-30/30/-90/90 -Ba10f5g10:" ":/a10f5g10:" ":wesn -G200 -K -V -X2.5 -Y0.5 > lune_hammer_iplot1.ps
awk '{print $1,$2}' $tapedir/dfiles//sourcetype_patch_01.dat | gmt psxy -G120 -J -R -K -O -V >>lune_hammer_iplot1.ps
awk '{print $1,$2}' $tapedir/dfiles//sourcetype_patch_02.dat | gmt psxy -G255 -J -R -K -O -V >>lune_hammer_iplot1.ps
gmt psbasemap -JH0/2.8i -R-30/30/-90/90 -Ba10f5g10:" ":/a10f5g10:" ":wesn -K -O -V >> lune_hammer_iplot1.ps
awk '{print $1,$2}' $tapedir/dfiles//sourcetype_arc_03.dat | gmt psxy -W2p,0 -J -R -K -O -V >>lune_hammer_iplot1.ps
awk '{print $1,$2}' $tapedir/dfiles//sourcetype_arc_04.dat | gmt psxy -W2p,0 -J -R -K -O -V >>lune_hammer_iplot1.ps
awk '{print $1,$2}' .$tapedir/dfiles//sourcetype_arc_05.dat | gmt psxy -W2p,0 -W2p,50/205/50 -J -R -K -O -V >>lune_hammer_iplot1.ps
awk '{print $1,$2}' $tapedir/dfiles//sourcetype_arc_06.dat | gmt psxy -W2p,0 -J -R -K -O -V >>lune_hammer_iplot1.ps
# gmt psxy -N -Sp8p -W1p,0 -J -R -K -O -V >>lune_hammer_iplot1.ps<<EOF
# 0.0000 -90.0000
# EOF
# gmt pstext -N -J -R -K -O -V -D0.00p/-10.00p >>lune_hammer_iplot1.ps<<EOF
# 0.0000 -90.0000 12 0 1 CT (-1,-1,-1)
# EOF
# gmt psxy -N -Sp8p -W1p,0 -J -R -K -O -V >>lune_hammer_iplot1.ps<<EOF
# -30.0000 -54.7356
# EOF
# gmt pstext -N -J -R -K -O -V -D-10.00p/0.00p >>lune_hammer_iplot1.ps<<EOF
# -30.0000 -54.7356 12 0 1 RM (0,-1,-1)
# EOF
# gmt psxy -N -Sp8p -W1p,0 -J -R -K -O -V >>lune_hammer_iplot1.ps<<EOF
# -30.0000 0.0000
# EOF
# gmt pstext -N -J -R -K -O -V -D-10.00p/0.00p >>lune_hammer_iplot1.ps<<EOF
# -30.0000 0.0000 12 0 1 RM (2,-1,-1)
# EOF
# gmt psxy -N -Sp8p -W1p,0 -J -R -K -O -V >>lune_hammer_iplot1.ps<<EOF
# -30.0000 35.2644
# EOF
# gmt pstext -N -J -R -K -O -V -D-10.00p/0.00p >>lune_hammer_iplot1.ps<<EOF
# -30.0000 35.2644 12 0 1 RM (1,0,0)
# EOF
# gmt psxy -N -Sp8p -W1p,0 -J -R -K -O -V >>lune_hammer_iplot1.ps<<EOF
# 0.0000 90.0000
# EOF
# gmt pstext -N -J -R -K -O -V -D0.00p/10.00p >>lune_hammer_iplot1.ps<<EOF
# 0.0000 90.0000 12 0 1 CB (1,1,1)
# EOF
# gmt psxy -N -Sp8p -W1p,0 -J -R -K -O -V >>lune_hammer_iplot1.ps<<EOF
# 30.0000 54.7356
# EOF
# gmt pstext -N -J -R -K -O -V -D10.00p/0.00p >>lune_hammer_iplot1.ps<<EOF
# 30.0000 54.7356 12 0 1 LM (1,1,0)
# EOF
# gmt psxy -N -Sp8p -W1p,0 -J -R -K -O -V >>lune_hammer_iplot1.ps<<EOF
# 30.0000 0.0000
# EOF
# gmt pstext -N -J -R -K -O -V -D10.00p/0.00p >>lune_hammer_iplot1.ps<<EOF
# 30.0000 0.0000 12 0 1 LM (1,1,-2)
# EOF
# gmt psxy -N -Sp8p -W1p,0 -J -R -K -O -V >>lune_hammer_iplot1.ps<<EOF
# 30.0000 -35.2644
# EOF
# gmt pstext -N -J -R -K -O -V -D10.00p/0.00p >>lune_hammer_iplot1.ps<<EOF
# 30.0000 -35.2644 12 0 1 LM (0,0,-1)
# EOF
# gmt psxy -N -Sp8p -W1p,0 -J -R -K -O -V >>lune_hammer_iplot1.ps<<EOF
# -30.0000 60.5038
# EOF
# gmt pstext -N -J -R -K -O -V -D-10.00p/0.00p >>lune_hammer_iplot1.ps<<EOF
# -30.0000 60.5038 12 0 1 RM (3,1,1)
# EOF
# gmt psxy -N -Sp8p -W1p,0 -J -R -K -O -V >>lune_hammer_iplot1.ps<<EOF
# 30.0000 -60.5038
# EOF
# gmt pstext -N -J -R -K -O -V -D10.00p/0.00p >>lune_hammer_iplot1.ps<<EOF
# 30.0000 -60.5038 12 0 1 LM (-1,-1,-3)
# EOF
awk '{print $1,$2}' $tapedir/dfiles//sourcetype_gdvw_Walter2010.dat | gmt psxy -N -Sc6p -W0.5p,0/0/0 -G160/32/240 -J -R -K -O -V >> lune_hammer_iplot1.ps
awk '{print $1,$2}' $tapedir/dfiles//sourcetype_gdvw_Walter2009.dat | gmt psxy -N -Sc6p -W0.5p,0/0/0 -G50/205/50 -J -R -K -O -V >> lune_hammer_iplot1.ps
awk '{print $1,$2}' $tapedir/dfiles//sourcetype_gdvw_Ford2009.dat | gmt psxy -N -Sc6p -W0.5p,0/0/0 -G200 -J -R -K -O -V >> lune_hammer_iplot1.ps
awk '{print $1,$2}' $tapedir/dfiles//sourcetype_gdvw_Minson2007.dat | gmt psxy -N -Sc6p -W0.5p,0/0/0 -G0/255/255 -J -R -K -O -V >> lune_hammer_iplot1.ps
awk '{print $1,$2}' $tapedir/dfiles//sourcetype_gdvw_Foulger2004.dat | gmt psxy -N -Sc6p -W0.5p,0/0/0 -G255/165/0 -J -R -K -O -V >> lune_hammer_iplot1.ps
# gmt psxy -N -Sc6p -W0.5p,0/0/0 -G160/32/240 -R0/1/0/1 -JX1i -Xa-2.0 -Ya6.5 -K -O -V >>lune_hammer_iplot1.ps<<EOF
# 0 1.2
# EOF
# gmt pstext -N -R0/1/0/1 -JX1i -Xa-2.0 -Ya6.5 -K -O -V >>lune_hammer_iplot1.ps<<EOF
#  0.2 1.2 12 0 1 LM Walter2010 (n=14)
# EOF
# gmt psxy -N -Sc6p -W0.5p,0/0/0 -G50/205/50 -R0/1/0/1 -JX1i -Xa-2.0 -Ya6.5 -K -O -V >>lune_hammer_iplot1.ps<<EOF
# 0 0.9
# EOF
# gmt pstext -N -R0/1/0/1 -JX1i -Xa-2.0 -Ya6.5 -K -O -V >>lune_hammer_iplot1.ps<<EOF
#  0.2 0.9 12 0 1 LM Walter2009 (n=13)
# EOF
# gmt psxy -N -Sc6p -W0.5p,0/0/0 -G200 -R0/1/0/1 -JX1i -Xa-2.0 -Ya6.5 -K -O -V >>lune_hammer_iplot1.ps<<EOF
# 0 0.6
# EOF
# gmt pstext -N -R0/1/0/1 -JX1i -Xa-2.0 -Ya6.5 -K -O -V >>lune_hammer_iplot1.ps<<EOF
#  0.2 0.6 12 0 1 LM Ford2009 (n=32)
# EOF
# gmt psxy -N -Sc6p -W0.5p,0/0/0 -G0/255/255 -R0/1/0/1 -JX1i -Xa-2.0 -Ya6.5 -K -O -V >>lune_hammer_iplot1.ps<<EOF
# 0 0.3
# EOF
# gmt pstext -N -R0/1/0/1 -JX1i -Xa-2.0 -Ya6.5 -K -O -V >>lune_hammer_iplot1.ps<<EOF
#  0.2 0.3 12 0 1 LM Minson2007 (n=18)
# EOF
# gmt psxy -N -Sc6p -W0.5p,0/0/0 -G255/165/0 -R0/1/0/1 -JX1i -Xa-2.0 -Ya6.5 -K -O -V >>lune_hammer_iplot1.ps<<EOF
# 0 0
# EOF
# gmt pstext -N -R0/1/0/1 -JX1i -Xa-2.0 -Ya6.5 -K -O -V >>lune_hammer_iplot1.ps<<EOF
#  0.2 0 12 0 1 LM Foulger2004 (n=26)
# EOF
gmt psxy -R -J  -O -T -V >> lune_hammer_iplot1.ps
