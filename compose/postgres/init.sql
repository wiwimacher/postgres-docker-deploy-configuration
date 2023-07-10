DO
$$
BEGIN
    -- Create the database if it doesn't exist
    IF EXISTS (SELECT FROM pg_database WHERE datname = '') THEN
        RAISE NOTICE 'Database already exists';
    ELSE
        PERFORM dblink_exec('dbname=' || current_database()  -- current db
                            , 'CREATE DATABASE ');
    END IF;

    -- Create the user if it doesn't exist
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = '') THEN
        CREATE USER  WITH PASSWORD '';
        -- Grant necessary privileges to the user
        -- REPLACE WITH YOUR DESIRED PRIVILEGES
        GRANT ALL PRIVILEGES ON DATABASE  TO ;
    END IF;
END
$$;
