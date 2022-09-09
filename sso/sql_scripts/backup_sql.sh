docker exec -i postgresql sh -c 'pg_dumpall -U postgres' > ./init_data_local_dev.sql
