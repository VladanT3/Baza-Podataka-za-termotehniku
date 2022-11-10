--drop database BazeProjekat
--create database BazeProjekat

create table Radnik
(
	Sifra_radnika int primary key,
	ImePrezime varchar(30),
	Plata numeric(6, 0)
)
create table Proizvod
(
	SifraProiz int primary key,
	Naziv varchar(50),
	CenaPro numeric(7, 0)
)
create table SoftPaket
(
	SifraSP int primary key,
	NazivSoft varchar(30),
	CenaSoft numeric(6, 0)
)
create table Obuka
(
	SifraObuke int,
	SifraSP int,
	VremeTr int,
	NazivKursa varchar(30),
	Sertifikat varchar(30),
	primary key(SifraObuke, SifraSP),
	foreign key(SifraSP) references SoftPaket(SifraSP)
)
create table Investitor
(
	IDInv int primary key,
	NazivInv varchar(30)
)
create table Inzenjer
(
	Sifra_radnika int primary key,
	RadniStaz numeric(2, 0),
	foreign key(Sifra_radnika) references Radnik(Sifra_radnika)
)
create table Izvodjac
(
	Sifra_radnika int primary key,
	SifraMentora int,
	StatusIzv varchar(15) check(StatusIzv in ('Licenciran', 'Pripravnik')),
	foreign key(Sifra_radnika) references Inzenjer(Sifra_radnika),
	foreign key(SifraMentora) references Izvodjac(Sifra_radnika)
)
create table Dobavljac
(
	IDDob int primary key,
	NazivDob varchar(30),
	IDKontakta int foreign key references Izvodjac(Sifra_radnika)
)
create table PIZ
(
	SifraPIZ int primary key,
	ObimPr varchar(15),
	PocetakPr date,
	ZavrsetakPr date,
	Lokacija varchar(20),
	--SifraGrad int foreign key references Gradiliste(SifraGrad),
	--SifraPIO int foreign key references PIO(SifraPIO),
	--IDPIZRacuna int foreign key references PIZRacun(IDPIZRacuna),
	--SifraVodje int foreign key references Projektant(Sifra_radnika)
)
create table PIZRacun
(
	IDPIZRacuna int primary key,
	CenaPIZRacuna numeric(7, 0),
	DatumPIZRacuna date,
	SifraPIZ int foreign key references PIZ(SifraPIZ)
)
create table PIO
(
	SifraPIO int primary key,
	DatPredaje date,
	SifraPIZ int foreign key references PIZ(SifraPIZ),
	Sifra_radnika int foreign key references Izvodjac(Sifra_radnika),
	--SifraGrad int foreign key references Gradiliste(SifraGrad)
)
create table Gradiliste
(
	SifraGrad int primary key,
	NazivGrad varchar(30),
	Lokacija varchar(20),
	PocRadova date,
	ZavrRadova date,
	SifraPIO int foreign key references PIO(SifraPIO),
	SifraPIZ int foreign key references PIZ(SifraPIZ)
)
create table StavkaPIZ
(
	IDStavke int,
	SifraPIZ int,
	PredVreme int,
	DatPoc date,
	DatZavr date,
	primary key(IDStavke, SifraPIZ),
	foreign key(SifraPIZ) references PIZ(SifraPIZ)
)
create table Projektant
(
	Sifra_radnika int primary key,
	StatusPro varchar(15) check(StatusPro in ('Licenciran', 'Pripravnik')),
	foreign key(Sifra_radnika) references Inzenjer(Sifra_radnika),
	SifraPIZaKojiVodi int foreign key references PIZ(SifraPIZ),
	SifraObuke int,
	SifraSP int,
	foreign key(SifraObuke, SifraSP) references Obuka(SifraObuke, SifraSP),
	SifraMentora int foreign key references Projektant(Sifra_radnika)
)
create table Majstor
(
	Sifra_radnika int primary key,
	Specijalizacija varchar(30),
	IDAngazovanje int foreign key references Izvodjac(Sifra_radnika),
	--SifraOtp int foreign key references Otpremnica(SifraOtp)
)
create table Otpremnica
(
	SifraOtp int primary key,
	DatumIzdOtp date,
	--RegVozila varchar(10) foreign key references Transport(RegVozila),
	IDDob int foreign key references Dobavljac(IDDob),
	SifraMajstora int foreign key references Majstor(Sifra_radnika)
)
create table Transport
(
	RegVozila varchar(10) primary key,
	BrojLjudi int,
	Gorivo numeric(4, 1),
	DatumTrans date,
	--SifraPN int foreign key references PutniNalog(SifraPN),
	SifraOtp int foreign key references Otpremnica(SifraOtp),
	SifraGrad int foreign key references Gradiliste(SifraGrad)
)
create table PutniNalog
(
	SifraPN int primary key,
	RelacijaPuta varchar(50),
	DatumPN date,
	SifraMajstora int foreign key references Majstor(Sifra_radnika),
	RegVozila varchar(10) foreign key references Transport(RegVozila)
)
create table UlaznaFaktura
(
	SifraFakture int primary key,
	RokPlacanja date,
	IDDob int foreign key references Dobavljac(IDDob)
)
create table IzlazniRacun
(
	IDRacuna int primary key,
	CenaRac numeric(7, 0),
	DatumRac date,
	IDSituacije int,
	SituacijaSifraGrad int,
	--foreign key(IDSituacije, SituacijaSifraGrad) references Situacija(IDSituacije, SifraGrad),
	IDInv int foreign key references Investitor(IDInv)
)
create table StavkaPIO
(
	RedniBrojSt int,
	SifraPIO int foreign key references PIO(SifraPIO),
	primary key(RedniBrojSt, SifraPIO)
)
create table Ponuda
(
	IDPonude int,
	IDDob int foreign key references Dobavljac(IDDob),
	DatumIzdPon date,
	primary key(IDPonude, IDDob)
)
create table StavkaPonude
(
	RedniBroj int,
	IDPonude int,
	IDDob int,
	SifraProiz int foreign key references Proizvod(SifraProiz),
	KolicinaProiz int,
	RokIsporuke date,
	primary key(RedniBroj, IDPonude, IDDob),
	foreign key(IDPonude, IDDob) references Ponuda(IDPonude, IDDob)
)
create table Kupovina
(
	SifraKup int,
	IDPonude int,
	IDDob int,
	foreign key(IDPonude, IDDob) references Ponuda(IDPonude, IDDob),
	Sifra_radnika int foreign key references Izvodjac(Sifra_radnika),
	DatumKup date,
	SifraFakture int foreign key references UlaznaFaktura(SifraFakture),
	primary key(SifraKup, IDPonude, IDDob, Sifra_radnika)
)
create table StavkaOtpremnice
(
	SifraStavkeOtp int,
	SifraOtp int foreign key references Otpremnica(SifraOtp),
	primary key(SifraStavkeOtp, SifraOtp),
	KolicinaRobe int,
	SifraProiz int foreign key references Proizvod(SifraProiz)
)
create table Situacija
(
	IDSituacije int,
	SifraGrad int foreign key references Gradiliste(SifraGrad),
	primary key(IDSituacije, SifraGrad),
	CenaSit numeric(7, 0),
	KolicinaPro numeric(3, 0),
	PredVrPoc date,
	PredVrZavr date,
	IDRacuna int foreign key references IzlazniRacun(IDRacuna)
)
create table GlavniMajstor
(
	Sifra_radnika int primary key foreign key references Majstor(Sifra_radnika),
	Sertifikat varchar(20)
)
create table JuniorMajstor
(
	Sifra_radnika int primary key foreign key references Majstor(Sifra_radnika),
	RadniStaz numeric(2, 0),
	NadredjeniMajstor int foreign key references GlavniMajstor(Sifra_radnika),
	--PodredjeniPom int foreign key references Pomocnik(Sifra_radnika)
)
create table Pomocnik
(
	Sifra_radnika int primary key foreign key references Majstor(Sifra_radnika),
	NacinZap varchar(30) check(NacinZap in('Honorarno', 'Ugovorom')),
	NadredjeniGM int foreign key references GlavniMajstor(Sifra_radnika),
	NadredjeniJM int foreign key references JuniorMajstor(Sifra_radnika)
)
create table Angazovan
(
	SifraIzv int foreign key references Izvodjac(Sifra_radnika),
	SifraGrad int foreign key references Gradiliste(SifraGrad),
	primary key(SifraIzv, SifraGrad)
)
create table Pro_PIO
(
	SifraProiz int foreign key references Proizvod(SifraProiz),
	SifraPIO int foreign key references PIO(SifraPIO),
	primary key(SifraProiz, SifraPIO)
)
create table IzvrsavanjeTransporta
(
	SifraMajstora int foreign key references Majstor(Sifra_radnika),
	RegVozila varchar(10) foreign key references Transport(RegVozila),
	primary key(SifraMajstora, RegVozila)
)
create table KoriscenjeSoftvera
(
	SifraSP int foreign key references SoftPaket(SifraSP),
	Sifra_radnika int foreign key references Projektant(Sifra_radnika),
	primary key(SifraSP, Sifra_radnika)
)
create table RadNaStavci
(
	Sifra_radnika int foreign key references Projektant(Sifra_radnika),
	IDStavke int,
	SifraPIZ int,
	primary key(Sifra_radnika, IDStavke, SifraPIZ),
	foreign key(IDStavke, SifraPIZ) references StavkaPIZ(IDStavke, SifraPIZ)
)


--DODAVNJE KOMENTARISANIH SPOLJNIH KLJUCEVA


alter table PIZ add 
	SifraGrad int foreign key references Gradiliste(SifraGrad),
	SifraPIO int foreign key references PIO(SifraPIO),
	IDPIZRacuna int foreign key references PIZRacun(IDPIZRacuna),
	SifraVodje int foreign key references Projektant(Sifra_radnika)

alter table PIO add
	SifraGrad int foreign key references Gradiliste(SifraGrad)

alter table Majstor add
	SifraOtp int foreign key references Otpremnica(SifraOtp)

alter table Otpremnica add
	RegVozila varchar(10) foreign key references Transport(RegVozila)

alter table Transport add
	SifraPN int foreign key references PutniNalog(SifraPN)

alter table IzlazniRacun add
	foreign key(IDSituacije, SituacijaSifraGrad) references Situacija(IDSituacije, SifraGrad)

alter table JuniorMajstor add
	PodredjeniPom int foreign key references Pomocnik(Sifra_radnika)