create table building
(
    buildingId   int auto_increment
        primary key,
    aircondition bit      null,
    price        int      null,
    dormNum      int      null,
    dormContent  smallint null,
    bathroom     bit      null,
    sextype      bit      null
);

create table dorm
(
    dormId     int auto_increment
        primary key,
    buildingId int         null,
    checkInNum smallint    null,
    dormNumber varchar(15) null,
    constraint dorm_ibfk_1
        foreign key (buildingId) references building (buildingId)
);

create index buildingId
    on dorm (buildingId);

create table ethnic
(
    ethnicId    int auto_increment
        primary key,
    description varchar(30) null
);

create table hometown
(
    hometown    int auto_increment
        primary key,
    description varchar(30) null
);

create table label
(
    labelId     int auto_increment
        primary key,
    type        int         null,
    description varchar(30) null
);

create table picture
(
    pictureid  int auto_increment
        primary key,
    path       varchar(300) null,
    buildingid int          null,
    constraint picture_building_buildingId_fk
        foreign key (buildingid) references building (buildingId)
);

create table studentinfo
(
    stuId    int auto_increment
        primary key,
    sex      bit         null,
    college  varchar(15) null,
    password varchar(15) null,
    name     varchar(30) null,
    dormId   int         null,
    ethnic   int         null,
    hometown int         null,
    classes  int         null,
    constraint studentinfo_ethnic_ethnicId_fk
        foreign key (ethnic) references ethnic (ethnicId),
    constraint studentinfo_hometown_hometown_fk
        foreign key (hometown) references hometown (hometown),
    constraint studentinfo_ibfk_1
        foreign key (dormId) references dorm (dormId)
);

create table invitation
(
    stuId     int              not null,
    invitorId int              not null,
    accept    bit default b'0' null,
    primary key (stuId, invitorId),
    constraint invitation_ibfk_1
        foreign key (stuId) references studentinfo (stuId),
    constraint invitation_ibfk_2
        foreign key (invitorId) references studentinfo (stuId)
);

create index invitorId
    on invitation (invitorId);

create table stu_building
(
    stuId      int not null,
    buildingId int not null,
    primary key (buildingId, stuId),
    constraint stu_building_building_buildingId_fk
        foreign key (buildingId) references building (buildingId),
    constraint stu_building_studentinfo_stuId_fk
        foreign key (stuId) references studentinfo (stuId)
);

create table stu_label
(
    stuId   int not null,
    labelId int not null,
    primary key (stuId, labelId),
    constraint stu_label_label_labelId_fk
        foreign key (labelId) references label (labelId),
    constraint stu_label_studentinfo_stuId_fk
        foreign key (stuId) references studentinfo (stuId)
);

create index dormId
    on studentinfo (dormId);


