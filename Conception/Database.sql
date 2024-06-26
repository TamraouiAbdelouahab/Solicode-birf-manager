
create table APPRENANT
(
   ID_APPRENANT         int not null,
   ID_GROUPE            int not null,
   NOM                  char(256) not null,
   PRENOM               char(256) not null,
   EMAIL                char(256) not null,
   MOT_DE_PASSE         char(256) not null,
   primary key (ID_APPRENANT)
);

create table BRIEF
(
   ID_BRIEF             int not null,
   ID_FORMATEUR         int not null,
   TITRE                char(256) not null,
   DATE_DEBUT           date not null,
   DATE_FIN             date not null,
   PIECE_JOINTE         char(256) not null,
   DATE_AJOUTE          date not null,
   primary key (ID_BRIEF)
);
create table COMPETENCE
(
   ID_COMPETENCE        int not null,
   NOM                  char(256) not null,
   primary key (ID_COMPETENCE)
);

create table CONCERNE
(
   ID_BRIEF             int not null,
   ID_COMPETENCE        int not null,
   primary key (ID_BRIEF, ID_COMPETENCE)
);

create table FORMATEUR
(
   ID_FORMATEUR         int not null,
   NOM                  char(256) not null,
   PRENOM               char(256) not null,
   EMAIL                char(256) not null,
   MOT_DE_PASSE         char(256) not null,
   primary key (ID_FORMATEUR)
);

create table GROUPE
(
   ID_GROUPE            int not null,
   ID_FORMATEUR         int not null,
   NOM_GROUPE           char(256) not null,
   ANNEE                char(256) not null,
   primary key (ID_GROUPE)
);

create table REALISER
(
   ID_APPRENANT         int not null,
   ID_BRIEF             int not null,
   ETAT                 char(256),
   LIEN                 char(256),
   primary key (ID_APPRENANT, ID_BRIEF)
);

alter table APPRENANT add constraint FK_POSSEDER foreign key (ID_GROUPE)
      references GROUPE (ID_GROUPE) on delete restrict on update restrict;

alter table BRIEF add constraint FK_CREE foreign key (ID_FORMATEUR)
      references FORMATEUR (ID_FORMATEUR) on delete restrict on update restrict;

alter table CONCERNE add constraint FK_CONCERNE foreign key (ID_BRIEF)
      references BRIEF (ID_BRIEF) on delete restrict on update restrict;

alter table CONCERNE add constraint FK_CONCERNE2 foreign key (ID_COMPETENCE)
      references COMPETENCE (ID_COMPETENCE) on delete restrict on update restrict;

alter table GROUPE add constraint FK_AVOIR foreign key (ID_FORMATEUR)
      references FORMATEUR (ID_FORMATEUR) on delete restrict on update restrict;

alter table REALISER add constraint FK_REALISER foreign key (ID_APPRENANT)
      references APPRENANT (ID_APPRENANT) on delete restrict on update restrict;

alter table REALISER add constraint FK_REALISER2 foreign key (ID_BRIEF)
      references BRIEF (ID_BRIEF) on delete restrict on update restrict;
