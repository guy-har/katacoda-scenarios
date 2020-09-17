wait 2
kataclient
docker pull bitnami/spark
docker run -d --name spark bitnami/spark
#docker exec spark spark-shell