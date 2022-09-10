DROP DATABASE IF EXISTS homesec;

create database homesec;
use homesec;

create table Usuario(
	cod_user int,
    name_user varchar(100),
	email varchar(100),
    birthdate date,
	Primary key (cod_user)
);

create table EventSensor(
	state int,
    tempo time,
    eventSensor char(20),
    Primary key (state)
);

create table MotionSensor(
	uuid_m varchar(10),
    activ_m bit not null,
    state_m int,
    eventSensor_m char(20),
    Primary key (uuid_m),
	Foreign key (state_m) references EventSensor(state)
);

create table ProximitySensor(
	uuid_p varchar(10),
    activ_p bit not null,
    state_p int,
    eventSensor_p char(20),
    Primary key (uuid_p),
	Foreign key (state_p) references EventSensor(state)
);

create table DeviceManager(
	uuid varchar(10),
    uuid_p varchar(10),
    Foreign key (uuid) references MotionSensor(uuid_m),
    Foreign key (uuid_p) references ProximitySensor(uuid_p)    
);