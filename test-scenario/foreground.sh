#sleep 1; wait.sh && docker-compose exec lakefs sh
apt update
yes | apt install wget
wget https://datasets.imdbws.com/name.basics.tsv.gz