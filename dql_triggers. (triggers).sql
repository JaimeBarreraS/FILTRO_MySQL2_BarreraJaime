USE Filtro_Jaime; 

-- ################################# 
delimiter //
create trigger actualizacion2_alumno
after update on alumno
for each row

begin
	insert into alumno (id_alumno,nif)
    values (new.id_alumno,'89542419S');
end;
//
delimiter ;
select *from alumno;

-- ################################# 
delimiter //
create trigger eliminar_alumno
after update on alumno
for each row
begin
	delete from cultivo where id_alumno=old.id_alumno;
end;
//
delimiter ;
select *from alumno;

-- ################################# 

delimiter //
create trigger insert_alumno
before insert on alumno
for each row

begin
	insert into alumno (id_alumno,nif,nombre,apellido1,apellido2,ciudad,direccion,telefono,fecha_nacimiento,sexo)
    values (new.id_alumno,'89542419T', 'Jaime', 'Barrera', 'Sandoval', 'Cucuta', 'C/ Barcelona', '618253876', '1999/08/08', 'H');
end;
//
delimiter ;
select *from alumno;

-- ################################# 

delimiter //
create trigger p4_alumno
before update on alumno
for each row

begin
	insert into alumno (id_alumno,fecha_nacimiento,sexo)
    values (new.id_alumno,'2022/08/08', 'H');
end;
//
delimiter ;
select *from alumno;

-- ################################# 

delimiter //
create trigger eliminar_profesor
after update on profesor
for each row
begin
	delete from profesor where id_profesor=old.id_profesor;
end;
//
delimiter ;
select *from alumno;