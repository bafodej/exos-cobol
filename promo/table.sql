CREATE DATABASE 'school';

   CREATE TABLE STUDENT
            (
       ID        SERIAL,
       LASTNAME  CHAR(35) NOT NULL DEFAULT 'DUPOND',
       FIRSTNAME CHAR(35) NOT NULL DEFAULT 'MonsieurMadame',
       AGE       SMALLINT(3) NOT NULL DEFAULT 99,
       CONSTRAINT STUDENT_ID_0 PRIMARY KEY (ID)
            );
    CREATE TABLE COURSE
           (
               ID        SERIAL,
               G-LABEL     CHAR(35) NOT NULL DEFAULT 'Manquant',
               G-COEF      NUMERIC(3,1) NOT NULL DEFAULT 1,
               G-GRADE     DECIMAL(2,2),
               CONSTRAINT COURSE_ID_0 PRIMARY KEY (ID)
               );


    CREATE TABLE GRADE
           (
       LABEL     CHAR(35) NOT NULL DEFAULT 'Manquant',
       COEF      NUMERIC(3,1) NOT NULL DEFAULT 1,

       CONSTRAINT COURSE_ID_0 PRIMARY KEY (ID)
           );                            