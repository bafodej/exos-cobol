       IDENTIFICATION DIVISION.
       PROGRAM-ID.  depart.
       AUTHOR. Bafode.
       

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      * SPECIAL-NAMES.
      *    DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FIC-DEPT ASSIGN TO 'fr-liste-dept.txt'
           ORGANIZATION IS LINE SEQUENTIAL 
           ACCESS MODE  IS SEQUENTIAL.


           SELECT FIC-CLIENT ASSIGN TO 'fichierclient.txt'
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL.


       DATA DIVISION.
       FILE SECTION.


           COPY 'FCLIENT.cpy'.
           COPY 'FDEPT.cpy'.
      *    copy 'FSORTIE.cpy'.
                
           copy FCLIENT REPLACING ==R:CLIENT:==BY ==EMPLOYE==.

        
       WORKING-STORAGE SECTION.

        01           I                  PIC 99 VALUE 00.
        01           WS-FILE-STATUS     PIC XX.
            88       WS-STATE-OK               VALUE 00.
            88       WS-STATE-END-C            VALUE 20.
            88       WS-STATE-END-D            VALUE 101.

        01 EMPLOYE PIC x(72).
        01 WS-TAB-EMPLOYE REDEFINES EMPLOYE.
           03 EMPLOYE-ID      PIC X(8).
           03 EMPLOYE-NOM     PIC X(20).
           03 EMPLOYE-PRENOM  PIC X(20).
           03 EMPLOYE-POSTE   PIC X(14).
           03 EMPLOYE-SALAIRE PIC X(7).
           03 EMPLOYE-AGENCE  PIC X(3).
      *  01 REC-DEPART PIC X(52).
            
           

        01 F-CLIENT.
           05 CODE-CLT    PIC X(8).
           05 NOM-CLT     PIC x(20).
           05 PRENOM-CLT  PIC X(20).
           05 METIER-CLT  PIC X(14).
           05 SALAIRE-CLT PIC X(11).
      *    COPY FCLISORTIE.
       PROCEDURE DIVISION.
      * Lecture-fichier-client.
      ***** Lecture du fichier client ****************************** 
           OPEN INPUT FIC-CLIENT.
           perform  varying I FROM 1 BY 1 
           UNTIL 20
           READ FIC-CLIENT
           END-PERFORM.
           CLOSE FIC-CLIENT.
           STOP RUN.



      * Lecture-fichier-departement.     
      ***** Lecture du fichier departement *************************
           OPEN INPUT FIC-DEPT.
           perform  varying I FROM 1 BY 1 
           UNTIL 101
           READ FIC-DEPT
           END-PERFORM.
           CLOSE FIC-DEPT.
           STOP RUN.
           

