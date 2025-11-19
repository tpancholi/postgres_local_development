# This is a PostgreSQL setup which can be used as a local database.

## Features
✅ A clean, simple, correct docker-compose.yml 

✅ A safe superuser only for initialization

✅ Automatic creation of a restricted dev_user via init scripts

✅ Custom postgresql.conf

✅ pg_stat_statements enabled

✅ Memory tuning

✅ WAL tuning

✅ Autovacuum tuning

✅ Applied cleanly inside your Docker Compose

✅ Beautiful UI via `pgAdmin`

## Files
- `docker-compose.yml` — Compose definition for a configurable Postgres v18 instance.
- `initdb/` — how to place initialization scripts (SQL / shell) per project.
- `config/postgresql.conf` - custom configuration file.

## It has two service
- PostgreSQL (18.1)
- PgAdmin4 (9.10.0)

### To access pgAdmin4
- Go to `http://localhost:5050`
- Username: `admin@example.com` # from docker-compose.yml
- Password: `admin` # from docker-compose.yml
- Go to Add new server and enter the following details:
    - Name: `local postgresql` # any name of your choice
    - Host name/address: `postgres` # found any docker compose service name
    - Port: `5432`
    - Maintenance database: `postgres`
    - Username: `myapp_user` # dev user from init scripts
    - Password: `pa55word` # dev user password from init scripts


### Important commands
- To start the container `docker-compose up -d`
- To view status of container `docker ps`
- To stop the container `docker-compose down`
- To stop and remove the container and volumes `docker-compose down -v`

### DB Connection string
`postgresql://myapp_user:pa55word@localhost:5432/datamover?sslmode=disable`

### Reference
[Youtube](https://youtu.be/EhapnaEKl-w?si=0VTfg76L33E5rFob)
