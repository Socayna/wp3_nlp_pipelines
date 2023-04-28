#!/bin/bash
set -e

### Insert here privileged tasks.
#bindFS
mkdir -p /gpfs/longitools.bsc.es/vre/public
mkdir -p /gpfs/longitools.bsc.es/vre/userdata/LTUSER62a5f5988116c

bindfs --map=www-data/rstudio:@www-data/@rstudio /gpfs/longitools.bsc.es/vre/userdata/LTUSER62a5f5988116c_tmp  /gpfs/longitools.bsc.es/vre/userdata/LTUSER62a5f5988116c

bindfs --map=www-data/rstudio:@www-data/@rstudio /gpfs/longitools.bsc.es/vre/public_tmp  /gpfs/longitools.bsc.es/vre/public


#Start Rserver as root and Rsesion as $HOST_UID
#/init
###
#if [[ -z "$HOST_UID" ]]; then
#    echo "ERROR: please set HOST_UID" >&2
#    exit 1
#fi
#if [[ -z "$HOST_GID" ]]; then
#    echo "ERROR: please set HOST_GID" >&2
#    exit 1
#fi

#if [[ $# -gt 0 ]]; then
#    exec sudo -H -u rstudio -- "$@"
#else
#    exec sudo -H -u rstudio -- bash
#fi
exec "$@"

