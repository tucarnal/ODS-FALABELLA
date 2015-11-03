--AUTORIZACION
SELECT 'MPDT004_Autorizacion' AS TABLA,M004.* FROM STAGE.STG_MPDT004 M004
WHERE (SIAIDCD IS NULL
    OR TIPOMSGON IS NULL OR CODPROON IS NULL OR MODENTDAT IS NULL OR SESIONORI IS NULL OR SESIONSIA IS NULL OR IMPTASAS IS NULL
    OR IDADQUIR IS NULL OR CODRED IS NULL OR NUMREFOPE IS NULL OR IDTERM IS NULL OR NOMCOM IS NULL OR LOCALIDAD IS NULL OR RTSITD IS NULL
    OR DATORI IS NULL OR NUMAUT IS NULL OR CODRESPU IS NULL OR CODACCRED IS NULL OR INDPREAUT IS NULL OR INDCRUCE IS NULL OR INDANUL IS NULL
    OR INDRETSAL IS NULL OR IMPTRNCON IS NULL OR IMPAUTCON IS NULL OR CLAMONCON IS NULL OR FECCONTA IS NULL OR NUMRETSAL IS NULL OR IMPRETSAL IS NULL
    OR CLAMONRET IS NULL OR IMPPROP IS NULL OR ACCEMICRE IS NULL OR ACCEMIDEB IS NULL OR ACCMERCH IS NULL OR INDPROINC IS NULL OR FECCADTAR IS NULL
    OR CALFRAUDE IS NULL OR NUMPASIVO IS NULL OR CODBLQFRA IS NULL OR TIPOLIM IS NULL OR FORPAGO IS NULL OR RESOLUTOR IS NULL OR COMISION IS NULL OR IMPUESTO IS NULL );

--CONTRATOCUENTATARJETA
SELECT 'MPDT007_ContratoCuentaTarjeta' AS TABLA,M007.* FROM STAGE.STG_MPDT007 M007
WHERE 
    (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR PRODUCTO||SUBPRODU NOT IN (SELECT COD_PRODUCTO||COD_SUBPRODUCTO FROM ODS_TARJETACREDITO.PRODUCTO)
	OR FECALTA IS NULL OR PRODUCTO IS NULL OR SUBPRODU IS NULL OR CONPROD IS NULL OR FORPAGO IS NULL OR FECULTCAR IS NULL
    OR FECBAJA IS NULL OR FORPAGOTEM IS NULL OR FIFORPAGT IS NULL OR FFFORPAGT IS NULL OR FECULTESTCTA IS NULL OR INDBLQOPE IS NULL
    OR INDBLQCON IS NULL OR INDCTAEMP IS NULL OR INDNOMEMP IS NULL OR NOMBREEMP IS NULL OR INDSITCTA IS NULL OR FECRESOL IS NULL
    OR CODPROLIQ IS NULL OR GRUPOLIQ IS NULL OR CODPROCUO IS NULL OR GRUPOCUO IS NULL OR RESEMIEXT IS NULL OR NUMULTPLAS IS NULL
    OR CODPROMO IS NULL OR INDPERCUO IS NULL OR NUMMESTOT IS NULL OR CODREGIMEN IS NULL OR NUMFACSC IS NULL OR NUMULTMOVD IS NULL
    OR NUMBEN IS NULL OR OFIGESTORA IS NULL OR INDDOMCARCRE IS NULL OR FECULTCGLIQ IS NULL OR TRASALACR IS NULL );

--TARJETACREDITO
SELECT 'MPDT009_TarjetaCredito' AS TABLA,M009.* FROM STAGE.STG_MPDT009 M009
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
    OR CODMAR NOT IN (SELECT COD_SATMARCATARJETA FROM ODS_MAESTRAS.MARCATARJETA)
    OR INDTIPT NOT IN (SELECT COD_SATTIPOTARJETA FROM ODS_MAESTRAS.TIPOTARJETA)
    OR NUMPLASTICO IS NULL OR PANANT IS NULL OR FECALTA IS NULL OR FECULTUSO IS NULL OR INDSITTAR IS NULL OR INDULTTAR IS NULL OR INDNOREN IS NULL
    OR FECULTBLQ IS NULL OR TEXBLQ IS NULL OR FECBAJA IS NULL OR FECCADTAR__AAAAMM IS NULL OR FECCADTARANT__AAAAMM IS NULL OR FECCOBCUO__AAAAMM IS NULL 
	OR OFFSET1 IS NULL OR OFFSET2 IS NULL OR PVV1 IS NULL OR PVV2 IS NULL OR CODCLVANT IS NULL );

--EXTRACTOCREDITO
SELECT 'MPDT011_ExtractoCredito' AS TABLA,M011.* FROM STAGE.STG_MPDT011 M011
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
    OR CLAMON NOT IN (SELECT COD_SATMONEDA FROM ODS_MAESTRAS.MONEDA)
    OR INDREP IS NULL OR INDSITEXT IS NULL OR IMPEXCLIM IS NULL OR IMPCOMIEXC IS NULL OR IMPCARGO IS NULL OR FECULTMOV IS NULL OR NUMULTMOV IS NULL
    OR FECEXT IS NULL OR FECLIQ IS NULL OR FECCAR IS NULL OR FECVALCAR IS NULL OR FORPAGO IS NULL OR PORINT IS NULL );

--MOVIMIENTO EXTRACTO CREDITO
SELECT 'MPDT012_MovimientoExtractoCredito' AS TABLA,M012.* FROM STAGE.STG_MPDT012 M012
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
	OR CENTALTA||CUENTA||NUMEXTCTA NOT IN (SELECT CT.COD_CENTROALTATARJETA||COD_CUENTATARJETA||EX.COD_EXTRACTOCREDITO FROM ODS_TARJETACREDITO.EXTRACTOCREDITO EX
                                           INNER JOIN ODS_TARJETACREDITO.CONTRATOCUENTATARJETA CT ON EX.ID_CUENTATARJETA=CT.ID_CUENTATARJETA)
	OR CLAMON NOT IN (SELECT COD_SATMONEDA FROM ODS_MAESTRAS.MONEDA)
	OR TIPOFAC IS NULL );

--BENEFICIARIOCUENTATARJETA
SELECT 'MPDT013_BeneficiarioCuentaTarjeta' AS TABLA,M013.* FROM STAGE.STG_MPDT013 M013
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
    OR IDENTCLI NOT IN (SELECT COD_CLIENTE FROM ODS_PERSONA.CLIENTE)
	OR FECALTA IS NULL OR FECBAJA IS NULL OR CODMAR IS NULL OR INDTIPT IS NULL );

--HISTORICO MODIFICACION
SELECT 'MPDT068_HistoricoModificacion' AS TABLA,M068.* FROM STAGE.STG_MPDT068 M068
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
	OR FECHAMOD IS NULL OR HORAMOD IS NULL OR TIPACCES IS NULL OR PROCESO IS NULL OR DESPROCESO IS NULL OR DATOMOD IS NULL OR MOTIVO IS NULL OR CANALMOD IS NULL );

--RECIBO
SELECT 'MPDT072_Recibo' AS TABLA,M072.* FROM STAGE.STG_MPDT072 M072
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA )
    OR CENTALTA||CUENTA||NUMEXTCTA NOT IN (SELECT CT.COD_CENTROALTATARJETA||COD_CUENTATARJETA||EX.COD_EXTRACTOCREDITO FROM ODS_TARJETACREDITO.EXTRACTOCREDITO EX
                                           INNER JOIN ODS_TARJETACREDITO.CONTRATOCUENTATARJETA CT ON EX.ID_CUENTATARJETA=CT.ID_CUENTATARJETA)
	OR NUMSECREC IS NULL OR NUMREFREM IS NULL OR ORIGEN IS NULL OR SITUAREC IS NULL OR INDRETENCION IS NULL OR DESCRECH IS NULL OR INDSOLRECH IS NULL
	OR FECRECHPAS IS NULL OR FECSOLRECH IS NULL OR CLAMON IS NULL );

--RECIBO IMPAGADO
SELECT 'MPDT113_ReciboImpagado' AS TABLA,M113.* FROM STAGE.STG_MPDT113 M113
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
	OR NUMSECREC NOT IN (SELECT COD_RECIBO FROM ODS_TARJETACREDITO.RECIBO)
	OR CLAMON NOT IN (SELECT COD_SATMONEDA FROM ODS_MAESTRAS.MONEDA)
	OR NUMSECIMP IS NULL OR CENTALTA IS NULL OR CUENTA IS NULL OR ORIGEN IS NULL OR FECALTA IS NULL OR FECEMIMOV IS NULL OR FECVENMOV IS NULL OR NUMSECREC IS NULL
	OR IMPREC IS NULL OR IMPAGO IS NULL OR IMPAPL IS NULL OR FECULTAPL IS NULL OR FECBAJA IS NULL OR FECENVCOB IS NULL OR FECCONTA IS NULL OR CLAMON IS NULL
	OR SITUACION IS NULL OR NUMULTMOV IS NULL OR NUMENVPAS IS NULL OR INDCONHIS IS NULL );

--RECIBOIMPAGADO_TIPOIMPORTE
SELECT 'MPDT114_ReciboImpagado_TipoImporte' AS TABLA,M114.* FROM STAGE.STG_MPDT114 M114
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR NUMSECIMP NOT IN (SELECT COD_RECIBOIMPAGADO FROM ODS_TARJETACREDITO.RECIBOIMPAGADO)
	OR TIPOLIN NOT IN (SELECT COD_TIPOLINEACREDITO FROM ODS_MAESTRAS.TIPOLINEACREDITO)
	OR TIPIMP NOT IN (SELECT COD_TIPOIMPORTE FROM ODS_MAESTRAS.TIPOIMPORTE));

--CONTIMPAG_TIPO_TIPOIMPORTE
SELECT 'MPDT116_ContImpag_TipoLinea_TipoImporte' AS TABLA,M116.* FROM STAGE.STG_MPDT116 M116
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
	OR CLAMON NOT IN (SELECT COD_SATMONEDA FROM ODS_MAESTRAS.MONEDA)
    OR TIPOLIN NOT IN (SELECT COD_TIPOLINEACREDITO FROM ODS_MAESTRAS.TIPOLINEACREDITO)
	OR TIPIMP NOT IN (SELECT COD_TIPOIMPORTE FROM ODS_MAESTRAS.TIPOIMPORTE));

--HISTORICO PAGO	
SELECT 'MPDT125_HistoricoPago' AS TABLA,M125.* FROM STAGE.STG_MPDT125 M125
WHERE 
	NUMMOVPG != 0 AND TIPOLIN !='LDEF' AND (
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
	OR CENTALTA||CUENTA||NUMEXTPG NOT IN (SELECT CT.COD_CENTROALTATARJETA||COD_CUENTATARJETA||EX.COD_EXTRACTOCREDITO FROM ODS_TARJETACREDITO.EXTRACTOCREDITO EX
                                          INNER JOIN ODS_TARJETACREDITO.CONTRATOCUENTATARJETA CT ON EX.ID_CUENTATARJETA=CT.ID_CUENTATARJETA)
	OR CENTALTA||CUENTA||NUMEXTPG||NUMMOVPG NOT IN (SELECT CT.COD_CENTROALTATARJETA||COD_CUENTATARJETA||EX.COD_EXTRACTOCREDITO||MEC.COD_MOVIMIENTOEXTRACTOCREDITO 
													FROM ODS_TARJETACREDITO.EXTRACTOCREDITO EX
													INNER JOIN ODS_TARJETACREDITO.CONTRATOCUENTATARJETA CT ON EX.ID_CUENTATARJETA=CT.ID_CUENTATARJETA
													INNER JOIN ODS_TARJETACREDITO.MOVIMIENTOEXTRACTOCREDITO MEC ON MEC.ID_CUENTATARJETA=CT.ID_CUENTATARJETA 
													AND EX.ID_EXTRACTOCREDITO=MEC.ID_EXTRACTOCREDITO)
	OR CLAMON NOT IN (SELECT COD_SATMONEDA FROM ODS_MAESTRAS.MONEDA)
	OR TIPIMP NOT IN (SELECT COD_TIPOIMPORTE FROM ODS_MAESTRAS.TIPOIMPORTE)
	OR TIPOLIN NOT IN (SELECT COD_TIPOLINEACREDITO FROM ODS_MAESTRAS.TIPOLINEACREDITO))
	OR TIPDEU IS NULL OR NUMORDEN IS NULL )	;

--CONTRATOIMPAGADO
SELECT 'MPDT127_ContratoImpagado' AS TABLA,M127.* FROM STAGE.STG_MPDT127 M127
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
    OR CLAMON NOT IN (SELECT COD_SATMONEDA FROM ODS_MAESTRAS.MONEDA)
	OR ORIGEN IS NULL OR FECALTA IS NULL OR IMPCONT IS NULL OR IMPAGO IS NULL OR IMPAPL IS NULL OR FECULTAPL IS NULL
	OR FECBAJA IS NULL OR FECENVCOB IS NULL OR SITUACION IS NULL );

--CONCECONOMICO EXTRACTOCREDITO
SELECT 'MPDT151_ConcEconomico_ExtractoCredito' AS TABLA,M151.* FROM STAGE.STG_MPDT151 M151
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA )
	OR CENTALTA||CUENTA||NUMEXTCTA NOT IN (SELECT CT.COD_CENTROALTATARJETA||COD_CUENTATARJETA||EX.COD_EXTRACTOCREDITO FROM ODS_TARJETACREDITO.EXTRACTOCREDITO EX
                                           INNER JOIN ODS_TARJETACREDITO.CONTRATOCUENTATARJETA CT ON EX.ID_CUENTATARJETA=CT.ID_CUENTATARJETA)
	OR CLAMON NOT IN (SELECT COD_SATMONEDA FROM ODS_MAESTRAS.MONEDA)
    OR CODCONECO NOT IN (SELECT COD_CONCEPTOECONOMICO FROM ODS_MAESTRAS.CONCEPTOECONOMICO)
	OR CENTALTA||CUENTA||NUMEXTCTA||NUMMOVEXT NOT IN (SELECT CT.COD_CENTROALTATARJETA||COD_CUENTATARJETA||EX.COD_EXTRACTOCREDITO||MEC.COD_MOVIMIENTOEXTRACTOCREDITO 
													  FROM ODS_TARJETACREDITO.EXTRACTOCREDITO EX
													  INNER JOIN ODS_TARJETACREDITO.CONTRATOCUENTATARJETA CT ON EX.ID_CUENTATARJETA=CT.ID_CUENTATARJETA
													  INNER JOIN ODS_TARJETACREDITO.MOVIMIENTOEXTRACTOCREDITO MEC ON MEC.ID_CUENTATARJETA=CT.ID_CUENTATARJETA 
													  AND EX.ID_EXTRACTOCREDITO=MEC.ID_EXTRACTOCREDITO)
	OR TIPIMP NOT IN (SELECT COD_TIPOIMPORTE FROM ODS_MAESTRAS.TIPOIMPORTE)
	OR IMPBRUECO IS NULL OR IMPBONECO IS NULL OR IMPIMPTO IS NULL OR PORINT IS NULL );

--CONTCUENTATARJETA_ENTIMONEDA
SELECT 'MPDT163_ContCuentaTarjeta_EntiMoneda' AS TABLA,M163.* FROM STAGE.STG_MPDT163 M163
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
    OR CLAMON NOT IN (SELECT COD_SATMONEDA FROM ODS_MAESTRAS.MONEDA)
	OR INDMONPRIN IS NULL OR IMPFPAGOA IS NULL OR PORPAGOA IS NULL OR LIMCRECTA IS NULL OR LIMCRECTATEM IS NULL OR FECINITEM IS NULL OR FECFINTEM IS NULL
	OR SALAUTCRE IS NULL OR SALDISCRE IS NULL OR IMPFPATEM IS NULL OR PORPATEM IS NULL OR FECULTEXT IS NULL OR NUMULTEXT IS NULL OR NUMEXTPEN IS NULL
	OR LIMCRECTAC IS NULL OR SALAUTCREC IS NULL OR SALDISCREC IS NULL OR NUMOPECUO IS NULL OR LIMCRECTAG IS NULL OR LIMCRECTACG IS NULL );

--CONTCUENTATARJETA_ENTIBLOQUEO
SELECT 'MPDT178_ContCuentaTarjeta_EntiBloqueo' AS TABLA,M178.* FROM STAGE.STG_MPDT178 M178
WHERE 
    (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
    OR CODBLQ NOT IN (SELECT COD_ENTIDADBLOQUEO FROM ODS_TARJETACREDITO.ENTIDADBLOQUEO)
	OR INDBLQEXT IS NULL ) ;

--EXTRACTO_TIPOLINEA_TIPOIMPORTE
SELECT 'MPDT182_Extracto_TipoLinea_TipoImporte' AS TABLA,M182.* FROM STAGE.STG_MPDT182 M182
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
	OR CENTALTA||CUENTA||NUMEXTCTA NOT IN (SELECT CT.COD_CENTROALTATARJETA||COD_CUENTATARJETA||EX.COD_EXTRACTOCREDITO FROM ODS_TARJETACREDITO.EXTRACTOCREDITO EX
                                           INNER JOIN ODS_TARJETACREDITO.CONTRATOCUENTATARJETA CT ON EX.ID_CUENTATARJETA=CT.ID_CUENTATARJETA)
	OR CLAMON NOT IN (SELECT COD_SATMONEDA FROM ODS_MAESTRAS.MONEDA)
    OR TIPOLIN NOT IN (SELECT COD_TIPOLINEACREDITO FROM ODS_MAESTRAS.TIPOLINEACREDITO)
	OR TIPIMP NOT IN (SELECT COD_TIPOIMPORTE FROM ODS_MAESTRAS.TIPOIMPORTE));

--CONCECONOMICO PENDIENTEIMPAGO
SELECT 'MPDT194_ConcEconomico_PendienteImpago' AS TABLA,M194.* FROM STAGE.STG_MPDT194 M194
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR NUMSECIMP NOT IN (SELECT COD_RECIBOIMPAGADO FROM ODS_TARJETACREDITO.RECIBOIMPAGADO)
    OR NUMSECIMP||NUMMOVIMP NOT IN (SELECT RI.COD_RECIBOIMPAGADO||MI.COD_MOVIMIENTOIMPAGADO FROM ODS_TARJETACREDITO.MOVIMIENTOIMPAGADO MI
									INNER JOIN ODS_TARJETACREDITO.RECIBOIMPAGADO RI ON MI.ID_RECIBOIMPAGADO=RI.ID_RECIBOIMPAGADO)
	OR CODCONECO NOT IN (SELECT COD_CONCEPTOECONOMICO FROM ODS_MAESTRAS.CONCEPTOECONOMICO)
	OR TIPIMP NOT IN (SELECT COD_TIPOIMPORTE FROM ODS_MAESTRAS.TIPOIMPORTE)
	OR IMPAPLECO IS NULL OR IMPBRUECO IS NULL OR IMPBONECO IS NULL OR IMPIMPTO IS NULL OR IMPCONSOL IS NULL OR IMPTOCON IS NULL
	OR PORINT IS NULL OR INDPERCON IS NULL OR FECULTCAI IS NULL );

--OPERACIONES CUOTA
SELECT 'MPDT205_OperacionesCuota' AS TABLA,M205.* FROM STAGE.STG_MPDT205 M205
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
	OR CLAMON NOT IN (SELECT COD_SATMONEDA FROM ODS_MAESTRAS.MONEDA)
	OR CODTIPC NOT IN (SELECT COD_ENTIDADTIPOCUOTA FROM ODS_TARJETACREDITO.ENTIDADTIPOCUOTA));

--CUOTA FINANCIADA
SELECT 'MPDT206_CuotaFinanciada' AS TABLA,M206.* FROM STAGE.STG_MPDT206 M206
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
	OR CENTALTA||CUENTA||NUMOPECUO NOT IN (SELECT CT.COD_CENTROALTATARJETA||CT.COD_CUENTATARJETA||OPE.COD_OPERACIONCUOTA
										   FROM ODS_TARJETACREDITO.OPERACIONESCUOTA OPE
										   INNER JOIN ODS_TARJETACREDITO.CONTRATOCUENTATARJETA CT ON OPE.ID_CUENTATARJETA=CT.ID_CUENTATARJETA)
	OR CODTIPC NOT IN (SELECT COD_ENTIDADTIPOCUOTA FROM ODS_TARJETACREDITO.ENTIDADTIPOCUOTA)
	OR CLAMON NOT IN (SELECT COD_SATMONEDA FROM ODS_MAESTRAS.MONEDA));

--DETALLE CUOTA
SELECT 'MPDT207_DetalleCuota' AS TABLA,M207.* FROM STAGE.STG_MPDT207 M207
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
	OR CLAMON NOT IN (SELECT COD_SATMONEDA FROM ODS_MAESTRAS.MONEDA)
	OR CENTALTA||CUENTA||NUMOPECUO NOT IN (SELECT CT.COD_CENTROALTATARJETA||CT.COD_CUENTATARJETA||OPE.COD_OPERACIONCUOTA
										   FROM ODS_TARJETACREDITO.OPERACIONESCUOTA OPE
										   INNER JOIN ODS_TARJETACREDITO.CONTRATOCUENTATARJETA CT ON OPE.ID_CUENTATARJETA=CT.ID_CUENTATARJETA)
	OR CENTALTA||CUENTA||NUMOPECUO||NUMFINAN NOT IN (SELECT CT.COD_CENTROALTATARJETA||CT.COD_CUENTATARJETA||OPE.COD_OPERACIONCUOTA||CF.COD_CUOTAFINANCIADA
													 FROM ODS_TARJETACREDITO.OPERACIONESCUOTA OPE
													 INNER JOIN ODS_TARJETACREDITO.CONTRATOCUENTATARJETA CT ON OPE.ID_CUENTATARJETA=CT.ID_CUENTATARJETA
													 INNER JOIN ODS_TARJETACREDITO.CUOTAFINANCIADA CF ON CF.ID_CUENTATARJETA=CT.ID_CUENTATARJETA 
													 AND OPE.ID_OPERACIONCUOTA=CF.ID_OPERACIONCUOTA));

--CONCECONOMICO DETALLECUOTA
SELECT 'MPDT208_ConcEconomico_DetalleCuota' AS TABLA,M208.* FROM STAGE.STG_MPDT208 M208
WHERE 
   (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
	OR CLAMON NOT IN (SELECT COD_SATMONEDA FROM ODS_MAESTRAS.MONEDA)
	OR CENTALTA||CUENTA||NUMOPECUO NOT IN (SELECT CT.COD_CENTROALTATARJETA||CT.COD_CUENTATARJETA||OPE.COD_OPERACIONCUOTA
										   FROM ODS_TARJETACREDITO.OPERACIONESCUOTA OPE
										   INNER JOIN ODS_TARJETACREDITO.CONTRATOCUENTATARJETA CT ON OPE.ID_CUENTATARJETA=CT.ID_CUENTATARJETA)
	OR TIPIMP NOT IN (SELECT COD_TIPOIMPORTE FROM ODS_MAESTRAS.TIPOIMPORTE)
	OR NUMFINAN IS NULL );

--REFERENCIATIPOLINEACONTRATO
SELECT 'MPDT325_ReferenciaTipoLineaContrato' AS TABLA,M325.* FROM STAGE.STG_MPDT325 M325
WHERE 
    (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
	OR TIPOLIN IS NULL OR FECBLQ IS NULL OR TEXBLQ IS NULL OR INDVIG IS NULL OR FECALTA IS NULL OR FECINI IS NULL OR FECFIN IS NULL );

--LIMITEREFERENCIATIPOLINEACONTRATO
SELECT 'MPDT326_LimiteReferenciaLineaContrato' AS TABLA,M326.* FROM STAGE.STG_MPDT326 M326
WHERE 
    (CODENT NOT IN (SELECT COD_ENTIDAD FROM ODS_MAESTRAS.ENTIDAD)
    OR CENTALTA||CUENTA NOT IN (SELECT COD_CENTROALTATARJETA||COD_CUENTATARJETA FROM ODS_TARJETACREDITO.CONTRATOCUENTATARJETA)
    OR CENTALTA||CUENTA||LINREF NOT IN (SELECT CT.COD_CENTROALTATARJETA||COD_CUENTATARJETA||RETIPO.COD_REFERENCIATIPOLINEACONTRAT 
										FROM ODS_TARJETACREDITO.REFERENCIATIPOLINEACONTRATO RETIPO
                                        INNER JOIN ODS_TARJETACREDITO.CONTRATOCUENTATARJETA CT ON RETIPO.ID_CUENTATARJETA=CT.ID_CUENTATARJETA)
    OR CLAMON NOT IN (SELECT COD_SATMONEDA FROM ODS_MAESTRAS.MONEDA)
	OR LIMCRELIN IS NULL OR SALAUTLIN IS NULL OR SALDISLIN IS NULL OR PORLIM IS NULL OR INDPORLIM IS NULL OR FECALTA IS NULL OR FECINI IS NULL OR FECFIN IS NULL); 	