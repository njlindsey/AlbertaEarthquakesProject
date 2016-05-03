read SWHSA_E SWHSA_N
rotate to gcp
title "2. Rotate to GCP"
saveimg "SWHSA_step2rot.pdf"
lh --> check CMPAZ for which is radial and trasv.
write SWHSA_R SWHSA_T

read SWHSA_R SWHSA_T SWHSA_Z
int
bp p 2 c 0.02 0.05
ylabel "Displacement [cm]"
title "3. Integrate to Displacement, BP 0.02-0.05s"
saveimg "SWHSA_step3disp.pdf"
