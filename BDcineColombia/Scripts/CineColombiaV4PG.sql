/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     29/03/2023 05:23:50 p. m.                    */
/*==============================================================*/


DROP TABLE ASIENTO;

DROP TABLE BOLETO;

DROP TABLE CARTELERA;

DROP TABLE CIUDAD;

DROP TABLE CLIENTE;

DROP TABLE CLIENTE_DIRECCIONES;

DROP TABLE CONSUMIBLES;

DROP TABLE CONSUMIBLES_COSTOS;

DROP TABLE COSTOS;

DROP TABLE DEPARTAMENTO;

DROP TABLE DISTRIBUCION;

DROP TABLE EMAIL_CLIENTES;

DROP TABLE GENERO;

DROP TABLE PAIS;

DROP TABLE PELICULA;

DROP TABLE SALA;

DROP TABLE TEATRO;

DROP TABLE TEATRO_SALAS;

DROP TABLE TELEFONO_CLIENTE;

DROP TABLE TIPO_DE_DOCUMENTO;

DROP TABLE TIPO_DE_PAGO;

DROP TABLE TIPO_SALA;

/*==============================================================*/
/* Table: ASIENTO                                               */
/*==============================================================*/
CREATE TABLE ASIENTO (
   ID_ASIENTO           VARCHAR(3)           NOT NULL,
   NUMERO_ASIENTO       VARCHAR(2)           NULL,
   CONSTRAINT PK_ASIENTO PRIMARY KEY (ID_ASIENTO)
);

/*==============================================================*/
/* Table: BOLETO                                                */
/*==============================================================*/
CREATE TABLE BOLETO (
   ID_BOLETO            VARCHAR(30)          NOT NULL,
   ID_ASIENTO           VARCHAR(3)           NULL,
   ID_SALA              VARCHAR(3)           NULL,
   ID_CARTELERA         VARCHAR(3)           NULL,
   ID_CLIENTE           VARCHAR(3)           NULL,
   FECHA_COMPRA         DATE                 NULL,
   CONSTRAINT PK_BOLETO PRIMARY KEY (ID_BOLETO)
);

/*==============================================================*/
/* Table: CARTELERA                                             */
/*==============================================================*/
CREATE TABLE CARTELERA (
   ID_PELICULA          VARCHAR(3)           NULL,
   ID_SALA              VARCHAR(3)           NULL,
   ID_CARTELERA         VARCHAR(3)           NOT NULL,
   HORARIO              DATE                 NULL,
   CONSTRAINT PK_CARTELERA PRIMARY KEY (ID_CARTELERA)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
CREATE TABLE CIUDAD (
   ID_CIUDAD            VARCHAR(3)           NOT NULL,
   ID_DEPTO             VARCHAR(2)           NULL,
   NOMBRE               VARCHAR(40)          NULL,
   CONSTRAINT PK_CIUDAD PRIMARY KEY (ID_CIUDAD)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
CREATE TABLE CLIENTE (
   ID_CLIENTE           VARCHAR(3)           NOT NULL,
   NOMBRE_CLIENTE       VARCHAR(40)          NULL,
   CORREO               VARCHAR(40)          NULL,
   N_IDENTIDAD          VARCHAR(20)          NULL,
   FECHA_DE_NACIMIENTO_ TIMESTAMP WITH TIME ZONE NULL,
   ESTADO               VARCHAR(1)           NULL,
   FECHA_VINCULACION_   TIMESTAMP WITH TIME ZONE NULL,
   CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CLIENTE_DIRECCIONES                                   */
/*==============================================================*/
CREATE TABLE CLIENTE_DIRECCIONES (
   ID_CLIENTE_DIRECCION NUMERIC(50)          NOT NULL,
   ID_CIUDAD            VARCHAR(3)           NOT NULL,
   ID_CLIENTE           VARCHAR(3)           NULL,
   VIA_PRINCIPAL        VARCHAR(20)          NOT NULL,
   NOMENCLATURA         VARCHAR(20)          NOT NULL,
   COMPLEMENTO          VARCHAR(20)          NOT NULL,
   CONSTRAINT PK_CLIENTE_DIRECCIONES PRIMARY KEY (ID_CLIENTE_DIRECCION)
);

/*==============================================================*/
/* Table: CONSUMIBLES                                           */
/*==============================================================*/
CREATE TABLE CONSUMIBLES (
   ID_CONSUMIBLES       VARCHAR(3)           NOT NULL,
   NOMBRE               VARCHAR(30)          NOT NULL,
   PRECIO               FLOAT                NOT NULL,
   CONSTRAINT PK_CONSUMIBLES PRIMARY KEY (ID_CONSUMIBLES)
);

/*==============================================================*/
/* Table: CONSUMIBLES_COSTOS                                    */
/*==============================================================*/
CREATE TABLE CONSUMIBLES_COSTOS (
   ID_CONSUMIBLES       VARCHAR(3)           NULL,
   ID_COSTOS            VARCHAR(3)           NULL
);

/*==============================================================*/
/* Table: COSTOS                                                */
/*==============================================================*/
CREATE TABLE COSTOS (
   ID_COSTOS            VARCHAR(3)           NOT NULL,
   ID_BOLETO            VARCHAR(30)          NULL,
   ID_T_PAGO            VARCHAR(3)           NULL,
   ID_CONSUMIBLES       VARCHAR(3)           NULL,
   TOTAL                FLOAT                NULL,
   CONSTRAINT PK_COSTOS PRIMARY KEY (ID_COSTOS)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
CREATE TABLE DEPARTAMENTO (
   ID_DEPTO             VARCHAR(2)           NOT NULL,
   IS_PAIS              VARCHAR(2)           NULL,
   NOMBRE               VARCHAR(20)          NOT NULL,
   CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (ID_DEPTO)
);

/*==============================================================*/
/* Table: DISTRIBUCION                                          */
/*==============================================================*/
CREATE TABLE DISTRIBUCION (
   ID_ASIENTO           VARCHAR(3)           NOT NULL,
   ID_SALA              VARCHAR(3)           NULL,
   ID_DISTRIBUCION      VARCHAR(3)           NOT NULL,
   CONSTRAINT PK_DISTRIBUCION PRIMARY KEY (ID_DISTRIBUCION)
);

/*==============================================================*/
/* Table: EMAIL_CLIENTES                                        */
/*==============================================================*/
CREATE TABLE EMAIL_CLIENTES (
   ID_EMAIL_CLIENTES    NUMERIC(100)         NOT NULL,
   ID_CLIENTE           VARCHAR(3)           NULL,
   EMAIL                VARCHAR(100)         NULL,
   ESTADO               VARCHAR(1)           NULL,
   FECHA_REGISTRO       TIMESTAMP WITH LOCAL TIME ZONE NULL,
   FECHA_ACTUALIZACION  TIMESTAMP WITH LOCAL TIME ZONE NULL,
   ID_USUARIO_LOG       VARCHAR(15)          NULL,
   CONSTRAINT PK_EMAIL_CLIENTES PRIMARY KEY (ID_EMAIL_CLIENTES)
);

/*==============================================================*/
/* Table: GENERO                                                */
/*==============================================================*/
CREATE TABLE GENERO (
   ID_GENERO            VARCHAR(3)           NOT NULL,
   TIPO                 VARCHAR(50)          NULL,
   CONSTRAINT PK_GENERO PRIMARY KEY (ID_GENERO)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
CREATE TABLE PAIS (
   IS_PAIS              VARCHAR(2)           NOT NULL,
   NOMBRE               VARCHAR(20)          NULL,
   CODIGO_TELEFONO      VARCHAR(20)          NOT NULL,
   CONSTRAINT PK_PAIS PRIMARY KEY (IS_PAIS)
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
CREATE TABLE PELICULA (
   ID_PELICULA          VARCHAR(3)           NOT NULL,
   ID_GENERO            VARCHAR(3)           NULL,
   N_PELICULA           VARCHAR(40)          NULL,
   DURACION             INT                  NULL,
   CONSTRAINT PK_PELICULA PRIMARY KEY (ID_PELICULA)
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
CREATE TABLE SALA (
   ID_SALA              VARCHAR(3)           NOT NULL,
   ID_TIPO              VARCHAR(3)           NULL,
   UBICACION            VARCHAR(2)           NULL,
   CONSTRAINT PK_SALA PRIMARY KEY (ID_SALA)
);

/*==============================================================*/
/* Table: TEATRO                                                */
/*==============================================================*/
CREATE TABLE TEATRO (
   ID_TEATRO            VARCHAR(3)           NOT NULL,
   ID_CIUDAD            VARCHAR(3)           NULL,
   NOMBRE               VARCHAR(40)          NULL,
   DIRECCION            VARCHAR(40)          NULL,
   CONSTRAINT PK_TEATRO PRIMARY KEY (ID_TEATRO)
);

/*==============================================================*/
/* Table: TEATRO_SALAS                                          */
/*==============================================================*/
CREATE TABLE TEATRO_SALAS (
   ID_T_S               VARCHAR(3)           NOT NULL,
   ID_TEATRO            VARCHAR(3)           NULL,
   ID_SALA              VARCHAR(3)           NULL,
   CONSTRAINT PK_TEATRO_SALAS PRIMARY KEY (ID_T_S)
);

/*==============================================================*/
/* Table: TELEFONO_CLIENTE                                      */
/*==============================================================*/
CREATE TABLE TELEFONO_CLIENTE (
   ID_TELEFONO_CLIENTE  VARCHAR(10)          NOT NULL,
   ID_CLIENTE           VARCHAR(3)           NULL,
   IS_PAIS              VARCHAR(2)           NULL,
   TELEFONO_            NUMERIC(30)          NULL,
   CONSTRAINT PK_TELEFONO_CLIENTE PRIMARY KEY (ID_TELEFONO_CLIENTE)
);

/*==============================================================*/
/* Table: TIPO_DE_DOCUMENTO                                     */
/*==============================================================*/
CREATE TABLE TIPO_DE_DOCUMENTO (
   ID_TIPO_DOCUMENTO    VARCHAR(3)           NOT NULL,
   ID_CLIENTE           VARCHAR(3)           NULL,
   TIPO                 VARCHAR(20)          NOT NULL,
   CONSTRAINT PK_TIPO_DE_DOCUMENTO PRIMARY KEY (ID_TIPO_DOCUMENTO)
);

/*==============================================================*/
/* Table: TIPO_DE_PAGO                                          */
/*==============================================================*/
CREATE TABLE TIPO_DE_PAGO (
   ID_T_PAGO            VARCHAR(3)           NOT NULL,
   DESCRIPCION          VARCHAR(20)          NULL,
   CONSTRAINT PK_TIPO_DE_PAGO PRIMARY KEY (ID_T_PAGO)
);

/*==============================================================*/
/* Table: TIPO_SALA                                             */
/*==============================================================*/
CREATE TABLE TIPO_SALA (
   ID_TIPO              VARCHAR(3)           NOT NULL,
   DESCRIPCION          VARCHAR(50)          NULL,
   CONSTRAINT PK_TIPO_SALA PRIMARY KEY (ID_TIPO)
);

ALTER TABLE BOLETO
   ADD CONSTRAINT FK_BOLETO_REFERENCE_SALA FOREIGN KEY (ID_SALA)
      REFERENCES SALA (ID_SALA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE BOLETO
   ADD CONSTRAINT FK_BOLETO_REFERENCE_CARTELER FOREIGN KEY (ID_CARTELERA)
      REFERENCES CARTELERA (ID_CARTELERA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE BOLETO
   ADD CONSTRAINT FK_BOLETO_REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE BOLETO
   ADD CONSTRAINT FK_BOLETO_REFERENCE_ASIENTO FOREIGN KEY (ID_ASIENTO)
      REFERENCES ASIENTO (ID_ASIENTO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CARTELERA
   ADD CONSTRAINT FK_CARTELER_REFERENCE_PELICULA FOREIGN KEY (ID_PELICULA)
      REFERENCES PELICULA (ID_PELICULA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CARTELERA
   ADD CONSTRAINT FK_CARTELER_REFERENCE_SALA FOREIGN KEY (ID_SALA)
      REFERENCES SALA (ID_SALA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CIUDAD
   ADD CONSTRAINT FK_CIUDAD_REFERENCE_DEPARTAM FOREIGN KEY (ID_DEPTO)
      REFERENCES DEPARTAMENTO (ID_DEPTO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CLIENTE_DIRECCIONES
   ADD CONSTRAINT FK_CLIENTE__REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CLIENTE_DIRECCIONES
   ADD CONSTRAINT FK_CLIENTE__REFERENCE_CIUDAD FOREIGN KEY (ID_CIUDAD)
      REFERENCES CIUDAD (ID_CIUDAD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CONSUMIBLES_COSTOS
   ADD CONSTRAINT FK_CONSUMIB_REFERENCE_CONSUMIB FOREIGN KEY (ID_CONSUMIBLES)
      REFERENCES CONSUMIBLES (ID_CONSUMIBLES)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CONSUMIBLES_COSTOS
   ADD CONSTRAINT FK_CONSUMIB_REFERENCE_COSTOS FOREIGN KEY (ID_COSTOS)
      REFERENCES COSTOS (ID_COSTOS)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE COSTOS
   ADD CONSTRAINT FK_COSTOS_REFERENCE_BOLETO FOREIGN KEY (ID_BOLETO)
      REFERENCES BOLETO (ID_BOLETO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE COSTOS
   ADD CONSTRAINT FK_COSTOS_REFERENCE_TIPO_DE_ FOREIGN KEY (ID_T_PAGO)
      REFERENCES TIPO_DE_PAGO (ID_T_PAGO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE COSTOS
   ADD CONSTRAINT FK_COSTOS_REFERENCE_CONSUMIB FOREIGN KEY (ID_CONSUMIBLES)
      REFERENCES CONSUMIBLES (ID_CONSUMIBLES)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DEPARTAMENTO
   ADD CONSTRAINT FK_DEPARTAM_REFERENCE_PAIS FOREIGN KEY (IS_PAIS)
      REFERENCES PAIS (IS_PAIS)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DISTRIBUCION
   ADD CONSTRAINT FK_DISTRIBU_REFERENCE_ASIENTO FOREIGN KEY (ID_ASIENTO)
      REFERENCES ASIENTO (ID_ASIENTO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DISTRIBUCION
   ADD CONSTRAINT FK_DISTRIBU_REFERENCE_SALA FOREIGN KEY (ID_SALA)
      REFERENCES SALA (ID_SALA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE EMAIL_CLIENTES
   ADD CONSTRAINT FK_EMAIL_CL_REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PELICULA
   ADD CONSTRAINT FK_PELICULA_REFERENCE_GENERO FOREIGN KEY (ID_GENERO)
      REFERENCES GENERO (ID_GENERO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE SALA
   ADD CONSTRAINT FK_SALA_REFERENCE_TIPO_SAL FOREIGN KEY (ID_TIPO)
      REFERENCES TIPO_SALA (ID_TIPO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TEATRO
   ADD CONSTRAINT FK_TEATRO_REFERENCE_CIUDAD FOREIGN KEY (ID_CIUDAD)
      REFERENCES CIUDAD (ID_CIUDAD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TEATRO_SALAS
   ADD CONSTRAINT FK_TEATRO_S_REFERENCE_TEATRO FOREIGN KEY (ID_TEATRO)
      REFERENCES TEATRO (ID_TEATRO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TEATRO_SALAS
   ADD CONSTRAINT FK_TEATRO_S_REFERENCE_SALA FOREIGN KEY (ID_SALA)
      REFERENCES SALA (ID_SALA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TELEFONO_CLIENTE
   ADD CONSTRAINT FK_TELEFONO_REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TELEFONO_CLIENTE
   ADD CONSTRAINT FK_TELEFONO_REFERENCE_PAIS FOREIGN KEY (IS_PAIS)
      REFERENCES PAIS (IS_PAIS)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TIPO_DE_DOCUMENTO
   ADD CONSTRAINT FK_TIPO_DE__REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

