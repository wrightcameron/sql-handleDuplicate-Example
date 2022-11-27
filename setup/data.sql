

--company
INSERT INTO company (c_name, c_address) VALUES ('Nanotrasen', 'PO Box 54023');
INSERT INTO company (c_name, c_address) VALUES ('Hyperion', 'PO Box 31341');

--sensor
SELECT * FROM sprocAddSensor('2342-6546-1742', 'Gravity', 'AO Sensors');
SELECT * FROM sprocAddSensor('8263-23488-4352', 'Optical', 'AO Sensors');
SELECT * FROM sprocAddSensor('9912-6162-6453', 'Optical', 'Columbia Engineering');

--computer
INSERT INTO computer(com_model, com_serial, com_core, com_ram, com_manufacture) VALUES ('XPS', '3242-0190-9944', 8, '16GB', 'Dell');
INSERT INTO computer(com_model, com_serial, com_core, com_ram, com_manufacture) VALUES ('XPS', '3242-0190-9944', 8, '16GB', 'Dell');

-- Satallite
INSERT INTO satallite(sat_serial, sat_name, sat_com_id, sat_sen_id, sat_c_id) VALUES ('1342-1232', 'OutOfThisWorld', 
    (SELECT com_id FROM computer OFFSET floor(random() * (SELECT COUNT(*) FROM computer)) LIMIT 1),
    (SELECT sen_id FROM sensor OFFSET floor(random() * (SELECT COUNT(*) FROM sensor)) LIMIT 1),
    (SELECT c_id FROM company OFFSET floor(random() * (SELECT COUNT(*) FROM company)) LIMIT 1)
);

