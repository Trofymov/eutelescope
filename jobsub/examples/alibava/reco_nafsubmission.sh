#!/bin/zsh

################################
#                              #
# ALiBaVa Analysis - Pedestal  #
#                              #
################################

# usage: source reco.sh runnumber(s)

# To get pedestal subtracted, common mode and cross talk corrected signal values
# you will need to run these templates
TEMPLATELIST=('alibava-converter' 'alibava-reco' 'alibava-datahisto' 'alibava-commonmodecut' 'alibava-seedclustering' 'alibava-crosstalk-it1' 'alibava-crosstalk-it2' 'alibava-crosstalk-it3')

for TEMPLATE in $TEMPLATELIST; do
jobsub -c config.cfg -csv runlist.csv --subdir --naf qsubparameters.cfg $TEMPLATE $1

#check if there is any run submitted to the naf
#if there is wait for them to be finished 
while [[ -n `qstat` ]]; do
        echo Waiting for jobs to be finished
        sleep 30
done
if [[ -z `qstat` ]];then
        echo ready to start new job
fi

done

