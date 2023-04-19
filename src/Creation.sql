CREATE TABLE IF NOT EXISTS human (
    id SERIAL PRIMARY KEY,
    human_name varchar(20),
    status varchar(100),
    age INT
);

CREATE TABLE IF NOT EXISTS engine (
    id SERIAL PRIMARY KEY,
    thrust varchar(32)
);

CREATE TABLE IF NOT EXISTS human_to_engine (
    human_id  INT REFERENCES human (id),
    engine_id INT REFERENCES engine (id),
    emotions varchar(100),
    PRIMARY KEY (human_id, engine_id)
);

CREATE TABLE IF NOT EXISTS antenna (
    id SERIAL PRIMARY KEY,
    importance varchar(100),
    safety_margin varchar(100)
);

CREATE TABLE IF NOT EXISTS human_to_antenna (
    antenna_id INT REFERENCES antenna (id),
    human_id INT REFERENCES human (id),
    connection varchar(32),
    PRIMARY KEY (antenna_id, human_id)
);

CREATE TABLE IF NOT EXISTS spaceship (
    id SERIAL PRIMARY KEY,
    denomination varchar(100)
);

CREATE TABLE IF NOT EXISTS hal (
    id SERIAL PRIMARY KEY,
    work_productivity varchar(100),
    spaceship_id INT REFERENCES spaceship (id)
);


--Спустя еще примерно минуту двигатель вышел на полную тягу.
--Все разразились апплодисментами, но Таня тут же успокоила
--страсти. Пусть даже ЭАЛ и работает безукоризненно, очень
--многое оставалось пока неясным. Например, могло не выдержать
--основание главной антенны "Дискавери", служившее сейчас
--опорой "Леонову", - хотя главный конструктор (давно ушедший
--в отставку) и уверял, что запас прочности вполне достаточен...


INSERT INTO human(human_name, status)
VALUES ('Таня', 'ушедший в отставку');
INSERT INTO engine(thrust)
VALUES ('вышел на полную тягу');
INSERT INTO human_to_engine(human_id, engine_id, emotions)
VALUES (1, 1, 'апплодисментами');
INSERT INTO antenna(importance, safety_margin)
VALUES ('основание главной антенны', 'запас прочности вполне достаточен');
INSERT INTO human_to_antenna(antenna_id, human_id)
VALUES (1, 1);
INSERT INTO spaceship(denomination)
VALUES ('Дискавери'),
       ('Леонову');
INSERT INTO hal(work_productivity, spaceship_id)
VALUES ('работает безукоризненно', 1);

