CREATE DATABASE IF NOT EXISTS polizas_de_seguros ;

USE polizas_de_seguros;


CREATE TABLE Empresa (
    id_empresa int NOT NULL,
    cuit int NOT NULL,
    razon_social varchar(200) NOT NULL,
    CONSTRAINT PK_empresa PRIMARY KEY (id_empresa)
);

CREATE TABLE Aseguradora (
    id_aseguradora int NOT NULL,
    cuit int NOT NULL,
    nombre varchar(200) NOT NULL,
    CONSTRAINT PK_Aseguradora PRIMARY KEY (id_aseguradora)
);

CREATE TABLE Poliza (
    id_poliza int NOT NULL,
    id_nro_poliza varchar(200) NOT NULL,
    f_inicio DATE NOT NULL,
    f_fin DATE NOT NULL,
    estado varchar(200) NOT NULL,
    importe DECIMAL(15,2) NOT NULL,
id_empresa int NOT NULL,
    id_aseguradora int NOT NULL,
    id_tipo_seg int NOT NULL,
    CONSTRAINT PK_Poliza PRIMARY KEY (id_poliza)
);

CREATE TABLE Tipo_de_seguro (
    id_tipo_seg INT NOT NULL,
    descripcion varchar(200) NOT NULL,
    CONSTRAINT PK_Tipo_de_seguro PRIMARY KEY (id_tipo_seg)
);

CREATE TABLE Endoso (
    id_endoso INT NOT NULL,
    descripcion varchar(200) NOT NULL,
    importe DECIMAL(15,2) NOT NULL,
    id_poliza INT NOT NULL,
    CONSTRAINT PK_endoso PRIMARY KEY (id_endoso)
);

CREATE TABLE Cuotas (
    id_cuota INT NOT NULL,
    importe DECIMAL(15,2) NOT NULL,
    f_venc DATE NOT NULL,
    id_poliza INT NOT NULL,
    CONSTRAINT PK_cuota PRIMARY KEY (id_cuota)
);

CREATE TABLE Pagos (
    id_pagos int NOT NULL,
    importe DECIMAL(15,2) NOT NULL,
    f_pago DATE NOT NULL,
    id_cuota INT NOT NULL,
    CONSTRAINT PK_Pagos PRIMARY KEY (id_pagos)
);

-- foreign keys
ALTER TABLE Poliza
ADD CONSTRAINT FK_Poliza_Empresa
FOREIGN KEY (id_empresa)
REFERENCES Empresa (id_empresa);

ALTER TABLE Poliza
ADD CONSTRAINT FK_Poliza_Aseguradora
FOREIGN KEY (id_aseguradora)
REFERENCES Aseguradora (id_aseguradora);

ALTER TABLE Poliza
ADD CONSTRAINT FK_Poliza_Tipo_Seguro
FOREIGN KEY (id_tipo_seg)
REFERENCES Tipo_de_seguro (id_tipo_seg);

ALTER TABLE Endoso
ADD CONSTRAINT FK_Endoso_Poliza
FOREIGN KEY (id_poliza)
REFERENCES Poliza (id_poliza);

ALTER TABLE Cuotas
ADD CONSTRAINT FK_Cuotas_Poliza
FOREIGN KEY (id_poliza)
REFERENCES Poliza (id_poliza);

ALTER TABLE Pagos
ADD CONSTRAINT FK_Pagos_Cuotas
FOREIGN KEY (id_cuota)
REFERENCES Cuotas (id_cuota); 

DROP TABLE IF EXISTS Empresa;

CREATE TABLE Empresa (
    id_empresa INT NOT NULL,
    cuit BIGINT NOT NULL,
    razon_social VARCHAR(200) NOT NULL,
    CONSTRAINT PK_empresa PRIMARY KEY (id_empresa)
);

INSERT INTO Empresa(id_empresa,cuit,razon_social) 
VALUES (1,20363046607,'VEOLIA SA');

DROP TABLE IF EXISTS Aseguradora;

CREATE TABLE Aseguradora (
    id_aseguradora int NOT NULL,
    cuit bigint NOT NULL,
    nombre varchar(200) NOT NULL,
    CONSTRAINT PK_Aseguradora PRIMARY KEY (id_aseguradora)
);

INSERT INTO Aseguradora(id_aseguradora,cuit,nombre) 
VALUES (1,20363046601,'NACIONAL SEGUROS S.A.'),
(2,20363046602,'PROVINCIAL SEGUROS S.A.'),
(3,20363046603,'LA TERCERA S.A.'),
(4,20363046604,'CAUTELAR S.A.');

INSERT INTO poliza(id_poliza, id_nro_poliza, f_inicio, f_fin, estado, importe,id_empresa,id_aseguradora,id_tipo_seg) VALUES 
(1,'129876','2025-12-30','2026-12-30','VIGENTE', 90000,1,2,1),
(2,'10939942','2025-12-30','2026-12-30','VIGENTE', 100000,1,2,2),
(3,'172730','2025-12-30','2026-03-07','VIGENTE', 50000,1,2,3),
(4,'611036','2025-12-30','2026-12-30','VIGENTE', 5000000,1,2,4),
(5,'26193','2025-12-30','2026-12-30','VIGENTE', 8000000,1,2,5);

INSERT INTO Cuotas (id_cuota, importe, f_venc, id_poliza) VALUES

-- POLIZA 1
(1,10000,'2026-01-10',1),
(2,10000,'2026-02-10',1),
(3,10000,'2026-03-10',1),
(4,10000,'2026-04-10',1),
(5,10000,'2026-05-10',1),
(6,10000,'2026-06-10',1),
(7,10000,'2026-07-10',1),
(8,10000,'2026-08-10',1),
(9,10000,'2026-09-10',1),

-- POLIZA 2
(10,12000,'2026-01-15',2),
(11,12000,'2026-02-15',2),
(12,12000,'2026-03-15',2),
(13,12000,'2026-04-15',2),
(14,12000,'2026-05-15',2),
(15,12000,'2026-06-15',2),
(16,12000,'2026-07-15',2),
(17,12000,'2026-08-15',2),
(18,12000,'2026-09-15',2),

-- POLIZA 3
(19,6000,'2026-01-05',3),
(20,6000,'2026-02-05',3),
(21,6000,'2026-03-05',3),
(22,6000,'2026-04-05',3),
(23,6000,'2026-05-05',3),
(24,6000,'2026-06-05',3),
(25,6000,'2026-07-05',3),
(26,6000,'2026-08-05',3),
(27,6000,'2026-09-05',3),

-- POLIZA 4
(28,550000,'2026-01-20',4),
(29,550000,'2026-02-20',4),
(30,550000,'2026-03-20',4),
(31,550000,'2026-04-20',4),
(32,550000,'2026-05-20',4),
(33,550000,'2026-06-20',4),
(34,550000,'2026-07-20',4),
(35,550000,'2026-08-20',4),
(36,550000,'2026-09-20',4),

-- POLIZA 5
(37,900000,'2026-01-25',5),
(38,900000,'2026-02-25',5),
(39,900000,'2026-03-25',5),
(40,900000,'2026-04-25',5),
(41,900000,'2026-05-25',5),
(42,900000,'2026-06-25',5),
(43,900000,'2026-07-25',5),
(44,900000,'2026-08-25',5),
(45,900000,'2026-09-25',5);

INSERT INTO Pagos (id_pagos, importe, f_pago, id_cuota) VALUES
(1, 10000, '2026-01-10', 1),   -- poliza 1
(2, 5000,  '2026-01-12', 2),   -- poliza 1 (parcial)
(3, 12000, '2026-01-15', 10),  -- poliza 2
(4, 6000,  '2026-01-05', 19),  -- poliza 3
(5, 550000,'2026-01-20', 28),  -- poliza 4
(6, 300000,'2026-01-22', 29),  -- poliza 4 (parcial)
(7, 900000,'2026-01-25', 37),  -- poliza 5
(8, 450000,'2026-02-25', 38),  -- poliza 5 (parcial)
(9, 10000, '2026-02-10', 3),   -- poliza 1
(10,12000, '2026-02-15', 11);  -- poliza 2

SELECT * FROM Pagos;


---- creacion de vistas ----

CREATE VIEW vw_polizas_vigentes AS
SELECT 
    p.id_nro_poliza,
    p.f_inicio,
    p.f_fin,
    a.nombre AS aseguradora,
    ts.descripcion AS tipo_seguro
FROM Poliza p
INNER JOIN Aseguradora a 
    ON p.id_aseguradora = a.id_aseguradora
INNER JOIN Tipo_de_seguro ts 
    ON p.id_tipo_seg = ts.id_tipo_seg
WHERE p.f_fin >= CURDATE();

CREATE VIEW vw_saldo_polizas AS
SELECT 
    p.id_poliza,
    p.id_nro_poliza,
    p.importe 
    + IFNULL(SUM(e.importe), 0) 
    - IFNULL(SUM(pg.importe), 0) AS saldo_pendiente
FROM Poliza p
LEFT JOIN Endoso e 
    ON p.id_poliza = e.id_poliza
LEFT JOIN Cuotas c 
    ON p.id_poliza = c.id_poliza
LEFT JOIN Pagos pg 
    ON c.id_cuota = pg.id_cuota
GROUP BY 
    p.id_poliza,
    p.id_nro_poliza,
    p.importe;
    
CREATE VIEW vw_pago_mensual AS
SELECT 
    p.id_nro_poliza,
    ts.descripcion AS tipo_seguro,
    c.id_cuota,
    c.f_venc,
    c.importe
FROM Cuotas c
INNER JOIN Poliza p 
    ON c.id_poliza = p.id_poliza
INNER JOIN Tipo_de_seguro ts 
    ON p.id_tipo_seg = ts.id_tipo_seg
WHERE MONTH(c.f_venc) = MONTH(CURDATE())
AND YEAR(c.f_venc) = YEAR(CURDATE());    

---- FUNCIONES ----

DELIMITER //

CREATE FUNCTION fx_dias_poliza(fecha_inicio DATE, fecha_fin DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE dias INT;
    
    SET dias = DATEDIFF(fecha_fin, fecha_inicio);
    
    RETURN dias;
END;
//

DELIMITER ;

DELIMITER //

CREATE FUNCTION fx_saldo_pendiente(p_id_poliza INT)
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    DECLARE saldo DECIMAL(15,2);

    SELECT 
        p.importe - IFNULL(SUM(pg.importe),0)
    INTO saldo
    FROM Poliza p
    LEFT JOIN Cuotas c ON p.id_poliza = c.id_poliza
    LEFT JOIN Pagos pg ON c.id_cuota = pg.id_cuota
    WHERE p.id_poliza = p_id_poliza
    GROUP BY p.id_poliza, p.importe;

    RETURN saldo;
END;
//

DELIMITER ;

DELIMITER //

CREATE FUNCTION fx_estado_poliza(fecha_fin DATE)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE estado VARCHAR(20);

    IF fecha_fin >= CURDATE() THEN
        SET estado = 'VIGENTE';
    ELSE
        SET estado = 'VENCIDA';
    END IF;

    RETURN estado;
END;
//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_nueva_poliza(
    IN p_id_poliza INT,
    IN p_nro_poliza VARCHAR(200),
    IN p_f_inicio DATE,
    IN p_f_fin DATE,
    IN p_estado VARCHAR(20),
    IN p_importe DECIMAL(15,2),
    IN p_id_empresa INT,
    IN p_id_aseguradora INT,
    IN p_id_tipo_seg INT
)
BEGIN

INSERT INTO Poliza (
    id_poliza,
    id_nro_poliza,
    f_inicio,
    f_fin,
    estado,
    importe,
    id_empresa,
    id_aseguradora,
    id_tipo_seg
)
VALUES (
    p_id_poliza,
    p_nro_poliza,
    p_f_inicio,
    p_f_fin,
    p_estado,
    p_importe,
    p_id_empresa,
    p_id_aseguradora,
    p_id_tipo_seg
);

END;
//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_eliminar_poliza(IN p_id_poliza INT)
BEGIN

-- eliminar pagos
DELETE pg
FROM Pagos pg
INNER JOIN Cuotas c ON pg.id_cuota = c.id_cuota
WHERE c.id_poliza = p_id_poliza;

-- eliminar cuotas
DELETE FROM Cuotas
WHERE id_poliza = p_id_poliza;

-- eliminar endosos
DELETE FROM Endoso
WHERE id_poliza = p_id_poliza;

-- eliminar póliza
DELETE FROM Poliza
WHERE id_poliza = p_id_poliza;

END;
//

DELIMITER ;

DELIMITER //

DELIMITER //

CREATE TRIGGER trg_estado_poliza_update
BEFORE UPDATE ON Poliza
FOR EACH ROW
BEGIN

    IF NEW.f_fin >= CURDATE() THEN
        SET NEW.estado = 'VIGENTE';
    ELSE
        SET NEW.estado = 'VENCIDA';
    END IF;

END;
//

CREATE TRIGGER trg_validar_pago
BEFORE INSERT ON Pagos
FOR EACH ROW
BEGIN

    DECLARE total_pagado DECIMAL(15,2);
    DECLARE importe_cuota DECIMAL(15,2);

    -- total ya pagado de esa cuota
    SELECT IFNULL(SUM(importe),0)
    INTO total_pagado
    FROM Pagos
    WHERE id_cuota = NEW.id_cuota;

    -- importe de la cuota
    SELECT importe
    INTO importe_cuota
    FROM Cuotas
    WHERE id_cuota = NEW.id_cuota;

    -- validación
    IF (total_pagado + NEW.importe) > importe_cuota THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El pago supera el importe de la cuota';
    END IF;

END;
//

DELIMITER ;



