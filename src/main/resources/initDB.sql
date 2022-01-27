drop table if exists notes;
drop table if exists groups;
drop table if exists users;

create table users (
    id int primary key generated always as identity,
    username varchar not null,
    password varchar not null,
    enabled boolean not null
);

create table groups (
    id int primary key generated always as identity,
    user_id int references users(id),
    name varchar not null,
    description text
);

create table notes (
    id int primary key generated always as identity,
    user_id int references users(id),
    group_id int references groups(id),
    last_update timestamp,
    name varchar not null,
    text text not null
);