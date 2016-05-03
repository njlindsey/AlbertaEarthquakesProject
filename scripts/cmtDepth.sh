#!/bin/bash
# MOMENT TENSOR DEPTH ANALYSIS SCRIPT
# NATE LINDSEY April 2016
outfile=temp.out

# TITLE
echo "CMT Inversion Depth Analysis for Alberta Fox Creek M4.2" > $outfile

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
  echo $i
	# RUN TDMT_INVC_ISO
  tdmt_invc_iso mt_inv.in
  # AWK TDMT_RESULT.OUT FOR z, VR, st1, rk1, dp1, st2, rk3, dp2
  awk 'NR==2' tdmt_result.out | awk '{print $1,$3}' >> $outfile
  awk 'NR==6' tdmt_result.out | awk '{print $1,$2,$3,$4,$5,$6}' >> $outfile
done

#
