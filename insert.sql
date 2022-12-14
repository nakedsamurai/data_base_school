--Заполнение таблиц какими-то данными

insert into instructor (name, phone_number)
values ('Нурмагомедов Хабиб Тагирович', '+7XXXXXXXXXX'),
       ('Муха Станислав Александрович', '+7XXXXXXXXXX'),
       ('Тузик Али Юрьев', '+7XXXXXXXXXX'),
       ('Галустян Михаил Алексеевич', '+7XXXXXXXXXX'),
       ('Коротков Иван Андреев', '+7XXXXXXXXXX'),
       ('Беспалько Игорь Евгеньевич', '+7XXXXXXXXXX'),
       ('Яшин Степан Алкександрович', '+7XXXXXXXXXX'),
       ('Попов Денис Александрович', '+7XXXXXXXXXX'),
       ('Козлов Максим Олегович', '+7XXXXXXXXXX'),
       ('Михалков Сергей Михайлович', '+7XXXXXXXXXX'),
       ('Стен Ли', '+7XXXXXXXXXX'),
       ('Брежнев Леонид Ильич', '+7XXXXXXXXXX'),
       ('Брюс Ли ', '+7XXXXXXXXXX');
       

insert into subscription (description, number_of_trainings, cost)
values ('Пробное занятие', 1, 300),
       ('Разовое занятие', 1, 600),
       ('Абонемент 4 занятия', 4, 2400),
       ('Абонемент 8 занятий', 8, 4200),
       ('Абонемент 12 занятий', 12, 6000);

insert into client (name, phone_number, email, number_of_remaining_trainings)
values ('Петров Вася Дмитриевич', '+7XXXXXXXXXX', 'qwerty123@gmail.com', 5),
       ('Скиба Степан Валерьевич', '+7XXXXXXXXXX', null, 2),
       ('Васильев Дмитрий Владиславович', '+7XXXXXXXXXX', 'vdv@yandex.ru', 10),
       ('Егоров Антон Егорович', '+7XXXXXXXXXX', 'supermuzhik666@gmail.com', 0),
       ('Антонов Егор Антонович', '+7XXXXXXXXXX', 'AntEg@mail.ru', 2),
       ('Антонов Антон Егорович', '+7XXXXXXXXXX', null, 2),
       ('Антонов Антон Антонович', '+7XXXXXXXXXX', null, 3),
       ('Егоров Егор Егорович', '+7XXXXXXXXXX', null, 2),
       ('Егоров Егор Антонович', '+7XXXXXXXXXX', 'EdAnt@yandex.ru', 10);

insert into martial_art(name, description)
values ('Карате', null),
       ('Джиу-Джитсу', null),
       ('Тайский бокс', null),
       ('Кикбоксинг', null),
       ('Борьба', null),
       ('Ушу', null),
       ('ММА', null),
       ('Кунг-фу', null),
       ('Сумо', null),
       ('Бокс', null),
       ('Бесконтактный бой', null);

insert into training_schedule(martial_art_name, training_date, start_time, end_time, instructor_id, number_of_free_places)
values ('Карате', '2022-12-14', '11:00', '12:30', 12, 6),
       ('Джиу-Джитсу', '2022-12-14', '12:30', '13:30', 5, 7),
       ('Тайский бокс', '2022-12-14', '18:00', '19:00', 3, 7),
       ('Борьба', '2022-12-14', '19:00', '20:00', 9, 6),
       ('Ушу', '2022-12-14', '20:00', '21:30', 8, 7),
       ('ММА', '2022-12-15', '11:00', '12:30', 12, 10),
       ('Кунг-фу', '2022-12-15', '18:00', '19:00', 11, 10),
       ('Сумо', '2022-12-15', '19:00', '20:00', 13, 10),
       ('Бокс', '2022-12-15', '20:00', '21:00', 6, 10);

insert into purchase_of_subscription(client_id, subscription_id)
values (1, 4),
       (2, 3),
       (3, 5),
       (4, 2),
       (5, 3),
       (6, 4),
       (7, 4),
       (8, 3),
       (9, 5);

insert into signing_up_for_trainings(client_id, group_number)
values (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (1, 2),
       (2, 2),
       (3, 2),
       (5, 3),
       (6, 3),
       (7, 3),
       (5, 4),
       (6, 4),
       (7, 4),
       (8, 4),
       (8, 5),
       (9, 5),
       (7, 5);
