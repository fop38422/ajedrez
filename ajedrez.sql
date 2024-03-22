CREATE TABLE PAISES (
    numero INT,
    nombre VARCHAR(45),
    numClubes INT,
    PRIMARY KEY (numero)
);
CREATE TABLE PARTICIPANTES (
    numAsociado INT,
    nombre VARCHAR(45),
    direccion VARCHAR(45),
    telefono INT,
    campeonatosJugador INT,
    campeonatosArbitro INT,
    numPais INT,
    PRIMARY KEY (numAsociado),
    FOREIGN KEY (numPais) REFERENCES PAISES(numero)
);
CREATE TABLE JUGADORES (
    
);