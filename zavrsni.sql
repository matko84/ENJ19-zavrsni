# zavrsni rad "SKLADISNA PRIMKA"
# mysql -uedunova -pedunova --default_character_set=utf8 < D:\OneDrive\04_Java\ENJ19-zavrsni\zavrsni.sql

drop database if exists zavrsni;
create database zavrsni character set utf8 collate utf8_general_ci;
use zavrsni;

create table TVRTKA (
		sifra						int					not null		primary key			auto_increment,
		naziv_tvrtke				varchar(50)			not null,
		ulica						varchar(50)			not null,
		mjesto						varchar(50)			not null,
		postanski_broj				int					not null,
		telefon						varchar(50),
		email						varchar(50)
		);

create table OSOBA (
		sifra						int					not null		primary key			auto_increment,
		ime							varchar(50)			not null,
		prezime						varchar(50)			not null
		);

create table PROIZVOD (
		sifra						int					not null		primary key			auto_increment,
		naziv_proizvoda				varchar(50)			not null,
		kategorija					varchar(50)			not null
		);

create table SKLADISTE (
		sifra						int					not null		primary key			auto_increment,
		skladiste					varchar(50)			not null
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
		vozac						varchar(50)			not null
		);

create table SKLADISNA_PRIMKA(
		sifra						int					not null		primary key			auto_increment,
		oznaka						varchar(50)			not null,
		datum						datetime			not null,
		isporucitelj				int					not null,
		prijevoznik					int					not null,
		skladiste					int 				not null,
		broj_narudzbenice			varchar(50)			not null,
		broj_otpremnice				varchar(50)			not null,
		vagar						int					not null,
		robu_zaprimio				int					not null,
		reg_oznaka_kamiona			varchar(50)			not null,
		reg_oznaka_prikolice		varchar(50)			not null
		);

create table STAVKA (
		sifra						int					not null		primary key			auto_increment,		
		broj						int					not null,
		proizvod					int					not null,
		jedinicna_mjera				varchar(50)			not null,
		skladisna_primka			int					not null,
		bruto						decimal(10,2),
		tara						decimal(10,2),
		netto						decimal(10,2),
		kolicina					decimal(10,2)											
		);

#   ALTER TABLE

alter table 	STAVKA		 	add foreign key (skladisna_primka)	references SKLADISNA_PRIMKA(sifra);
alter table 	STAVKA		 	add foreign key (proizvod)			references PROIZVOD(sifra);

alter table 	ISPORUCITELJ 	add foreign key (tvrtka) 			references TVRTKA(sifra);

alter table 	PRIJEVOZNIK 	add foreign key (tvrtka) 			references TVRTKA(sifra);

alter table 	SKLADISNA_PRIMKA add foreign key (robu_zaprimio) 	references OSOBA(sifra);
alter table 	SKLADISNA_PRIMKA add foreign key (vagar) 			references OSOBA(sifra);
alter table 	SKLADISNA_PRIMKA add foreign key (isporucitelj) 	references ISPORUCITELJ(sifra);
alter table 	SKLADISNA_PRIMKA add foreign key (prijevoznik)	 	references PRIJEVOZNIK(sifra);
alter table 	SKLADISNA_PRIMKA add foreign key (skladiste) 		references SKLADISTE(sifra);



#   INSERT

insert into 	TVRTKA 	(sifra,	naziv_tvrtke,	ulica,			mjesto,		postanski_broj,	telefon,		email) values
						(null,	"Ricardo",		"Kudeljara 1a",				"Darda",			31326,			"031/562-255",	"info@ricardo.hr"),
						(null,	"Ralu",			"Gospodarska ulica 11",		"Rugvica",			10370,			"01/6285-205",	"ralu@ralu.hr"),
						(null,	"Balog",		"Lovre Matačića 18",		"Našice",			31500,			"031/617-204",	"info@balog-transport.hr"),
						(null,	"Autoeuropa",	"Naselje Gorica 30",		"Donji Miholjac",	31540,			"031/630-997",	"zlatko@autoevropa.hr"),
						(null,	"Pevec",		"Savska cesta 84",			"Sesvete",			10360,			"0800-44-62",	"info@pevec.hr"),
						(null,	"Izolirka",		"J.J.Strossmayera 348b",	"Osijek",			31000,			"031/310-000",	"info@izolirka.hr"),
						(null,	"Projektgradnja","Vrbska 3",				"Gornja Vrba",		35207,			"035/405-650",	"info@projektgradnja.hr"),
						(null,	"Osijek Koteks","Šamačka 11",				"Osijek",			31000,			"031/227-700",	"uprava@osijek-koteks.hr"),
						(null,	"Nexe",			"Vinogradska 6",			"Našice",			31500,			"031/616-100",	"nexe-grupa@nexe.hr");

insert into OSOBA 		(sifra,	ime,prezime) values
						(null,	'Pero',		'Perić'),
						(null, 	'Janko',	'Strižić'),
						(null,	'Ivan',		'Ivković'),
						(null,	'Zvonko',	'Lutak'),
						(null,	'Sam',		'Vatrogasac');
						
insert into PROIZVOD		(sifra, naziv_proizvoda, kategorija) values
							(null, 	'Bijela boja',	'Boje i lakovi'),
							(null,	'Cement',		'Građevinski materijal'),
							(null,	'Televizor',	'Tehnika'),
							(null,	'Kamen 0-60',	'Građevinski materijal'),
							(null,	'Crijep',		'Građevinski materijal'),
							(null, 	'Beton C20/25',	'Građevinski materijal'),
							(null, 	'Vrata'	,		'Vrata'),
							(null,	'Čavli',		'Potrošni materijal'),
							(null, 	'Izolir traka',	'Potrošni materijal'),
							(null,	'Ulje',			'Boje i lakovi');

insert into	SKLADISTE		(sifra,skladiste) values
							(null, 'BP Mitrovac'),
							(null, 'BP Popovac');

insert into ISPORUCITELJ	(sifra,tvrtka,isporucio) values	
							(null,5,'Vladimir Perić'),
							(null,6,'Pero Janković'),
							(null,7,'Josip Hlebec'),
							(null,8,'Ivan Ivanković'),
							(null,9,'Luka Budiselić');

insert into PRIJEVOZNIK		(sifra,tvrtka,broj_prijevoznog_lista,vozac) values
							(null,1,'01-01-2018','Zoran Zoranić'),
							(null,2,'345/18','Pavo Kamion'),
							(null,3,'op/P1/19','Jozo Kamenko'),
							(null,4,'9876879','Fred Kremenko');

insert into SKLADISNA_PRIMKA	(sifra,oznaka,datum,isporucitelj,prijevoznik,skladiste,broj_narudzbenice,broj_otpremnice,vagar,robu_zaprimio,reg_oznaka_kamiona,reg_oznaka_prikolice) values
								(null,'SK 001/2018','2018-12-12',1,1,1,'BP_M 12-12-2018','98/2018',1,2,'BM234JK','BM999JK'),
								(null,'SK 002/2018','2018-12-13',2,2,1,'BP_M 13-12-2018','9998/2018',2,3,'NA234JK','NA999JK'),
								(null,'SK 003/2018','2018-12-14',3,3,1,'BP_M 14-12-2018','9823/18',3,1,'OS234JK','BM009JK'),
								(null,'SK 004/2018','2018-12-15',4,4,1,'BP_M 15-12-2018','98/18',2,2,'ZG999JK','DA989JK'),
								(null,'SK 001/2018','2018-01-01',5,1,2,'BP_P 01-01-2018','0_98/2018',4,5,'SB234L','SB232J0'),
								(null,'SK 002/2018','2018-02-10',5,2,2,'BP_P 10-02-2018','O_99/2018',5,4,'DA333K','DA999OO'),
								(null,'SK 003/2018','2018-06-15',4,3,2,'BP_P 15-06-2018','99/18',4,4,'VT234JK','PŽ999JK');
						
							
insert into STAVKA				(sifra,broj,proizvod,jedinicna_mjera,skladisna_primka,bruto,tara,netto,kolicina) values
								(null,1,2,'kg',5,35040,12990,22050,null),
								(null,2,2,'Vreća 25kg',6,null,null,null,100),
								(null,3,4,'kg',7,35500,10500,25000,null),
								(null,4,1,'kom',1,null,null,null,5),
								(null,4,3,'kom',1,null,null,null,1),
								(null,4,8,'kg',1,null,null,null,1),
								(null,5,5,'kg',2,null,null,null,1500),
								(null,6,6,'kg',3,20000,10000,10000,null),
								(null,7,4,'kg',4,32000,12000,20000,null);

# select * from isporucitelj;			#   A
# select * from osoba;				#   B
# select * from prijevoznik;			#   C
# select * from proizvod;				#   D
# select * from skladisna_primka;		#   E
# select * from skladiste;			#   F
# select * from stavka;				#   G
# select * from tvrtka;				#   H

# select e.oznaka as 'BROJ PRIMKE', e.datum as 'DATUM', h.naziv_tvrtke as 'ISPORUČITELJ', h1.naziv_tvrtke as 'PRJEVOZNIK', f.skladiste as 'SKLADIŠTE', concat(b1.ime,' ',b1.prezime) as 'ROBU ZAPRIMIO'
# from skladisna_primka e 
# inner join skladiste f on e.skladiste=f.sifra
# inner join osoba b on e.robu_zaprimio=b.sifra
# inner join osoba b1 on e.vagar=b1.sifra
# inner join stavka g on g.skladisna_primka=e.sifra
# inner join proizvod d on g.proizvod=d.sifra
# inner join isporucitelj a on e.isporucitelj=a.sifra
# inner join prijevoznik c on e.prijevoznik=c.sifra
# inner join tvrtka h on a.tvrtka=h.sifra
# inner join tvrtka h1 on c.tvrtka=h1.sifra