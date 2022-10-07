CREATE schema IF NOT EXISTS hospital;

CREATE TABLE IF NOT EXISTS hospital.station (
    station_id VARCHAR(100) PRIMARY KEY,
    station_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS hospital.station_personell (
    pers_id VARCHAR(100) PRIMARY KEY,
    pers_name TEXT NOT NULL,
    station_id VARCHAR(100) NOT NULL REFERENCES hospital.station(station_id)
);

CREATE TABLE IF NOT EXISTS hospital.doctor (
    pers_id VARCHAR(100) PRIMARY KEY,
    area TEXT NOT NULL,
    doc_rank TEXT NOT NULL,
    station_id VARCHAR(100) NOT NULL REFERENCES hospital.station(station_id)
);

CREATE TABLE IF NOT EXISTS hospital.caregiver (
    pers_id VARCHAR(100) PRIMARY KEY,
    qualification TEXT NOT NULL,
    station_id VARCHAR(100) NOT NULL REFERENCES hospital.station(station_id)
);

CREATE TABLE IF NOT EXISTS hospital.room (
    room_id VARCHAR(100) PRIMARY KEY,
    beds_count INTEGER NOT NULL,
    station_id VARCHAR(100) NOT NULL REFERENCES hospital.station(station_id)
);

CREATE TABLE IF NOT EXISTS hospital.patient (
    patient_id VARCHAR(100) PRIMARY KEY,
    patient_name TEXT NOT NULL,
    disease TEXT NOT NULL,
    doctor_id VARCHAR(100) NOT NULL REFERENCES hospital.doctor(pers_id),
    room_id VARCHAR(100) NOT NULL REFERENCES hospital.room(room_id),
    admission_from INT NOT NULL,
    admission_to INT NOT NULL
);