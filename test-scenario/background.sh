#!/bin/sh
set -o pipefail
set -e
touch ~/test.txt
export LAKEFS_STATS_ENABLED=false
mkdir ~/lakefs

cat <<EOS > lakefs/setup-lakefs.sh
#!/bin/bash
wait-for localhost:8000
LAKEFS_LOGGING_LEVEL=ERROR lakefs init --user-name demo | tail -3 > /home/lakefs/.lakectl.yaml
echo -e "server:\n  endpoint_url: http://localhost:8000/api/v1\n" >> /home/lakefs/.lakectl.yaml
EOS
chmod +x lakefs/setup-lakefs.sh

cat <<EOS > /home/lakefs/docker-compose.yaml
version: '3'
services:
  lakefs:
    image: "treeverse/lakefs:latest"
    ports:
      - 8000:8000
    depends_on:
      - postgres
    volumes:
      - lakefs:/home/lakefs
    environment:
      LAKEFS_AUTH_ENCRYPT_SECRET_KEY: some random secret string
      LAKEFS_DATABASE_CONNECTION_STRING: postgres://lakefs:lakefs@postgres/postgres?sslmode=disable
      LAKEFS_BLOCKSTORE_TYPE: local
      LAKEFS_BLOCKSTORE_LOCAL_PATH: /home/lakefs
      LAKEFS_GATEWAYS_S3_DOMAIN_NAME: s3.local.lakefs.io:8000
    entrypoint: ["/app/wait-for", "postgres:5432", "--", "/app/lakefs", "run"]
  postgres:
    image: "postgres:11"
    environment:
      POSTGRES_USER: lakefs
      POSTGRES_PASSWORD: lakefs
  lakefs-setup:
    image: "treeverse/lakefs:latest"
    command: /home/lakefs/setup-lakefs.sh
    depends_on:
      - lakefs
    volumes:
      - lakefs:/home/lakefs
EOS


echo "done" >> /root/katacoda-finished
docker-compose up -d
echo "done" >> /root/katacoda-background-finished

