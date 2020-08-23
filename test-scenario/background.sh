#!/bin/sh
set -o pipefail
set -e
touch ~/test.txt
export LAKEFS_STATS_ENABLED=false

cat <<EOS > run-lakefs.sh
#!/bin/bash
wait-for postgres:5432
LAKEFS_LOGGING_LEVEL=ERROR /app/lakefs init --user-name demo | tail -3 > /home/lakefs/.lakectl.yaml
echo -e "server:\n  endpoint_url: http://localhost:8000/api/v1\n" >> /home/lakefs/.lakectl.yaml
lakefs run
EOS
chmod +x run-lakefs.sh

cat <<EOS > docker-compose.yaml
version: '3'
services:
  lakefs:
    image: "treeverse/lakefs:latest"
    ports:
      - 8000:8000
    depends_on:
      - postgres
    volumes:
      - ./run-lakefs.sh:/app/run-lakefs.sh:ro
    environment:
      LAKEFS_AUTH_ENCRYPT_SECRET_KEY: some random secret string
      LAKEFS_DATABASE_CONNECTION_STRING: postgres://lakefs:lakefs@postgres/postgres?sslmode=disable
      LAKEFS_BLOCKSTORE_TYPE: memory
      LAKEFS_BLOCKSTORE_LOCAL_PATH: /home/
      LAKEFS_GATEWAYS_S3_DOMAIN_NAME: s3.local.lakefs.io:8000
    entrypoint: ["/bin/sh", "/app/run-lakefs.sh"]
  postgres:
    image: "postgres:11"
    environment:
      POSTGRES_USER: lakefs
      POSTGRES_PASSWORD: lakefs
EOS

docker-compose pull
echo "done" >> /root/katacoda-finished
docker-compose up -d
echo "done" >> /root/katacoda-background-finished

