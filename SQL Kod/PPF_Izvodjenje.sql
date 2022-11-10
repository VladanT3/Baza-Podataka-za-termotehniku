--POGLED:
create view Pregled_Ponuda
as
	select k.SifraKup, r.ImePrezime, d.NazivDob as 'Dobavljac', k.IDPonude, sp.RedniBroj as 'Stavka Ponude', sp.SifraProiz as 'Proizvod', pr.Naziv as 'Naziv proizvoda', sp.KolicinaProiz, pr.CenaPro * sp.KolicinaProiz as 'Cena', uf.SifraFakture
	from Ponuda p join StavkaPonude sp on sp.IDPonude = p.IDPonude join Kupovina k on k.IDPonude = p.IDPonude join UlaznaFaktura uf on uf.SifraFakture = k.SifraFakture
	join Dobavljac d on d.IDDob = p.IDDob join Proizvod pr on pr.SifraProiz = sp.SifraProiz join Radnik r on r.Sifra_radnika = k.Sifra_radnika

--POZIV POGLEDA:
go
select * from Pregled_Ponuda



--PROCEDURA:
go
create procedure Nova_Kupovina
	@BrojStavki int, @Dobavljac int, @Izvodjac int as
begin
	declare @MaxPonuda int
	set @MaxPonuda = (select max(IDPonude) from Ponuda)
	insert into Ponuda values(@MaxPonuda + 1, @Dobavljac, (select cast(getdate() as date)))
	
	declare @MaxStavkaPon int
	set @MaxPonuda = (select max(IDPonude) from Ponuda)
	declare @KolicinaRobe int
	declare @Proizvod int
	declare @MaxFaktura int
	declare @MaxKupovina int
	declare @x int = @BrojStavki
	while (@x > 0)
	begin
		set @x = @x - 1
		set @MaxStavkaPon = (select max(RedniBroj) from StavkaPonude)
		set @KolicinaRobe = (select cast(floor(rand()*(5-1+1)+1) as int))
		set @Proizvod = (select cast(floor(rand()*(3-1+1)+1) as int))
		insert into StavkaPonude values(@MaxStavkaPon + 1, @MaxPonuda, @Dobavljac, @Proizvod, @KolicinaRobe, (select cast(getdate() + 10 as date)))	
	end

	set @MaxFaktura = (select max(SifraFakture) from UlaznaFaktura)
	insert into UlaznaFaktura values(@MaxFaktura + 1, (select cast(getdate() + 30 as date)), @Dobavljac)

	set @MaxKupovina = (select max(SifraKup) from Kupovina)
	set @MaxPonuda = (select max(IDPonude) from Ponuda)
	set @MaxFaktura = (select max(SifraFakture) from UlaznaFaktura)
	insert into Kupovina values(@MaxKupovina + 1, @MaxPonuda, @Dobavljac, @Izvodjac, (select cast(getdate() + 20 as date)), @MaxFaktura)
end

--POZIV PROCEDURE:
exec Nova_Kupovina @BrojStavki = 3, @Dobavljac = 2, @Izvodjac = 2



--FUNKCIJA:
go
create function Pregled_Promena_Izvodjenje() returns table as
return
	select * from Pregled_Ponuda

--POZIV FUNKCIJE:
go
select * from Pregled_Promena_Izvodjenje()