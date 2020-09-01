#sleep 1; wait.sh && docker-compose exec lakefs sh
apt update && apt install -y wget
wget https://datasets.imdbws.com/name.basics.tsv.gz