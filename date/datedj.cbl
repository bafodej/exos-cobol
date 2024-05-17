      ***** Affichage de la date du jour *******************************
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  datedj.
       AUTHOR. Bafode.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-DATE.
           05  WS-DATE-DU-JOUR.
              10  WS-ANNEE    PIC  9(4).
              10  WS-MOIS     PIC  9(2).
              10  WS-JOUR     PIC  9(2).
           05  WS-HEURE-ACTUEL.
              10  WS-HEURE    PIC  9(2).
              10  WS-MINUTE   PIC  9(2).
              10  WS-SECONDE  PIC  9(2).
           05  WS-FUSEAU      PIC S9(4).

       01  WS-FORMAT REDEFINES WS-DATE.
           05 WS-FORMAT-DATE  PIC 9(8).
           05 FILLER PIC X VALUE ':'.
           05 WS-FORMAT-HEURE PIC X(10).

           
       PROCEDURE DIVISION.
           MOVE FUNCTION CURRENT-DATE (1:8) TO WS-DATE-DU-JOUR.
           DISPLAY WS-FORMAT.
           