       IDENTIFICATION DIVISION.
       PROGRAM-ID.  assure.
       AUTHOR. Bafode.

       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      * SPECIAL-NAMES.
      *    DECIMAL-POINT IS COMMA.

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
        01 REC-ASSU .
                 10  WS-ID-CLIENT         PIC X(8).
                 10  FILLER               PIC X.
                 10  WS-TYPE-ASSU         PIC X(13).
                 10  FILLER               PIC X.
                 10  WS-IRP               PIC X(14).
                 10  FILLER               PIC X.
                 10  WS-REGIME            PIC X(50).
                 10  FILLER               PIC X.
                 10  WS-STATUT            PIC X(8).
                 10  FILLER               PIC X.
                 10  WS-NUM-CONTRAT       PIC X(8).
                 10  FILLER               PIC X.
                 10  WS-NUM-CLIENT        PIC X(8).
                 10  FILLER               PIC X.
                 10  WS-MONTANT-PAYE      PIC X(10). 

           
       WORKING-STORAGE SECTION.
        01           WS-CPT               PIC 9(2).     
        01           WS-FILE-STATUS       PIC X(2).
            88       WS-STATE-START       VALUE 00.
            88       WS-STATE-END         VALUE 29.
                   
           
       PROCEDURE DIVISION.
 
       
      *****  Lecture ficher ********************************************
           OPEN INPUT  FIC-ASSU.
      *    OUTPUT FIC-RAPPORT-ASSU.
           perform  varying WS-CPT FROM 1 BY 1 UNTIL WS-STATE-END
           
           READ FIC-ASSU
               EVALUATE REC-ASSU
                   WHEN  WS-CPT = 3 move WS-CPT to REC-ASSU
                     DISPLAY REC-ASSU
                  WHEN WS-CPT = 7 move WS-CPT to REC-ASSU
                     DISPLAY REC-ASSU 
           END-EVALUATE
           END-PERFORM.   
           CLOSE FIC-ASSU.
               STOP RUN.           
         



           
      ******************************************************************     
      *     perform varying I FROM 1 BY 1 UNTIL I > 2
      *     display WS-TYPE-ASSU(I)
      *     end-perform.
      *     MOVE WS-ENREG TO WS-ASSU.
      *     DISPLAY WS-ID-CLIENT space ASSU-NAME.
      ******************************************************************
      *     perform varying I from 1 by 1 until I > 3
      *     display ENREG
      *     end-perform
      ******************************************************************
      *     DISPLAY ENREG.

           
           


      
      