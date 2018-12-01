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
telefon						varchar(50),
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
proizvod					int					not null,
jedinicna_mjera				varchar(50)			not null,
skladisna_primka			int					not null,
bruto						decimal(10,2)		not null,
tara						decimal(10,2)		not null,
netto						decimal(10,2)												
);

create table ISPORUCITELJ (
sifra						int					not null		primary key			auto_increment,
tvrtka						int					not null,
isporucio					varchar(50)			not null
);

create table PRIJEVOZNIK (
sifra						int					not null		primary key			auto_increment,
tvrtka						int					not null,
broj_prijevoznog_lista		varchar(50)			not null,
vozac						varchar(50)			not null,
vozilo						int					not null
);

create table PRIMATELJ (
sifra						int					not null		primary key			auto_increment,
skladiste					varchar(50)			not null
);

create table SKLADISNA_PRIMKA(
sifra						int					not null		primary key			auto_increment,
oznaka						varchar(50)			not null,
datum						datetime			not null,
isporucitelj				int					not null,
prijevoznik					int					not null,
primatelj					int 				not null,
broj_narudzbenice			varchar(50)			not null,
broj_otpremnice				varchar(50)			not null,
vagar						int					not null,
robu_zaprimio				int					not null
);

create table PROIZVOD (
sifra						int					not null		primary key			auto_increment,
naziv_proizvoda				varchar(50)			not null,
kategorija					varchar(50)			not null
);

alter table 	STAVKA		 	add foreign key (skladisna_primka)	references SKLADISNA_PRIMKA(sifra);
alter table 	STAVKA		 	add foreign key (proizvod)			references PROIZVOD(sifra);

alter table 	ISPORUCITELJ 	add foreign key (tvrtka) 			references TVRTKA(sifra);

alter table 	PRIJEVOZNIK 	add foreign key (tvrtka) 			references TVRTKA(sifra);
alter table 	PRIJEVOZNIK 	add foreign key (vozilo) 			references VOZILO(sifra);

alter table 	SKLADISNA_PRIMKA add foreign key (robu_zaprimio) 	references OSOBA(sifra);
alter table 	SKLADISNA_PRIMKA add foreign key (vagar) 			references OSOBA(sifra);
alter table 	SKLADISNA_PRIMKA add foreign key (isporucitelj) 	references ISPORUCITELJ(sifra);
alter table 	SKLADISNA_PRIMKA add foreign key (prijevoznik)	 	references PRIJEVOZNIK(sifra);
alter table 	SKLADISNA_PRIMKA add foreign key (primatelj) 		references PRIMATELJ(sifra);
