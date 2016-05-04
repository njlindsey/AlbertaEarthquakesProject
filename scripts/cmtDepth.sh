#!/bin/bash
# MOMENT TENSOR DEPTH ANALYSIS SCRIPT
# NATE LINDSEY April 2016

# SETUP FILES
outfile=cmtDepth.out
temp=cmtDepth.temp
plot=cmtDepth.ps

# CLEAR FILES
> $outfile
> $temp
> $plot

# COPY inversion input to scratch
cp mt_inv.in mt_inv_saved.in

# LOOP to change Z and run inversion
for i in {1..25}; do
	# MOD mt_inv.in
  sed -i .bup "1 s/4 .* 1 6 1/4 $i 1 6 1/" mt_inv.in
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
awk "NR==1,EOF" $temp | sed "N;s/\n/ /" >> $outfile
rm $temp

# PLOT MT in GMT
gmt psxy -R0/10/-25/0 -JX12/20 -Ba1f1g1/a2f1g2WSne -P -K -X3 -Y5 << END > $plot
100 100
END
for i in {1..24}; do
  awk "NR==$i" $outfile | awk '{print $2,$1,10,$3,$4,$5,$6,$7,$8,1,2,$2,$1}'
  awk "NR==$i" $outfile | awk '{print $2,$1,10,$3,$4,$5,$6,$7,$8,1,2,$2,$1}' |\
    gmt psmeca -R -J -Sc2 -K -O >> $plot
done
awk "NR==25" $outfile | gmt psmeca -R -J -Sc.1 -O >> $plot
