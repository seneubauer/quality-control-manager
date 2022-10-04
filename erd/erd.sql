-- create the supplier table
create table suppliers (
	supplier_id serial not null,
	name varchar(255) not null,
	primary key(supplier_id));

-- create the personnel table
create table personnel (
	employee_id serial,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	primary key(employee_id));

-- create the job_numbers table
create table job_numbers (
	job_number varchar(255) not null,
	description varchar(255) not null,
	primary key(job_number));

-- create the item_types table
create table item_types (
	item_number varchar(255) not null,
	description varchar(255) not null,
	primary key(item_number));

-- create the drawing_types table
create table drawing_types (
	drawing_number varchar(255) not null,
	revision varchar(255) not null,
	description varchar(255) not null,
	primary key(drawing_number, revision));

-- create the gages table
create table gages (
	gage_id serial,
	gage_name varchar(255) not null,
	last_calibrated date not null,
	description varchar(255) not null,
	primary key (gage_id));

-- create the purchase_orders table
create table purchase_orders (
	po_id serial,
	supplier_id int not null,
	description varchar(255) not null,
	primary key(po_id),
	foreign key(supplier_id) references suppliers(supplier_id));

-- create the inspection_records
create table inspection_records (
	item_id varchar(255) not null,
	drawing_number varchar(255) not null,
	drawing_revision varchar(255) not null,
	gage_id integer not null,
	date_measured date not null,
	inspector_id integer not null,
	operator_id integer not null,
	disposition boolean not null,
	po_id integer not null,
	reciever_number varchar(255) not null,
	job_number varchar(255) not null,
	full_inspect_interval integer not null,
	rel_quantity integer not null,
	comp_quantity integer not null,
	feature_id integer not null,
	dimension varchar(255) not null,
	usl decimal not null,
	lsl decimal not null,
	primary key(item_id, drawing_number, drawing_revision),
	foreign key(item_id) references item_types(item_number),
	foreign key(drawing_number, drawing_revision) references drawing_types(drawing_number, revision),
	foreign key(gage_id) references gages(gage_id),
	foreign key(inspector_id) references personnel(employee_id),
	foreign key(operator_id) references personnel(employee_id),
	foreign key(po_id) references purchase_orders(po_id),
	foreign key(job_number) references job_numbers(job_number));