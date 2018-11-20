# zavrsni rad "SKLADISNA PRIMKA"
# mysql -uedunova -pedunova --default_character_set=utf8 < D:\ENJ19\J19-zavrsni\zavrsni.sql

drop database if exists zavrsni;
create database zavrsni character set utf8 collate utf8_general_ci;
use zavrsni;

create table TVRTKA (
sifra						int					not null		primary key			auto_increment,
naziv_tvrtke				varchar(50)			not null,
ulica						varchar(50)			not null,
mjesto						varchar(50)			not null,
postanski_broj				decimal(10,2)		not null,
drzava						varchar(50)			not null,
mobitel						varchar(50),
telefon						varchar(50),
faks						varchar(50),
email						varchar(50)
);

create table OSOBA (
sifra						int					not null		primary key			auto_increment,
ime							varchar(50)			not null,
prezime						varchar(50)			not null
);

create table VOZILO (
sifra						int					not null		primary key			auto_increment,
reg_oznaka_kamiona			varchar(50)			not null,
reg_oznaka_prikolice		varchar(50)
);

create table STAVKA (
sifra						int					not null		primary key			auto_increment,		
redni_broj					int					not null,
naziv_robe					varchar(50)			not null,
jedinicna_mjera				varchar(50)			not null,
kolicina					decimal(10,2)		not null
);

create table ISPORUCITELJ (
sifra						int					not null		primary key			auto_increment,
tvrtka						int					not null,
broj_otpremnice				varchar(50)			not null,
broj_narudzbenice			varchar(50),
isporucio					int					not null
);

create table PRIJEVOZNIK (
sifra						int					not null		primary key			auto_increment,
tvrtka						int					not null,
broj_prijevoznog_lista		varchar(50)			not null,
vozac						int					not null,
vozilo						int					not null
);

create table PRIMATELJ (
sifra						int					not null		primary key			auto_increment,
tvrtka						int					not null,
robu_zaprimio				int					not null,
vagar						int					not null
);

create table SKLADISNA_PRIMKA(
sifra						int					not null		primary key			auto_increment,
oznaka						varchar(50)			not null,
datum						datetime			not null,
isporucitelj				int					not null,
prijevoznik					int					not null,
primatelj					int 				not null,
stavka						int					not null
);

alter table 	ISPORUCITELJ 	add foreign key (tvrtka) 			references TVRTKA(sifra);
alter table 	ISPORUCITELJ 	add foreign key (isporucio) 		references OSOBA(sifra);

alter table 	PRIJEVOZNIK 	add foreign key (tvrtka) 			references TVRTKA(sifra);
alter table 	PRIJEVOZNIK 	add foreign key (vozac) 			references OSOBA(sifra);
alter table 	PRIJEVOZNIK 	add foreign key (vozilo) 			references VOZILO(sifra);

alter table 	PRIMATELJ 		add foreign key (tvrtka) 			references TVRTKA(sifra);
alter table 	PRIMATELJ 		add foreign key (robu_zaprimio) 	references OSOBA(sifra);
alter table 	PRIMATELJ 		add foreign key (vagar) 			references OSOBA(sifra);

alter table 	SKLADISNA_PRIMKA add foreign key (isporucitelj) 	references ISPORUCITELJ(sifra);
alter table 	SKLADISNA_PRIMKA add foreign key (prijevoznik)	 	references PRIJEVOZNIK(sifra);
alter table 	SKLADISNA_PRIMKA add foreign key (primatelj) 		references PRIMATELJ(sifra);
alter table 	SKLADISNA_PRIMKA add foreign key (stavka) 			references STAVKA(sifra);