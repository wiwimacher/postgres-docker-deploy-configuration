# Postgres, pgbouncer and pgwatch setup on your server

### Getting started:

1. At first run bash script to generate all necessary files (envs, pgbouncer configuration files and postgres initial transaction):

   ```
   bash generate <postgres_user> <postgres_password> <postgres_database_name>
   ```
2. Then update healthcheck for postgres container in docker-compose.yml:
   Change this row:

   ```
   test: [ "CMD", "pg_isready", "-U", "", "-d", "" ]
   ```

   to this:

   ```
   test: [ "CMD", "pg_isready", "-U", "<postgres_user>", "-d", "<postgres_database_name" ]
   ```
3. And finally build and run the containers:

   ```
   docker compose up -d
   ```

And simply as that you will have running PostgreSQL, PgBouncer and PgWatch on your server or local machine
