delete hhms.room;
delete hhms.room_status;
delete hhms.param_value;
delete hhms.manager;
delete hhms.employee;
delete hhms.employee_category;
delete hhms.item;
delete hhms.department;
delete hhms.operation;


-- department
insert INTO hhms.department (department_id,department,name,description, state) VALUES (1, 1, 'HSKP','HOUSEKEEPING','A');
insert INTO hhms.department (department_id,department,name,description, state) VALUES (2, 2, 'BQT','CATERING','A');
insert INTO hhms.department (department_id,department,name,description, state) VALUES (3, 3, 'JAN','JANITORIAL','A');
insert INTO hhms.department (department_id,department,name,description, state) VALUES (4, 4, 'LND','LAUNDRY','A');

insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'PILLOW CASES',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'SHEETS',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'FACE CLOTH',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'HAND TOWEL',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'BATH TOWEL',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'BATH MATS',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'HSKP RUGS',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'STRIPE SHEETS',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'PILLOW COVERS',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'SAUNA TOWELS',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'MTRSS PADS',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'BLANKET',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'DUVETS',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'BED SKIRTS',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'SHOWER COURTAINS',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'SHEERS',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'RUBBER MAT',1,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'ROBES',1,'A');


insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'BLANKET LINEN',2,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'BLANKET NAPKINS',2,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'DINING LINEN',2,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'DINING NAPKINS',2,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'TABLE SKIRTS',2,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'RUGS DUDDLEY',2,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'RUGS PEANUT',2,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'KITCHEN RUGS',2,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'SHIRTS',2,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'APRONS',2,'A');
insert into hhms.item (item_id, item, name, department_id, state ) values (hhms.item_seq.nextval,hhms.item_seq.currval,'PANTS',2,'A');



insert into hhms.employee_category (employee_category_id, description, state) values (1,'MANAGER','A');
insert into hhms.employee_category (employee_category_id, description, state) values (2,'SUPERVISOR','A');
insert into hhms.employee_category (employee_category_id, description, state) values (3,'JANITORIAL','A');
insert into hhms.employee_category (employee_category_id, description, state) values (4,'HOUSEKEEPING','A');
insert into hhms.employee_category (employee_category_id, description, state) values (5,'LAUNDRY','A');

-- employees
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Hanim','Alaam','1111',4,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Martha','Rojas','1112',4,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Damaris','Bolanos','1113',4,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Joan','Evans','1114',4,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Suad','Grant','1115',4,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Ganna','Solongo','1116',4,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Kiomara','Hall','1117',4,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Sanchir','Batu','1118',4,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Mieri','Welday','1119',4,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Andrea','Ramirez','1120',4,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Isabel','Tan','1121',4,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Annette','Alvaro','1122',4,'A');

insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Joyce','Demun','1123',5,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Maria','Layug','1124',5,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Chris','Garcia','1125',5,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Tammy','Gautier','1126',5,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Indra','Namuunb','1127',5,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Carolina','Ruz','1128',5,'A');

insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Victoria','Castillo','1129',3,'A');
insert into hhms.employee (employee_id, first_name, last_name, punch_number, employee_category_id, state ) values (hhms.employee_seq.nextval, 'Freddy','Mera','1130',3,'A');

insert into hhms.manager (MANAGER_ID,FIRST_NAME,LAST_NAME,USERNAME,PASSWORD,EMPLOYEE_CATEGORY_ID,STATE,email) values (hhms.manager_seq.nextval, 'Isabel','Opazo','iopazo','$2a$10$56VCAiApLO8NQYeOPiu2De/EBC5RWrTZvLl7uoeC3r7iXinRR1iiq',1,'A','sixtocode@gmail.com');
insert into hhms.manager (MANAGER_ID,FIRST_NAME,LAST_NAME,USERNAME,PASSWORD,EMPLOYEE_CATEGORY_ID,STATE) values (hhms.manager_seq.nextval, 'Teresa','Koleva','tkoleva','$2a$10$56VCAiApLO8NQYeOPiu2De/EBC5RWrTZvLl7uoeC3r7iXinRR1iiq',2,'A');
insert into hhms.manager (MANAGER_ID,FIRST_NAME,LAST_NAME,USERNAME,PASSWORD,EMPLOYEE_CATEGORY_ID,STATE,email) values (hhms.manager_seq.nextval, 'Luz','Opazo','lopazo','$2a$10$56VCAiApLO8NQYeOPiu2De/EBC5RWrTZvLl7uoeC3r7iXinRR1iiq',2,'A','marco.neira.carpio@gmail.com');

-- parameters
insert into hhms.param_value (parameter, value) values ('LABOR_FACTOR',18);

insert into hhms.room_status (room_status_id, room_status, description, state) values (hhms.room_status_seq.nextval, hhms.room_status_seq.currval, 'CHECK OUT', 'A');
insert into hhms.room_status (room_status_id, room_status, description, state) values (hhms.room_status_seq.nextval, hhms.room_status_seq.currval, 'STAY', 'A');
insert into hhms.room_status (room_status_id, room_status, description, state) values (hhms.room_status_seq.nextval, hhms.room_status_seq.currval, 'CLEAN', 'A');
insert into hhms.room_status (room_status_id, room_status, description, state) values (hhms.room_status_seq.nextval, hhms.room_status_seq.currval, 'AVAILABLE', 'A');
insert into hhms.room_status (room_status_id, room_status, description, state) values (hhms.room_status_seq.nextval, hhms.room_status_seq.currval, 'DONT DISTURBED', 'A');

-- rooms

insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '251', '2', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '252', '2', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '253', '2', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '254', '2', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '255', '2', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '256', '2', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '257', '2', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '258', '2', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '259', '2', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '260', '2', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '261', '2', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '262', '2', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '264', '2', null, 4, 'A');

insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '301', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '302', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '303', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '304', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '305', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '306', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '307', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '308', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '309', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '310', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '311', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '312', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '314', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '315', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '351', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '352', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '353', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '354', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '355', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '356', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '357', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '358', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '359', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '360', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '361', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '362', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '363', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '364', '3', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '366', '3', null, 4, 'A');

insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '401', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '402', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '403', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '404', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '405', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '406', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '407', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '408', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '409', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '410', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '411', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '412', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '414', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '415', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '451', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '452', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '453', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '454', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '455', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '456', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '457', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '458', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '459', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '460', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '461', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '462', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '463', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '464', '4', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '466', '4', null, 4, 'A');

insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '551', '5', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '552', '5', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '553', '5', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '554', '5', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '555', '5', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '556', '5', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '557', '5', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '558', '5', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '559', '5', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '560', '5', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '561', '5', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '562', '5', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '563', '5', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '564', '5', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '566', '5', null, 4, 'A');

insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '651', '6', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '652', '6', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '653', '6', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '654', '6', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '655', '6', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '656', '6', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '657', '6', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '658', '6', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '659', '6', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '660', '6', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '661', '6', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '662', '6', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '663', '6', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '664', '6', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '666', '6', null, 4, 'A');

insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '751', '7', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '752', '7', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '753', '7', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '754', '7', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '755', '7', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '756', '7', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '757', '7', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '758', '7', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '759', '7', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '760', '7', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '761', '7', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '762', '7', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '763', '7', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '764', '7', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '766', '7', null, 4, 'A');

insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '851', '8', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '852', '8', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '853', '8', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '854', '8', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '855', '8', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '856', '8', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '857', '8', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '858', '8', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '859', '8', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '860', '8', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '861', '8', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '862', '8', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '863', '8', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '864', '8', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '866', '8', null, 4, 'A');

insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '951', '9', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '952', '9', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '953', '9', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '954', '9', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '955', '9', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '956', '9', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '957', '9', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '958', '9', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '959', '9', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '960', '9', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '961', '9', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '962', '9', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '963', '9', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '964', '9', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '966', '9', null, 4, 'A');

insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '1051', '10', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '1052', '10', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '1053', '10', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '1054', '10', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '1055', '10', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '1056', '10', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '1057', '10', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '1058', '10', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '1059', '10', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '1060', '10', null, 4, 'A');
insert into hhms.room (room_id, room, floor, employee_id, room_status_id, state) values (hhms.room_seq.nextval, '1062', '10', null, 4, 'A');

insert into hhms.operation (operation_id, description, state) values (1,'Reset email request','A');
insert into hhms.operation (operation_id, description, state) values (2,'Change user password by reset email','A');
insert into hhms.operation (operation_id, description, state) values (3,'Change user password by mantainance option','A');
commit;


COMMIT;

