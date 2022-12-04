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

