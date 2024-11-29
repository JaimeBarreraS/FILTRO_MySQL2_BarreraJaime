USE Filtro_Jaime; 

-- ################################# 
select a.nombre, a.id_profesor 
from asignatura a
join profesor b on a.id_profesor  = b.id_profesor
where a.id_profesor=(3);

-- ################################# 
select id_departamento as departamento, nombre 
from departamento 
where id_departamento < 6;

-- ################################# 
select  count(b.id_profesor) as cantidad_profesor , b.id_profesor, b.nombre
from asignatura a
join profesor b on a.id_profesor  = b.id_profesor
where a.id_profesor=(3);

-- ################################# 
select count(sexo) as sexo from alumno; 

-- ################################# 
select id_asignatura, nombre, curso 
from asignatura
where curso=(2);

-- ################################# 
select nombre, cuatrimestre
from asignatura
where cuatrimestre=(2);

-- ################################# 
select id_profesor
from profesor
where id_departamento > 3;

-- ################################# 
select id_profesor
from profesor
where id_departamento < 2;

-- ################################# 
select *from alumno 
where fecha_nacimiento=('1991-03-28'); 

-- ################################# 
select id_asignatura as nombre, creditos 
from asignatura
where id_profesor < 6;



