--sensor
do $$
BEGIN
FOR i IN 1..10 LOOP
    PERFORM sprocAddSensor('2342-6546-1742', 'Gravity', null);
    PERFORM sprocAddSensor('8263-23488-4352', 'Optical', null);
    PERFORM sprocAddSensor('9912-6162-6453', 'Optical', null);
END LOOP;
END; $$

