SELECT Suministros_CodigoSuministro, count(*) as cant 
FROM departamento_suminstro
group by Suministros_CodigoSuministro;

/*Testeo Trigger*/
SELECT Hospital_NroHospital, Departamento_NroDepartamento as NroDepartamento, Suministros_CodigoSuministro as CodigoSuministro, CantSum
FROM(
SELECT * 
FROM departamento_suminstro
WHERE Suministros_CodigoSuministro = 'AR9261') AS T1
NATURAL JOIN 
departamentos_hospital