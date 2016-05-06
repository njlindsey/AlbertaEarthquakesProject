#!/bin/bash
# MOMENT TENSOR DEPTH ANALYSIS SCRIPT
# NATE LINDSEY April 2016

# SETUP FILES
outfile_dev=cmtDepth.out
outfile_full=cmtDepth_full.out
temp=cmtDepth.temp
plot=cmtDepth.ps

# CLEAR FILES
> $outfile_dev
> $temp
> $plot

# COPY inversion input to scratch
cp mt_inv.in mt_inv_saved.in

# LOOP to change Z and run inversion
for i in {1..10}; do
  # MOD mt_inv.in
  sed -i .bup "1 s/4 .* 1 5 1/4 $i 1 5 1/" mt_inv.in #deviotoriconly
  #sed -i .bup "1 s/4 .* 1 6 1/4 $i 1 6 1/" mt_inv.in #fullsolution
  sed -i .bup "6 s/_206d.* /_206d$i /" mt_inv.in
  sed -i .bup "7 s/_241d.* /_241d$i /" mt_inv.in
  sed -i .bup "8 s/_258d.* /_258d$i /" mt_inv.in
  sed -i .bup "9 s/_270d.* /_270d$i /" mt_inv.in
  # RUN TDMT_INVC_ISO
  tdmt_invc_iso mt_inv.in
  # AWK TDMT_RESULT.OUT FOR z, VR, st1, rk1, dp1, st2, rk3, dp2
  awk 'NR==2' tdmt_result.out | awk '{print -$1,$3}' >> $temp
  awk 'NR==6' tdmt_result.out | awk '{print $1,$2,$3,$4,$5,$6}' >> $temp
done

# MUNGE RESULTS TABLE
awk "NR==1,EOF" $temp | sed "N;s/\n/ /" >> $outfile_dev
rm $temp

# PLOT CMTDEPTH beachballs in GMT OVER Velocity Models
# AXIS1 -- Velocity Models
gmt psbasemap -R0/8.5/-25/0 -JX12/20 -BS -Bx1 -X0 -K > $plot
gmt psxy -R -JX -Ba10f1:"Seismic Velocity [km/s]":/:"Z [km]":a10f1WSne -P -W2p,red,- -K -X3 -Y5 << END >> $plot
##Herrmann Vs
>>
3.406 0
3.406 -1.9
>>
3.406 -1.9
5.544 -1.9
>>
5.544 -1.9
5.544 -8.0
>>
5.544 -8.0
6.271 -8.0
>>
6.271 -8.0
6.271 -20.9
>>
6.271 -20.9
6.407 -20.9
>>
6.407 -20.9
6.407 -39.9
>>
6.407 -39.9
7.407 -39.9
>>
7.407 -39.9
7.407 -600
END
gmt psxy -R -JX -Ba10f1/a10f1WSne -P -W2p,red -O -K << END >> $plot
##Herrmann Vp
2.009 0
2.009 -1.9
>>
2.009 -1.9
3.295 -1.9
>>
3.295 -1.9
3.295 -8.0
>>
3.295 -8.0
3.739 -8.0
>>
3.739 -8.0
3.739 -20.9
>>
3.739 -20.9
3.768 -20.9
>>
3.768 -20.9
3.768 -39.9
>>
3.768 -39.9
4.768 -39.9
>>
4.768 -39.9
4.768 -600
END
gmt psxy -R -JX -Ba10f1/a10f1WSne -P -W2p,blue,- -O -K << END >> $plot
##Zhang et al 2016 Vs
2.5 0
2.5 -1.5
>>
2.5 -1.5
4.3 -1.5
>>
4.3 -1.5
4.3 -3
>>
4.3 -3
6.1 -3
>>
6.1 -3
6.1 -32.5
>>
6.1 -32.5
7.15 -32.5
>>
7.15 -32.5
7.15 -46
>>
7.15 -46
8.1 -46
>>
8.1 -46
8.1 -65
END
gmt psxy -R -JX -Ba10f1/a10f1WSne -P -W2p,blue -O -K << END >> $plot
##Zhang et al 2016 Vs
1.25 0
1.25 -1.5
>>
1.25 -1.5
2.20 -1.5
>>
2.20 -1.5
2.20 -3
>>
2.20 -3
3.6 -3
>>
3.6 -3
3.6 -32.5
>>
3.6 -32.5
4 -32.5
>>
4 -32.5
4 -46
>>
4 -46
4.8 -46
>>
4.8 -46
4.8 -65
END


# AXIS2 -- CMT DEPTH FITS
gmt psbasemap -R0/40/-25/0 -JX12/20 -Ba10f1:"Variance Reduction":/a10f1wsNe -K -O >> $plot
for i in {2..25}; do
  awk "NR==$i" $outfile_dev | awk '{print $2,$1,10,$3,$5,$4,$6,$8,$7,1,2,$2,$1}' |\
    gmt psmeca -R -J -Sc.25 -K -O -Ggreen >> $plot
  awk "NR==$i" $outfile_full | awk '{print $2,$1,10,$3,$5,$4,$6,$8,$7,1,2,$2,$1}' |\
    gmt psmeca -R -J -Sc.25 -K -O -Gblue >> $plot
done
echo "" | gmt psxy -R -J -Sc.3 -O >> $plot
