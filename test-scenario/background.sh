touch ~/test.txt
export LAKEFS_STATS_ENABLED=false
mkdir ~/lakefs

wget  https://raw.githubusercontent.com/treeverse/lakeFS/master/docker-compose.yaml -P /home/lakefs/
cd home/lakefs/
docker-compose up -d
docker-compose exec lakefs wait-for localhost:8000
docker-compose exec -e LAKEFS_LOGGING_LEVEL=ERROR lakefs  sh -c 'lakefs init --user-name demo | tail -3 > /home/lakefs/.lakectl.yaml'
docker-compose exec lakefs sh -c 'echo -e "server:\n  endpoint_url: http://localhost:8000/api/v1\n" >> /home/lakefs/.lakectl.yaml'

docker-compose exec lakefs sh

