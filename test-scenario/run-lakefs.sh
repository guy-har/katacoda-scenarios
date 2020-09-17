#!/bin/bash
wget https://datasets.imdbws.com/name.basics.tsv.gz
export LAKEFS_STATS_ENABLED=false
wait-for postgres:5432
LAKEFS_LOGGING_LEVEL=ERROR /app/lakefs init --user-name demo | tail -3 > /home/lakefs/.lakectl.yaml
echo -e "server:\n  endpoint_url: http://localhost:8000/api/v1\n" >> /home/lakefs/.lakectl.yaml
lakefs run
