docker compose up -d
cd ./sso
docker compose up -d
cd ..
docker compose logs -f -tail 50
