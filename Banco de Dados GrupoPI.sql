CREATE DATABASE AviSafe;
-- DROP DTABASE AviSafe;

USE AviSafe;

CREATE TABLE Sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
dtLeitura DATETIME DEFAULT current_timestamp,
leituraTemp DECIMAL (5,2),
leituraUmi INT 
);



INSERT INTO Sensor (leituraTemp, leituraUmi) VALUES
(99.22, 40),
(59.20, 38),
(62.52, 44),
(93.25, 47),
(32.62, 48);

SELECT * FROM sensor;

SELECT dtLeitura AS 'DataDaLeitura',
	leituraTemp AS 'LeituraDaTemperaturaºC',
	leituraUmi AS 'LeituraDaUmidade%'
    FROM Sensor;
    
SELECT concat ('Em ', dtLeitura, ' foi coletada a temperatura ', leituraTemp,'ºC e o 
nível de umidade em ', leituraUmi,'%' ) AS 'Dados do Arduino' FROM Sensor;

INSERT INTO Sensor VALUES
(DEFAULT, DEFAULT,24.00, 50),
(DEFAULT, DEFAULT,20.30, 60),
(DEFAULT, DEFAULT,25.6, 55),
(DEFAULT, DEFAULT,19.2, 62);

SELECT * FROM Sensor;

UPDATE Sensor SET leituraUmi = 56
WHERE idSensor = 6;

DELETE FROM Sensor WHERE idSensor = 7;

ALTER TABLE Sensor ADD COLUMN diadasemana VARCHAR (25);

DESC Sensor;

ALTER TABLE Sensor MODIFY COLUMN diadasemana VARCHAR (30);

DESC Sensor;

ALTER TABLE Sensor RENAME COLUMN diadasemana TO DiaDaSemana;

SELECT * FROM Sensor;

ALTER TABLE Sensor DROP COLUMN DiaDaSemana;


SELECT dtLeitura, leituraTemp,
	CASE
    WHEN leituraTemp >= 50 THEN 'Temperatura crítica'
    WHEN leituraTemp <=30 THEN 'Temperatura normal'
	ELSE 'Temperatura elevada'
    END AS 'Status de Temperatura'
    FROM Sensor;
    
    
SELECT * FROM Sensor ORDER BY dtLeitura DESC;

SELECT * FROM Sensor ORDER BY dtleitura ASC;

SELECT * FROM Sensor
WHERE leituraUmi >=48;

SELECT * FROM Sensor
WHERE idSensor LIKE '14';

SELECT * FROM Sensor
WHERE idSensor NOT LIKE '10';

SELECT * FROM Sensor
WHERE idSensor != '6';






CREATE TABLE Usuario  (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(50) NOT NULL,
email VARCHAR(80) UNIQUE NOT NULL,
telefone VARCHAR(15),
cnpj CHAR (14) NOT NULL UNIQUE,
statusUsuario VARCHAR(30),
CONSTRAINT chkStatus 
	CHECK (statusUsuario IN ('ativo', 'desativado'))
);





CREATE TABLE Plano (
idPlano INT PRIMARY KEY AUTO_INCREMENT,
statusPlano VARCHAR(15),
CONSTRAINT chkStatusPlano
	CHECK (statusPlano IN ('pago', 'pendente', 'atrasado')),
    
tipoPlano VARCHAR(15),
CONSTRAINT chkTipoPlano
	CHECK (tipoPlano IN ('mensal', 'anual')),
    
dtAssinatura DATE,
valorPlano DECIMAL (7,2)
);






CREATE TABLE Galpoes(
idGalpao INT PRIMARY KEY AUTO_INCREMENT,
nomeGalpao VARCHAR(30),
qtdSensores INT,
tamanho FLOAT,
responsavel VARCHAR(50),
statusGalpao VARCHAR(30),
CONSTRAINT chkStatusGalpao
	CHECK (statusGalpao IN ('ativo', 'desativado'))
);







CREATE TABLE Plano (
idPlano INT PRIMARY KEY AUTO_INCREMENT,
statusPlano VARCHAR(15),
CONSTRAINT chkStatusPlano
	CHECK (statusPlano IN ('pago', 'pendente', 'atrasado')),
    
tipoPlano VARCHAR(15),
CONSTRAINT chkTipoPlano
	CHECK (tipoPlano IN ('mensal', 'anual')),
    
dtVencimento DATE,
valorPlano DECIMAL (7,2)
);






CREATE TABLE Pagamento (
idPagamento INT PRIMARY KEY AUTO_INCREMENT,
formaPagamento VARCHAR(30) NOT NULL,
CONSTRAINT chkFormaPagamento
	CHECK (formaPagamento IN ('boleto', 'credito', 'pix', 'transferencia')),
dtPagamento DATETIME
);
