CREATE TABLE IF NOT EXISTS human
(
    id SERIAL PRIMARY KEY,
    human_name varchar(20),
    status     varchar(100),
    emotions   varchar(100)
);

CREATE TABLE IF NOT EXISTS engine
(
    id     SERIAL PRIMARY KEY,
    thrust varchar(100)
);

CREATE TABLE IF NOT EXISTS human_to_engine
(
    id SERIAL PRIMARY KEY,
    human_id INT REFERENCES human (id),
    engine_id INT REFERENCES engine (id)
);

CREATE TABLE IF NOT EXISTS antenna
(
    id SERIAL PRIMARY KEY,
    importance varchar(100),
    safety_margin varchar(100)
);

CREATE TABLE IF NOT EXISTS human_to_antenna
(
    id SERIAL PRIMARY KEY,
    antenna_id INT REFERENCES antenna (id),
    human_id INT REFERENCES human (id)
);

CREATE TABLE IF NOT EXISTS spaceship
(
    id SERIAL PRIMARY KEY,
    denomination varchar(100),
    antenna_id  INT REFERENCES antenna (id),
    engine_id INT REFERENCES engine (id)
);

CREATE TABLE IF NOT EXISTS
    hal
(
    id SERIAL PRIMARY KEY,
    work_productivity varchar(100),
    spaceship_id INT
        REFERENCES spaceship (id)
);


--Спустя еще примерно минуту двигатель вышел на полную тягу.
--Все разразились апплодисментами, но Таня тут же успокоила
--страсти. Пусть даже ЭАЛ и работает безукоризненно, очень
--многое оставалось пока неясным. Например, могло не выдержать
--основание главной антенны "Дискавери", служившее сейчас
--опорой "Леонову", - хотя главный конструктор (давно ушедший
--в отставку) и уверял, что запас прочности вполне достаточен...


INSERT INTO human(human_name, status, emotions)
VALUES ('Таня', 'ушедший в отставку', 'апплодисментами');
INSERT INTO engine(thrust)
VALUES ('вышел на полную тягу');
INSERT INTO human_to_engine(human_id, engine_id)
VALUES (1, 1);
INSERT INTO antenna(importance, safety_margin)
VALUES ('основание главной антенны', 'запас прочности вполне достаточен');
INSERT INTO human_to_antenna(antenna_id, human_id)
VALUES (1, 1);
INSERT INTO spaceship(denomination, antenna_id, engine_id)
VALUES ('Дискавери', 1, 1),
       ('Леонову', 1, 1);
INSERT INTO hal(work_productivity, spaceship_id)
VALUES ('работает безукоризненно', 1);