touch ~/test.txt
export LAKEFS_STATS_ENABLED=false
cd ~/lakefs/
docker-compose up
docker-compose exec lakefs bash