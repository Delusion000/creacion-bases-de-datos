/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     06/03/2023 10:54:31 p. m.                    */
/*==============================================================*/


ALTER TABLE BOLETO
   DROP CONSTRAINT FK_BOLETO_REFERENCE_SALA;

ALTER TABLE BOLETO
   DROP CONSTRAINT FK_BOLETO_REFERENCE_TEATRO;

ALTER TABLE BOLETO
   DROP CONSTRAINT FK_BOLETO_REFERENCE_CARTELER;

ALTER TABLE BOLETO
   DROP CONSTRAINT FK_BOLETO_REFERENCE_CLIENTE;

ALTER TABLE BOLETO
   DROP CONSTRAINT FK_BOLETO_REFERENCE_ASIENTO;

ALTER TABLE CARTELERA
   DROP CONSTRAINT FK_CARTELER_REFERENCE_PELICULA;

ALTER TABLE CARTELERA
   DROP CONSTRAINT FK_CARTELER_REFERENCE_SALA;

ALTER TABLE CIUDAD
   DROP CONSTRAINT FK_CIUDAD_REFERENCE_DEPARTAM;

ALTER TABLE CLIENTE_DIRECCIONES
   DROP CONSTRAINT FK_CLIENTE__REFERENCE_CLIENTE;

ALTER TABLE CLIENTE_DIRECCIONES
   DROP CONSTRAINT FK_CLIENTE__REFERENCE_CIUDAD;

ALTER TABLE COSTOS
   DROP CONSTRAINT FK_COSTOS_REFERENCE_BOLETO;

ALTER TABLE COSTOS
   DROP CONSTRAINT FK_COSTOS_REFERENCE_TIPO_DE_;

ALTER TABLE COSTOS
   DROP CONSTRAINT FK_COSTOS_REFERENCE_CLIENTE;

ALTER TABLE COSTOS
   DROP CONSTRAINT FK_COSTOS_REFERENCE_CONSUMIB;

ALTER TABLE DEPARTAMENTO
   DROP CONSTRAINT FK_DEPARTAM_REFERENCE_PAIS;

ALTER TABLE DISTRIBUCION
   DROP CONSTRAINT FK_DISTRIBU_REFERENCE_ASIENTO;

ALTER TABLE DISTRIBUCION
   DROP CONSTRAINT FK_DISTRIBU_REFERENCE_SALA;

ALTER TABLE PELICULA
   DROP CONSTRAINT FK_PELICULA_REFERENCE_GENERO;

ALTER TABLE SALA
   DROP CONSTRAINT FK_SALA_REFERENCE_TIPO_SAL;

ALTER TABLE TEATRO
   DROP CONSTRAINT FK_TEATRO_REFERENCE_CIUDAD;

ALTER TABLE TEATRO_SALAS
   DROP CONSTRAINT FK_TEATRO_S_REFERENCE_TEATRO;

ALTER TABLE TEATRO_SALAS
   DROP CONSTRAINT FK_TEATRO_S_REFERENCE_SALA;

ALTER TABLE TIPO_DE_DOCUMENTO
   DROP CONSTRAINT FK_TIPO_DE__REFERENCE_CLIENTE;

DROP TABLE ASIENTO CASCADE CONSTRAINTS;

DROP TABLE BOLETO CASCADE CONSTRAINTS;

DROP TABLE CARTELERA CASCADE CONSTRAINTS;

DROP TABLE CIUDAD CASCADE CONSTRAINTS;

DROP TABLE CLIENTE CASCADE CONSTRAINTS;

DROP TABLE CLIENTE_DIRECCIONES CASCADE CONSTRAINTS;

DROP TABLE CONSUMIBLES CASCADE CONSTRAINTS;

DROP TABLE COSTOS CASCADE CONSTRAINTS;

DROP TABLE DEPARTAMENTO CASCADE CONSTRAINTS;

DROP TABLE DISTRIBUCION CASCADE CONSTRAINTS;

DROP TABLE GENERO CASCADE CONSTRAINTS;

DROP TABLE PAIS CASCADE CONSTRAINTS;

DROP TABLE PELICULA CASCADE CONSTRAINTS;

DROP TABLE SALA CASCADE CONSTRAINTS;

DROP TABLE TEATRO CASCADE CONSTRAINTS;

DROP TABLE TEATRO_SALAS CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_DOCUMENTO CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_PAGO CASCADE CONSTRAINTS;

DROP TABLE TIPO_SALA CASCADE CONSTRAINTS;

/*==============================================================*/
/* Table: ASIENTO                                               */
/*==============================================================*/
CREATE TABLE ASIENTO (
   ID_ASIENTO           VARCHAR(3)            NOT NULL,
   NUMERO_ASIENTO       VARCHAR(2),
   CONSTRAINT PK_ASIENTO PRIMARY KEY (ID_ASIENTO)
);

/*==============================================================*/
/* Table: BOLETO                                                */
/*==============================================================*/
CREATE TABLE BOLETO (
   ID_BOLETO            VARCHAR(30)           NOT NULL,
   ID_ASIENTO           VARCHAR(3),
   ID_SALA              VARCHAR(3),
   ID_TEATRO            VARCHAR(3),
   ID_CARTELERA         VARCHAR(3),
   ID_CLIENTE           VARCHAR(3),
   FECHA_COMPRA         DATE,
   CONSTRAINT PK_BOLETO PRIMARY KEY (ID_BOLETO)
);

/*==============================================================*/
/* Table: CARTELERA                                             */
/*==============================================================*/
CREATE TABLE CARTELERA (
   ID_PELICULA          VARCHAR(3),
   ID_SALA              VARCHAR(3),
   ID_CARTELERA         VARCHAR(3)            NOT NULL,
   HORARIO              DATE,
   CONSTRAINT PK_CARTELERA PRIMARY KEY (ID_CARTELERA)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
CREATE TABLE CIUDAD (
   ID_CIUDAD            VARCHAR(3)            NOT NULL,
   ID_DEPTO             VARCHAR(2),
   NOMBRE               VARCHAR(40),
   CONSTRAINT PK_CIUDAD PRIMARY KEY (ID_CIUDAD)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
CREATE TABLE CLIENTE (
   ID_CLIENTE           VARCHAR(3)            NOT NULL,
   NOMBRE_CLIENTE       VARCHAR(40),
   CORREO               VARCHAR(40),
   N_IDENTIDAD          VARCHAR(20),
   CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CLIENTE_DIRECCIONES                                   */
/*==============================================================*/
CREATE TABLE CLIENTE_DIRECCIONES (
   ID_CLIENTE_DIRECCION NUMBER(15)            NOT NULL,
   ID_CIUDAD            VARCHAR(3)            NOT NULL,
   ID_CLIENTE           VARCHAR(3),
   VIA_PRINCIPAL        VARCHAR(20)           NOT NULL,
   NOMENCLATURA         VARCHAR(20)           NOT NULL,
   COMPLEMENTO          VARCHAR(20)           NOT NULL,
   CONSTRAINT PK_CLIENTE_DIRECCIONES PRIMARY KEY (ID_CLIENTE_DIRECCION)
);

/*==============================================================*/
/* Table: CONSUMIBLES                                           */
/*==============================================================*/
CREATE TABLE CONSUMIBLES (
   ID_CONSUMIBLES       VARCHAR(3)            NOT NULL,
   NOMBRE               VARCHAR(30)           NOT NULL,
   PRECIO               FLOAT                 NOT NULL,
   CONSTRAINT PK_CONSUMIBLES PRIMARY KEY (ID_CONSUMIBLES)
);

/*==============================================================*/
/* Table: COSTOS                                                */
/*==============================================================*/
CREATE TABLE COSTOS (
   ID_COSTOS            VARCHAR(3)            NOT NULL,
   ID_BOLETO            VARCHAR(30),
   ID_T_PAGO            VARCHAR(3),
   ID_CLIENTE           VARCHAR(3),
   ID_CONSUMIBLES       VARCHAR(3),
   TOTAL                FLOAT,
   CONSTRAINT PK_COSTOS PRIMARY KEY (ID_COSTOS)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
CREATE TABLE DEPARTAMENTO (
   ID_DEPTO             VARCHAR(2)            NOT NULL,
   IS_PAIS              VARCHAR(2),
   NOMBRE               VARCHAR(20)           NOT NULL,
   CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (ID_DEPTO)
);

/*==============================================================*/
/* Table: DISTRIBUCION                                          */
/*==============================================================*/
CREATE TABLE DISTRIBUCION (
   ID_ASIENTO           VARCHAR(3)            NOT NULL,
   ID_SALA              VARCHAR(3),
   ID_DISTRIBUCION      VARCHAR(3)            NOT NULL,
   CONSTRAINT PK_DISTRIBUCION PRIMARY KEY (ID_DISTRIBUCION)
);

/*==============================================================*/
/* Table: GENERO                                                */
/*==============================================================*/
CREATE TABLE GENERO (
   ID_GENERO            VARCHAR(3)            NOT NULL,
   TIPO                 VARCHAR(50),
   CONSTRAINT PK_GENERO PRIMARY KEY (ID_GENERO)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
CREATE TABLE PAIS (
   IS_PAIS              VARCHAR(2)            NOT NULL,
   NOMBRE               VARCHAR(20),
   CONSTRAINT PK_PAIS PRIMARY KEY (IS_PAIS)
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
CREATE TABLE PELICULA (
   ID_PELICULA          VARCHAR(3)            NOT NULL,
   ID_GENERO            VARCHAR(3),
   N_PELICULA           VARCHAR(40),
   DURACION             INT,
   CONSTRAINT PK_PELICULA PRIMARY KEY (ID_PELICULA)
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
CREATE TABLE SALA (
   ID_SALA              VARCHAR(3)            NOT NULL,
   ID_TIPO              VARCHAR(3),
   UBICACION            VARCHAR(2),
   CONSTRAINT PK_SALA PRIMARY KEY (ID_SALA)
);

/*==============================================================*/
/* Table: TEATRO                                                */
/*==============================================================*/
CREATE TABLE TEATRO (
   ID_TEATRO            VARCHAR(3)            NOT NULL,
   ID_CIUDAD            VARCHAR(3),
   NOMBRE               VARCHAR(40),
   DIRECCION            VARCHAR(40),
   CONSTRAINT PK_TEATRO PRIMARY KEY (ID_TEATRO)
);

/*==============================================================*/
/* Table: TEATRO_SALAS                                          */
/*==============================================================*/
CREATE TABLE TEATRO_SALAS (
   ID_T_S               VARCHAR(3)            NOT NULL,
   ID_TEATRO            VARCHAR(3),
   ID_SALA              VARCHAR(3),
   CONSTRAINT PK_TEATRO_SALAS PRIMARY KEY (ID_T_S)
);

/*==============================================================*/
/* Table: TIPO_DE_DOCUMENTO                                     */
/*==============================================================*/
CREATE TABLE TIPO_DE_DOCUMENTO (
   ID_TIPO_DOCUMENTO    VARCHAR(3)            NOT NULL,
   ID_CLIENTE           VARCHAR(3),
   TIPO                 VARCHAR(20)           NOT NULL,
   CONSTRAINT PK_TIPO_DE_DOCUMENTO PRIMARY KEY (ID_TIPO_DOCUMENTO)
);

/*==============================================================*/
/* Table: TIPO_DE_PAGO                                          */
/*==============================================================*/
CREATE TABLE TIPO_DE_PAGO (
   ID_T_PAGO            VARCHAR(3)            NOT NULL,
   DESCRIPCION          VARCHAR(20),
   CONSTRAINT PK_TIPO_DE_PAGO PRIMARY KEY (ID_T_PAGO)
);

/*==============================================================*/
/* Table: TIPO_SALA                                             */
/*==============================================================*/
CREATE TABLE TIPO_SALA (
   ID_TIPO              VARCHAR(3)            NOT NULL,
   DESCRIPCION          VARCHAR(50),
   CONSTRAINT PK_TIPO_SALA PRIMARY KEY (ID_TIPO)
);

ALTER TABLE BOLETO
   ADD CONSTRAINT FK_BOLETO_REFERENCE_SALA FOREIGN KEY (ID_SALA)
      REFERENCES SALA (ID_SALA);

ALTER TABLE BOLETO
   ADD CONSTRAINT FK_BOLETO_REFERENCE_TEATRO FOREIGN KEY (ID_TEATRO)
      REFERENCES TEATRO (ID_TEATRO);

ALTER TABLE BOLETO
   ADD CONSTRAINT FK_BOLETO_REFERENCE_CARTELER FOREIGN KEY (ID_CARTELERA)
      REFERENCES CARTELERA (ID_CARTELERA);

ALTER TABLE BOLETO
   ADD CONSTRAINT FK_BOLETO_REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE BOLETO
   ADD CONSTRAINT FK_BOLETO_REFERENCE_ASIENTO FOREIGN KEY (ID_ASIENTO)
      REFERENCES ASIENTO (ID_ASIENTO);

ALTER TABLE CARTELERA
   ADD CONSTRAINT FK_CARTELER_REFERENCE_PELICULA FOREIGN KEY (ID_PELICULA)
      REFERENCES PELICULA (ID_PELICULA);

ALTER TABLE CARTELERA
   ADD CONSTRAINT FK_CARTELER_REFERENCE_SALA FOREIGN KEY (ID_SALA)
      REFERENCES SALA (ID_SALA);

ALTER TABLE CIUDAD
   ADD CONSTRAINT FK_CIUDAD_REFERENCE_DEPARTAM FOREIGN KEY (ID_DEPTO)
      REFERENCES DEPARTAMENTO (ID_DEPTO);

ALTER TABLE CLIENTE_DIRECCIONES
   ADD CONSTRAINT FK_CLIENTE__REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE CLIENTE_DIRECCIONES
   ADD CONSTRAINT FK_CLIENTE__REFERENCE_CIUDAD FOREIGN KEY (ID_CIUDAD)
      REFERENCES CIUDAD (ID_CIUDAD);

ALTER TABLE COSTOS
   ADD CONSTRAINT FK_COSTOS_REFERENCE_BOLETO FOREIGN KEY (ID_BOLETO)
      REFERENCES BOLETO (ID_BOLETO);

ALTER TABLE COSTOS
   ADD CONSTRAINT FK_COSTOS_REFERENCE_TIPO_DE_ FOREIGN KEY (ID_T_PAGO)
      REFERENCES TIPO_DE_PAGO (ID_T_PAGO);

ALTER TABLE COSTOS
   ADD CONSTRAINT FK_COSTOS_REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE COSTOS
   ADD CONSTRAINT FK_COSTOS_REFERENCE_CONSUMIB FOREIGN KEY (ID_CONSUMIBLES)
      REFERENCES CONSUMIBLES (ID_CONSUMIBLES);

ALTER TABLE DEPARTAMENTO
   ADD CONSTRAINT FK_DEPARTAM_REFERENCE_PAIS FOREIGN KEY (IS_PAIS)
      REFERENCES PAIS (IS_PAIS);

ALTER TABLE DISTRIBUCION
   ADD CONSTRAINT FK_DISTRIBU_REFERENCE_ASIENTO FOREIGN KEY (ID_ASIENTO)
      REFERENCES ASIENTO (ID_ASIENTO);

ALTER TABLE DISTRIBUCION
   ADD CONSTRAINT FK_DISTRIBU_REFERENCE_SALA FOREIGN KEY (ID_SALA)
      REFERENCES SALA (ID_SALA);

ALTER TABLE PELICULA
   ADD CONSTRAINT FK_PELICULA_REFERENCE_GENERO FOREIGN KEY (ID_GENERO)
      REFERENCES GENERO (ID_GENERO);

ALTER TABLE SALA
   ADD CONSTRAINT FK_SALA_REFERENCE_TIPO_SAL FOREIGN KEY (ID_TIPO)
      REFERENCES TIPO_SALA (ID_TIPO);

ALTER TABLE TEATRO
   ADD CONSTRAINT FK_TEATRO_REFERENCE_CIUDAD FOREIGN KEY (ID_CIUDAD)
      REFERENCES CIUDAD (ID_CIUDAD);

ALTER TABLE TEATRO_SALAS
   ADD CONSTRAINT FK_TEATRO_S_REFERENCE_TEATRO FOREIGN KEY (ID_TEATRO)
      REFERENCES TEATRO (ID_TEATRO);

ALTER TABLE TEATRO_SALAS
   ADD CONSTRAINT FK_TEATRO_S_REFERENCE_SALA FOREIGN KEY (ID_SALA)
      REFERENCES SALA (ID_SALA);

ALTER TABLE TIPO_DE_DOCUMENTO
   ADD CONSTRAINT FK_TIPO_DE__REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

