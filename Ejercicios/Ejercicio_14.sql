/*
14) Mostrar, por cada hospital, cuantos suministros fueron utilizados un 40% más de 
lo que se repusieron en el ultimo mes.
*/

SELECT * 
FROM hospital;

SELECT * 
FROM utilizacion_suministro;

SELECT *
FROM departamento_suminstro;

SELECT * 
FROM pm_suministros;

SET @MesActual = month(curdate());

SELECT * 
FROM utilizacion_suministro
WHERE month(date(utilizacion_suministro.Fecha_Hora)) = @MesActual;
