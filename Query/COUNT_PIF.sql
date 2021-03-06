--CLIENTE
SELECT * FROM (
SELECT CL.RUT
from cliente.CLIENTE CL
INNER JOIN CLIENTE.REGISTROMODIFICACION RM ON (RM.FECHA>=TO_DATE('06/09/2005')AND (RM.FECHA<=TO_DATE('29/10/2015')) AND CL.RUT=RM.RUTCLIENTE )
GROUP BY CL.RUT) A;

--ACTIVIDADDEPENDIENTE
SELECT COUNT(*) FROM (
SELECT AD.RUTCLIENTE
FROM CLIENTE.ActividadDependiente AD
INNER JOIN CLIENTE.REGISTROMODIFICACION RM ON (RM.FECHA>=TO_DATE('06/09/2005')AND (RM.FECHA<=TO_DATE('29/10/2015'))AND AD.RUTCLIENTE=RM.RUTCLIENTE )
GROUP BY RM.RUTCLIENTE) A;

--ACTIVIDADINDEPENDIENTE
SELECT COUNT(*) FROM (
SELECT AI.RUTCLIENTE
FROM CLIENTE.ActividadINDependiente AI
INNER JOIN CLIENTE.REGISTROMODIFICACION RM ON (RM.FECHA>=TO_DATE('06/09/2005')AND RM.FECHA<=TO_DATE('29/10/2015') AND AI.RUTCLIENTE=RM.RUTCLIENTE )
order by RM.RUTCLIENTE) A;

--AFILIACIONEMAILING
SELECT COUNT(*) FROM(
SELECT RM.RUTCLIENTE
from CLIENTE.afiliacionemailing AF
INNER JOIN CLIENTE.REGISTROMODIFICACION RM ON (RM.FECHA>=TO_DATE('06/09/2005')AND RM.FECHA<=TO_DATE('29/10/2015')AND AF.RUT=RM.RUTCLIENTE )
GROUP BY RM.RUTCLIENTE) A;

--CONYUGE
SELECT COUNT(*) FROM (
SELECT RM.RUTCLIENTE
FROM cliente.conyuge cy
INNER JOIN CLIENTE.REGISTROMODIFICACION RM ON (RM.FECHA>=TO_DATE('06/09/2005')AND RM.FECHA<=TO_DATE('29/10/2015') AND cy.RUTCLIENTE=RM.RUTCLIENTE )
GROUP BY RM.RUTCLIENTE) A;

--CORREOELECTRONICO
SELECT COUNT(*) FROM (
SELECT RM.RUTCLIENTE
FROM CLIENTE.CORREOELECTRONICO CE
INNER JOIN CLIENTE.REGISTROMODIFICACION RM ON (RM.FECHA>=TO_DATE('06/09/2005')AND RM.FECHA<=TO_DATE('29/10/2015') AND CE.RUTCLIENTE=RM.RUTCLIENTE )
GROUP BY RM.RUTCLIENTE)A;
----------------------------------------
--DIRECCION
SELECT COUNT(*) FROM (
SELECT RM.RUTCLIENTE
from cliente.direccion CD
INNER JOIN CLIENTE.REGISTROMODIFICACION RM ON (RM.FECHA>=TO_DATE('06/09/2005')AND RM.FECHA<=TO_DATE('29/10/2015') AND CD.RUTCLIENTE=RM.RUTCLIENTE )
GROUP BY RM.RUTCLIENTE) A;

--IDENTIFICACIONCLIENTE
SELECT COUNT(*) FROM (
SELECT RM.RUTCLIENTE
 FROM CLIENTE.IDENTIFICACIONCLIENTE CL
INNER JOIN  CLIENTE.REGISTROMODIFICACION RM ON (RM.FECHA>=TO_DATE('06/09/2005') AND RM.FECHA<=TO_DATE('29/10/2015') AND CL.RUTCLIENTE=RM.RUTCLIENTE)
GROUP BY RM.RUTCLIENTE) A;

--SOL_ACTIVIDADDEPENDIENTE
SELECT COUNT(*) FROM (
SELECT SH.SOLICITUD
FROM EVALUACION.SOL_ACTIVIDADDEPENDIENTE SAD
INNER JOIN  EVALUACION.SOL_HISTORIA SH ON (SH.FECHAHORA>=TO_DATE('06/09/2005')AND SH.FECHAHORA<=TO_DATE('29/10/2015')AND SAD.SOLICITUD=SH.SOLICITUD)
GROUP BY SH.SOLICITUD) A;

--SOL_CLIENTE
SELECT COUNT(*) FROM (
SELECT EH.SOLICITUD
from EVALUACION.SOL_CLIENTE SC
INNER JOIN EVALUACION.SOL_HISTORIA EH ON (EH.FECHAHORA>=TO_DATE('06/09/2005')AND EH.FECHAHORA<=TO_DATE('29/10/2015') AND SC.SOLICITUD=EH.SOLICITUD )
GROUP BY EH.SOLICITUD) A;

--SOL_EVALUACION
SELECT COUNT(*) FROM (
SELECT SH.SOLICITUD
from EVALUACION.sol_evaluacion E
INNER JOIN  EVALUACION.SOL_HISTORIA SH ON (SH.FECHAHORA>=TO_DATE('06/09/2005')AND SH.FECHAHORA<=TO_DATE('29/10/2015') AND E.SOLICITUD=SH.SOLICITUD)
GROUP BY SH.SOLICITUD)A;

--SOL_FINANCIAMIENTOCMR
SELECT COUNT(*) FROM (
SELECT SH.SOLICITUD
FROM EVALUACION.SOL_FINANCIAMIENTOCMR F
INNER JOIN  EVALUACION.SOL_HISTORIA SH ON (SH.FECHAHORA>=TO_DATE('06/09/2005')AND SH.FECHAHORA<=TO_DATE('29/10/2015') AND F.SOLICITUD=SH.SOLICITUD)
GROUP BY SH.SOLICITUD) A;

--SOL_HISTORIA
SELECT COUNT(*) FROM (
SELECT SOLICITUD
FROM  EVALUACION.SOL_HISTORIA
WHERE FECHAHORA>=TO_DATE('06/09/2005') AND FECHAHORA<=TO_DATE('29/10/2015')
GROUP BY SOLICITUD) A ;

--SOL_IDENTIFICACIONCLIENTE
SELECT COUNT(*) FROM (
SELECT SH.SOLICITUD
FROM EVALUACION.SOL_IDENTIFICACIONCLIENTE SIC
INNER JOIN  EVALUACION.SOL_HISTORIA SH ON (SH.FECHAHORA>=TO_DATE('06/09/2005')AND SH.FECHAHORA<=TO_DATE('29/10/2015') AND SIC.SOLICITUD=SH.SOLICITUD)
GROUP BY SH.SOLICITUD) A;

--SOL_SITUACIONLABORAL
SELECT COUNT(*) FROM (
SELECT SH.SOLICITUD
FROM EVALUACION.SOL_SITUACIONLABORAL SL
INNER JOIN  EVALUACION.SOL_HISTORIA SH ON (SH.FECHAHORA>=TO_DATE('06/09/2005')AND SH.FECHAHORA<=TO_DATE('29/10/2015') AND SL.SOLICITUD=SH.SOLICITUD)
GROUP BY SH.SOLICITUD) A;

--SOL_SOLICITUD
SELECT COUNT(*) FROM (
SELECT SH.SOLICITUD
FROM EVALUACION.SOL_SOLICITUD SS
INNER JOIN  EVALUACION.SOL_HISTORIA SH ON (SH.FECHAHORA>=TO_DATE('06/09/2005')AND SH.FECHAHORA<=TO_DATE('29/10/2015') AND SS.NUMERO=SH.SOLICITUD)
GROUP BY SH.SOLICITUD) A;

--SOL_TARJETACREDITOBANCARIA
SELECT COUNT(*) FROM (
SELECT SH.SOLICITUD
from evaluacion.sol_tarjetacreditobancaria tcb
INNER JOIN  EVALUACION.SOL_HISTORIA SH ON (SH.FECHAHORA>=TO_DATE('06/09/2005')AND SH.FECHAHORA<=TO_DATE('29/10/2015') AND tcb.SOLICITUD=SH.SOLICITUD)
GROUP BY SH.SOLICITUD) A;

--TELEFONO
select count (*) from (
SELECT RM.RUTCLIENTE
FROM CLIENTE.TELEFONO TE
INNER JOIN CLIENTE.REGISTROMODIFICACION RM ON (RM.FECHA>=TO_DATE('06/09/2005')AND RM.FECHA<=TO_DATE('29/10/2015') AND TE.RUTCLIENTE=RM.RUTCLIENTE )
GROUP BY RM.RUTCLIENTE) A;

--VIVIENDA
SELECT COUNT(*) FROM (
SELECT RM.RUTCLIENTE
FROM CLIENTE.VIVIENDA VI
INNER JOIN CLIENTE.REGISTROMODIFICACION RM ON (RM.FECHA>=TO_DATE('06/09/2005')AND RM.FECHA<=TO_DATE('29/10/2015') AND VI.RUTCLIENTE=RM.RUTCLIENTE )
GROUP BY RM.RUTCLIENTE) A;