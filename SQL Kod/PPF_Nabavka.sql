--POGLED:
create view Detalji_o_Transportu
as
	select izt.RegVozila, izt.SifraMajstora, r.ImePrezime as 'Izvrsilac transporta', t.BrojLjudi, t.Gorivo, t.DatumTrans, pn.RelacijaPuta, pn.SifraPN, o.SifraOtp
	from Transport t join PutniNalog pn on pn.RegVozila = t.RegVozila join Otpremnica o on o.RegVozila = t.RegVozila join IzvrsavanjeTransporta izt on izt.RegVozila = t.RegVozila
	join Radnik r on r.Sifra_radnika = pn.SifraMajstora

--POZIV POGLEDA:
go
select * from Detalji_o_Transportu



--PROCEDURA:
go
create procedure Promena_Transporta
	@PokvarenoVozilo varchar(10), @NovoVozilo varchar(10) as
begin
	update PutniNalog
	set RegVozila = NULL
	where RegVozila = @PokvarenoVozilo

	update Otpremnica
	set RegVozila = NULL
	where RegVozila = @PokvarenoVozilo

	declare @Majstor int = (select SifraMajstora from IzvrsavanjeTransporta where RegVozila = @PokvarenoVozilo)
	delete from IzvrsavanjeTransporta
	where RegVozila = @PokvarenoVozilo
	
	declare @BrojLjudi int = (select BrojLjudi from Transport where RegVozila = @PokvarenoVozilo)
	declare @Gorivo numeric(4, 1) = (select Gorivo from Transport where RegVozila = @PokvarenoVozilo)
	declare @Datum date = (select DatumTrans from Transport where RegVozila = @PokvarenoVozilo)
	declare @PutniNalog int = (select SifraPN from PutniNalog where RegVozila is null)
	declare @Otpremnica int = (select SifraOtp from Otpremnica where RegVozila is null)
	declare @Gradiliste int = (select SifraGrad from Transport where RegVozila = @PokvarenoVozilo)
	delete from Transport
	where RegVozila = @PokvarenoVozilo

	insert into Transport values(@NovoVozilo, @BrojLjudi, @Gorivo, @Datum, @Otpremnica, @Gradiliste, @PutniNalog)

	update PutniNalog
	set RegVozila = @NovoVozilo
	where RegVozila is null

	update Otpremnica
	set RegVozila = @NovoVozilo
	where RegVozila is null

	insert into IzvrsavanjeTransporta values(@Majstor, @NovoVozilo)
end

--POZIV PROCEDURE:
exec Promena_Transporta @PokvarenoVozilo = 'BG-423-GS', @NovoVozilo = 'BG-1568-GM'



--FUNKCIJA:
go
create function Promene_Nabavka() returns table as
return
	select * from Detalji_o_Transportu

--POZIV FUNKCIJE:
go
select * from Promene_Nabavka()