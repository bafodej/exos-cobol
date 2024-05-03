       IDENTIFICATION DIVISION.
       PROGRAM-ID. assurer.
       AUTHOR. Bafode.

       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FIC-ASSU ASSIGN TO 'assurances.dat'
           ORGANIZATION IS LINE SEQUENTIAL 
           ACCESS MODE  IS SEQUENTIAL
           FILE STATUS IS WS-FILE-STATUS.


       DATA DIVISION.
       FILE SECTION.
       FD  FIC-ASSU
           RECORD CONTAINS 121 CHARACTERS
           RECORDING MODE IS F.   

        01 REC-ASSU.
              06     WS-ID-CLIENT         PIC X(8).
              06     FILLER               PIC X.
              06     WS-TYPE-ASSU         PIC X(13).
              06     FILLER               PIC X.
              06     WS-IRP               PIC X(14).
              06     FILLER               PIC X.
              06     WS-REGIME            PIC X(50).
              06     FILLER               PIC X.
              06     WS-STATUT            PIC X(8).
              06     FILLER               PIC X.
              06     WS-NUM-CONTRAT       PIC X(8).
              06     FILLER               PIC X.
              06     WS-NUM-CLIENT        PIC X(8).
              06     FILLER               PIC X.
              06     WS-MONTANT-PAYE      PIC X(10). 

           
       WORKING-STORAGE SECTION.
      ***** Variables compteur  et File-Status *******************
        01           WS-CPT               PIC 9(2) VALUE 1.     
        01           WS-FILE-STATUS       PIC X(2).
            88       WS-STATE-OK          VALUE 00.
            88       WS-STATE-END         VALUE 10.
                   
           
       PROCEDURE DIVISION.
 
       
      ***** Overture et  lecture ficher du fichier*******
           OPEN INPUT FIC-ASSU
           PERFORM  UNTIL WS-STATE-END
             
      ***** Lecture du fichier 
             READ FIC-ASSU INTO REC-ASSU
      ***** Indication fin de fichier       
               AT END
                      MOVE '10' TO WS-FILE-STATUS
                     
      ***** Incrémentation du compteur si non fin de fichier                 
                   NOT AT END
                    ADD 1 TO WS-CPT

           
      ***** Afichage des ligne 3 et 7     
               EVALUATE TRUE
                   WHEN  WS-CPT = 3
                     DISPLAY "ID-client" WS-ID-CLIENT,
                             "Nom:" WS-TYPE-ASSU,
                             "IRP:" WS-IRP,
                             "REGIME" WS-REGIME,
                             "Statut" WS-STATUT,
                             "NUM CONTRAT" WS-NUM-CONTRAT,
                             "NUM client" WS-NUM-CLIENT,
                             "Montant payé" WS-MONTANT-PAYE

                            

                  WHEN WS-CPT = 7
                     DISPLAY "ID-client" WS-ID-CLIENT,
                             "Nom:" WS-TYPE-ASSU,
                             "IRP:" WS-IRP,
                             "REGIME" WS-REGIME,
                             "Statut" WS-STATUT,
                             "NUMERO Contrat" WS-NUM-CONTRAT,
                             "NUM client" WS-NUM-CLIENT,
                             "Montant Payé" WS-MONTANT-PAYE

                    WHEN OTHER CONTINUE
              END-EVALUATE
           END-PERFORM.



           CLOSE FIC-ASSU.
           STOP RUN.


           
           


      
      