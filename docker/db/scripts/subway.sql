CREATE SCHEMA IF NOT EXISTS subway;


CREATE TABLE subway.Station(
    name text primary key,
    tracks int,

    next_station_name text, 
    previous_station_name text,

    city_name text,
    foreign key (city_region, city_name) references subway.City
);

CREATE TABLE subway.City(
    name text,
    region text,

    primary key (region, name)
);



CREATE TABLE subway.Train(
    train_nr serial primary key,
    length int,

    start_station_name text,
    end_station_name text,

    foreign key (start_station_name) references subway.Station,
    foreign key (end_station_name) references subway.Station
);

CREATE TABLE subway.TrainRoute(
    departure_timestamp int,
    arrival date,

    first_station_name text,
    last_station_name text,
    train_id serial,

    foreign key (first_station_name) references subway.Station,
    foreign key (last_station_name) references subway.Station,
    foreign key (train_id) references subway.Train
)