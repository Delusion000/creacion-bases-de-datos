/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     17/04/2023 08:20:50 p. m.                    */
/*==============================================================*/


DROP TABLE ALMACEN;

DROP TABLE CIUDAD;

DROP TABLE CLIENTE;

DROP TABLE CLIENTE_DIRECCIONES;

DROP TABLE DEPARTAMENTO;

DROP TABLE EMAIL_CLIENTES;

DROP TABLE IMPUESTOS;

DROP TABLE MEDIO_DE_PAGO;

DROP TABLE PAIS;

DROP TABLE PRODUCTOS;

DROP TABLE PRODUCTOS_TICKET;

DROP TABLE PROMOCION;

DROP TABLE PUNTOS;

DROP TABLE TARJETAS;

DROP TABLE TELEFONO_CLIENTE;

DROP TABLE TICKET;

DROP TABLE TIPO_DE_DOCUMENTO;

DROP TABLE TIPO_TARJETA;

DROP TABLE TIPO_VALOR;

/*==============================================================*/
/* Table: ALMACEN                                               */
/*==============================================================*/
CREATE TABLE ALMACEN (
   ID_ALMACEN           VARCHAR(3)           NOT NULL,
   ID_CIUDAD            VARCHAR(3)           NULL,
   NOMBRE               VARCHAR(40)          NULL,
   DIRECCION            VARCHAR(40)          NULL,
   TELEFONO             VARHCAR(20)          NULL,
   CONSTRAINT PK_ALMACEN PRIMARY KEY (ID_ALMACEN)
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
   FECHA_DE_NACIMIENTO_ DATE                 NULL,
   CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CLIENTE_DIRECCIONES                                   */
/*==============================================================*/
CREATE TABLE CLIENTE_DIRECCIONES (
   ID_CLIENTE_DIRECCION NUMBER(15)           NOT NULL,
   ID_CIUDAD            VARCHAR(3)           NOT NULL,
   ID_CLIENTE           VARCHAR(3)           NULL,
   VIA_PRINCIPAL        VARCHAR(20)          NOT NULL,
   NOMENCLATURA         VARCHAR(20)          NOT NULL,
   COMPLEMENTO          VARCHAR(20)          NOT NULL,
   CONSTRAINT PK_CLIENTE_DIRECCIONES PRIMARY KEY (ID_CLIENTE_DIRECCION)
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
/* Table: EMAIL_CLIENTES                                        */
/*==============================================================*/
CREATE TABLE EMAIL_CLIENTES (
   ID_EMAIL_CLIENTES    NUMBER(15)           NOT NULL,
   ID_CLIENTE           VARCHAR(3)           NULL,
   EMAIL                VARCHAR(100)         NULL,
   ESTADO               VARCHAR(1)           NULL,
   FECHA_REGISTRO       TIMESTAMP WITH LOCAL TIME ZONE NULL,
   FECHA_ACTUALIZACION  TIMESTAMP WITH LOCAL TIME ZONE NULL,
   ID_USUARIO_LOG       VARCHAR(15)          NULL,
   CONSTRAINT PK_EMAIL_CLIENTES PRIMARY KEY (ID_EMAIL_CLIENTES)
);

/*==============================================================*/
/* Table: IMPUESTOS                                             */
/*==============================================================*/
CREATE TABLE IMPUESTOS (
   ID_IMPUESTO          VARCHAR(5)           NOT NULL,
   DESCRIPCION          VARCHAR(20)          NULL,
   PORCENTAJE           DECIMAL              NULL,
   CONSTRAINT PK_IMPUESTOS PRIMARY KEY (ID_IMPUESTO)
);

/*==============================================================*/
/* Table: MEDIO_DE_PAGO                                         */
/*==============================================================*/
CREATE TABLE MEDIO_DE_PAGO (
   MEDIO_               VARCHAR(5)           NOT NULL,
   ID_TARETA            VARCHAR(5)           NULL,
   EFECTIVO             DECIMAL              NULL,
   CONSTRAINT PK_MEDIO_DE_PAGO PRIMARY KEY (MEDIO_)
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
/* Table: PRODUCTOS                                             */
/*==============================================================*/
CREATE TABLE PRODUCTOS (
   ID_PRODUCTOS         ID_PRODUCTO          NOT NULL,
   ID_TIPO_VALOR        VARCHAR(1)           NULL,
   NOMBRE               VARCHAR(50)          NULL,
   TIPO_IMPUESTO        VARCHAR(1)           NULL,
   CONSTRAINT PK_PRODUCTOS PRIMARY KEY (ID_PRODUCTOS)
);

/*==============================================================*/
/* Table: PRODUCTOS_TICKET                                      */
/*==============================================================*/
CREATE TABLE PRODUCTOS_TICKET (
   ID_PRODUCTOS_TICKET  VARCHAR(10)          NOT NULL,
   ID_PRODUCTOS         ID_PRODUCTO          NULL,
   ID_TICKET            VARCHAR(30)          NULL,
   CONSTRAINT PK_PRODUCTOS_TICKET PRIMARY KEY (ID_PRODUCTOS_TICKET)
);

/*==============================================================*/
/* Table: PROMOCION                                             */
/*==============================================================*/
CREATE TABLE PROMOCION (
   ID_PROMOCION         VARCHAR(5)           NOT NULL,
   NOMBRE_REFERENCIA    VARCHAR(50)          NULL,
   PORCENTAJE_DESCUENTO DECIMAL              NULL,
   CONSTRAINT PK_PROMOCION PRIMARY KEY (ID_PROMOCION)
);

/*==============================================================*/
/* Table: PUNTOS                                                */
/*==============================================================*/
CREATE TABLE PUNTOS (
   ID_PUNTOS            VARCHAR(10)          NOT NULL,
   SALDO_ANTERIOR       NUMERIC              NULL,
   ESTA_COMPRA          NUMERIC              NULL,
   TOTAL_PUNTOS         NUMERIC              NULL,
   FECHA_VENCIMIENTO    DATE                 NULL,
   CONSTRAINT PK_PUNTOS PRIMARY KEY (ID_PUNTOS)
);

/*==============================================================*/
/* Table: TARJETAS                                              */
/*==============================================================*/
CREATE TABLE TARJETAS (
   ID_TARETA            VARCHAR(5)           NOT NULL,
   ID_TIPO_TARJETA      VARCHAR(5)           NULL,
   NOMBRE_BANCO         VARCHAR(50)          NULL,
   DESCRIPCION          VARCHAR(50)          NULL,
   CONSTRAINT PK_TARJETAS PRIMARY KEY (ID_TARETA)
);

/*==============================================================*/
/* Table: TELEFONO_CLIENTE                                      */
/*==============================================================*/
CREATE TABLE TELEFONO_CLIENTE (
   ID_TELEFONO_CLIENTE  VARCHAR(10)          NOT NULL,
   ID_CLIENTE           VARCHAR(3)           NULL,
   IS_PAIS              VARCHAR(2)           NULL,
   TELEFONO_            NUMBER(30)           NULL,
   CONSTRAINT PK_TELEFONO_CLIENTE PRIMARY KEY (ID_TELEFONO_CLIENTE)
);

/*==============================================================*/
/* Table: TICKET                                                */
/*==============================================================*/
CREATE TABLE TICKET (
   ID_TICKET            VARCHAR(30)          NOT NULL,
   ID_PUNTOS            VARCHAR(10)          NULL,
   ID_IMPUESTO          VARCHAR(5)           NULL,
   MEDIO_               VARCHAR(5)           NULL,
   ID_PROMOCION         VARCHAR(5)           NULL,
   ID_CLIENTE           VARCHAR(3)           NULL,
   ID_ALMACEN           VARCHAR(3)           NULL,
   UNIDAD               NUMERIC              NULL,
   PESO                 DECIMAL              NULL,
   FECHA                TIME WITH TIME ZONE  NULL,
   TOTAL                DECIMAL(15,2)        NULL,
   TOTAL_MAS_IMPUESTO   DECIMAL(15,2)        NULL,
   CONSTRAINT PK_TICKET PRIMARY KEY (ID_TICKET)
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
/* Table: TIPO_TARJETA                                          */
/*==============================================================*/
CREATE TABLE TIPO_TARJETA (
   ID_TIPO_TARJETA      VARCHAR(5)           NOT NULL,
   DESCRIPCION          VARCHAR(30)          NULL,
   CUOTAS               NUMERIC              NULL,
   CONSTRAINT PK_TIPO_TARJETA PRIMARY KEY (ID_TIPO_TARJETA)
);

/*==============================================================*/
/* Table: TIPO_VALOR                                            */
/*==============================================================*/
CREATE TABLE TIPO_VALOR (
   ID_TIPO_VALOR        VARCHAR(1)           NOT NULL,
   VALOR                DECIMAL(15,2)        NULL,
   VALORX_PESO          DECIMAL(15,2)        NULL,
   CONSTRAINT PK_TIPO_VALOR PRIMARY KEY (ID_TIPO_VALOR)
);

ALTER TABLE ALMACEN
   ADD CONSTRAINT FK_ALMACEN_REFERENCE_CIUDAD FOREIGN KEY (ID_CIUDAD)
      REFERENCES CIUDAD (ID_CIUDAD)
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

ALTER TABLE DEPARTAMENTO
   ADD CONSTRAINT FK_DEPARTAM_REFERENCE_PAIS FOREIGN KEY (IS_PAIS)
      REFERENCES PAIS (IS_PAIS)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE EMAIL_CLIENTES
   ADD CONSTRAINT FK_EMAIL_CL_REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE MEDIO_DE_PAGO
   ADD CONSTRAINT FK_MEDIO_DE_REFERENCE_TARJETAS FOREIGN KEY (ID_TARETA)
      REFERENCES TARJETAS (ID_TARETA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PRODUCTOS
   ADD CONSTRAINT FK_PRODUCTO_REFERENCE_TIPO_VAL FOREIGN KEY (ID_TIPO_VALOR)
      REFERENCES TIPO_VALOR (ID_TIPO_VALOR)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PRODUCTOS_TICKET
   ADD CONSTRAINT FK_PRODUCTO_REFERENCE_PRODUCTO FOREIGN KEY (ID_PRODUCTOS)
      REFERENCES PRODUCTOS (ID_PRODUCTOS)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PRODUCTOS_TICKET
   ADD CONSTRAINT FK_PRODUCTO_REFERENCE_TICKET FOREIGN KEY (ID_TICKET)
      REFERENCES TICKET (ID_TICKET)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TARJETAS
   ADD CONSTRAINT FK_TARJETAS_REFERENCE_TIPO_TAR FOREIGN KEY (ID_TIPO_TARJETA)
      REFERENCES TIPO_TARJETA (ID_TIPO_TARJETA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TELEFONO_CLIENTE
   ADD CONSTRAINT FK_TELEFONO_REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TELEFONO_CLIENTE
   ADD CONSTRAINT FK_TELEFONO_REFERENCE_PAIS FOREIGN KEY (IS_PAIS)
      REFERENCES PAIS (IS_PAIS)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TICKET
   ADD CONSTRAINT FK_TICKET_REFERENCE_PUNTOS FOREIGN KEY (ID_PUNTOS)
      REFERENCES PUNTOS (ID_PUNTOS)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TICKET
   ADD CONSTRAINT FK_TICKET_REFERENCE_IMPUESTO FOREIGN KEY (ID_IMPUESTO)
      REFERENCES IMPUESTOS (ID_IMPUESTO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TICKET
   ADD CONSTRAINT FK_TICKET_REFERENCE_MEDIO_DE FOREIGN KEY (MEDIO_)
      REFERENCES MEDIO_DE_PAGO (MEDIO_)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TICKET
   ADD CONSTRAINT FK_TICKET_REFERENCE_PROMOCIO FOREIGN KEY (ID_PROMOCION)
      REFERENCES PROMOCION (ID_PROMOCION)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TICKET
   ADD CONSTRAINT FK_TICKET_REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TICKET
   ADD CONSTRAINT FK_TICKET_REFERENCE_ALMACEN FOREIGN KEY (ID_ALMACEN)
      REFERENCES ALMACEN (ID_ALMACEN)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TIPO_DE_DOCUMENTO
   ADD CONSTRAINT FK_TIPO_DE__REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

