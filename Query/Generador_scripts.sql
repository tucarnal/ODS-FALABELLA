SELECT OWNER FROM ALL_TABLES
WHERE OWNER LIKE('%%');

SELECT distinct COUNT(TABLE_NAME) FROM ALL_TABLES
WHERE OWNER LIKE('STAGE');

SELECT OWNER,TABLE_NAME FROM ALL_TABLES
WHERE OWNER LIKE('STAGE') AND TABLE_NAME LIKE('STG_MPDT%');

--GEMERADOR DE SCRIPT PARA LOS OBJETOS DE SAT
SELECT CONCAT('SELECT * FROM',  OWNER||'.'||TABLE_NAME) FROM ALL_TABLES
WHERE OWNER LIKE('STAGE') AND TABLE_NAME LIKE('STG_MPDT%');

--GEMERADOR DE SCRIPT PARA LOS OBJETOS DE SFC
SELECT CONCAT('SELECT * FROM',  OWNER||'.'||TABLE_NAME) FROM ALL_TABLES
WHERE OWNER LIKE('STAGE') AND TABLE_NAME LIKE('STG_T75%');

--GEMERADOR DE SCRIPT PARA LOS OBJETOS DE AZCLEAR
SELECT CONCAT('SELECT * FROM ', OWNER||'.'||TABLE_NAME) FROM ALL_TABLES
WHERE OWNER LIKE('STAGE') AND TABLE_NAME LIKE('STG_AZ%');


--GENERADOR DE CONSULTA DE LAS TABLAS DE STG
SELECT CONCAT( 'SELECT '|| TABLE_NAME||' AS TABLA',', COUNT(*) AS CANTIDAD FROM '||OWNER||'.'||table_name||' UNION' ) FROM ALL_TABLES
WHERE OWNER LIKE('STAGE') ORDER BY (TABLE_NAME) ASC;


