/*==============================================================*/
/* Table: TIPO_DE_DOCUMENTO                                     */
/*==============================================================*/
/*CREATE TABLE TIPO_DE_DOCUMENTO (
   ID_TIPO_DOCUMENTO    VARCHAR(3)           NOT NULL,
   ID_CLIENTE           VARCHAR(3)           NULL,
   TIPO                 VARCHAR(20)          NOT NULL,
   CONSTRAINT PK_TIPO_DE_DOCUMENTO PRIMARY KEY (ID_TIPO_DOCUMENTO)
);*/

INSERT INTO TIPO_DE_DOCUMENTO (ID_TIPO_DOCUMENTO,TIPO) VALUES('CC','CEDULA');
INSERT INTO TIPO_DE_DOCUMENTO (ID_TIPO_DOCUMENTO,TIPO) VALUES('RC','REGISTRO CIVIL');
INSERT INTO TIPO_DE_DOCUMENTO (ID_TIPO_DOCUMENTO,TIPO) VALUES('DX','DOCUMENTO EXTRANGERO');
INSERT INTO TIPO_DE_DOCUMENTO (ID_TIPO_DOCUMENTO,TIPO) VALUES('TI','TARJETA IDENTIDAD');
INSERT INTO TIPO_DE_DOCUMENTO (ID_TIPO_DOCUMENTO,TIPO) VALUES('PT','PASAPORTE');



/*==============================================================*/
/* Table: TIPO_TARJETA                                          */
/*==============================================================*/
/*CREATE TABLE TIPO_TARJETA (
   ID_TIPO_TARJETA      VARCHAR(5)           NOT NULL,
   DESCRIPCION          VARCHAR(30)          NULL,
   CUOTAS               NUMERIC              NULL,
   CONSTRAINT PK_TIPO_TARJETA PRIMARY KEY (ID_TIPO_TARJETA)
);*/

INSERT INTO TIPO_TARJETA(ID_TIPO_TARJETA,DESCRIPCION,CUOTAS) VALUES('01','DEBITO','1')
INSERT INTO TIPO_TARJETA(ID_TIPO_TARJETA,DESCRIPCION,CUOTAS) VALUES('02','CREDITO','')



/*==============================================================*/
/* Table: TIPO_VALOR                                            */
/*==============================================================*/
/*CREATE TABLE TIPO_VALOR (
   ID_TIPO_VALOR        VARCHAR(1)           NOT NULL,
   VALOR                DECIMAL(15,2)        NULL,
   VALORX_PESO          DECIMAL(15,2)        NULL,
   CONSTRAINT PK_TIPO_VALOR PRIMARY KEY (ID_TIPO_VALOR)
);*/

INSERT INTO TIPO_VALOR(ID_TIPO_VALOR,VALOR,VALORC_PESO) VALUES ('01')
INSERT INTO TIPO_VALOR(ID_TIPO_VALOR,VALOR,VALORC_PESO) VALUES ('02')