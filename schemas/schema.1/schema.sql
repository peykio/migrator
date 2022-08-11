create table fruit (
	id text primary key,
	name text not null unique,
	color text not null default ''
);
