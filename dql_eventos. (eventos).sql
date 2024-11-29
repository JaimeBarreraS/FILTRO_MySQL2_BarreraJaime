USE Filtro_Jaime; 

-- ##############
create event alumno on schedule at '2024-12-02  10:00' do 
insert into nuevo (nombre,apellido1) values ('pedro','gomez');

-- ##############
create event departamento on schedule at '2024-12-02  10:00' do 
insert into nuevo_2 (nombre) values ('Programacion y Desarrollo de Sotware');

-- ##############
create event actualizar on schedule every 1 week starts '2024-12-08  10:00' do
update act set id_curso_escolar = id_curso_escolar + 1.05;

-- ##############
create event ajustar on schedule every 3 week starts '2024-12-10  10:00' ends '2024-12-11  10:00' do
delete from ajustar where telefono < now() - interval 20 day;

-- ##############
create event proyectox on schedule every 3 week starts '2024-12-12  10:00' ends '2024-12-15  10:00' do
delete from proyectox where tipo < now() - interval 25 day;