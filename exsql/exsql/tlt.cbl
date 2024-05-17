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
       
       EXEC SQL BEGIN DECLARE SECTION END-EXEC.

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
       
         

       EXEC SQL END DECLARE SECTION END-EXEC.

       EXEC SQL INCLUDE SQLCA END-EXEC.
           
       PROCEDURE DIVISION.
       EXEC SQL 
           CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME
       END-EXEC. 
            IF  SQLCODE NOT = ZERO 
               PERFORM 1001-ERROR-RTN-START
                   THRU 1001-ERROR-RTN-END
           END-IF.
 

      ***** obtention de l'âge maximum                                  ********

       EXEC SQL 
           SELECT MAX(age) INTO :WS-AGE FROM databank
       END-EXEC. 

      

      ***** obtention de l'age minimum                                  ********

       EXEC SQL 
           SELECT MIN(age) INTO :WS-AGE FROM databank
       END-EXEC.

      

      ***** Obtention du  nombre d’individus par âge                    ********

       
       EXEC SQL
           DECLARE CURSAGE CURSOR FOR
           SELECT age , COUNT(*) AS Nbr
           FROM databank GROUP BY 
           age ORDER BY Nbr DESC
       END-EXEC.

       EXEC SQL OPEN CURSAGE END-EXEC.
       
           PERFORM F-CRAGE
           UNTIL SQLCODE NOT = 0.
      
           PERFORM VARYING WS-IDX FROM 1 BY 1 UNTIL WS-IDX = 32
           DISPLAY "Age: ", AGE(WS-IDX), " Count: ", CNT(WS-IDX)
           END-PERFORM.
       EXEC SQL CLOSE CURSAGE END-EXEC.
       
           PERFORM UPDATE-TABLE.
     

           STOP RUN. 


       F-CRAGE.
       EXEC SQL
       
       FETCH CURSAGE INTO :WS-AGE-ENT

       END-EXEC.
           
       UPDATE-TABLE.  
       
      ***** Mise à jour du code pays pays  BE vers FR                   ********

       EXEC SQL
       UPDATE databank
       SET country_code = 'BE'
       WHERE age > 35 AND age < 40 AND country_code = 'FR'
       END-EXEC.
                                     

       EXEC SQL
       UPDATE databank
       SET country = 'Belgique'
       WHERE country-code = 'BE' 
       END-EXEC.

      *****  Mise en majuscule le pays et la langue                     ********

       EXEC SQL
       UPDATE databank
       SET country = UPPER(country),
           spoken  = UPPER(spoken)
       END-EXEC.



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
                 EXEC SQL
                     ROLLBACK
                 END-EXEC
              WHEN  OTHER
                 DISPLAY "Undefined error"
                 DISPLAY "ERRCODE:" SPACE SQLSTATE
                 DISPLAY SQLERRMC
           END-EVALUATE.
       1001-ERROR-RTN-END.
           STOP RUN. 

