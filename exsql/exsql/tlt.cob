      * ************************************************************************                                                                
      * Programme cobol/ Psql executer le programme depuis le terminal                                                         
      * qui permet d'accèder aux données ,d'afficher l'age max/min et le                                                                
      * nombre d'individus par age                                                                 
      *                                                                 
      *                                                                 
      *                                                                 
      **************************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. tlt.
       AUTHOR. Bafodé.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC.

       01  DBNAME               PIC X(20)    VALUE "nom".
       01  USERNAME             PIC X(20)    VALUE "cobol".
       01  PASSWD               PIC X(10)    VALUE SPACE.

       01  WS-IDX               PIC 99.

        01 PHRASE.
           05 PH-COUNTRY-CODE   PIC X(50).
           05 PH-PHRASE         PIC X(50).

       01  DATABANK.
           05 WS-FIRST-NAME     PIC X(50).
           05 WS-LAST-NAME      PIC X(50).
           05 WS-EMAIL          PIC X(50).
           05 WS-GENDER         PIC X(50).
           05 WS-AGE            PIC 9(10).   
           05 WS-SPOKEN         PIC X(50).
           05 WS-COUNTRY        PIC X(50).
           05 WS-COUNTRY-CODE   PIC X(50).
           05 WS-INFO-PHONE     PIC X(50).  
 
       01  AGE-TABLE.
           05  WS-AGE-ENT OCCURS 100 TIMES.
               10  CNT          PIC 99.
               10  AGE          PIC 99.
       
         

OCESQL*EXEC SQL END DECLARE SECTION END-EXEC.

OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC.
OCESQL     copy "sqlca.cbl".
           
OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(029) VALUE "SELECT MAX(age) FROM databank".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(029) VALUE "SELECT MIN(age) FROM databank".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0003.
OCESQL     02  FILLER PIC X(074) VALUE "SELECT age, COUNT( * ) AS Nbr "
OCESQL  &  "FROM databank GROUP BY age ORDER BY Nbr DESC".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0004.
OCESQL     02  FILLER PIC X(091) VALUE "UPDATE databank SET country_co"
OCESQL  &  "de = 'BE' WHERE age > 35 AND age < 40 AND country_code = '"
OCESQL  &  "FR'".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0005.
OCESQL     02  FILLER PIC X(066) VALUE "UPDATE databank SET country = "
OCESQL  &  "'Belgique' WHERE country-code = 'BE'".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0006.
OCESQL     02  FILLER PIC X(068) VALUE "UPDATE databank SET country = "
OCESQL  &  "UPPER(country), spoken = UPPER(spoken)".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       PROCEDURE DIVISION.
OCESQL*EXEC SQL 
OCESQL*    CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME
OCESQL*END-EXEC. 
OCESQL     CALL "OCESQLConnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE USERNAME
OCESQL          BY VALUE 20
OCESQL          BY REFERENCE PASSWD
OCESQL          BY VALUE 10
OCESQL          BY REFERENCE DBNAME
OCESQL          BY VALUE 20
OCESQL     END-CALL.
            IF  SQLCODE NOT = ZERO 
               PERFORM 1001-ERROR-RTN-START
                   THRU 1001-ERROR-RTN-END
           END-IF.
 

      ***** obtention de l'âge maximum                                  ********

OCESQL*EXEC SQL 
OCESQL*    SELECT MAX(age) INTO :WS-AGE FROM databank
OCESQL*END-EXEC. 
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-AGE
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecSelectIntoOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0001
OCESQL          BY VALUE 0
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

      

      ***** obtention de l'age minimum                                  ********

OCESQL*EXEC SQL 
OCESQL*    SELECT MIN(age) INTO :WS-AGE FROM databank
OCESQL*END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-AGE
OCESQL     END-CALL
OCESQL     CALL "OCESQLExecSelectIntoOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0002
OCESQL          BY VALUE 0
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

      

      ***** Obtention du  nombre d’individus par âge                    ********

       
OCESQL*EXEC SQL
OCESQL*    DECLARE CURSAGE CURSOR FOR
OCESQL*    SELECT age , COUNT(*) AS Nbr
OCESQL*    FROM databank GROUP BY 
OCESQL*    age ORDER BY Nbr DESC
OCESQL*END-EXEC.
OCESQL     CALL "OCESQLCursorDeclare" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "tlt_CURSAGE" & x"00"
OCESQL          BY REFERENCE SQ0003
OCESQL     END-CALL.

OCESQL*EXEC SQL OPEN CURSAGE END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "tlt_CURSAGE" & x"00"
OCESQL     END-CALL.
       
           PERFORM F-CRAGE
           UNTIL SQLCODE NOT = 0.
      
           PERFORM VARYING WS-IDX FROM 1 BY 1 UNTIL WS-IDX = 32
           DISPLAY "Age: ", AGE(WS-IDX), " Count: ", CNT(WS-IDX)
           END-PERFORM.
OCESQL*EXEC SQL CLOSE CURSAGE END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "tlt_CURSAGE" & x"00"
OCESQL     END-CALL
OCESQL    .
       
           PERFORM UPDATE-TABLE.
     

           STOP RUN. 


       F-CRAGE.
OCESQL*EXEC SQL
OCESQL*
OCESQL*FETCH CURSAGE INTO :WS-AGE-ENT
OCESQL*FETCH CURSAGE INTO :WS-AGE-ENT
OCESQL*END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 2
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE CNT(1)
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 2
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE AGE(1)
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetHostTable" USING
OCESQL          BY VALUE 100
OCESQL          BY VALUE 4
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOccurs" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "tlt_CURSAGE" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
           
       UPDATE-TABLE.  
       
      ***** Mise à jour du code pays pays  BE vers FR                   ********

OCESQL*EXEC SQL
OCESQL*UPDATE databank
OCESQL*SET country_code = 'BE'
OCESQL*WHERE age > 35 AND age < 40 AND country_code = 'FR'
OCESQL*END-EXEC.
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0004
OCESQL     END-CALL.
                                     

OCESQL*EXEC SQL
OCESQL*UPDATE databank
OCESQL*SET country = 'Belgique'
OCESQL*WHERE country-code = 'BE' 
OCESQL*END-EXEC.
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0005
OCESQL     END-CALL.

      *****  Mise en majuscule le pays et la langue                     ********

OCESQL*EXEC SQL
OCESQL*UPDATE databank
OCESQL*SET country = UPPER(country),
OCESQL*    spoken  = UPPER(spoken)
OCESQL*END-EXEC.
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE SQ0006
OCESQL     END-CALL.



      *****     Gestion d'erreurs                                       ********
       1001-ERROR-RTN-START.
           DISPLAY "*** SQL ERROR ***".
           DISPLAY "SQLCODE: " SQLCODE SPACE.
           EVALUATE SQLCODE
              WHEN  +100
                 DISPLAY "Record not found"
              WHEN  -01
                 DISPLAY "Connection failed"
              WHEN  -20
                 DISPLAY "Internal error"
              WHEN  -30
                 DISPLAY "PostgreSQL error"
                 DISPLAY "ERRCODE:" SPACE SQLSTATE
                 DISPLAY SQLERRMC
              *> TO RESTART TRANSACTION, DO ROLLBACK.
OCESQL*          EXEC SQL
OCESQL*              ROLLBACK
OCESQL*          END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "ROLLBACK" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
              WHEN  OTHER
                 DISPLAY "Undefined error"
                 DISPLAY "ERRCODE:" SPACE SQLSTATE
                 DISPLAY SQLERRMC
           END-EVALUATE.
       1001-ERROR-RTN-END.
           STOP RUN. 



