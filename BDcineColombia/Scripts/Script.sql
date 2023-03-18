create database cine;
create user cine password 'cine';
grant all privileges on database cine to cine;
drop database cine;
GRANT SELECT ON tablename TO PUBLIC;
GRANT ALL ON DATABASE cine TO postgres;
GRANT USAGE, CREATE ON SCHEMA public TO cine;
ALTER DATABASE cine OWNER TO postgres;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO cine;
GRANT USAGE ON SCHEMA public TO cine;
GRANT ALL ON SCHEMA public TO cine;
GRANT ALL ON SCHEMA public TO cine;
grant;
select current_user;

grant usage on schema public to cine;
grant select on all tables in schema public to cine;
