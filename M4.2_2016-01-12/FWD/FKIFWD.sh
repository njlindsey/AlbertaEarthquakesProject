#!/bin/bash
# Frequency-Wavenumber Integration Forward Modeling to find best Velocity Model
# given the inverted Focal Mechanism.
#
# INPUT: MODEL_foxCreekSLU_8_it0
# OUTPUT:
#
# NATE LINDSEY April 2016

# USER INPUT FOR CALLING and LABELING FIGS
sta1=BRLDA
sta2=SWHSA
sta3=TD002
sta4=TD009
sta5=NBC7

az1=212
az2=19
az3=123
az4=169
az4=312

model=MODEL_foxCreekSLU_8km_it0
depth=8

str=282
rake=4
dip=76
mo=7.7e+21

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
putmech in=foxCreekSLU_46d8 out=synth azimuth=$az3 strike=$str rake=$rake dip=$dip moment=$mo
putmech in=foxCreekSLU_53d8 out=synth azimuth=$az4 strike=$str rake=$rake dip=$dip moment=$mo
putmech in=foxCreekSLU_206d8 out=synth azimuth=$az3 strike=$str rake=$rake dip=$dip moment=$mo
putmech in=foxCreekSLU_241d8 out=synth azimuth=$az4 strike=$str rake=$rake dip=$dip moment=$mo
putmech in=foxCreekSLU_316d8 out=synth azimuth=$az4 strike=$str rake=$rake dip=$dip moment=$mo

# STEP 6 -- READ synth files, change header times, Overlay on DATA, Write to PS, GS CONVERT PS TO PNG
sac FKIFWD_$sta1.macro
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=1T_timeseries.png T_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=1R_timeseries.png R_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=1Z_timeseries.png Z_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=1T_spectra.png T_spectra.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=1R_spectra.png R_spectra.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=1Z_spectra.png Z_spectra.ps >&GS.log
sac FKIFWD_$sta2.macro
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=2T_timeseries.png T_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=2R_timeseries.png R_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=2Z_timeseries.png Z_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=2T_spectra.png T_spectra.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=2R_spectra.png R_spectra.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=2Z_spectra.png Z_spectra.ps >&GS.log
sac FKIFWD_$sta3.macro
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=3T_timeseries.png T_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=3R_timeseries.png R_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=3Z_timeseries.png Z_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=3T_spectra.png T_spectra.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=3R_spectra.png R_spectra.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=3Z_spectra.png Z_spectra.ps >&GS.log
sac FKIFWD_$sta4.macro
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4T_timeseries.png T_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4R_timeseries.png R_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4Z_timeseries.png Z_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4T_spectra.png T_spectra.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4R_spectra.png R_spectra.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4Z_spectra.png Z_spectra.ps >&GS.log
sac FKIFWD_$sta5.macro
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4T_timeseries.png T_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4R_timeseries.png R_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4Z_timeseries.png Z_timeseries.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4T_spectra.png T_spectra.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4R_spectra.png R_spectra.ps >&GS.log
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -sOutputFile=4Z_spectra.png Z_spectra.ps >&GS.log

# STEP 7 -- SUBPLOT PNGs to single PDF per station
python ../../scripts/sac_multiPng2SubplotPdf.py
