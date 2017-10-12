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

-- Clase de hoy sabado 11 de octubre
create table vendedor (numero_vendedor integer, 
                      ubicacion_vendedor varchar2(60),
                      area_ventas varchar2(60),
                      constraint pk_nv primary key(numero_vendedor)
                      );

                      DESCRIBE almacen;
                      DESCRIBE vendedor;
                      DESCRIBE cliente;
                      DESCRIBE ventas;
                      
create table cliente (numero_cliente integer, 
                      numero_almacen integer,
                      nombre_cliente varchar2(60),
                      constraint pk_nc primary key(numero_cliente),
                      constraint fk1_almacen foreign key(numero_almacen)
                      references almacen(numero_almacen)
                      );

create table ventas (ID_ventas integer, 
                      numero_cliente integer,
                      numero_vendedor integer,
                      montos_ventas float,
                      constraint pk_IDVv1 primary key(ID_ventas),
                      constraint fk_nc foreign key(numero_cliente) references cliente(numero_cliente),
                      constraint fk_nv foreign key (numero_vendedor) references vendedor(numero_vendedor)
                      );
                      
SELECT * from ventas;
                      