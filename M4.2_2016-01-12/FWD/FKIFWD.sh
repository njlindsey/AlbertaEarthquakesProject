#!/bin/bash
# Frequency-Wavenumber Integration Forward Modeling to find best Velocity Model
# given the inverted Focal Mechanism.
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

az1=123
az2=169
az3=24
az4=300

model=../GFS/MODEL_foxCreekSLU_8km_it0
depth=8

str=276
rake=9
dip=83
mo=5.50e+21

# STEP 1 -- delete old complex spectra
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

# STEP 5 -- add mechanism to synthetic Green's function using fundamental
# Green's functions focal parameter coefficients calculated using mksyn_grt.m,
# or the tdmt_invc_iso solution. Write 3 component displacement data to SAC.
# OUTPUT: SAC-files synth.tan, synth.rad, synth.ver
putmech in=foxCreekSLU_206d8 out=synth azimuth=$az1 strike=$str rake=$rake dip=$dip moment=$mo
putmech in=foxCreekSLU_241d8 out=synth azimuth=$az2 strike=$str rake=$rake dip=$dip moment=$mo
putmech in=foxCreekSLU_258d8 out=synth azimuth=$az3 strike=$str rake=$rake dip=$dip moment=$mo
putmech in=foxCreekSLU_270d8 out=synth azimuth=$az4 strike=$str rake=$rake dip=$dip moment=$mo

# STEP 6 -- READ synth files, change header times, Overlay on DATA, Write to PS, GS CONVERT PS TO PNG
sac FKIFWD_$sta1.macro
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=1T_timeseries.png T_timeseries.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=1R_timeseries.png R_timeseries.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=1Z_timeseries.png Z_timeseries.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=1T_spectra.png T_spectra.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=1R_spectra.png R_spectra.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=1Z_spectra.png Z_spectra.ps
sac FKIFWD_$sta2.macro
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=2T_timeseries.png T_timeseries.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=2R_timeseries.png R_timeseries.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=2Z_timeseries.png Z_timeseries.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=2T_spectra.png T_spectra.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=2R_spectra.png R_spectra.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=2Z_spectra.png Z_spectra.ps
sac FKIFWD_$sta1.macro
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=3T_timeseries.png T_timeseries.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=3R_timeseries.png R_timeseries.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=3Z_timeseries.png Z_timeseries.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=3T_spectra.png T_spectra.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=3R_spectra.png R_spectra.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=3Z_spectra.png Z_spectra.ps
sac FKIFWD_$sta1.macro
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4T_timeseries.png T_timeseries.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4R_timeseries.png R_timeseries.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4Z_timeseries.png Z_timeseries.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4T_spectra.png T_spectra.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4R_spectra.png R_spectra.ps
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4Z_spectra.png Z_spectra.ps

# STEP 7 -- SUBPLOT PNGs to single PDF per station
python ../../scripts/sac_multiPng2SubplotPdf.py
