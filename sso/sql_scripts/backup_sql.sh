docker exec -i postgresql sh -c 'pg_dumpall -U postgres' > ./pgdump.sql
