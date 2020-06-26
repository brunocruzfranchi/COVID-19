/*
7) Chequear que el costo unitario de los suministros farmacéuticos no sea mayor a $20.000
*/
 
 alter table personas
	DROP CONSTRAINT check_Sexo;
 
-- Checkeo de que todas los atributos sexos son de la variable F o M
alter table personas 
	ADD CONSTRAINT check_Sexo CHECK(Sexo IN ('F','M'));
    -- En este caso al cumplise las condiciones propuestas en el CHECK, este se agrega 
    -- con exito en la tabla en la que se indica
    
-- Checkeo de que el valor unitario de los sf no sea mayor a 20.000
alter table suministros 
	ADD CONSTRAINT check_precio CHECK(CostoUnitario <= 20000);
    -- Mientras que este al no cumplirse lo propuesto, nos marca un error diciendo
    -- que existen datos con un costo unitario mayor al indicando en la condicion.
    
    

