-- Satallite
INSERT INTO satallite(sat_serial, sat_name, sat_com_id, sat_sen_id, sat_c_id) VALUES ('1342-1232', 'OutOfThisWorld', 
    (SELECT com_id FROM computer OFFSET floor(random() * (SELECT COUNT(*) FROM computer)) LIMIT 1),
    (SELECT sen_id FROM sensor OFFSET floor(random() * (SELECT COUNT(*) FROM sensor)) LIMIT 1),
    (SELECT c_id FROM company OFFSET floor(random() * (SELECT COUNT(*) FROM company)) LIMIT 1)
);

