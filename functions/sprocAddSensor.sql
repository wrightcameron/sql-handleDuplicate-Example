CREATE OR REPLACE FUNCTION sprocAddSensor(
    p_serial        text,
    p_type          text,
    p_manufacture   text)
    RETURNS TABLE(
        r_serial      text,
        r_type        text,
        r_manufactor  text
    )
AS $$
DECLARE
    v_sen_id        uuid = null;
BEGIN
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
