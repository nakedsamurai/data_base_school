--Создание всех таблиц БД

--Инструктор
create table instructor (
    id serial primary key,
    name varchar(50) not null,
    phone_number varchar(12),
    information text
);

--Абонемент
create table subscription (
    id serial primary key,
    description varchar(255),
    number_of_trainings integer,
    cost integer not null,
    check (number_of_trainings > 0),
    check (cost > 0)
);

--Клиент
create table client (
    id serial primary key,
    name varchar(50) not null,
    phone_number varchar(12) not null,
    email varchar(50),
    number_of_remaining_trainings integer,
    check (number_of_remaining_trainings >= 0 or number_of_remaining_trainings is null)
);

--Виды боевых искусств
create table martial_art (
    name varchar(50) primary key,
    description text
);

--Расписание занятий
create table training_schedule (
    group_number serial primary key,
    martial_art_name varchar(50) not null references martial_art on delete cascade,
    training_date date not null,
    start_time time not null,
    end_time time not null,
    instructor_id integer references instructor on delete set null,
    number_of_free_places integer not null,
    check (number_of_free_places >= 0)
);

--Приобретение услуг
create table purchase_of_subscription (
    id serial primary key,
    client_id integer not null references client on delete cascade,
    subscription_id integer not null references subscription(id) on delete cascade
);

--Запись на тренировки
create table signing_up_for_trainings (
    id serial primary key,
    client_id integer not null references client(id) on delete cascade,
    group_number integer not null references training_schedule(group_number) on delete cascade
);
