       IDENTIFICATION DIVISION.
       PROGRAM-ID.  calc2.
       AUTHOR. Bafode.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01  calc2
           05 WS-NB1           PIC 999.
           05 WS-NB2           PIC 999.
           05 WS-OPERS         PIC X(1).
           05 WS-RESULT        PIC S9999.
           05 WS-RESULT-STOCKE PIC S9999.
           05 WS-CALC-ENCOURS  PIC X(30).
           05 WS-CONTINU       PIC X VALUE ('y,n').

       PROCEDURE DIVISION.   
           DISPLAY  "Entrez un nombe"        NO ADVANCING ACCEPT 
           WS-NB1.
           DISPLAY  "Entrez un opérateur"    NO ADVANCING ACCEPT 
           WS-OPERS.
           DISPLAY  "Entrez un autre nombre" NO ADVANCING ACCEPT 
           WS-NB2.
      ***************** choix opération***************************** 
       le-calcule.
           EVALUATE WS-OPERS.
             WHEN "+" ADD       WS-NB1 to WS-NB2.
             WHEN "-" SUBSTRACT WS-NB1 FROM WS-NB2.
             WHEN "*" MULTIPLY  WS-NB1 BY WS-NB2 GIVING WS-RESULT.
             WHEN "/" DIVIDE    WS-NB1 BY WS-NB2 GIVING WS-RESULT.
             WHEN OTHER DISPLAY "opérateur non reconnu.

      ************* continuer a calculer **************************
           DISPLAY "effectuer ce calcul (O or N ?)".
              IF WS-CONTINU  == ('O') THEN DISPLAY WS-RESULT.
              IF WS-CONTINU == ('N') THEN 
           SET   WS-RESULT to WS-RESULT-STOCKE.

           PERFORM le-calcule UNTIL WS-CONTINU == ('y')
           END-PERFORM.
           END IF.
           END-EVALUATE.



       