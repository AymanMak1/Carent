CREATE OR REPLACE PACKAGE BODY carent_funcs AS
	PROCEDURE add_car(mtrc in varchar2, garage in number, marque in varchar2, model in varchar2, price in number, pic in varchar2) IS
	BEGIN
		DECLARE
			car1 car%rowtype;
		BEGIN
			car1.matricule := mtrc;
			car1.garage_id := garage;
			car1.marque := marque;
			car1.model := model;
			car1.addedAt := sysdate;
			car1.price := price;
			car1.disponible := 1;
			car1.picture_path := pic;

			insert into car values car1;
		END;
	END add_car;

	PROCEDURE add_car_desc(mtrc in varchar2, kilometrage in number, fuel in varchar2, fp in number, gear in varchar2, suitcase in number, door in number, seat in number) IS
	BEGIN
		DECLARE
			car1 car%rowtype;
		BEGIN
			car1.matricule := mtrc;
			car1.kilometrage := kilometrage;
			car1.fiscal_power := fp;
			car1.fuel := fuel;
			car1.gearbox := gear;
			car1.nbr_suitcase := suitcase;
			car1.nbr_doors := door;
			car1.nbr_seat := seat;

			insert into carDescription values car1;
		END;
	END add_car_desc;

	PROCEDURE remove_car(mtrc in varchar2) IS
	BEGIN
		BEGIN
			delete from car where matricule = mtrc;
		END;
	END remove_car;

	PROCEDURE modify_car(mtrc in varchar2, prix in number, kilomet in number) IS
	BEGIN
		BEGIN
			update car set price = prix where matricule = mtrc;
			update carDescription set kilometrage = kilomet where matricule = mtrc;
		END;
	END modify_car;

	PROCEDURE create_promo(mtrc in varchar2, prcnt in number) IS
	BEGIN
		BEGIN
			update car set price = (price - (prcnt*price/100)) where matricule = mtrc;
		END;
	END create_promo;
	
END;
/
