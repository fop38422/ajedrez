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
    numAsociado INT,
    nivel INT,
    PRIMARY KEY (numAsociado),
    FOREIGN KEY (numAsociado) REFERENCES PARTICIPANTES(numAsociado)
);
CREATE TABLE ARBITROS (
    numAsociado INT,
    PRIMARY KEY (numAsociado),
    FOREIGN KEY (numAsociado) REFERENCES PARTICIPANTES(numAsociado)
);
CREATE TABLE HOTELES (
    nombre VARCHAR(45),
    direccion VARCHAR(45),
    telefono INT,
    PRIMARY KEY (nombre)
);
CREATE TABLE ALOJAR (
    nombreHotel VARCHAR(45),
    numAsociado INT,
    fecha DATE,
    PRIMARY KEY (nombreHotel, numAsociado, fecha),
    FOREIGN KEY (numAsociado) REFERENCES PARTICIPANTES(numAsociado),
    FOREIGN KEY (nombreHotel) REFERENCES HOTELES(nombre)
);
CREATE TABLE SALAS (
    nombreHotel VARCHAR(45),
    nombreSala VARCHAR(45),
    capacidad INT,
    PRIMARY KEY (nombreHotel, nombreSala),
    FOREIGN KEY (nombreHotel) REFERENCES HOTELES(nombre)
);
CREATE TABLE MEDIOS (
    codigo INT,
    descripcion VARCHAR(45),
    PRIMARY KEY (codigo)
);
CREATE TABLE EQUIPAR (
    nombreHotel VARCHAR(45),
    nombreSala VARCHAR(45),
    codigoMedio INT,
    PRIMARY KEY (nombreHotel, nombreSala, codigoMedio),
    FOREIGN KEY (codigoMedio) REFERENCES MEDIOS(codigo),
    FOREIGN KEY (nombreSala) REFERENCES SALAS(nombreSala),
    FOREIGN KEY (nombreHotel) REFERENCES SALAS(nombreHotel)
);
CREATE TABLE PARTIDAS (
    numero INT,
    fecha DATE,
    blancas INT,
    negras INT,
    arbitro INT,
    nombreHotel VARCHAR(45),
    nombreSala VARCHAR(45),
    entradas INT,
    PRIMARY KEY (numero),
    FOREIGN KEY (arbitro) REFERENCES ARBITROS(numAsociado),
    FOREIGN KEY (blancas) REFERENCES JUGADORES(numAsociado),
    FOREIGN KEY (negras) REFERENCES JUGADORES(numAsociado),
    FOREIGN KEY (nombreSala) REFERENCES SALAS(nombreSala),
    FOREIGN KEY (nombreHotel) REFERENCES SALAS(nombreHotel)
);
CREATE TABLE MOVIMIENTOS (
    numPartida INT,
    numMovimiento INT,
    jugada VARCHAR(45),
    comentario LONGTEXT,
    PRIMARY KEY (numPartida, numMovimiento),
    FOREIGN KEY (numPartida) REFERENCES PARTIDAS(numero)
);

INSERT INTO PAISES (numero, nombre, numClubes) VALUES
(1, 'España', 200),
(2, 'Alemania', 150),
(3, 'Francia', 180),
(4, 'Italia', 160),
(5, 'Inglaterra', 190);

INSERT INTO PARTICIPANTES (numAsociado, nombre, direccion, telefono, campeonatosJugador, campeonatosArbitro, numPais) VALUES
(1, 'Jugador1', 'Calle 123', 123456789, 2, 0, 1),
(2, 'Jugador2', 'Avenida XYZ', 987654321, 1, 0, 2),
(3, 'Arbitro1', 'Calle Principal', 555123456, 0, 3, 3),
(4, 'Arbitro2', 'Plaza Mayor', 666987654, 0, 2, 4),
(5, 'Jugador3', 'Calle Secundaria', 777555444, 3, 0, 5);

INSERT INTO JUGADORES (numAsociado, nivel) VALUES
(1, 5),
(2, 4),
(5, 6);

INSERT INTO ARBITROS (numAsociado) VALUES
(3),
(4);

INSERT INTO HOTELES (nombre, direccion, telefono) VALUES
('Hotel A', 'Avenida Principal', 111222333),
('Hotel B', 'Calle Secundaria', 444555666),
('Hotel C', 'Plaza Central', 777888999);

INSERT INTO ALOJAR (nombreHotel, numAsociado, fecha) VALUES
('Hotel A', 1, '2024-04-10'),
('Hotel B', 2, '2024-04-11'),
('Hotel C', 3, '2024-04-10'),
('Hotel A', 4, '2024-04-12'),
('Hotel B', 5, '2024-04-13');

INSERT INTO SALAS (nombreHotel, nombreSala, capacidad) VALUES
('Hotel A', 'Sala 1', 50),
('Hotel A', 'Sala 2', 30),
('Hotel B', 'Sala 1', 40),
('Hotel C', 'Sala 1', 60),
('Hotel C', 'Sala 2', 20);

INSERT INTO MEDIOS (codigo, descripcion) VALUES
(1, 'TV'),
(2, 'Radio'),
(3, 'Internet');

INSERT INTO EQUIPAR (nombreHotel, nombreSala, codigoMedio) VALUES
('Hotel A', 'Sala 1', 1),
('Hotel B', 'Sala 1', 2),
('Hotel C', 'Sala 1', 3),
('Hotel C', 'Sala 2', 1);

INSERT INTO PARTIDAS (numero, fecha, blancas, negras, arbitro, nombreHotel, nombreSala, entradas) VALUES
(1, '2024-04-10', 1, 2, 3, 'Hotel A', 'Sala 1', 100),
(2, '2024-04-11', 5, 4, 4, 'Hotel B', 'Sala 1', 120),
(3, '2024-04-12', 2, 3, 3, 'Hotel C', 'Sala 1', 80),
(4, '2024-04-13', 1, 5, 4, 'Hotel C', 'Sala 2', 90);

INSERT INTO MOVIMIENTOS (numPartida, numMovimiento, jugada, comentario) VALUES
(1, 1, '1. e4', 'Apertura española'),
(1, 2, '1... c5', 'Defensa Siciliana'),
(2, 1, '1. d4', 'Apertura de peón de dama'),
(2, 2, '1... d5', 'Defensa Escandinava'),
(3, 1, '1. e4', 'Apertura española'),
(3, 2, '1... e5', 'Defensa del peón de rey'),
(4, 1, '1. c4', 'Apertura Inglesa'),
(4, 2, '1... e5', 'Defensa doble del peón de rey');