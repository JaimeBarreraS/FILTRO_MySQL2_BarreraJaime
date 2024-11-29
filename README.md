![alt text](LOGO.png)
## Filtro MyQSL 2 📊

## **Descripción Filtro**  📝

**El Universitario** Este filtro tiene como objetivo diseñar e implementar un sistema de gestión de información integral que optimice las operaciones y administrativas mediante una base de datos relacional.

El sistema propuesto permite:

- **Gestión de Asignatura**: Control sobre los creditos, cursos, cuatrimestres y grados.  
- **Administración de Profesor**: Información personal completa sobre profesores y asignaciones de departamento. 
- **Control de Alumnos**: Información personal completa sobre Alumnos, matriculas a sus asignaturas. 
- **Gestión de Departamentos**: Información sobre los departamentes y asignaciones a los profesores.   

### **Metodología**  
El filtro utiliza un enfoque relacional para modelar la base de datos. 

**Fases del desarrollo**:

1. **Modelo Conceptual**: Representación de las entidades clave y sus relaciones.  
3. **Normalización**: Aplicación de las formas normales (1FN, 2FN, 3FN) para garantizar integridad y eficiencia.  
4. **Modelo Físico**: Implementación en SQL con inserción de datos y consultas optimizadas.  


### **Beneficios del Sistema**

- Mejora la **eficiencia operativa**.  
- Reduce errores en el manejo de información.  
- Aumenta la **sostenibilidad** mediante una gestión centralizada y organizada.  
- Facilita la **toma de decisiones estratégicas** basada en datos confiables y accesibles.

## **Requisitos del Sistema** ⚙️

- **Software necesario:**  
  - MySQL versión X.X o superior.  
  - Cliente MySQL Workbench.  
  - Editor de texto (e.g., Visual Studio Code, Sublime Text).  

### **Instalación y Configuración**

Siga estos pasos para configurar el entorno y cargar la base de datos:  

1. **Preparación del entorno:**  
   - Instale MySQL y MySQL Workbench en su sistema.  
   - Asegúrese de tener permisos para ejecutar scripts SQL.  

2. **Generación de la base de datos:**  
   - Ejecute el archivo `ddl.sql` para crear la estructura de la base de datos.  

3. **Carga de datos iniciales:**  
   - Ejecute el archivo `dml.sql` para insertar los datos iniciales necesarios para las operaciones del sistema.  

4. **Ejecución de consultas y procesos:**  
   - Utilice `dql_select.sql` para realizar consultas relacionadas.  
   - Añada las funciones definidas en `dql_funciones.sql` para cálculos personalizados.  
   - Configure triggers con `dql.triggers.sql` y eventos automáticos con `dql.eventos.sql`.  

5. **Verificación y ajustes:**  
   - Revise el modelo de datos en `Diagrama.jpg` para confirmar la estructura.  
   - Consulte el archivo `README.md` para detalles adicionales sobre el uso del sistema.


## **Instalación General** 🛠️

El sistema de gestión de datos está distribuido en archivos SQL organizados en ocho partes y archivos adicionales para facilitar su implementación y comprensión. A continuación, se detalla el contenido y los pasos para su instalación.

### **Archivos Relacionados**  
1. **`ddl.sql` (Creación de base de datos con tablas y relaciones):**  
   Contiene el script para crear la base de datos, tablas y definir relaciones entre ellas.

2. **`dml.sql` (Inserciones de datos):**  
   Script con los datos iniciales para gestionar las operaciones.

3. **`dql_select.sql` (Consultas):**  
   Incluye consultas relacionadas con el filtro, como reportes y búsquedas específicas.

4. **`dql_funciones.sql` (Funciones):**  
   Contiene funciones para cálculos personalizados y transformaciones específicas.

5. **`dql.triggers.sql` (Triggers):**  
   Define triggers que automatizan respuestas a cambios en las tablas.

6. **`dql.eventos.sql` (Eventos):**  
   Incluye eventos que se ejecutan automáticamente en momentos específicos.


### **Archivos Adicionales**  
- **`README.md`:**  
  Documento escrito en Markdown con explicaciones del proyecto, instrucciones de uso y otros detalles esenciales.  
- **`Diagrama.jpg`:**  
  Imagen del modelo de datos para referencia visual.  
  
## **Estructura de la Base de Datos**  📚

| **Tablas**          | **Descripción**                                                                                                                                 |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| **Alumno**          | Gestion con datos personales como nif, nombres, apellidos, ciudad, direccion, telefono, fecha de nacimiento y sexo.                                  |
| **Alumno_se_matricula_asignatura**       | Registra las llaves foraneas de alumno, asignatura y curso_escolar.                                               |
| **Asignatura**       | Detalla asignaturas. Nombre, creditos, curso, profesores y grado.                     |
| **Curso_escolar**            | Información sobre el año de inicio y año de fin del curso.                                                    |
| **Departamento**        |  Datos del identificador unico del departamento y nombre.                                              |
| **Grado**         | Datos del identificador unico del grado y nombre.                                                       |
| **Profesor**       | Gestion con datos personales como nif, nombres, apellidos, ciudad, direccion, telefono, fecha de nacimiento, sexo y el departamento donde fue asignado.                                               |


## **Ejemplos de Consultas** 🔍 

A continuación, se presentan algunos ejemplos de consultas SQL que se pueden ejecutar en la base de datos:

> Ejemplo 1.  
```sql
select a.nombre, a.id_profesor 
from asignatura a
join profesor b on a.id_profesor  = b.id_profesor
where a.id_profesor=(3);
```

> Ejemplo 2.
```sql
select id_departamento as departamento, nombre 
from departamento 
where id_departamento < 6;
```

> Ejemplo 3.
```sql
select  count(b.id_profesor) as cantidad_profesor , b.id_profesor, b.nombre
from asignatura a
join profesor b on a.id_profesor  = b.id_profesor
where a.id_profesor=(3);
```

## **Funciones, Triggers y Eventos** ⚙️


### **Funciones** 🔧
Las funciones se utilizan para realizar cálculos o transformaciones personalizadas.

> Ejemplo

```sql
DELIMITER //
CREATE FUNCTION p4(id_profesor INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE profe DECIMAL(10,2);
    SELECT (SUM(id_profesor) / COUNT(id_departamento)) 
    INTO profe
    FROM profesor
    LEFT JOIN departamento ON profesor.id_departamento = departamento.id_departamento
    WHERE profesor.id_departamento = id_departamento;
	RETURN IFNULL(profe, 0);
END;
//
DELIMITER ;
```

### **Triggers** 🔧
Los triggers automatizan acciones en respuesta a eventos en las tablas.


> Ejemplo

```sql
create trigger eliminar_alumno
after update on alumno
for each row
begin
	delete from cultivo where id_alumno=old.id_alumno;
end;
//
delimiter ;
```
### **Eventos** 🔧
Los eventos ejecutan tareas programadas en momentos específicos.

> Ejemplo

```sql
create event alumno on schedule at '2024-12-02  10:00' do 
insert into nuevo (nombre,apellido1) values ('pedro','gomez');
```

## **Desarrollo** 🎉
Este filtro fue desarrollado por:
   - 👑 **Jaime Enrique Barrera Sandoval:** Diseño y desarrollo de la base de datos, inserciones, consultas, implementación de funciones, triggers, eventos.