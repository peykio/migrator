create table fruit (
	id text primary key,
	name text not null unique,
	flavor text not null default 'SWEET'
);

create table person (
	name text primary key,
	favorite_fruit text references fruit(id)
);
