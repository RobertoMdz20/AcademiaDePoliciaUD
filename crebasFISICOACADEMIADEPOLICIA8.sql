/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     09/06/2022 9:13:49                           */
/*==============================================================*/


drop table CALIFICACION;

drop table CLASE;

drop table CURSO;

drop table DOCENTE;

drop table ESTUDIANTE;

drop table HORARIO;

drop table MATERIA;

drop table MATRICULA;

drop table PERIODO;

/*==============================================================*/
/* Table: CALIFICACION                                          */
/*==============================================================*/
create table CALIFICACION (
   COD_CALIFICACION     INT2                 not null,
   COD_MATRICULA        INT2                 null,
   COD_CLASE            INT2                 null,
   COD_ESTUDIANTE       INT2                 null,
   NOTA_PRIMERPARCIAL   DECIMAL              not null,
   NOTA_SEGUNDOPARCIAL  DECIMAL              not null,
   constraint PK_CALIFICACION primary key (COD_CALIFICACION)
);

/*==============================================================*/
/* Table: CLASE                                                 */
/*==============================================================*/
create table CLASE (
   COD_CLASE            INT2                 not null,
   COD_CURSO            INT2                 null,
   COD_PERIODO          INT2                 null,
   COD_MATERIA          INT2                 null,
   COD_DOCENTE          INT2                 null,
   COD_HORARIO          INT2                 null,
   constraint PK_CLASE primary key (COD_CLASE)
);

/*==============================================================*/
/* Table: CURSO                                                 */
/*==============================================================*/
create table CURSO (
   COD_CURSO            INT2                 not null,
   NOMBRE_CURSO         VARCHAR(30)          not null,
   UBICACION_CURSO      VARCHAR(60)          not null,
   SECCION              VARCHAR(20)          not null,
   constraint PK_CURSO primary key (COD_CURSO)
);

/*==============================================================*/
/* Table: DOCENTE                                               */
/*==============================================================*/
create table DOCENTE (
   COD_DOCENTE          INT2                 not null,
   NOMBRE_DOCENTE       VARCHAR(60)          not null,
   DNI_DOCENTE          VARCHAR(20)          not null,
   CELULAR_DOCENTE      VARCHAR(20)          not null,
   GRADO_DOCENTE        VARCHAR(60)          not null,
   CORREO_DOCENTE       VARCHAR(60)          not null,
   NACIMIENTO_DOCENTE   DATE                 not null,
   constraint PK_DOCENTE primary key (COD_DOCENTE)
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE (
   COD_ESTUDIANTE       INT2                 not null,
   NOMBRE_ESTUDIANTE    VARCHAR(60)          not null,
   DNI_ESTUDIANTE       VARCHAR(20)          not null,
   CELULAR_ESTUDIANTE   VARCHAR(20)          not null,
   NACIMIENTO_ESTUDIANTE DATE                 not null,
   PROVINCIA_ESTUDIANTE VARCHAR(60)          not null,
   CIUDAD_ESTUDIANTE    VARCHAR(60)          not null,
   CORREO_ESTUDIANTE    VARCHAR(60)          not null,
   GENERO_ESTUDIANTE    VARCHAR(10)          not null,
   constraint PK_ESTUDIANTE primary key (COD_ESTUDIANTE)
);

/*==============================================================*/
/* Table: HORARIO                                               */
/*==============================================================*/
create table HORARIO (
   COD_HORARIO          INT2                 not null,
   TIPO_HORARIO         VARCHAR(10)          not null,
   HORA_INICIO          TIME                 not null,
   HORA_FIN             TIME                 not null,
   DIA                  VARCHAR(10)          null,
   constraint PK_HORARIO primary key (COD_HORARIO)
);

/*==============================================================*/
/* Table: MATERIA                                               */
/*==============================================================*/
create table MATERIA (
   COD_MATERIA          INT2                 not null,
   NOMBRE_MATERIA       VARCHAR(60)          not null,
   constraint PK_MATERIA primary key (COD_MATERIA)
);

/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
create table MATRICULA (
   COD_MATRICULA        INT2                 not null,
   COD_PERIODO          INT2                 null,
   COD_ESTUDIANTE       INT2                 null,
   COD_CLASE            INT2                 null,
   constraint PK_MATRICULA primary key (COD_MATRICULA)
);

/*==============================================================*/
/* Table: PERIODO                                               */
/*==============================================================*/
create table PERIODO (
   COD_PERIODO          INT2                 not null,
   INICIO_PERIODO       DATE                 not null,
   FIN_PERIODO          DATE                 not null,
   PERIODO              VARCHAR(10)          not null,
   constraint PK_PERIODO primary key (COD_PERIODO)
);

alter table CALIFICACION
   add constraint FK_CALIFICA_ESTUDIANT_ESTUDIAN foreign key (COD_ESTUDIANTE)
      references ESTUDIANTE (COD_ESTUDIANTE)
      on delete restrict on update restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_MATERIA_C_CLASE foreign key (COD_CLASE)
      references CLASE (COD_CLASE)
      on delete restrict on update restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_MATRICULA_MATRICUL foreign key (COD_MATRICULA)
      references MATRICULA (COD_MATRICULA)
      on delete restrict on update restrict;

alter table CLASE
   add constraint FK_CLASE_CURSO_CLA_CURSO foreign key (COD_CURSO)
      references CURSO (COD_CURSO)
      on delete restrict on update restrict;

alter table CLASE
   add constraint FK_CLASE_DOCENTE_C_DOCENTE foreign key (COD_DOCENTE)
      references DOCENTE (COD_DOCENTE)
      on delete restrict on update restrict;

alter table CLASE
   add constraint FK_CLASE_HORARIO_C_HORARIO foreign key (COD_HORARIO)
      references HORARIO (COD_HORARIO)
      on delete restrict on update restrict;

alter table CLASE
   add constraint FK_CLASE_MATERIA_C_MATERIA foreign key (COD_MATERIA)
      references MATERIA (COD_MATERIA)
      on delete restrict on update restrict;

alter table CLASE
   add constraint FK_CLASE_PERIODO_C_PERIODO foreign key (COD_PERIODO)
      references PERIODO (COD_PERIODO)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_CLASE_MAT_CLASE foreign key (COD_CLASE)
      references CLASE (COD_CLASE)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_ESTUDIANT_ESTUDIAN foreign key (COD_ESTUDIANTE)
      references ESTUDIANTE (COD_ESTUDIANTE)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_PERIODO_M_PERIODO foreign key (COD_PERIODO)
      references PERIODO (COD_PERIODO)
      on delete restrict on update restrict;

