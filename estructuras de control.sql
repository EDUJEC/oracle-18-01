create table menores_edad( id_menores integer,
                          nombre varchar2(60),
                          edad integer,
                          constraint pk_im primary key(id_menores));
                          
create or replace procedure generar_mil
as begin
--generamos los mil
for i IN 1..1000 loop
insert into menores_edad values(i,'JOSE CAMPOS',20);
end loop;
end;
/

-- vamos a ejecutar el procedimiento

begin
generar_mil();
end;
/

SELECT * FROM menores_edad;
SELECT count(*) FROM menores_edad;

-- PROBLEMA 2  IF ELSE
CREATE OR REPLACE PROCEDURE ACTUALIZAR_EDAD(AGE IN INTEGER,ID IN INTEGER) AS
BEGIN
IF AGE < 18 THEN
RAISE_APLICACION_ERROR (-20001, 'NO ASEPTO EDADES MENORES A 18');
ELSE
UPDATE MENORES_EDAD SET EDAD=AGE WHERE ID_MENORES=ID;
END IF;
END;
/


 