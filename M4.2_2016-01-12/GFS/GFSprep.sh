#!/bin/bash
#
# INPUT: MODEL_foxCreekSLU_8_it0
# OUTPUT:
#
# NATE LINDSEY April 2016

# USER INPUT FOR CALLING and LABELING FIGS
sta1=TD002
sta2=TD009
sta3=RDEA
sta4=NBC4
model=MODEL_foxCreekSLU_$1
depth=$1

#STEP 1 -- delete old complex spectra
rm GREEN.1

# STEP 2 -- frequency-wave number integration based on source-time function
# and model file
# OUTPUT: GREEN.1
FKRPROG< $model >&FKRPROG.log

# STEP 3 -- generate time-series by iFFT on output
# INPUT: d; OUTPUT: vec
echo "d" | wvint9

# STEP 4 -- bin2ascii file conversion and filtering of synthetics
# OUTPUT: *.disp and no-ext ascii data file
./run_fkrsortiso $depth >&run_fkrsortiso.log

