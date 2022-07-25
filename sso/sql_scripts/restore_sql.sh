#!/bin/bash
set -e

docker exec -i postgresql sh -c 'psql -U postgres' < ./pgdump.sql
