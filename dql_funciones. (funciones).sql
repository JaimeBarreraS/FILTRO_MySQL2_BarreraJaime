USE Filtro_Jaime; 

-- ################################
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

-- ################################

DELIMITER //
CREATE FUNCTION p5(id_profesor INT)
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

-- ################################

DELIMITER //
CREATE FUNCTION p6(id_profesor INT)
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

-- ################################

DELIMITER //
CREATE FUNCTION p7(id_profesor INT)
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

-- ################################

DELIMITER //
CREATE FUNCTION p8(id_profesor INT)
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