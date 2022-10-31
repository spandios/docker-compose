CREATE DATABASE merge_main_db;
ALTER USER postgres WITH PASSWORD 'dbMerge135!#%';
GRANT ALL PRIVILEGES ON DATABASE "merge_main_db" to postgres;