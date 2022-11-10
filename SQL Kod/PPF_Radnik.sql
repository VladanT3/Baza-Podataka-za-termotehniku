--POGLED:
create view Radnici_i_Njihove_Pozicije
as
select r.Sifra_radnika, r.ImePrezime, r.Plata, i.RadniStaz 'Radni staz inzenjera', m.Specijalizacija, iz.SifraMentora as 'Izvodjac mentor', iz.StatusIzv as 'Status izvodjaca',
p.SifraMentora as 'Projektant mentor', p.StatusPro as 'Status Projektanta', gm.Sertifikat, jm.RadniStaz as 'Radni staz juniora', jm.NadredjeniMajstor, jm.PodredjeniPom,
po.NacinZap, po.NadredjeniGM, po.NadredjeniJM
from Radnik r full outer join Inzenjer i on r.Sifra_radnika = i.Sifra_radnika full outer join Majstor m on r.Sifra_radnika = m.Sifra_radnika full outer join Izvodjac iz on iz.Sifra_radnika = i.Sifra_radnika
full outer join Projektant p on p.Sifra_radnika = i.Sifra_radnika full outer join GlavniMajstor gm on gm.Sifra_radnika = m.Sifra_radnika full outer join JuniorMajstor jm on jm.Sifra_radnika = m.Sifra_radnika
full outer join Pomocnik po on po.Sifra_radnika = m.Sifra_radnika

--POZIV POGLEDA:
go
select * from Radnici_i_Njihove_Pozicije



--PROCEDURA:
go
create procedure Zaposljavanje_Novog_Izvodjaca
	@ID int, @ImePrezime varchar(30), @Plata numeric(6, 0), @RadniStaz int, @Mentor int, @Status varchar(15) as
begin
	if @ID in (select Sifra_radnika from Radnik) or @Mentor not in (select SifraMentora from Izvodjac) or @Status not in ('Licenciran', 'Pripravnik')
	begin
		print 'Niste pravilno uneli vrednosti novog Izvodjaca'
		return -1
	end
	insert into Radnik values(@ID, @ImePrezime, @Plata)
	insert into Inzenjer values(@ID, @RadniStaz)
	insert into Izvodjac values(@ID, @Mentor, @Status)
end

--POZIV PROCEDURE:
go
declare @NoviRadnik int
set @NoviRadnik = (select max(Sifra_radnika) from Radnik) + 1
exec Zaposljavanje_Novog_Izvodjaca @ID = @NoviRadnik, @ImePrezime = 'Toma Tomic', @Plata = 82000, @RadniStaz = 3, @Mentor = 1, @Status = 'Pripravnik'



--FUNKCIJA:
go
create function Prikaz_Promena_Radnik(@IDNovogRadnika int) returns table as
return
	select * from Radnici_i_Njihove_Pozicije

--POZIV FUNKCIJE:
go
select * from Prikaz_Promena_Radnik((select max(Sifra_radnika) from Radnik))
order by Sifra_radnika