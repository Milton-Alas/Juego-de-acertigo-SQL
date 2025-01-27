-- Consultas del acertijo (cada una revela una pista)

-- Consulta 1: Encuentra eventos con alta energía durante luna llena
-- Pista: Los portales solo se activan con alta energía (>80) durante luna llena
SELECT id, ubicacion, intensidad_energetica, fase_lunar
FROM Eventos
WHERE intensidad_energetica > 80 
AND fase_lunar = 'Llena';

-- Consulta 2: Identifica lugares con actividad magnética y sin testigos
-- Pista: Los verdaderos portales tienen actividad magnética pero no testigos
SELECT id, ubicacion, actividad_magnetica, testigos
FROM Eventos
WHERE actividad_magnetica = true 
AND testigos = 0;

-- Consulta 3: Analiza patrones de código específicos
-- Pista: Solo los códigos con patrón BETA o DELTA son válidos
SELECT e.id, e.ubicacion, e.codigo, c.patron
FROM Eventos e
JOIN Codigos c ON e.id = c.evento_id
WHERE c.patron IN ('BETA', 'DELTA');

-- Consulta 4: Verifica coordenadas de alta precisión
-- Pista: El portal real debe tener precisión "Muy Alta"
SELECT e.id, e.ubicacion, c.precision_medicion, c.altitud
FROM Eventos e
JOIN Coordenadas c ON e.id = c.evento_id
WHERE c.precision_medicion = 'Muy Alta';

-- Consulta 5: Combina condiciones de temperatura y altitud
-- Pista: El portal se abre en lugares fríos (temp < 16) y altos (alt > 2000)
SELECT e.id, e.ubicacion, e.temperatura, c.altitud
FROM Eventos e
JOIN Coordenadas c ON e.id = c.evento_id
WHERE e.temperatura < 16 
AND c.altitud > 2000;

-- Consulta 6: Analiza fechas específicas
-- Pista: El portal solo se abre en fechas con día par después de medianoche
SELECT id, ubicacion, fecha
FROM Eventos
WHERE EXTRACT(DAY FROM fecha) % 2 = 0
AND EXTRACT(HOUR FROM fecha) < 6;

-- Consulta 7: Verifica la secuencia de validación
-- Pista: La secuencia debe empezar con "SEC4"
SELECT e.id, e.ubicacion, c.secuencia_validacion
FROM Eventos e
JOIN Codigos c ON e.id = c.evento_id
WHERE c.secuencia_validacion LIKE 'SEC4%';

-- Consulta 8: Combina múltiples condiciones
SELECT e.id, e.ubicacion, e.fecha
FROM Eventos e
JOIN Codigos c ON e.id = c.evento_id
JOIN Coordenadas co ON e.id = co.evento_id
WHERE e.intensidad_energetica > 80
AND e.fase_lunar = 'Nueva'
AND e.actividad_magnetica = true
AND e.testigos = 0
AND c.patron = 'BETA'
AND co.precision_medicion = 'Muy Alta'
AND e.temperatura < 16;

-- Consulta Final: Revela el verdadero portal
-- Esta consulta combina todas las pistas anteriores
SELECT 
    e.ubicacion as "Ubicación del Portal",
    e.fecha as "Momento de Apertura",
    co.latitud as "Latitud",
    co.longitud as "Longitud",
    co.altitud as "Altitud",
    e.codigo as "Código de Activación"
FROM Eventos e
JOIN Codigos c ON e.id = c.evento_id
JOIN Coordenadas co ON e.id = co.evento_id
WHERE e.intensidad_energetica > 80
AND e.fase_lunar = 'Nueva'
AND e.actividad_magnetica = true
AND e.testigos = 0
AND c.patron = 'BETA'
AND co.precision_medicion = 'Muy Alta'
AND e.temperatura < 16
AND EXTRACT(DAY FROM fecha) % 2 = 0
AND c.secuencia_validacion LIKE 'SEC4%';
