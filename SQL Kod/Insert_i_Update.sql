insert into Radnik values(1, 'Marko Markovic', 85000)
insert into Radnik values(2, 'Mina Minic', 85000)
insert into Radnik values(3, 'Petar Petrovic', 80000)
insert into Radnik values(4, 'Jovana Jovanovic', 95000)
insert into Radnik values(5, 'Ana Anic', 90000)
insert into Radnik values(6, 'Janko Jankovic', 90000)
insert into Radnik values(7, 'Dragan Dragic', 90000)
insert into Radnik values(8, 'Katarina Katic', 70000)
insert into Radnik values(9, 'Ivana Ivanovic', 70000)
insert into Radnik values(10, 'Luka Lukic', 50000)
insert into Radnik values(11, 'Milan Milanovic', 30000)

insert into Proizvod values(1, 'Sistem za grejanje', 325000)
insert into Proizvod values(2, 'Sistem za klimatizaciju', 650000)
insert into Proizvod values(3, 'Sistem za ventilaciju', 120000)

insert into SoftPaket values(1, 'AutoCad', 18000)
insert into SoftPaket values(2, 'Revit', 24000)

insert into Obuka values(1, 1, 20, 'Pocetni kurs', 'Level 1')
insert into Obuka values(2, 2, 40, 'Napredni kurs', 'Level 2')

insert into Investitor values(1, 'Peteg')
insert into Investitor values(2, 'Seven Invest')
insert into Investitor values(3, 'Hotel Slavija')

insert into Inzenjer values(1, 13)
insert into Inzenjer values(2, 8)
insert into Inzenjer values(3, 3)
insert into Inzenjer values(4, 25)
insert into Inzenjer values(5, 5)
insert into Inzenjer values(6, 1)

insert into Izvodjac(Sifra_radnika, StatusIzv) values(1, 'Licenciran')
insert into Izvodjac(Sifra_radnika, StatusIzv) values(2, 'Licenciran')
insert into Izvodjac values(3, 1, 'Pripravnik')

insert into Dobavljac values(1, 'PVF', 1)
insert into Dobavljac values(2, 'Doming', 2)
insert into Dobavljac values(3, 'Jakka Group', 3)

insert into PIZ(SifraPIZ, ObimPr, PocetakPr, ZavrsetakPr, Lokacija) values(1, 'Mali', '2021-8-14', '2022-1-24', 'Zemun')
insert into PIZ(SifraPIZ, ObimPr, PocetakPr, ZavrsetakPr, Lokacija) values(2, 'Srednji', '2021-11-16', '2022-2-3', 'Novi Beograd')
insert into PIZ(SifraPIZ, ObimPr, PocetakPr, ZavrsetakPr, Lokacija) values(3, 'Veliki', '2022-1-9', '2022-3-12', 'Stari Grad')

insert into PIZRacun values(1, 76000, '2022-1-24', 1)
insert into PIZRacun values(2, 260000, '2022-2-3', 2)
insert into PIZRacun values(3, 520000, '2022-3-12', 3)

insert into PIO(SifraPIO, DatPredaje, SifraPIZ, Sifra_radnika) values(1, '2022-3-16', 1, 3)
insert into PIO(SifraPIO, DatPredaje, SifraPIZ, Sifra_radnika) values(2,  '2022-1-24', 2, 2)
insert into PIO(SifraPIO, DatPredaje, SifraPIZ, Sifra_radnika) values(3, '2022-2-12', 3, 1)

insert into Gradiliste values(1, 'Zemunske Kapije', 'Zemun', '2021-9-1', '2022-1-18', 1, 1)
insert into Gradiliste values(2, 'Sakura', 'Novi Beograd', '2021-11-28', '2022-1-27', 2, 2)
insert into Gradiliste values(3, 'Levi 9', 'Stari Grad', '2022-1-15', '2022-3-4', 3, 3)

insert into StavkaPIZ values(1, 1, 2, '2021-8-14', '2021-9-16')
insert into StavkaPIZ values(2, 1, 3, '2021-9-17', '2022-1-24')
insert into StavkaPIZ values(3, 2, 2, '2021-11-16', '2022-1-13')
insert into StavkaPIZ values(4, 2, 1, '2022-1-14', '2022-2-3')
insert into StavkaPIZ values(5, 3, 1, '2022-1-9', '2022-2-7')
insert into StavkaPIZ values(6, 3, 1, '2022-2-8', '2022-3-12')

insert into Projektant(Sifra_radnika, StatusPro, SifraPIZaKojiVodi, SifraObuke, SifraSP) values(4, 'Licenciran', 3, 2, 2)
insert into Projektant values(5, 'Pripravnik', 2, 1, 1, 4)
insert into Projektant values(6, 'Pripravnik', 1, 1, 1, 4)

insert into Majstor(Sifra_radnika, Specijalizacija) values(7, 'Grejac')
insert into Majstor(Sifra_radnika, Specijalizacija, IDAngazovanje) values(8, 'Limar', 1)
insert into Majstor(Sifra_radnika, Specijalizacija, IDAngazovanje) values(9, 'Klimatizer', 2)
insert into Majstor(Sifra_radnika, IDAngazovanje) values(10, 3)
insert into Majstor(Sifra_radnika) values(11)

insert into Otpremnica(SifraOtp, DatumIzdOtp, IDDob, SifraMajstora) values(1, '2021-8-28', 3, 8)
insert into Otpremnica(SifraOtp, DatumIzdOtp, IDDob, SifraMajstora) values(2, '2021-11-23', 2, 9)
insert into Otpremnica(SifraOtp, DatumIzdOtp, IDDob, SifraMajstora) values(3, '2022-1-13', 1, 10)

insert into Transport(RegVozila, BrojLjudi, Gorivo, DatumTrans, SifraOtp, SifraGrad) values('BG-423-GS', 3, 43.5, '2021-8-30', 1, 1)
insert into Transport(RegVozila, BrojLjudi, Gorivo, DatumTrans, SifraOtp, SifraGrad) values('BG-678-AD', 4, 50.3, '2021-11-26', 2, 2)
insert into Transport(RegVozila, BrojLjudi, Gorivo, DatumTrans, SifraOtp, SifraGrad) values('BG-5694-DB', 2, 47.5, '2022-1-14', 3, 3)

insert into PutniNalog values(1, 'Banovo Brdo - Zemun', '2021-8-30', 8, 'BG-423-GS')
insert into PutniNalog values(2, 'Dorćol - Novi Beograd', '2021-11-26', 9, 'BG-678-AD')
insert into PutniNalog values(3, 'Voždovac - Stari Grad', '2022-1-14', 10, 'BG-5694-DB')

insert into UlaznaFaktura values(1, '2022-2-14', 1)
insert into UlaznaFaktura values(2, '2022-3-7', 2)
insert into UlaznaFaktura values(3, '2022-4-17', 3)

insert into IzlazniRacun(IDRacuna, CenaRac, DatumRac, IDInv) values(1, 110120, '2021-10-25', 1)
insert into IzlazniRacun(IDRacuna, CenaRac, DatumRac, IDInv) values(2, 120530, '2021-12-14', 2)
insert into IzlazniRacun(IDRacuna, CenaRac, DatumRac, IDInv) values(3, 140230, '2021-2-18', 1)
insert into IzlazniRacun(IDRacuna, CenaRac, DatumRac, IDInv) values(4, 100570, '2021-10-25', 3)
insert into IzlazniRacun(IDRacuna, CenaRac, DatumRac, IDInv) values(5, 90410, '2021-12-14', 2)
insert into IzlazniRacun(IDRacuna, CenaRac, DatumRac, IDInv) values(6, 150760, '2021-2-18', 3)

insert into StavkaPIO values(1, 1)
insert into StavkaPIO values(2, 1)
insert into StavkaPIO values(3, 2)
insert into StavkaPIO values(4, 2)
insert into StavkaPIO values(5, 3)
insert into StavkaPIO values(6, 3)

insert into Ponuda values(1, 1, '2021-8-20')
insert into Ponuda values(2, 2, '2021-11-17')
insert into Ponuda values(3, 3, '2021-1-7')

insert into StavkaPonude values(1, 1, 1, 1, 3, '2021-8-30')
insert into StavkaPonude values(2, 1, 1, 2, 2, '2021-8-31')
insert into StavkaPonude values(3, 2, 2, 1, 1, '2021-11-25')
insert into StavkaPonude values(4, 2, 2, 3, 5, '2021-11-26')
insert into StavkaPonude values(5, 3, 3, 2, 4, '2022-1-12')
insert into StavkaPonude values(6, 3, 3, 3, 6, '2022-1-14')

insert into Kupovina values(1, 1, 1, 3, '2021-8-24', 1)
insert into Kupovina values(2, 2, 2, 2, '2021-11-20', 2)
insert into Kupovina values(3, 3, 3, 1, '2022-1-10', 3)

insert into StavkaOtpremnice values(1, 1, 10, 1)
insert into StavkaOtpremnice values(2, 1, 20, 1)
insert into StavkaOtpremnice values(3, 2, 10, 2)
insert into StavkaOtpremnice values(4, 2, 30, 2)
insert into StavkaOtpremnice values(5, 3, 20, 3)
insert into StavkaOtpremnice values(6, 3, 30, 3)

insert into Situacija values(1, 1, 110120, 30, '2021-9-1', '2021-11-12', 1)
insert into Situacija values(2, 1, 120530, 70, '2021-11-12', '2022-1-18', 2)
insert into Situacija values(3, 2, 140230, 60, '2021-11-28', '2021-12-31', 3)
insert into Situacija values(4, 2, 100570, 40, '2021-12-31', '2022-1-27', 4)
insert into Situacija values(5, 3, 90410, 55, '2022-1-15', '2022-2-4', 5)
insert into Situacija values(6, 3, 150760, 45, '2022-2-4', '2022-3-4', 6)

insert into GlavniMajstor values(7, 'TIG zavarivanje')

insert into JuniorMajstor(Sifra_radnika, RadniStaz, NadredjeniMajstor) values(8, 7, 7)
insert into JuniorMajstor(Sifra_radnika, RadniStaz, NadredjeniMajstor) values(9, 10, 7)

insert into Pomocnik values(10, 'Ugovorom', 7, 8)
insert into Pomocnik values(11, 'Honorarno', 7, 9)

insert into Angazovan values(3, 1)
insert into Angazovan values(2, 2)
insert into Angazovan values(1, 3)

insert into Pro_PIO values(1, 1)
insert into Pro_PIO values(2, 2)
insert into Pro_PIO values(3, 3)

insert into IzvrsavanjeTransporta values(8, 'BG-423-GS')
insert into IzvrsavanjeTransporta values(9, 'BG-678-AD')
insert into IzvrsavanjeTransporta values(10, 'BG-5694-DB')

insert into KoriscenjeSoftvera values(2, 4)
insert into KoriscenjeSoftvera values(1, 5)
insert into KoriscenjeSoftvera values(1, 6)

insert into RadNaStavci values(4, 5, 3)
insert into RadNaStavci values(5, 3, 2)
insert into RadNaStavci values(6, 1, 1)


--UBACIVANJE DODATNIH SPOLJINIH KLJUCEVA


update PIZ
set SifraGrad = 1, SifraPIO = 1, IDPIZRacuna = 1, SifraVodje = 6
where SifraPIZ = 1
update PIZ
set SifraGrad = 2, SifraPIO = 2, IDPIZRacuna = 2, SifraVodje = 5
where SifraPIZ = 2
update PIZ
set SifraGrad = 3, SifraPIO = 3, IDPIZRacuna = 3, SifraVodje = 4
where SifraPIZ = 3


update PIO
set SifraGrad = 1
where SifraPIO = 1
update PIO
set SifraGrad = 2
where SifraPIO = 2
update PIO
set SifraGrad = 3
where SifraPIO = 3


update Majstor
set SifraOtp = 1
where Sifra_radnika = 8
update Majstor
set SifraOtp = 2
where Sifra_radnika = 9
update Majstor
set SifraOtp = 3
where Sifra_radnika = 10


update Otpremnica
set RegVozila = 'BG-423-GS'
where SifraOtp = 1
update Otpremnica
set RegVozila = 'BG-678-AD'
where SifraOtp = 2
update Otpremnica
set RegVozila = 'BG-5694-DB'
where SifraOtp = 3


update Transport
set SifraPN = 1
where RegVozila = 'BG-423-GS'
update Transport
set SifraPN = 2
where RegVozila = 'BG-678-AD'
update Transport
set SifraPN = 3
where RegVozila = 'BG-5694-DB'


update IzlazniRacun
set IDSituacije = 1, SituacijaSifraGrad = 1
where IDRacuna = 1
update IzlazniRacun
set IDSituacije = 2, SituacijaSifraGrad = 1
where IDRacuna = 2
update IzlazniRacun
set IDSituacije = 3, SituacijaSifraGrad = 2
where IDRacuna = 3
update IzlazniRacun
set IDSituacije = 4, SituacijaSifraGrad = 2
where IDRacuna = 4
update IzlazniRacun
set IDSituacije = 5, SituacijaSifraGrad = 3
where IDRacuna = 5
update IzlazniRacun
set IDSituacije = 6, SituacijaSifraGrad = 3
where IDRacuna = 6


update JuniorMajstor
set PodredjeniPom = 10
where Sifra_radnika = 8
update JuniorMajstor
set PodredjeniPom = 11
where Sifra_radnika = 9