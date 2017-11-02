-- BEFORE
--paso1 Generar la siguiente tabla
create table mayores(id integer primary key,
                     nombre varchar2(60),
                     edad integer);
                     /


-- Generar un disparador que impida registrar Usuarios menores de edad en la tabla MAYORES.                     

create or replace trigger disp_mayores before insert on mayores
for each row
begin
if  :new.edad < 18 then
raise_application_error(-20000, 'Edad incorrecata');
end if;
end;
/
--comprobando el disparador
insert into mayores values (1,'JUAN',20);
SELECT * FROM MAYORES;
insert into mayores values (1,'JUAN',16);
SELECT * FROM MAYORES;


--Disparador  de tiipo BEFORE con ioperacion
--Paso No 1 Generar la siguiente tabla

create table nominas(id integer primary key,
                     sueldo_base float,
                     horas_laboradas integer,
                     deposito float);
                     /
                     
--paso 2 Garadar los registros

insert into nominas values(1,2000,20,28000);
insert into nominas values(2,1000,16,50000);
select * from nominas;

--Paso 3 usasr un disparador que lleve a cabo la actualizacion

create or replace trigger disp_nominas before update on nominas
for each row
begin
--iniciamos la ligica del diaparador
:new.deposito := :old.deposito+:new.horas_laboradas * :old.sueldo_base;
end;
/

update nominas set horas_laboradas=20 where id=1; 
select * from nominas;

