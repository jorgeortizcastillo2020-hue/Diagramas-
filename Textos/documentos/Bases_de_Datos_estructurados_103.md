# 3. Consultas avanzadas sobre una o más tablas

## 3.1 Funciones de una sola fila

Las funciones de una sola fila en SQL, también conocidas como funciones escalares, son herramientas fundamentales para la manipulación de datos. Operan sobre un valor único de una fila y devuelven un solo resultado por cada fila.

### ¿Qué son las funciones de una sola fila?

Son funciones que aceptan uno o más argumentos de una sola fila de una tabla y retornan un único valor para esa misma fila. A diferencia de las funciones de agregado como `COUNT()` o `SUM()`, que operan sobre un conjunto de filas para dar un único resultado, las funciones de una sola fila actúan sobre cada fila individualmente.

### Tipos de funciones de una sola fila

Se agrupan en varias categorías según el tipo de dato que manipulan:

- **Funciones de cadena (string):** manipulan texto.
- **Funciones numéricas:** realizan operaciones matemáticas.
- **Funciones de fecha y hora:** trabajan con datos de tipo fecha y hora.
- **Funciones de conversión:** convierten un tipo de dato a otro.
- **Funciones generales:** trabajan con valores nulos y condiciones (`IFNULL`, `NULLIF`, `COALESCE`, `IF`, `CASE`).

### ¿Dónde se usan?

- En la cláusula `SELECT` (para transformar lo que se muestra).
- En la cláusula `WHERE` (para filtrar usando valores transformados).
- En `ORDER BY` (para ordenar según un valor calculado).
- En `GROUP BY` (para agrupar según un valor calculado, por ejemplo `YEAR(fecha)`).
- También en `HAVING`, `JOIN`, `INSERT` y `UPDATE`.

### ¿Cuándo, por qué y para qué?

**Cuándo:** cuando se necesita transformar, formatear o calcular valores para cada fila de un conjunto de resultados.

**Por qué:** porque permiten una manipulación de datos eficiente y directa en la base de datos, evitando la necesidad de procesar los datos en una aplicación externa.

**Para qué:**

- **Limpieza de datos:** quitar espacios sobrantes, unificar mayúsculas/minúsculas, reemplazar valores nulos.
- **Cálculos:** redondear, calcular diferencias de fechas, obtener restos o potencias.
- **Formateo de salida:** unir nombre y apellido, mostrar fechas o números de cierta forma.
- **Filtrado de datos:** buscar sin importar mayúsculas (`WHERE LOWER(nombre) = 'ana'`) o filtrar por año (`WHERE YEAR(fecha) = 2025`).

---

### Funciones de cadena

| Función | Descripción | Ejemplo | Resultado |
|---|---|---|---|
| `CONCAT` | Concatena dos o más cadenas | `SELECT CONCAT('Hola', ' ', 'Mundo');` | `Hola Mundo` |
| `UPPER` | Convierte una cadena a mayúsculas | `SELECT UPPER('hola');` | `HOLA` |
| `LOWER` | Convierte una cadena a minúsculas | `SELECT LOWER('HOLA');` | `hola` |
| `SUBSTRING` | Extrae una subcadena (texto, posición inicial, largo) | `SELECT SUBSTRING('Hola Mundo', 6, 5);` | `Mundo` |
| `LENGTH` | Devuelve la longitud de una cadena | `SELECT LENGTH('Hola');` | `4` |
| `TRIM` | Elimina espacios al inicio y al final | `SELECT TRIM('  Hola  ');` | `Hola` |

> Nota: en MySQL `LENGTH` cuenta bytes; para contar caracteres se usa `CHAR_LENGTH`. Con letras sin tilde da lo mismo.

### Funciones numéricas

| Función | Descripción | Ejemplo | Resultado |
|---|---|---|---|
| `ABS` | Devuelve el valor absoluto | `SELECT ABS(-25);` | `25` |
| `ROUND` | Redondea un número | `SELECT ROUND(15.678, 2);` | `15.68` |
| `CEIL` | Redondea hacia arriba al entero más cercano | `SELECT CEIL(12.34);` | `13` |
| `FLOOR` | Redondea hacia abajo al entero más cercano | `SELECT FLOOR(12.98);` | `12` |
| `MOD` | Devuelve el resto de una división | `SELECT MOD(10, 3);` | `1` |
| `POWER` | Eleva un número a una potencia | `SELECT POWER(2, 3);` | `8` |

### Funciones de fecha y hora

| Función | Descripción | Ejemplo | Resultado |
|---|---|---|---|
| `NOW` | Devuelve la fecha y la hora actual | `SELECT NOW();` | `2026-10-22 12:10:00` |
| `CURDATE` | Devuelve la fecha actual | `SELECT CURDATE();` | `2026-10-22` |
| `YEAR` | Extrae el año de una fecha | `SELECT YEAR('2025-10-22');` | `2025` |
| `MONTH` | Extrae el mes de una fecha | `SELECT MONTH('2025-10-22');` | `10` |
| `DAY` | Extrae el día de una fecha | `SELECT DAY('2025-10-22');` | `22` |
| `DATEDIFF` | Calcula la diferencia en días entre dos fechas (fecha1 − fecha2) | `SELECT DATEDIFF('2026-05-21', '2025-02-04');` | `471` |

> Ojo: `DATEDIFF(a, b)` hace `a - b`. En tu ejemplo original (`'2025-02-04', '2026-05-21'`) el resultado sale **negativo** (-471), porque la primera fecha es la más antigua.
> MySQL entrega las fechas como `AAAA-MM-DD`; el formato `22-10-2025` se obtiene con `DATE_FORMAT(fecha, '%d-%m-%Y')`.

### Funciones de conversión

| Función | Descripción | Ejemplo | Resultado |
|---|---|---|---|
| `CAST` | Convierte texto a número | `SELECT CAST('123' AS UNSIGNED);` | `123` (como número) |
| `CAST` | Convierte un número a cadena | `SELECT CAST(123 AS CHAR);` | `'123'` (como texto) |

---

## 3.2 Funciones de conversión y expresiones condicionales

### 3.2.1 Funciones de conversión

#### ¿Qué son las funciones de conversión?

Son herramientas de SQL que permiten transformar datos de un tipo a otro. Permiten convertir números a texto, texto a números, fechas a cadenas y muchas otras combinaciones necesarias para el manejo eficiente de datos.

#### Elementos de las funciones de conversión

Típicamente contienen:

- **Nombre de la función:** identifica la función (`CAST`).
- **Expresión o valor:** el dato que será convertido.
- **Tipo de destino:** el tipo de dato al que se quiere convertir.
- **Parámetros opcionales:** como charset, longitud, precisión.

#### ¿Cómo se usa?

```sql
CAST(expresion AS tipo_dato)
```

Ejemplos:

```sql
SELECT CAST('2025-10-22' AS DATE);       -- texto a fecha
SELECT CAST('15.678' AS DECIMAL(10,2));  -- texto a decimal: 15.68
SELECT CAST(2026 AS CHAR);               -- número a texto
```

#### Tipos de datos más comunes para conversión

- `CHAR` / `VARCHAR`: cadenas de texto.
- `DATE` / `DATETIME` / `TIME`: fechas y horas.
- `DECIMAL`: números decimales.
- `SIGNED` / `UNSIGNED`: entero con o sin signo.

**SIGNED o UNSIGNED:** la diferencia principal es que `SIGNED` permite números positivos, negativos y cero, mientras que `UNSIGNED` solo permite números positivos y cero. `UNSIGNED` duplica el rango de valores positivos posibles para un tipo de dato, ya que no reserva el bit de signo y lo usa para el valor en sí.

#### ¿Cuándo se usan?

- Cuando los tipos de datos no coinciden en comparaciones.
- Al realizar operaciones matemáticas con datos almacenados como texto.
- Al formatear salidas de consultas.
- Al importar/exportar datos entre diferentes sistemas.

#### ¿Dónde se usan?

- En cláusulas `SELECT`: para dar formato a los resultados.
- En cláusulas `WHERE`: para comparaciones correctas.
- En `JOIN`: para unir tablas con tipos diferentes.
- En `ORDER BY`: para un ordenamiento correcto (por ejemplo, números guardados como texto: sin conversión `'10'` queda antes que `'9'`).
- En `INSERT` / `UPDATE`: para asegurar tipos correctos.

---

### 3.2.2 Expresiones condicionales

#### ¿Qué son las expresiones condicionales en SQL?

Son sentencias que permiten evaluar condiciones y retornar diferentes valores según el resultado de estas evaluaciones. Funcionan como una estructura del tipo "Si-entonces-Sino" dentro de una consulta SQL.

SQL ofrece varias expresiones condicionales:

- `IF()`
- `CASE`
- `IFNULL()`
- `NULLIF()`
- `COALESCE()`

#### IF()

Sintaxis:

```sql
IF(condicion, valor_si_es_verdadero, valor_si_es_falso)
```

Ejemplo:

```sql
SELECT nombre, IF(nota >= 4.0, 'Aprobado', 'Reprobado') AS estado
FROM alumnos;
```

#### CASE

Tiene dos formas:

- **Simple:** compara una expresión con valores específicos.
- **Buscada:** evalúa múltiples condiciones booleanas.

Sintaxis (buscada):

```sql
CASE
    WHEN condicion1 THEN resultado1
    WHEN condicion2 THEN resultado2
    ELSE resultado_por_defecto
END
```

Ejemplo (buscada):

```sql
SELECT nombre,
       CASE
           WHEN nota >= 6.0 THEN 'Excelente'
           WHEN nota >= 4.0 THEN 'Aprobado'
           ELSE 'Reprobado'
       END AS categoria
FROM alumnos;
```

Sintaxis (simple):

```sql
CASE expresion
    WHEN valor1 THEN resultado1
    WHEN valor2 THEN resultado2
    ELSE resultado_por_defecto
END
```

Ejemplo (simple):

```sql
SELECT nombre,
       CASE sexo
           WHEN 'M' THEN 'Masculino'
           WHEN 'F' THEN 'Femenino'
           ELSE 'Otro'
       END AS genero
FROM personas;
```

> Si ninguna condición se cumple y no hay `ELSE`, el resultado es `NULL`.

#### IFNULL()

Devuelve un valor alternativo si la expresión es `NULL`.

Sintaxis:

```sql
IFNULL(expresion, valor_si_es_null)
```

Ejemplo:

```sql
SELECT nombre, IFNULL(telefono, 'Sin teléfono') AS telefono
FROM clientes;
```

#### NULLIF()

Devuelve `NULL` si las dos expresiones son iguales; si no, devuelve la primera. Sirve, por ejemplo, para evitar divisiones por cero.

Sintaxis:

```sql
NULLIF(expresion1, expresion2)
```

Ejemplo:

```sql
SELECT total / NULLIF(cantidad, 0) AS precio_unitario
FROM ventas;   -- si cantidad = 0, devuelve NULL en vez de error
```

#### COALESCE()

Devuelve el primer valor que **no** sea `NULL` de una lista de expresiones.

Sintaxis:

```sql
COALESCE(expresion1, expresion2, ..., expresionN)
```

Ejemplo:

```sql
SELECT nombre, COALESCE(celular, telefono_fijo, 'Sin contacto') AS contacto
FROM clientes;
```

#### Diferencia entre IFNULL y COALESCE

- `IFNULL` recibe solo 2 argumentos (es propia de MySQL).
- `COALESCE` recibe una lista de argumentos y es estándar en casi todos los motores SQL.

---

### Resumen rápido

| Función | Para qué sirve |
|---|---|
| `IF(c, a, b)` | Si se cumple `c` devuelve `a`, si no `b` |
| `CASE` | Varias condiciones (Si-entonces-Sino múltiple) |
| `IFNULL(x, y)` | Reemplaza `NULL` por `y` |
| `NULLIF(x, y)` | Devuelve `NULL` si `x = y` |
| `COALESCE(a, b, c...)` | Primer valor no nulo de la lista |
| `CAST(x AS tipo)` | Convierte `x` a otro tipo de dato |
