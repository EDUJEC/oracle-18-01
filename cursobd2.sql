
-- Clase de hoy sabado 7 de octubre
create table almacen (numero_almacen integer, 
                      ubicacion_alamacen varchar2(80),
                      constraint pk_na primary key(numero_almacen)
                      );

-- VAMOS AGENERARUN PROCEDIMIENTO ALMACENADO PARA GUARDAR UNA ENTIDAD O REGISTRO DE TIPO ALMACEN  
create or replace procedure guardar_almacen(mi_id IN integer,
                                            mi_ubicacion IN varchar2)
                                            as
                                            begin
                          --AQUI BINE LA LOGICA DEL PROCEDIMIENTO
                          
                          insert into almacen values(mi_id,mi_ubicacion);
                          end;
                          /

--VAMOS A PROBAR QUE FUNCIONA NUESTRO PROCEDIMIENTO
begin
guardar_almacen(1,'PLYMOUTH');
end;
/

SELECT * FROM almacen;


                          