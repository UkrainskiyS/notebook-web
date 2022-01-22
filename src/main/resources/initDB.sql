drop table if exists notes;
drop table if exists groups;

create table groups (
    id int primary key generated always as identity,
    name varchar not null
);
--
insert into groups (name) values('test group');
insert into groups (name) values('pidors');
--

create table notes (
    id int primary key generated always as identity,
    group_id int references groups(id),
    last_update timestamp,
    name varchar not null,
    text text not null
);
--
insert into notes (group_id, last_update, name, text) values(1, clock_timestamp(), 'Новая газета', 'На корреспондентов «Новой газеты» напали в больнице Сургута. Они снимали там репортаж о самоубийствах среди медперсонала.');
insert into notes (group_id, last_update, name, text) values(1, clock_timestamp(), 'Курс доллара достиг 77,5 рубля', 'Курс доллара на Мосбирже достиг 77,5 рубля, обновив максимум с начала года. Об этом свидетельствуют данные биржи.');
insert into notes (group_id, last_update, name, text) values(2, clock_timestamp(), 'main pidor', 'nu pidor i pidor');
--
