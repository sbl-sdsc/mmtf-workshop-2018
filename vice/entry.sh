#!/bin/bash

echo '{"irods_host": "data.cyverse.org", "irods_port": 1247, "irods_user_name": "anonymous", "irods_zone_name": "iplant"}' | envsubst > $HOME/.irods/irods_environment.json

# Expand MMTF files
cd $HOME/vice/MMTF_Files
tar -xvf full.tar
rm full.tar

# The full directory to $HOME
#mv $HOME/vice/MMTF_Files/full $HOME/

# Move notebooks to default location
cd $HOME/vice
mv $HOME/mmtf-workshop-2018 $HOME/vice/

echo '{"irods_host": "data.cyverse.org", "irods_port": 1247, "irods_user_name": "$IPLANT_USER", "irods_zone_name": "iplant"}' | envsubst > $HOME/.irods/irods_environment.json

exec jupyter lab --no-browser 
