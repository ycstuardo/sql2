-- 1 cuantos registros hay?
SELECT COUNT(*) FROM inscritos;
-- resultado:16

-- 2 cuantos inscritos hay en total?
SELECT SUM(cantidad) FROM inscritos;
-- resultado:774

-- 3 cual o cuales son los registros de mayor antiguedad?
SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos);
-- resultado: 44 2021-01-01 Blog, 56 2021-01-01 Página

--4 cuantos inscritos hay por dia ?
SELECT SUM(cantidad), fecha FROM inscritos GROUP BY fecha;
-- resultado:
-- 22-01-01 100,
-- 22-01-02 120, 
-- 22-01-03 103,
-- 22-01-04 93,
-- 22-01-05 88, 
-- 22-01-06 30,
-- 22-01-07 58,
-- 22-01-08 182

--5 cuantos inscritos hay por fuente?
SELECT SUM(cantidad),fuente FROM inscritos GROUP BY fuente;
-- resultado:Blog 333, Página 441

--6 que dia se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT fecha, SUM (cantidad) FROM inscritos GROUP BY fecha ORDER BY  MAX (cantidad) DESC  LIMIT  1 ;
-- resultado: 2021-08-01 182

--7 Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?
SELECT SUM(cantidad) AS suma, fecha, fuente FROM inscritos WHERE fuente = 'Blog' GROUP BY fuente, fecha ORDER BY suma DESC LIMIT 1;
-- resultado:83 2021-08-01 Blog,

--8 Cuántas personas en promedio se inscriben en un día?
SELECT AVG(cantidad) FROM (SELECT fecha, sum(cantidad) AS cantidad FROM inscritos GROUP BY fecha) AS tabla;
-- resultado:96.75

--9 Qué días se inscribieron más de 50 personas?
SELECT fecha, SUM(cantidad)  FROM inscritos GROUP BY fecha HAVING SUM(cantidad) > 50;
-- resultado:
-- 2021-02-01 120, 
-- 2021-08-01 182, 
-- 2021-05-01 88, 
-- 2021-04-01 93,
-- 2021-07-01 58,
-- 2021-03-01 103,
-- 2021-01-01 100

--10 cuántas personas se registraron en promedio cada día a partir del tercer día?
SELECT AVG(inscritos_por_dia) AS promedio FROM (SELECT fecha, SUM(cantidad) AS inscritos_por_dia FROM inscritos WHERE fecha >= '01/03/2021' GROUP BY fecha) as tab;
-- resultado:92.333333333


1.- 16
2.- 774
3.- 44 2021-01-01 Blog, 56 2021-01-01 Página
4.- 22-01-01 100, 22-01-02 120, 22-01-03 103, 22-01-04 93, 22-01-05 88, 22-01-06 30, 22-01-07 58, 22-01-08 182
5.- Blog 333, Página 441
6.- 2021-08-01 182
7.- 83 2021-08-01 Blog,
8.- 96.75
9.- 2021-02-01 120, 2021-08-01 182, 2021-05-01 88, 2021-04-01 93, 2021-07-01 58, 2021-03-01 103, 2021-01-01 100
10.- 92.33

