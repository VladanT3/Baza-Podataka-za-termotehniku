--POGLED:
create view Projektanti_na_Obuci
as
	select p.Sifra_radnika, r.ImePrezime, p.SifraObuke, p.SifraSP, o.VremeTr as 'Vreme trajanja', CenaSoft as 'Cena paketa'
	from Projektant p full outer join Obuka o on o.SifraObuke = p.SifraObuke full outer join SoftPaket sp on o.SifraSP = sp.SifraSP join Radnik r on p.Sifra_radnika = r.Sifra_radnika

--POZIV POGLEDA:
go
select * from Projektanti_na_Obuci



--PROCEDURA:
go
create procedure Napredovanje_Obuke as
begin
	update Projektant
	set SifraObuke = null, SifraSP = null
	where SifraObuke = 2
	update Projektant
	set SifraObuke = 2, SifraSP = 2
	where SifraObuke = 1

	update Obuka
	set VremeTr = VremeTr + 10

	update SoftPaket
	set CenaSoft = CenaSoft + 1000
end

--POZIV PROCEDURE:
go
exec Napredovanje_Obuke



--FUNKCIJA:
go
create function Pregled_Promena() returns table as
return
	select * from Projektanti_na_Obuci

--POZIV FUNKCIJE:
go
select * from Pregled_Promena()