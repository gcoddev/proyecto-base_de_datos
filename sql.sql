create database proyecto_bd;

use proyecto_bd;

/* AULAS Y LABORATORIOS */
create table aulas_labos(
	cod_aula varchar(5) primary key not null,
	sillas int, 
	mesas int
);

insert into aulas_labos values('A1', 15, 7);
insert into aulas_labos values('B1', 15, 7);
insert into aulas_labos values('C1', 15, 7);
insert into aulas_labos values('A2', 15, 7);
insert into aulas_labos values('B2', 15, 7);
insert into aulas_labos values('C2', 15, 7);
insert into aulas_labos values('A3', 15, 7);
insert into aulas_labos values('B3', 15, 7);
insert into aulas_labos values('C3', 15, 7);
insert into aulas_labos values('LAB1', 15, 7);
insert into aulas_labos values('LAB2', 15, 7);
insert into aulas_labos values('LAB3', 15, 7);
insert into aulas_labos values('COMP1', 15, 7);
insert into aulas_labos values('COMP2', 15, 7);
select * from aulas_labos;

/* PARALELO */
create table paralelo(
	cod_paralelo int primary key not null,
	paralelo_n varchar(7) not null
);

insert into paralelo values(165, '1ro "A"');
insert into paralelo values(166, '1ro "B"');
insert into paralelo values(167, '1ro "C"');
insert into paralelo values(265, '2do "A"');
insert into paralelo values(266, '2do "B"');
insert into paralelo values(267, '2do "C"');
insert into paralelo values(365, '3ro "A"');
insert into paralelo values(366, '3ro "B"');
insert into paralelo values(367, '3ro "C"');
select * from paralelo;

/* PARALELO-AULA */
create table par_aula(
	cod_paralelo int,
	constraint FK_ParAula_paralelo foreign key (cod_paralelo) references paralelo(cod_paralelo),
	cod_aula varchar(5),
	constraint FK_ParAula_aula foreign key (cod_aula) references aulas_labos(cod_aula)
);

insert into par_aula values(165, 'A1');
insert into par_aula values(166, 'B1');
insert into par_aula values(167, 'C1');
insert into par_aula values(265, 'A2');
insert into par_aula values(266, 'B2');
insert into par_aula values(267, 'C2');
insert into par_aula values(365, 'A3');
insert into par_aula values(366, 'B3');
insert into par_aula values(367, 'C3');
select * from par_aula;


/* PROFESOR */
create table profesor(
	cod_profesor int primary key auto_increment not null,
	ci_profesor int,
	apellidos_p varchar(100),
	nombres_p varchar(100),
	n_celular_p int,
	usuario varchar(100),
	contrasena varchar(100)
);
alter table profesor auto_increment = 11;

insert into profesor values(null, 10000001, 'Limachi Quispe', 'Mary Luz', 70007002, 'mary_13', 'mary_13');
insert into profesor values(null, 10000002, 'Quispe Rodriguez', 'Luis', 70007005, 'luis_16', 'luis_16');
insert into profesor values(null, 10000003, 'Peña Yujra', 'Leyla', 70007006, 'leyla_17', 'leyla_17');
insert into profesor values(null, 10000004, 'Yapur Coche', 'Miguel', 70007008, 'miguel_19', 'miguel_19');
insert into profesor values(null, 10000005, 'Osco Vera', 'Yessica', 70007009, 'yessica_20', 'yessica_20');
insert into profesor values(null, 10000006, 'Rojas Pari', 'Cielo', 70007010, 'cielo_21', 'cielo_21');
insert into profesor values(null, 10000007, 'Quispe Mamani', 'Vladimir', 70007011, 'vladimir_22', 'vladimir_22');
insert into profesor values(null, 10000008, 'Apaza Quispe', 'Rosmelia', 70007012, 'rosmelia_23', 'rosmelia_23');
insert into profesor values(null, 10000009, 'Mamani Tintaya', 'Edwin', 70007013, 'edwin_24', 'edwin_24');
insert into profesor values(null, 10000010, 'Misme Nina', 'Karen', 70007015, 'karen_26', 'karen_26');
insert into profesor values(null, 10000011, 'Paucara Laura', 'Brayan', 70007016, 'brayan_27', 'brayan_27');
select * from profesor;

/* ESTUDIANTE */
create table estudiante(
	n_rude int primary key not null,
	ci_estudiante int not null,
	n_lista int not null,
	ap_paterno varchar(100) not null,
	ap_materno varchar(100) not null,
	nombres_e varchar(150) not null,
	edad int,
	n_celular_e int, 
	cod_paralelo int,
	constraint FK_Estudiante_codParalelo foreign key (cod_paralelo) references paralelo(cod_paralelo)
);

insert into estudiante values(1001, 50000001, 1, 'Calle', 'Alanoca', 'Mari Luz', 12, 67007001, 165);
insert into estudiante values(1002, 50000002, 2, 'Choquehuanca', 'Rengipo', 'Monica', 12, 67007002, 165);
insert into estudiante values(1003, 50000003, 3, 'Gomez', 'Yupanqui', 'Pedro Pablo', 12, 67007003, 165);
insert into estudiante values(1004, 50000004, 4, 'Laura', 'Mamani', 'Brayan', 12, 67007004, 165);
insert into estudiante values(1005, 50000005, 5, 'Mamani', 'Kantuta', 'Alvaro', 12, 67007005, 165);
insert into estudiante values(1006, 50000006, 6, 'Murga', 'Nina', 'Jazmin', 12, 67007006, 165);
insert into estudiante values(1007, 50000007, 7, 'Paucara', 'Mamani', 'Lucy', 12, 67007007, 165);
insert into estudiante values(1008, 50000008, 8, 'Quispe', 'Condori', 'Dayana Rocio', 12, 67007008, 165);
insert into estudiante values(1009, 50000009, 9, 'Quispe', 'Poma', 'Adalid Esau', 12, 67007009, 165);
insert into estudiante values(1010, 50000010, 10, 'Ramos', 'Bautista', 'Gary Nicolas', 12, 67007010, 165);

insert into estudiante values(2001, 50001001, 1, 'Calle', 'Alanoca', 'Mari Luz', 12, 67008001, 166);
insert into estudiante values(2002, 50001002, 2, 'Choquehuanca', 'Rengipo', 'Monica', 12, 67008002, 166);
insert into estudiante values(2003, 50001003, 3, 'Gomez', 'Yupanqui', 'Pedro Pablo', 12, 67008003, 166);
insert into estudiante values(2004, 50001004, 4, 'Laura', 'Mamani', 'Brayan', 12, 67008004, 166);
insert into estudiante values(2005, 50001005, 5, 'Mamani', 'Kantuta', 'Alvaro', 12, 67008005, 166);
insert into estudiante values(2006, 50001006, 6, 'Murga', 'Nina', 'Jazmin', 12, 67008006, 166);
insert into estudiante values(2007, 50001007, 7, 'Paucara', 'Mamani', 'Lucy', 12, 67008007, 166);
insert into estudiante values(2008, 50001008, 8, 'Quispe', 'Condori', 'Dayana Rocio', 12, 67008008, 166);
insert into estudiante values(2009, 50001009, 9, 'Quispe', 'Poma', 'Adalid Esau', 12, 67008009, 166);
insert into estudiante values(2010, 50001010, 10, 'Ramos', 'Bautista', 'Gary Nicolas', 12, 67008010, 166);

insert into estudiante values(3001, 50002001, 1, 'Calle', 'Alanoca', 'Mari Luz', 12, 67009001, 167);
insert into estudiante values(3002, 50002002, 2, 'Choquehuanca', 'Rengipo', 'Monica', 12, 67009002, 167);
insert into estudiante values(3003, 50002003, 3, 'Gomez', 'Yupanqui', 'Pedro Pablo', 12, 67009003, 167);
insert into estudiante values(3004, 50002004, 4, 'Laura', 'Mamani', 'Brayan', 12, 67009004, 167);
insert into estudiante values(3005, 50002005, 5, 'Mamani', 'Kantuta', 'Alvaro', 12, 67009005, 167);
insert into estudiante values(3006, 50002006, 6, 'Murga', 'Nina', 'Jazmin', 12, 67009006, 167);
insert into estudiante values(3007, 50002007, 7, 'Paucara', 'Mamani', 'Lucy', 12, 67009007, 167);
insert into estudiante values(3008, 50002008, 8, 'Quispe', 'Condori', 'Dayana Rocio', 12, 67009008, 167);
insert into estudiante values(3009, 50002009, 9, 'Quispe', 'Poma', 'Adalid Esau', 12, 67009009, 167);
insert into estudiante values(3010, 50002010, 10, 'Ramos', 'Bautista', 'Gary Nicolas', 12, 67009010, 167);



insert into estudiante values(4001, 50003001, 1, 'Calle', 'Alanoca', 'Mari Luz', 13, 67010001, 265);
insert into estudiante values(4002, 50003002, 2, 'Choquehuanca', 'Rengipo', 'Monica', 13, 67010002, 265);
insert into estudiante values(4003, 50003003, 3, 'Gomez', 'Yupanqui', 'Pedro Pablo', 13, 67010003, 265);
insert into estudiante values(4004, 50003004, 4, 'Laura', 'Mamani', 'Brayan', 13, 67010004, 265);
insert into estudiante values(4005, 50003005, 5, 'Mamani', 'Kantuta', 'Alvaro', 13, 67010005, 265);
insert into estudiante values(4006, 50003006, 6, 'Murga', 'Nina', 'Jazmin', 13, 67010006, 265);
insert into estudiante values(4007, 50003007, 7, 'Paucara', 'Mamani', 'Lucy', 13, 67010007, 265);
insert into estudiante values(4008, 50003008, 8, 'Quispe', 'Condori', 'Dayana Rocio', 12, 67010008, 265);
insert into estudiante values(4009, 50003009, 9, 'Quispe', 'Poma', 'Adalid Esau', 13, 67010009, 265);
insert into estudiante values(4010, 50003010, 10, 'Ramos', 'Bautista', 'Gary Nicolas', 13, 67010010, 265);

insert into estudiante values(5001, 50004001, 1, 'Calle', 'Alanoca', 'Mari Luz', 13, 67011001, 266);
insert into estudiante values(5002, 50004002, 2, 'Choquehuanca', 'Rengipo', 'Monica', 13, 67011002, 266);
insert into estudiante values(5003, 50004003, 3, 'Gomez', 'Yupanqui', 'Pedro Pablo', 13, 67011003, 266);
insert into estudiante values(5004, 50004004, 4, 'Laura', 'Mamani', 'Brayan', 13, 67011004, 266);
insert into estudiante values(5005, 50004005, 5, 'Mamani', 'Kantuta', 'Alvaro', 13, 67011005, 266);
insert into estudiante values(5006, 50004006, 6, 'Murga', 'Nina', 'Jazmin', 13, 67011006, 266);
insert into estudiante values(5007, 50004007, 7, 'Paucara', 'Mamani', 'Lucy', 13, 67011007, 266);
insert into estudiante values(5008, 50004008, 8, 'Quispe', 'Condori', 'Dayana Rocio', 12, 67011008, 266);
insert into estudiante values(5009, 50004009, 9, 'Quispe', 'Poma', 'Adalid Esau', 13, 67011009, 266);
insert into estudiante values(5010, 50004010, 10, 'Ramos', 'Bautista', 'Gary Nicolas', 13, 67011010, 266);

insert into estudiante values(6001, 50005001, 1, 'Calle', 'Alanoca', 'Mari Luz', 13, 67012001, 267);
insert into estudiante values(6002, 50005002, 2, 'Choquehuanca', 'Rengipo', 'Monica', 13, 67012002, 267);
insert into estudiante values(6003, 50005003, 3, 'Gomez', 'Yupanqui', 'Pedro Pablo', 13, 67012003, 267);
insert into estudiante values(6004, 50005004, 4, 'Laura', 'Mamani', 'Brayan', 13, 67012004, 267);
insert into estudiante values(6005, 50005005, 5, 'Mamani', 'Kantuta', 'Alvaro', 13, 67012005, 267);
insert into estudiante values(6006, 50005006, 6, 'Murga', 'Nina', 'Jazmin', 13, 67012006, 267);
insert into estudiante values(6007, 50005007, 7, 'Paucara', 'Mamani', 'Lucy', 13, 67012007, 267);
insert into estudiante values(6008, 50005008, 8, 'Quispe', 'Condori', 'Dayana Rocio', 13, 67012008, 267);
insert into estudiante values(6009, 50005009, 9, 'Quispe', 'Poma', 'Adalid Esau', 13, 67012009, 267);
insert into estudiante values(6010, 50005010, 10, 'Ramos', 'Bautista', 'Gary Nicolas', 13, 67012010, 267);



insert into estudiante values(7001, 50006001, 1, 'Calle', 'Alanoca', 'Mari Luz', 14, 67013001, 365);
insert into estudiante values(7002, 50006002, 2, 'Choquehuanca', 'Rengipo', 'Monica', 14, 67013002, 365);
insert into estudiante values(7003, 50006003, 3, 'Gomez', 'Yupanqui', 'Pedro Pablo', 14, 67013003, 365);
insert into estudiante values(7004, 50006004, 4, 'Laura', 'Mamani', 'Brayan', 14, 67013004, 365);
insert into estudiante values(7005, 50006005, 5, 'Mamani', 'Kantuta', 'Alvaro', 14, 67013005, 365);
insert into estudiante values(7006, 50006006, 6, 'Murga', 'Nina', 'Jazmin', 14, 67013006, 365);
insert into estudiante values(7007, 50006007, 7, 'Paucara', 'Mamani', 'Lucy', 14, 67013007, 365);
insert into estudiante values(7008, 50006008, 8, 'Quispe', 'Condori', 'Dayana Rocio', 14, 67013008, 365);
insert into estudiante values(7009, 50006009, 9, 'Quispe', 'Poma', 'Adalid Esau', 14, 67013009, 365);
insert into estudiante values(7010, 50006010, 10, 'Ramos', 'Bautista', 'Gary Nicolas', 14, 67013010, 365);

insert into estudiante values(8001, 50007001, 1, 'Calle', 'Alanoca', 'Mari Luz', 14, 67014001, 366);
insert into estudiante values(8002, 50007002, 2, 'Choquehuanca', 'Rengipo', 'Monica', 14, 67014002, 366);
insert into estudiante values(8003, 50007003, 3, 'Gomez', 'Yupanqui', 'Pedro Pablo', 14, 67014003, 366);
insert into estudiante values(8004, 50007004, 4, 'Laura', 'Mamani', 'Brayan', 14, 67014004, 366);
insert into estudiante values(8005, 50007005, 5, 'Mamani', 'Kantuta', 'Alvaro', 14, 67014005, 366);
insert into estudiante values(8006, 50007006, 6, 'Murga', 'Nina', 'Jazmin', 14, 67014006, 366);
insert into estudiante values(8007, 50007007, 7, 'Paucara', 'Mamani', 'Lucy', 14, 67014007, 366);
insert into estudiante values(8008, 50007008, 8, 'Quispe', 'Condori', 'Dayana Rocio', 14, 67014008, 366);
insert into estudiante values(8009, 50007009, 9, 'Quispe', 'Poma', 'Adalid Esau', 14, 67014009, 366);
insert into estudiante values(8010, 50007010, 10, 'Ramos', 'Bautista', 'Gary Nicolas', 14, 67014010, 366);

insert into estudiante values(9001, 50008001, 1, 'Calle', 'Alanoca', 'Mari Luz', 14, 67015001, 367);
insert into estudiante values(9002, 50008002, 2, 'Choquehuanca', 'Rengipo', 'Monica', 14, 67015002, 367);
insert into estudiante values(9003, 50008003, 3, 'Gomez', 'Yupanqui', 'Pedro Pablo', 14, 67015003, 367);
insert into estudiante values(9004, 50008004, 4, 'Laura', 'Mamani', 'Brayan', 14, 67015004, 367);
insert into estudiante values(9005, 50008005, 5, 'Mamani', 'Kantuta', 'Alvaro', 14, 67015005, 367);
insert into estudiante values(9006, 50008006, 6, 'Murga', 'Nina', 'Jazmin', 14, 67015006, 367);
insert into estudiante values(9007, 50008007, 7, 'Paucara', 'Mamani', 'Lucy', 14, 67015007, 367);
insert into estudiante values(9008, 50008008, 8, 'Quispe', 'Condori', 'Dayana Rocio', 14, 67015008, 367);
insert into estudiante values(9009, 50008009, 9, 'Quispe', 'Poma', 'Adalid Esau', 14, 67015009, 367);
insert into estudiante values(9010, 50008010, 10, 'Ramos', 'Bautista', 'Gary Nicolas', 14, 67015010, 367);

select * from estudiante;

/* NOTAS */
create table notas(
	cod_notas int primary key auto_increment not null,
	practicas_1t float,
	proyectos_1t float,
	examen_1t float,
	nota_1t float,
	practicas_2t float,
	proyectos_2t float,
	examen_2t float,
	nota_2t float,
	practicas_3t float,
	proyectos_3t float,
	examen_3t float,
	nota_3t float,
	nota_final float
);
alter table notas auto_increment = 11001;

delimiter //
create procedure ciclo(in istart int, in iend int)
begin
while istart <= iend do
insert into notas(nota_final) values(0);
set istart = istart + 1;
end while;
end //
call ciclo (1, 990);
select * from notas;


/* MATERIA */
create table materia(
	cod_materia varchar(3) primary key not null,
	nombre_m varchar(50) not null
);

insert into materia values('MAT', 'MATEMATICA');
insert into materia values('LEN', 'LENGUAJE Y LITERATURA');
insert into materia values('CSS', 'CIENCIAS SOCIALES');
insert into materia values('BIO', 'BIOLOGIA');
insert into materia values('MUS', 'MUSICA');
insert into materia values('EDU', 'EDUCACION FISICA');
insert into materia values('VER', 'VALORES ESPIRITUALIDADES Y RELIGIONES');
insert into materia values('FIL' ,'FILOSOFIA');
insert into materia values('FIS' ,'FISICA');
insert into materia values('QMC' ,'QUIMICA');
insert into materia values('APV' ,'ARTES PLASTICAS Y VISUALES');
select * from materia;

/* PROF-MAT-PAR */
create table prof_mat_par(
	cod_profesor int,
	constraint FK_PMP_profesor foreign key (cod_profesor) references profesor(cod_profesor),
	cod_materia VARCHAR(3),
	constraint FK_PMP_materia foreign key (cod_materia) references materia(cod_materia),
	cod_paralelo int,
	constraint FK_PMP_paralelo foreign key (cod_paralelo) references paralelo(cod_paralelo)
);

insert into prof_mat_par values(11, 'APV', 165);
insert into prof_mat_par values(11, 'APV', 166);
insert into prof_mat_par values(11, 'APV', 167);
insert into prof_mat_par values(11, 'APV', 265);
insert into prof_mat_par values(11, 'APV', 266);
insert into prof_mat_par values(11, 'APV', 267);
insert into prof_mat_par values(11, 'APV', 365);
insert into prof_mat_par values(11, 'APV', 366);
insert into prof_mat_par values(11, 'APV', 367);

insert into prof_mat_par values(12, 'BIO', 165);
insert into prof_mat_par values(12, 'BIO', 166);
insert into prof_mat_par values(12, 'BIO', 167);
insert into prof_mat_par values(12, 'BIO', 265);
insert into prof_mat_par values(12, 'BIO', 266);
insert into prof_mat_par values(12, 'BIO', 267);
insert into prof_mat_par values(12, 'BIO', 365);
insert into prof_mat_par values(12, 'BIO', 366);
insert into prof_mat_par values(12, 'BIO', 367);

insert into prof_mat_par values(13, 'CSS', 165);
insert into prof_mat_par values(13, 'CSS', 166);
insert into prof_mat_par values(13, 'CSS', 167);
insert into prof_mat_par values(13, 'CSS', 265);
insert into prof_mat_par values(13, 'CSS', 266);
insert into prof_mat_par values(13, 'CSS', 267);
insert into prof_mat_par values(13, 'CSS', 365);
insert into prof_mat_par values(13, 'CSS', 366);
insert into prof_mat_par values(13, 'CSS', 367);

insert into prof_mat_par values(14, 'EDU', 165);
insert into prof_mat_par values(14, 'EDU', 166);
insert into prof_mat_par values(14, 'EDU', 167);
insert into prof_mat_par values(14, 'EDU', 265);
insert into prof_mat_par values(14, 'EDU', 266);
insert into prof_mat_par values(14, 'EDU', 267);
insert into prof_mat_par values(14, 'EDU', 365);
insert into prof_mat_par values(14, 'EDU', 366);
insert into prof_mat_par values(14, 'EDU', 367);

insert into prof_mat_par values(15, 'FIL', 165);
insert into prof_mat_par values(15, 'FIL', 166);
insert into prof_mat_par values(15, 'FIL', 167);
insert into prof_mat_par values(15, 'FIL', 265);
insert into prof_mat_par values(15, 'FIL', 266);
insert into prof_mat_par values(15, 'FIL', 267);
insert into prof_mat_par values(15, 'FIL', 365);
insert into prof_mat_par values(15, 'FIL', 366);
insert into prof_mat_par values(15, 'FIL', 367);

insert into prof_mat_par values(16, 'FIS', 165);
insert into prof_mat_par values(16, 'FIS', 166);
insert into prof_mat_par values(16, 'FIS', 167);
insert into prof_mat_par values(16, 'FIS', 265);
insert into prof_mat_par values(16, 'FIS', 266);
insert into prof_mat_par values(16, 'FIS', 267);
insert into prof_mat_par values(16, 'FIS', 365);
insert into prof_mat_par values(16, 'FIS', 366);
insert into prof_mat_par values(16, 'FIS', 367);

insert into prof_mat_par values(17, 'LEN', 165);
insert into prof_mat_par values(17, 'LEN', 166);
insert into prof_mat_par values(17, 'LEN', 167);
insert into prof_mat_par values(17, 'LEN', 265);
insert into prof_mat_par values(17, 'LEN', 266);
insert into prof_mat_par values(17, 'LEN', 267);
insert into prof_mat_par values(17, 'LEN', 365);
insert into prof_mat_par values(17, 'LEN', 366);
insert into prof_mat_par values(17, 'LEN', 367);

insert into prof_mat_par values(18, 'MAT', 165);
insert into prof_mat_par values(18, 'MAT', 166);
insert into prof_mat_par values(18, 'MAT', 167);
insert into prof_mat_par values(18, 'MAT', 265);
insert into prof_mat_par values(18, 'MAT', 266);
insert into prof_mat_par values(18, 'MAT', 267);
insert into prof_mat_par values(18, 'MAT', 365);
insert into prof_mat_par values(18, 'MAT', 366);
insert into prof_mat_par values(18, 'MAT', 367);

insert into prof_mat_par values(19, 'MUS', 165);
insert into prof_mat_par values(19, 'MUS', 166);
insert into prof_mat_par values(19, 'MUS', 167);
insert into prof_mat_par values(19, 'MUS', 265);
insert into prof_mat_par values(19, 'MUS', 266);
insert into prof_mat_par values(19, 'MUS', 267);
insert into prof_mat_par values(19, 'MUS', 365);
insert into prof_mat_par values(19, 'MUS', 366);
insert into prof_mat_par values(19, 'MUS', 367);

insert into prof_mat_par values(20, 'QMC', 165);
insert into prof_mat_par values(20, 'QMC', 166);
insert into prof_mat_par values(20, 'QMC', 167);
insert into prof_mat_par values(20, 'QMC', 265);
insert into prof_mat_par values(20, 'QMC', 266);
insert into prof_mat_par values(20, 'QMC', 267);
insert into prof_mat_par values(20, 'QMC', 365);
insert into prof_mat_par values(20, 'QMC', 366);
insert into prof_mat_par values(20, 'QMC', 367);

insert into prof_mat_par values(21, 'VER', 165);
insert into prof_mat_par values(21, 'VER', 166);
insert into prof_mat_par values(21, 'VER', 167);
insert into prof_mat_par values(21, 'VER', 265);
insert into prof_mat_par values(21, 'VER', 266);
insert into prof_mat_par values(21, 'VER', 267);
insert into prof_mat_par values(21, 'VER', 365);
insert into prof_mat_par values(21, 'VER', 366);
insert into prof_mat_par values(21, 'VER', 367);

select * from prof_mat_par;

/* MATERIA-ESTUDIANTE-NOTAS */
create table mat_est_not(
	cod_materia varchar(3),
	constraint FK_MEN_materia foreign key (cod_materia) references materia(cod_materia),
	n_rude int,
	constraint FK_MEN_rude foreign key (n_rude) references estudiante(n_rude),
	cod_notas int auto_increment,
	constraint FK_MEN_notas foreign key (cod_notas) references notas(cod_notas)
);
alter table mat_est_not auto_increment = 11001;

insert into mat_est_not(cod_materia, n_rude) values('APV', 1001);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 1001);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 1001);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 1001);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 1001);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 1001);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 1001);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 1001);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 1001);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 1001);
insert into mat_est_not(cod_materia, n_rude) values('VER', 1001);

insert into mat_est_not(cod_materia, n_rude) values('APV', 1002);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 1002);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 1002);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 1002);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 1002);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 1002);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 1002);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 1002);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 1002);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 1002);
insert into mat_est_not(cod_materia, n_rude) values('VER', 1002);

insert into mat_est_not(cod_materia, n_rude) values('APV', 1003);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 1003);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 1003);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 1003);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 1003);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 1003);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 1003);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 1003);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 1003);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 1003);
insert into mat_est_not(cod_materia, n_rude) values('VER', 1003);

insert into mat_est_not(cod_materia, n_rude) values('APV', 1004);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 1004);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 1004);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 1004);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 1004);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 1004);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 1004);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 1004);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 1004);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 1004);
insert into mat_est_not(cod_materia, n_rude) values('VER', 1004);

insert into mat_est_not(cod_materia, n_rude) values('APV', 1005);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 1005);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 1005);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 1005);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 1005);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 1005);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 1005);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 1005);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 1005);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 1005);
insert into mat_est_not(cod_materia, n_rude) values('VER', 1005);

insert into mat_est_not(cod_materia, n_rude) values('APV', 1006);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 1006);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 1006);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 1006);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 1006);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 1006);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 1006);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 1006);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 1006);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 1006);
insert into mat_est_not(cod_materia, n_rude) values('VER', 1006);

insert into mat_est_not(cod_materia, n_rude) values('APV', 1007);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 1007);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 1007);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 1007);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 1007);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 1007);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 1007);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 1007);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 1007);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 1007);
insert into mat_est_not(cod_materia, n_rude) values('VER', 1007);

insert into mat_est_not(cod_materia, n_rude) values('APV', 1008);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 1008);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 1008);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 1008);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 1008);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 1008);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 1008);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 1008);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 1008);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 1008);
insert into mat_est_not(cod_materia, n_rude) values('VER', 1008);

insert into mat_est_not(cod_materia, n_rude) values('APV', 1009);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 1009);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 1009);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 1009);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 1009);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 1009);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 1009);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 1009);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 1009);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 1009);
insert into mat_est_not(cod_materia, n_rude) values('VER', 1009);

insert into mat_est_not(cod_materia, n_rude) values('APV', 1010);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 1010);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 1010);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 1010);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 1010);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 1010);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 1010);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 1010);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 1010);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 1010);
insert into mat_est_not(cod_materia, n_rude) values('VER', 1010);



insert into mat_est_not(cod_materia, n_rude) values('APV', 2001);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 2001);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 2001);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 2001);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 2001);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 2001);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 2001);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 2001);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 2001);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 2001);
insert into mat_est_not(cod_materia, n_rude) values('VER', 2001);

insert into mat_est_not(cod_materia, n_rude) values('APV', 2002);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 2002);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 2002);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 2002);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 2002);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 2002);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 2002);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 2002);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 2002);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 2002);
insert into mat_est_not(cod_materia, n_rude) values('VER', 2002);

insert into mat_est_not(cod_materia, n_rude) values('APV', 2003);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 2003);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 2003);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 2003);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 2003);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 2003);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 2003);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 2003);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 2003);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 2003);
insert into mat_est_not(cod_materia, n_rude) values('VER', 2003);

insert into mat_est_not(cod_materia, n_rude) values('APV', 2004);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 2004);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 2004);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 2004);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 2004);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 2004);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 2004);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 2004);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 2004);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 2004);
insert into mat_est_not(cod_materia, n_rude) values('VER', 2004);

insert into mat_est_not(cod_materia, n_rude) values('APV', 2005);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 2005);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 2005);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 2005);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 2005);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 2005);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 2005);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 2005);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 2005);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 2005);
insert into mat_est_not(cod_materia, n_rude) values('VER', 2005);

insert into mat_est_not(cod_materia, n_rude) values('APV', 2006);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 2006);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 2006);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 2006);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 2006);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 2006);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 2006);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 2006);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 2006);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 2006);
insert into mat_est_not(cod_materia, n_rude) values('VER', 2006);

insert into mat_est_not(cod_materia, n_rude) values('APV', 2007);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 2007);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 2007);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 2007);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 2007);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 2007);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 2007);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 2007);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 2007);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 2007);
insert into mat_est_not(cod_materia, n_rude) values('VER', 2007);

insert into mat_est_not(cod_materia, n_rude) values('APV', 2008);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 2008);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 2008);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 2008);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 2008);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 2008);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 2008);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 2008);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 2008);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 2008);
insert into mat_est_not(cod_materia, n_rude) values('VER', 2008);

insert into mat_est_not(cod_materia, n_rude) values('APV', 2009);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 2009);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 2009);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 2009);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 2009);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 2009);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 2009);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 2009);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 2009);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 2009);
insert into mat_est_not(cod_materia, n_rude) values('VER', 2009);

insert into mat_est_not(cod_materia, n_rude) values('APV', 2010);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 2010);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 2010);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 2010);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 2010);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 2010);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 2010);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 2010);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 2010);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 2010);
insert into mat_est_not(cod_materia, n_rude) values('VER', 2010);



insert into mat_est_not(cod_materia, n_rude) values('APV', 3001);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 3001);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 3001);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 3001);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 3001);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 3001);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 3001);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 3001);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 3001);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 3001);
insert into mat_est_not(cod_materia, n_rude) values('VER', 3001);

insert into mat_est_not(cod_materia, n_rude) values('APV', 3002);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 3002);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 3002);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 3002);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 3002);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 3002);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 3002);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 3002);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 3002);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 3002);
insert into mat_est_not(cod_materia, n_rude) values('VER', 3002);

insert into mat_est_not(cod_materia, n_rude) values('APV', 3003);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 3003);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 3003);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 3003);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 3003);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 3003);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 3003);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 3003);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 3003);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 3003);
insert into mat_est_not(cod_materia, n_rude) values('VER', 3003);

insert into mat_est_not(cod_materia, n_rude) values('APV', 3004);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 3004);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 3004);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 3004);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 3004);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 3004);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 3004);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 3004);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 3004);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 3004);
insert into mat_est_not(cod_materia, n_rude) values('VER', 3004);

insert into mat_est_not(cod_materia, n_rude) values('APV', 3005);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 3005);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 3005);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 3005);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 3005);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 3005);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 3005);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 3005);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 3005);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 3005);
insert into mat_est_not(cod_materia, n_rude) values('VER', 3005);

insert into mat_est_not(cod_materia, n_rude) values('APV', 3006);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 3006);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 3006);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 3006);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 3006);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 3006);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 3006);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 3006);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 3006);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 3006);
insert into mat_est_not(cod_materia, n_rude) values('VER', 3006);

insert into mat_est_not(cod_materia, n_rude) values('APV', 3007);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 3007);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 3007);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 3007);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 3007);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 3007);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 3007);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 3007);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 3007);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 3007);
insert into mat_est_not(cod_materia, n_rude) values('VER', 3007);

insert into mat_est_not(cod_materia, n_rude) values('APV', 3008);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 3008);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 3008);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 3008);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 3008);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 3008);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 3008);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 3008);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 3008);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 3008);
insert into mat_est_not(cod_materia, n_rude) values('VER', 3008);

insert into mat_est_not(cod_materia, n_rude) values('APV', 3009);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 3009);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 3009);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 3009);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 3009);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 3009);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 3009);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 3009);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 3009);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 3009);
insert into mat_est_not(cod_materia, n_rude) values('VER', 3009);

insert into mat_est_not(cod_materia, n_rude) values('APV', 3010);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 3010);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 3010);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 3010);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 3010);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 3010);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 3010);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 3010);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 3010);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 3010);
insert into mat_est_not(cod_materia, n_rude) values('VER', 3010);



insert into mat_est_not(cod_materia, n_rude) values('APV', 4001);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 4001);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 4001);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 4001);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 4001);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 4001);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 4001);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 4001);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 4001);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 4001);
insert into mat_est_not(cod_materia, n_rude) values('VER', 4001);

insert into mat_est_not(cod_materia, n_rude) values('APV', 4002);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 4002);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 4002);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 4002);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 4002);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 4002);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 4002);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 4002);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 4002);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 4002);
insert into mat_est_not(cod_materia, n_rude) values('VER', 4002);

insert into mat_est_not(cod_materia, n_rude) values('APV', 4003);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 4003);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 4003);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 4003);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 4003);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 4003);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 4003);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 4003);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 4003);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 4003);
insert into mat_est_not(cod_materia, n_rude) values('VER', 4003);

insert into mat_est_not(cod_materia, n_rude) values('APV', 4004);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 4004);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 4004);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 4004);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 4004);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 4004);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 4004);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 4004);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 4004);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 4004);
insert into mat_est_not(cod_materia, n_rude) values('VER', 4004);

insert into mat_est_not(cod_materia, n_rude) values('APV', 4005);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 4005);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 4005);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 4005);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 4005);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 4005);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 4005);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 4005);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 4005);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 4005);
insert into mat_est_not(cod_materia, n_rude) values('VER', 4005);

insert into mat_est_not(cod_materia, n_rude) values('APV', 4006);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 4006);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 4006);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 4006);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 4006);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 4006);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 4006);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 4006);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 4006);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 4006);
insert into mat_est_not(cod_materia, n_rude) values('VER', 4006);

insert into mat_est_not(cod_materia, n_rude) values('APV', 4007);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 4007);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 4007);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 4007);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 4007);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 4007);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 4007);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 4007);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 4007);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 4007);
insert into mat_est_not(cod_materia, n_rude) values('VER', 4007);

insert into mat_est_not(cod_materia, n_rude) values('APV', 4008);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 4008);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 4008);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 4008);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 4008);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 4008);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 4008);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 4008);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 4008);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 4008);
insert into mat_est_not(cod_materia, n_rude) values('VER', 4008);

insert into mat_est_not(cod_materia, n_rude) values('APV', 4009);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 4009);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 4009);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 4009);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 4009);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 4009);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 4009);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 4009);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 4009);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 4009);
insert into mat_est_not(cod_materia, n_rude) values('VER', 4009);

insert into mat_est_not(cod_materia, n_rude) values('APV', 4010);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 4010);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 4010);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 4010);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 4010);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 4010);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 4010);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 4010);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 4010);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 4010);
insert into mat_est_not(cod_materia, n_rude) values('VER', 4010);



insert into mat_est_not(cod_materia, n_rude) values('APV', 5001);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 5001);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 5001);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 5001);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 5001);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 5001);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 5001);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 5001);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 5001);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 5001);
insert into mat_est_not(cod_materia, n_rude) values('VER', 5001);

insert into mat_est_not(cod_materia, n_rude) values('APV', 5002);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 5002);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 5002);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 5002);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 5002);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 5002);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 5002);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 5002);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 5002);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 5002);
insert into mat_est_not(cod_materia, n_rude) values('VER', 5002);

insert into mat_est_not(cod_materia, n_rude) values('APV', 5003);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 5003);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 5003);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 5003);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 5003);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 5003);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 5003);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 5003);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 5003);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 5003);
insert into mat_est_not(cod_materia, n_rude) values('VER', 5003);

insert into mat_est_not(cod_materia, n_rude) values('APV', 5004);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 5004);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 5004);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 5004);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 5004);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 5004);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 5004);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 5004);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 5004);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 5004);
insert into mat_est_not(cod_materia, n_rude) values('VER', 5004);

insert into mat_est_not(cod_materia, n_rude) values('APV', 5005);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 5005);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 5005);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 5005);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 5005);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 5005);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 5005);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 5005);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 5005);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 5005);
insert into mat_est_not(cod_materia, n_rude) values('VER', 5005);

insert into mat_est_not(cod_materia, n_rude) values('APV', 5006);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 5006);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 5006);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 5006);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 5006);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 5006);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 5006);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 5006);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 5006);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 5006);
insert into mat_est_not(cod_materia, n_rude) values('VER', 5006);

insert into mat_est_not(cod_materia, n_rude) values('APV', 5007);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 5007);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 5007);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 5007);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 5007);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 5007);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 5007);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 5007);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 5007);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 5007);
insert into mat_est_not(cod_materia, n_rude) values('VER', 5007);

insert into mat_est_not(cod_materia, n_rude) values('APV', 5008);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 5008);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 5008);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 5008);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 5008);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 5008);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 5008);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 5008);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 5008);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 5008);
insert into mat_est_not(cod_materia, n_rude) values('VER', 5008);

insert into mat_est_not(cod_materia, n_rude) values('APV', 5009);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 5009);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 5009);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 5009);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 5009);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 5009);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 5009);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 5009);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 5009);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 5009);
insert into mat_est_not(cod_materia, n_rude) values('VER', 5009);

insert into mat_est_not(cod_materia, n_rude) values('APV', 5010);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 5010);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 5010);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 5010);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 5010);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 5010);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 5010);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 5010);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 5010);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 5010);
insert into mat_est_not(cod_materia, n_rude) values('VER', 5010);



insert into mat_est_not(cod_materia, n_rude) values('APV', 6001);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 6001);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 6001);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 6001);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 6001);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 6001);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 6001);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 6001);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 6001);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 6001);
insert into mat_est_not(cod_materia, n_rude) values('VER', 6001);

insert into mat_est_not(cod_materia, n_rude) values('APV', 6002);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 6002);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 6002);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 6002);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 6002);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 6002);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 6002);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 6002);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 6002);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 6002);
insert into mat_est_not(cod_materia, n_rude) values('VER', 6002);

insert into mat_est_not(cod_materia, n_rude) values('APV', 6003);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 6003);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 6003);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 6003);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 6003);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 6003);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 6003);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 6003);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 6003);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 6003);
insert into mat_est_not(cod_materia, n_rude) values('VER', 6003);

insert into mat_est_not(cod_materia, n_rude) values('APV', 6004);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 6004);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 6004);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 6004);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 6004);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 6004);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 6004);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 6004);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 6004);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 6004);
insert into mat_est_not(cod_materia, n_rude) values('VER', 6004);

insert into mat_est_not(cod_materia, n_rude) values('APV', 6005);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 6005);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 6005);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 6005);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 6005);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 6005);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 6005);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 6005);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 6005);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 6005);
insert into mat_est_not(cod_materia, n_rude) values('VER', 6005);

insert into mat_est_not(cod_materia, n_rude) values('APV', 6006);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 6006);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 6006);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 6006);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 6006);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 6006);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 6006);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 6006);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 6006);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 6006);
insert into mat_est_not(cod_materia, n_rude) values('VER', 6006);

insert into mat_est_not(cod_materia, n_rude) values('APV', 6007);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 6007);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 6007);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 6007);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 6007);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 6007);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 6007);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 6007);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 6007);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 6007);
insert into mat_est_not(cod_materia, n_rude) values('VER', 6007);

insert into mat_est_not(cod_materia, n_rude) values('APV', 6008);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 6008);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 6008);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 6008);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 6008);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 6008);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 6008);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 6008);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 6008);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 6008);
insert into mat_est_not(cod_materia, n_rude) values('VER', 6008);

insert into mat_est_not(cod_materia, n_rude) values('APV', 6009);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 6009);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 6009);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 6009);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 6009);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 6009);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 6009);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 6009);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 6009);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 6009);
insert into mat_est_not(cod_materia, n_rude) values('VER', 6009);

insert into mat_est_not(cod_materia, n_rude) values('APV', 6010);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 6010);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 6010);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 6010);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 6010);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 6010);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 6010);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 6010);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 6010);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 6010);
insert into mat_est_not(cod_materia, n_rude) values('VER', 6010);



insert into mat_est_not(cod_materia, n_rude) values('APV', 7001);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 7001);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 7001);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 7001);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 7001);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 7001);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 7001);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 7001);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 7001);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 7001);
insert into mat_est_not(cod_materia, n_rude) values('VER', 7001);

insert into mat_est_not(cod_materia, n_rude) values('APV', 7002);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 7002);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 7002);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 7002);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 7002);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 7002);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 7002);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 7002);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 7002);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 7002);
insert into mat_est_not(cod_materia, n_rude) values('VER', 7002);

insert into mat_est_not(cod_materia, n_rude) values('APV', 7003);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 7003);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 7003);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 7003);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 7003);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 7003);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 7003);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 7003);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 7003);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 7003);
insert into mat_est_not(cod_materia, n_rude) values('VER', 7003);

insert into mat_est_not(cod_materia, n_rude) values('APV', 7004);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 7004);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 7004);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 7004);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 7004);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 7004);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 7004);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 7004);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 7004);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 7004);
insert into mat_est_not(cod_materia, n_rude) values('VER', 7004);

insert into mat_est_not(cod_materia, n_rude) values('APV', 7005);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 7005);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 7005);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 7005);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 7005);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 7005);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 7005);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 7005);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 7005);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 7005);
insert into mat_est_not(cod_materia, n_rude) values('VER', 7005);

insert into mat_est_not(cod_materia, n_rude) values('APV', 7006);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 7006);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 7006);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 7006);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 7006);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 7006);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 7006);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 7006);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 7006);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 7006);
insert into mat_est_not(cod_materia, n_rude) values('VER', 7006);

insert into mat_est_not(cod_materia, n_rude) values('APV', 7007);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 7007);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 7007);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 7007);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 7007);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 7007);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 7007);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 7007);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 7007);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 7007);
insert into mat_est_not(cod_materia, n_rude) values('VER', 7007);

insert into mat_est_not(cod_materia, n_rude) values('APV', 7008);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 7008);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 7008);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 7008);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 7008);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 7008);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 7008);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 7008);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 7008);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 7008);
insert into mat_est_not(cod_materia, n_rude) values('VER', 7008);

insert into mat_est_not(cod_materia, n_rude) values('APV', 7009);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 7009);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 7009);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 7009);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 7009);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 7009);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 7009);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 7009);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 7009);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 7009);
insert into mat_est_not(cod_materia, n_rude) values('VER', 7009);

insert into mat_est_not(cod_materia, n_rude) values('APV', 7010);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 7010);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 7010);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 7010);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 7010);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 7010);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 7010);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 7010);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 7010);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 7010);
insert into mat_est_not(cod_materia, n_rude) values('VER', 7010);



insert into mat_est_not(cod_materia, n_rude) values('APV', 8001);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 8001);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 8001);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 8001);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 8001);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 8001);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 8001);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 8001);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 8001);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 8001);
insert into mat_est_not(cod_materia, n_rude) values('VER', 8001);

insert into mat_est_not(cod_materia, n_rude) values('APV', 8002);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 8002);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 8002);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 8002);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 8002);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 8002);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 8002);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 8002);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 8002);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 8002);
insert into mat_est_not(cod_materia, n_rude) values('VER', 8002);

insert into mat_est_not(cod_materia, n_rude) values('APV', 8003);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 8003);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 8003);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 8003);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 8003);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 8003);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 8003);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 8003);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 8003);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 8003);
insert into mat_est_not(cod_materia, n_rude) values('VER', 8003);

insert into mat_est_not(cod_materia, n_rude) values('APV', 8004);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 8004);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 8004);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 8004);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 8004);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 8004);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 8004);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 8004);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 8004);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 8004);
insert into mat_est_not(cod_materia, n_rude) values('VER', 8004);

insert into mat_est_not(cod_materia, n_rude) values('APV', 8005);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 8005);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 8005);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 8005);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 8005);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 8005);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 8005);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 8005);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 8005);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 8005);
insert into mat_est_not(cod_materia, n_rude) values('VER', 8005);

insert into mat_est_not(cod_materia, n_rude) values('APV', 8006);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 8006);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 8006);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 8006);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 8006);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 8006);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 8006);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 8006);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 8006);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 8006);
insert into mat_est_not(cod_materia, n_rude) values('VER', 8006);

insert into mat_est_not(cod_materia, n_rude) values('APV', 8007);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 8007);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 8007);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 8007);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 8007);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 8007);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 8007);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 8007);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 8007);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 8007);
insert into mat_est_not(cod_materia, n_rude) values('VER', 8007);

insert into mat_est_not(cod_materia, n_rude) values('APV', 8008);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 8008);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 8008);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 8008);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 8008);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 8008);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 8008);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 8008);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 8008);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 8008);
insert into mat_est_not(cod_materia, n_rude) values('VER', 8008);

insert into mat_est_not(cod_materia, n_rude) values('APV', 8009);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 8009);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 8009);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 8009);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 8009);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 8009);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 8009);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 8009);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 8009);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 8009);
insert into mat_est_not(cod_materia, n_rude) values('VER', 8009);

insert into mat_est_not(cod_materia, n_rude) values('APV', 8010);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 8010);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 8010);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 8010);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 8010);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 8010);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 8010);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 8010);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 8010);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 8010);
insert into mat_est_not(cod_materia, n_rude) values('VER', 8010);



insert into mat_est_not(cod_materia, n_rude) values('APV', 9001);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 9001);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 9001);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 9001);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 9001);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 9001);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 9001);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 9001);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 9001);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 9001);
insert into mat_est_not(cod_materia, n_rude) values('VER', 9001);

insert into mat_est_not(cod_materia, n_rude) values('APV', 9002);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 9002);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 9002);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 9002);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 9002);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 9002);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 9002);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 9002);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 9002);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 9002);
insert into mat_est_not(cod_materia, n_rude) values('VER', 9002);

insert into mat_est_not(cod_materia, n_rude) values('APV', 9003);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 9003);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 9003);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 9003);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 9003);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 9003);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 9003);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 9003);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 9003);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 9003);
insert into mat_est_not(cod_materia, n_rude) values('VER', 9003);

insert into mat_est_not(cod_materia, n_rude) values('APV', 9004);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 9004);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 9004);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 9004);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 9004);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 9004);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 9004);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 9004);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 9004);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 9004);
insert into mat_est_not(cod_materia, n_rude) values('VER', 9004);

insert into mat_est_not(cod_materia, n_rude) values('APV', 9005);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 9005);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 9005);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 9005);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 9005);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 9005);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 9005);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 9005);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 9005);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 9005);
insert into mat_est_not(cod_materia, n_rude) values('VER', 9005);

insert into mat_est_not(cod_materia, n_rude) values('APV', 9006);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 9006);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 9006);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 9006);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 9006);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 9006);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 9006);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 9006);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 9006);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 9006);
insert into mat_est_not(cod_materia, n_rude) values('VER', 9006);

insert into mat_est_not(cod_materia, n_rude) values('APV', 9007);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 9007);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 9007);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 9007);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 9007);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 9007);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 9007);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 9007);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 9007);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 9007);
insert into mat_est_not(cod_materia, n_rude) values('VER', 9007);

insert into mat_est_not(cod_materia, n_rude) values('APV', 9008);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 9008);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 9008);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 9008);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 9008);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 9008);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 9008);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 9008);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 9008);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 9008);
insert into mat_est_not(cod_materia, n_rude) values('VER', 9008);

insert into mat_est_not(cod_materia, n_rude) values('APV', 9009);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 9009);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 9009);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 9009);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 9009);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 9009);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 9009);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 9009);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 9009);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 9009);
insert into mat_est_not(cod_materia, n_rude) values('VER', 9009);

insert into mat_est_not(cod_materia, n_rude) values('APV', 9010);
insert into mat_est_not(cod_materia, n_rude) values('BIO', 9010);
insert into mat_est_not(cod_materia, n_rude) values('CSS', 9010);
insert into mat_est_not(cod_materia, n_rude) values('EDU', 9010);
insert into mat_est_not(cod_materia, n_rude) values('FIL', 9010);
insert into mat_est_not(cod_materia, n_rude) values('FIS', 9010);
insert into mat_est_not(cod_materia, n_rude) values('LEN', 9010);
insert into mat_est_not(cod_materia, n_rude) values('MAT', 9010);
insert into mat_est_not(cod_materia, n_rude) values('MUS', 9010);
insert into mat_est_not(cod_materia, n_rude) values('QMC', 9010);
insert into mat_est_not(cod_materia, n_rude) values('VER', 9010);

select * from mat_est_not;