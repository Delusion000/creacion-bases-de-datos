/*==============================================================*/
/* Table: TIPO_DE_DOCUMENTO                                     */
/*==============================================================*/
/*CREATE TABLE TIPO_DE_DOCUMENTO (
   ID_TIPO_DOCUMENTO    VARCHAR(3)            NOT NULL,
   ID_CLIENTE           VARCHAR(3),
   TIPO                 VARCHAR(20)           NOT NULL,
   CONSTRAINT PK_TIPO_DE_DOCUMENTO PRIMARY KEY (ID_TIPO_DOCUMENTO)
);*/

INSERT INTO TIPO_DE_DOCUMENTO (ID_TIPO_DOCUMENTO,TIPO) VALUES('CC','CEDULA');
INSERT INTO TIPO_DE_DOCUMENTO (ID_TIPO_DOCUMENTO,TIPO) VALUES('RC','REGISTRO CIVIL');
INSERT INTO TIPO_DE_DOCUMENTO (ID_TIPO_DOCUMENTO,TIPO) VALUES('DX','DOCUMENTO EXTRANGERO');
INSERT INTO TIPO_DE_DOCUMENTO (ID_TIPO_DOCUMENTO,TIPO) VALUES('TI','TARJETA IDENTIDAD');
INSERT INTO TIPO_DE_DOCUMENTO (ID_TIPO_DOCUMENTO,TIPO) VALUES('PT','PASAPORTE');


/*==============================================================*/
/* Table: TIPO_SALA                                             */
/*==============================================================*/
/*CREATE TABLE TIPO_SALA (
   ID_TIPO              VARCHAR(3)            NOT NULL,
   DESCRIPCION          VARCHAR(50),
   CONSTRAINT PK_TIPO_SALA PRIMARY KEY (ID_TIPO)
);*/

INSERT INTO TIPO_SALA (ID_TIPO,DESCRIPCION) VALUES ('2D','SALA 2D');
INSERT INTO TIPO_SALA (ID_TIPO,DESCRIPCION) VALUES ('3D','SALA 3D');
INSERT INTO TIPO_SALA (ID_TIPO,DESCRIPCION) VALUES ('MEG','MEGA SALA');
INSERT INTO TIPO_SALA (ID_TIPO,DESCRIPCION) VALUES ('4DX','SALA 4DX');


/*==============================================================*/
/* Table: TIPO_DE_PAGO                                          */
/*==============================================================*/
/*CREATE TABLE TIPO_DE_PAGO (
   ID_T_PAGO            VARCHAR(3)            NOT NULL,
   DESCRIPCION          VARCHAR(20),
   CONSTRAINT PK_TIPO_DE_PAGO PRIMARY KEY (ID_T_PAGO)
);*/

INSERT INTO TIPO_DE_PAGO (ID_T_PAGO,DESCRIPCION) VALUES ('001','EFECTIVO');
INSERT INTO TIPO_DE_PAGO (ID_T_PAGO,DESCRIPCION) VALUES ('010','TARJETA CREDITO');
INSERT INTO TIPO_DE_PAGO (ID_T_PAGO,DESCRIPCION) VALUES ('011','TARJETA DEBITO');
INSERT INTO TIPO_DE_PAGO (ID_T_PAGO,DESCRIPCION) VALUES ('100','CHEQUE');







