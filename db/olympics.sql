DROP TABLE athletes;
DROP TABLE nations;
DROP TABLE events;

CREATE TABLE nations(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
points int8
);


CREATE TABLE events(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE athletes(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
nation_id int8 references nations(id) ON DELETE CASCADE,
event_id int8 references events(id) ON DELETE CASCADE,
event_time NUMERIC,
medal VARCHAR(255)
);
