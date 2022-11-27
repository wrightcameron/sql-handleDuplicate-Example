
BEGIN;

    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

    CREATE TABLE IF NOT EXISTS satallite(
        sat_id		uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
        sat_serial	text NOT NULL,
        sat_name	text,
        sat_launch_date	date NOT NULL DEFAULT now(),
        sat_decommission_date	date,
        sat_com_id	uuid,
        sat_sen_id	uuid,
        sat_c_id	uuid
    );

    CREATE TABLE IF NOT EXISTS computer(
        com_id		uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
        com_model	text NOT NULL,
        com_serial	text NOT NULL,
        com_core	int,
        com_ram		text,
        com_manufacture	text
    );

    CREATE TABLE IF NOT EXISTS sensor(
        sen_id		uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
        sen_serial	text NOT NULL,
        sen_type	text,
        sen_manufactor	text
    );

    CREATE TABLE IF NOT EXISTS company(
        c_id		uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
        c_name		text NOT NULL,
        c_address	text
    );

    -- Create foreign key
    ALTER TABLE satallite ADD CONSTRAINT fk_com_id FOREIGN KEY (sat_com_id) REFERENCES computer (com_id);
    ALTER TABLE satallite ADD CONSTRAINT fk_sen_id FOREIGN KEY (sat_sen_id) REFERENCES sensor (sen_id);
    ALTER TABLE satallite ADD CONSTRAINT fk_c_id FOREIGN KEY (sat_c_id) REFERENCES company (c_id);

    -- CREATE [UNIQUE] INDEX <NAME> ON <TABLE> (COLUMNS)
    CREATE UNIQUE INDEX ak_sensor_serial ON sensor (sen_serial, sen_manufactor);
    CREATE UNIQUE INDEX ak_computer_serial ON computer (com_serial, com_manufacture);
    CREATE UNIQUE INDEX ak_satallite_serial ON satallite (sat_serial);
END;
