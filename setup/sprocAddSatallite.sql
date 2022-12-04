CREATE OR REPLACE FUNCTION sprocAddSatallite(
    p_sat_serial    text,
    p_name          text,
    p_sen_sensor    text)
    RETURNS TABLE(
        r_serial       text,
        r_name         text,
        r_launch_date  date
    )
AS $$
DECLARE
    v_sen_id        uuid = null;
    v_sen_serial    text
BEGIN
    --TODO: Need to have a select statement to get the sensor to use
    SELECT sen_serial, sen_type, sen_manufactor
    INTO v_sen_serial, v_sen_type, v_sen_manufactor
    FROM sensor
    WHERE sen_sensor = p_sen_sensor;

    --TODO: Check if the sensor that was passed in was found;
    
    PERFORM sprocAddSensor(v_sen_serial, v_sen_type, v_sen_manufactor);
  
    INSERT INTO sensor as s (sen_serial, sen_type, sen_manufactor)
    VALUES (p_serial, p_type, p_manufacture)
    ON CONFLICT (sen_serial, sen_manufactor) DO
        UPDATE SET 
        sen_serial = p_serial,
        sen_type = p_type,
        sen_manufactor = p_manufacture
    RETURNING sen_id INTO v_sen_id;

    RETURN QUERY
    SELECT sen_serial as r_serial,
        sen_type as r_type,
        sen_manufactor as r_manufactor
    FROM sensor
    WHERE sen_id = v_sen_id; 
END;
$$ LANGUAGE plpgsql;
