create table fruit (
	id text primary key,
	name text not null unique,
	flavor text not null default 'SWEET'
);
