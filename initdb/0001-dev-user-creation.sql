-- Enable pg_stat_statements extension
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
-- Enable citext extension for case-insensitive text matching
CREATE EXTENSION IF NOT EXISTS citext;
-- Enable encrypting, decrypting, and hashing data within the database
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Create the user
CREATE USER myapp_user WITH PASSWORD 'pa55word';

-- Allow connection to database
GRANT CONNECT ON DATABASE datamover TO myapp_user;

-- Schema usage
GRANT USAGE ON SCHEMA public TO myapp_user;

-- Permissions on existing tables
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO myapp_user;

-- Permissions on existing sequences
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO myapp_user;

-- Permissions for future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA public
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO myapp_user;

-- Permissions for future sequences
ALTER DEFAULT PRIVILEGES IN SCHEMA public
    GRANT USAGE, SELECT ON SEQUENCES TO myapp_user;

-- Example table using uuidv7 as primary key
CREATE TABLE example_table (
    -- For fboulnois/pg_uuidv7 implementation
    id UUID PRIMARY KEY DEFAULT uuidv7(),
    name TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Grant privileges on the example table to myapp_user
GRANT ALL PRIVILEGES ON TABLE example_table TO myapp_user;

-- Insert example data using uuidv7
INSERT INTO example_table (name) VALUES ('Example Record 1');
INSERT INTO example_table (name) VALUES ('Example Record 2');