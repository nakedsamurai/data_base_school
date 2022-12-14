--Уменьшение количества оставшихся тренировок на абонементе
CREATE OR REPLACE FUNCTION decrement_number_of_remaining_trainings() RETURNS TRIGGER AS
$$
begin
    if (SELECT number_of_remaining_trainings FROM client WHERE client.id = new.client_id) = 0
    then
        raise exception 'No trainings';
    elsif (SELECT number_of_remaining_trainings FROM client WHERE client.id = new.client_id) IS NOT NULL
    then
        UPDATE client SET number_of_remaining_trainings = number_of_remaining_trainings - 1
        WHERE client.id = new.client_id;
    elsif (SELECT number_of_remaining_trainings FROM client WHERE client.id = new.client_id) IS NULL
    then
        raise exception 'No subscription';
    end if;
    return new;
end;
$$ LANGUAGE plpgsql;

--При записи
CREATE OR REPLACE TRIGGER reduce_remaining_trainings AFTER INSERT ON signing_up_for_trainings
    FOR EACH ROW EXECUTE FUNCTION decrement_number_of_remaining_trainings();

--Уменьшение количества свободных мест на тренировке
CREATE OR REPLACE FUNCTION decrement_number_of_free_places_in_group() RETURNS TRIGGER AS
$$
begin
    if (SELECT number_of_free_places FROM training_schedule WHERE training_schedule.group_number = new.group_number) - 1 >= 0
    then
        UPDATE training_schedule SET number_of_free_places = number_of_free_places - 1
                              WHERE training_schedule.group_number = new.group_number;
    else
        raise exception 'No free places in the group %', new.group_number;
    end if;
    return new;
end;
$$ LANGUAGE plpgsql;

--При записи на тренировку
CREATE OR REPLACE TRIGGER reduce_free_places_in_group AFTER INSERT ON signing_up_for_trainings
    FOR EACH ROW EXECUTE FUNCTION decrement_number_of_free_places_in_group();

--Увеличение количества оставшихся тренировок на абонементе
CREATE OR REPLACE FUNCTION increment_number_of_remaining_trainings() RETURNS TRIGGER AS
$$
begin
    if (SELECT number_of_remaining_trainings FROM client WHERE client.id = old.client_id) IS NOT NULL
    then
        UPDATE client SET number_of_remaining_trainings = number_of_remaining_trainings + 1
                      WHERE client.id = old.client_id;
    end if;
    return new;
end;
$$ LANGUAGE plpgsql;

--При отмене
CREATE OR REPLACE TRIGGER increase_remaining_trainings AFTER DELETE ON signing_up_for_trainings
    FOR EACH ROW EXECUTE FUNCTION increment_number_of_remaining_trainings();


--Увеличение колиества оставшихся мест на тренировке
CREATE OR REPLACE FUNCTION increment_number_of_free_places_in_group() RETURNS TRIGGER AS
$$
begin
    UPDATE training_schedule SET number_of_free_places = number_of_free_places + 1
                             WHERE training_schedule.group_number = old.group_number;
    return new;
end;
$$ LANGUAGE plpgsql;

--При отмене записи
CREATE OR REPLACE TRIGGER increase_free_places_in_group AFTER DELETE ON signing_up_for_trainings
    FOR EACH ROW EXECUTE FUNCTION increment_number_of_free_places_in_group();

--Добавление занятий при покупке нового абонемента
CREATE OR REPLACE FUNCTION add_trainings_to_client() RETURNS TRIGGER AS
$$
begin
    if new.subscription_id = 1 or new.subscription_id = 2
    then UPDATE client SET number_of_remaining_trainings = 1
                       WHERE client.id = new.client_id;
    elsif new.subscription_id = 3
    then UPDATE client SET number_of_remaining_trainings = 4
                       WHERE client.id = new.client_id;
    elsif new.subscription_id = 4
    then UPDATE client SET number_of_remaining_trainings = 8
                       WHERE client.id = new.client_id;
    elsif new.subscription_id = 5
    then UPDATE client SET number_of_remaining_trainings = 12
                       WHERE client.id = new.client_id;
    end if;
    return new;
end;
$$ LANGUAGE plpgsql;

--Вызывается при покупке
CREATE OR REPLACE TRIGGER push_trainings_to_client AFTER INSERT ON purchase_of_subscription
    FOR EACH ROW EXECUTE FUNCTION add_trainings_to_client();
