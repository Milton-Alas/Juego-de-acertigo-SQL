# El Portal del Tiempo: En Búsqueda del Portal Ancestral

## Base de Datos
Este juego utiliza PostgreSQL como sistema de gestión de base de datos. El script incluye la creación de tablas e inserción de datos de prueba diseñados específicamente para PostgreSQL.

## Introducción
El año es 2024. Has sido contactado por la Dra. Elena Sánchez, una reconocida arqueóloga-matemática que ha dedicado su vida a estudiar las antiguas leyendas Incas sobre portales dimensionales. En tu escritorio encuentras su diario de investigación, lleno de notas cruciales para tu misión...

## Tu Misión
Como analista de datos ancestrales, deberás descifrar la base de datos que contiene la ubicación del portal. Cada consulta te acercará más a la verdad, pero necesitarás prestar atención a las pistas dejadas en el diario de la Dra. Sánchez.

## La Historia y Sus Pistas

### Capítulo 1: Los Primeros Indicios
*Del diario de la Dra. Sánchez:*
"Los registros son claros: las manifestaciones energéticas más potentes ocurren durante la luna nueva, no durante cualquier fase lunar. Específicamente, hemos observado que necesitamos una intensidad energética superior a 80 unidades. Los antiguos textos mencionan: 'Solo cuando la energía supera el umbral de 80 y la luna se oculta por completo, el velo entre mundos se hace más delgado.'"

**Pista Técnica:** 
- Buscar eventos con intensidad_energetica > 80
- Durante fase_lunar = 'Nueva'

### Capítulo 2: El Patrón Magnético
*Notas del Dr. Ruiz:*
"¡Fascinante! Los verdaderos portales tienen una característica única: generan campos magnéticos intensos pero son completamente imperceptibles para los observadores. En mis notas de campo: 'Un portal verdadero mostrará actividad magnética positiva (true) pero ningún testigo podrá verlo (testigos = 0).'"

**Pista Técnica:**
- Filtrar por actividad_magnetica = true
- Y testigos = 0

### Capítulo 3: Los Códigos Ancestrales
*Fragmento de pergamino traducido:*
"Entre los patrones sagrados, solo BETA y DELTA contienen la verdad. Los demás son señuelos dejados por los antiguos para confundir a los no iniciados."

**Pista Técnica:**
- Buscar en tabla Codigos donde patron = 'BETA' o patron = 'DELTA'

### Capítulo 4: La Precisión Sagrada
*Anotación en el margen del diario:*
"Confirmado: los portales solo aparecen en ubicaciones medidas con precisión 'Muy Alta'. Cualquier otra medición es insuficiente para la manifestación del portal."

**Pista Técnica:**
- Filtrar coordenadas donde precision_medicion = 'Muy Alta'

### Capítulo 5: Las Condiciones Perfectas
*Del libro de observaciones ambientales:*
"El portal requiere condiciones específicas:
- Temperatura por debajo de 16 grados
- Altitud superior a 2000 metros
'En el frío de las alturas, donde el aire es delgado, allí se abre la puerta.'"

**Pista Técnica:**
- Temperatura < 16
- Altitud > 2000

### Capítulo 6: El Tiempo Correcto
*Calendario ancestral traducido:*
"Las puertas solo se abren en días impares, durante las horas oscuras antes del amanecer (00:00 - 06:00). Los antiguos eran muy específicos sobre esto."

**Pista Técnica:**
- EXTRACT(DAY FROM fecha) % 2 != 0
- EXTRACT(HOUR FROM fecha) < 6

### Capítulo 7: La Secuencia Sagrada
*Nota cryptográfica:*
"La secuencia de validación siempre comienza con 'SEC4'. Es el código que marca los verdaderos portales. Todo lo demás es una falsa pista."

**Pista Técnica:**
- secuencia_validacion LIKE 'SEC4%'

### Capítulo 8: La Convergencia
*Últimas notas de la Dra. Sánchez:*
"Para encontrar el verdadero portal, debemos combinar todo:
1. Alta energía (>80) en luna nueva
2. Actividad magnética sin testigos
3. Patrón BETA
4. Precisión muy alta
5. Temperatura < 16°C y altitud > 2000m
6. Día impar, antes del amanecer
7. Secuencia SEC4
Solo un lugar cumple con todos estos criterios."

**Pista Técnica para la Consulta Final:**
Combinar todas las condiciones anteriores:
- intensidad_energetica > 80
- fase_lunar = 'Nueva'
- actividad_magnetica = true
- testigos = 0
- patron = 'BETA'
- precision_medicion = 'Muy Alta'
- temperatura < 16
- altitud > 2000
- EXTRACT(DAY FROM fecha) % 2 = 0
- EXTRACT(HOUR FROM fecha) < 6
- secuencia_validacion LIKE 'SEC4%'

## Epílogo
Al ejecutar la consulta final con todas las condiciones, descubrirás el único lugar que cumple con todos los criterios: el verdadero portal temporal.

### Notas para el Jugador
- Usa las pistas técnicas como guía para construir tus consultas SQL
- Cada capítulo agrega nuevas condiciones que deberás combinar al final
- Puedes probar las condiciones individualmente antes de combinarlas
- La solución final requerirá usar todas las pistas en una sola consulta

