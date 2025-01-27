-- Crear las tablas principales
CREATE TABLE Eventos (
    id INTEGER PRIMARY KEY,
    ubicacion VARCHAR(100),
    fecha TIMESTAMP,
    tipo VARCHAR(50),
    codigo VARCHAR(200),
    intensidad_energetica INTEGER,
    fase_lunar VARCHAR(20),
    temperatura DECIMAL(5,2),
    actividad_magnetica BOOLEAN,
    testigos INTEGER
);

CREATE TABLE Codigos (
    id INTEGER PRIMARY KEY,
    evento_id INTEGER,
    clave INTEGER,
    patron VARCHAR(50),
    secuencia_validacion VARCHAR(100),
    FOREIGN KEY (evento_id) REFERENCES Eventos(id)
);

CREATE TABLE Coordenadas (
    id INTEGER PRIMARY KEY,
    evento_id INTEGER,
    latitud DECIMAL(9,6),
    longitud DECIMAL(9,6),
    altitud INTEGER,
    precision_medicion VARCHAR(20),
    FOREIGN KEY (evento_id) REFERENCES Eventos(id)
);

-- Insertar datos de ejemplo
INSERT INTO Eventos VALUES
(1, 'Cusco', '2024-01-15 23:45:00', 'Fenómeno Natural', 'UBY45_XNVR78', 85, 'Llena', 12.5, true, 23),
(2, 'Machu Picchu', '2024-02-29 00:00:00', 'Portal', 'CRX89_AKTV12', 100, 'Nueva', 15.2, true, 0),
(3, 'Nazca', '2024-03-21 03:33:00', 'Conjunción', 'LMN33_QWER90', 65, 'Creciente', 18.7, false, 12),
(4, 'Sacsayhuamán', '2024-04-01 12:12:00', 'Portal', 'ZYX11_MNBV45', 95, 'Llena', 10.1, true, 5),
(5, 'Valle Sagrado', '2024-05-05 15:15:00', 'Fenómeno Natural', 'JKL77_ASDF23', 75, 'Menguante', 14.3, false, 8);
(6, 'Ollantaytambo', '2024-03-15 02:15:00', 'Portal', 'WER78_POIU90', 90, 'Nueva', 14.8, true, 3),
(7, 'Pisac', '2024-04-22 01:30:00', 'Fenómeno Natural', 'HJK56_LKJH34', 85, 'Llena', 15.5, false, 0),
(8, 'Moray', '2024-01-18 04:45:00', 'Portal', 'QAZ12_WSXC34', 95, 'Nueva', 13.2, true, 0),
(9, 'Chinchero', '2024-05-30 05:00:00', 'Conjunción', 'EDC45_RFVT67', 88, 'Nueva', 15.8, true, 0),
(10, 'Tipon', '2024-06-21 22:30:00', 'Portal', 'UJM78_NHYG56', 82, 'Nueva', 14.5, true, 0),
(11, 'Pikillacta', '2024-07-13 03:20:00', 'Fenómeno Natural', 'PLM90_OKIJ78', 87, 'Nueva', 15.9, false, 2),
(12, 'Raqchi', '2024-08-25 01:15:00', 'Portal', 'BVC23_XZAS45', 92, 'Nueva', 13.8, true, 0);

INSERT INTO Codigos VALUES
(1, 1, 3, 'ALFA', 'SEC123'),
(2, 2, 7, 'BETA', 'SEC456'),
(3, 3, 5, 'GAMMA', 'SEC789'),
(4, 4, 4, 'DELTA', 'SEC012'),
(5, 5, 6, 'EPSILON', 'SEC345');
(6, 6, 8, 'BETA', 'SEC789'),
(7, 7, 9, 'DELTA', 'SEC234'),
(8, 8, 2, 'BETA', 'SEC456'),
(9, 9, 1, 'ALFA', 'SEC890'),
(10, 10, 5, 'BETA', 'SEC567'),
(11, 11, 4, 'GAMMA', 'SEC123'),
(12, 12, 7, 'DELTA', 'SEC345');

INSERT INTO Coordenadas VALUES
(1, 1, -13.5319, -71.9675, 3400, 'Alta'),
(2, 2, -13.1631, -72.5450, 2430, 'Muy Alta'),
(3, 3, -14.7382, -75.1300, 520, 'Media'),
(4, 4, -13.5098, -71.9817, 3701, 'Muy Alta'),
(5, 5, -13.3265, -72.0864, 2792, 'Alta');
(6, 6, -13.2584, -72.2627, 2792, 'Alta'),
(7, 7, -13.4249, -71.8467, 2972, 'Media'),
(8, 8, -13.3287, -72.1873, 3500, 'Muy Alta'),
(9, 9, -13.3925, -72.0471, 3762, 'Alta'),
(10, 10, -13.5634, -71.7148, 3560, 'Muy Alta'),
(11, 11, -13.6155, -71.7147, 3250, 'Media'),
(12, 12, -14.1017, -71.4175, 3480, 'Muy Alta');


