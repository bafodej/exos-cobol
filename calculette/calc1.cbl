       IDENTIFICATION DIVISION.
       PROGRAM-ID.  calc1.
       AUTHOR. Bafode.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

        01 CHIFFRE1      PIC S9(5).
        01 CHIFFRE2      PIC S9(5).
        01 RESULTAT      PIC 9(4).
        01 OPERATEUR     PIC X.
     

        



       PROCEDURE DIVISION.
      *****       Récupération des  nombres et de l'opérateur.     *****
           DISPLAY  "Entrez un chiffre"                 
           ACCEPT CHIFFRE1.
           DISPLAY  "Entrez l'opérateur(+, -, *, /) :" 
           ACCEPT OPERATEUR.
           DISPLAY  "Entrez un autre chiffre"         
           ACCEPT CHIFFRE2.
          


      *****     Execution du code selon l'opérateur choisi         *****
           EVALUATE OPERATEUR
            WHEN "+" PERFORM ADDITION
            WHEN "-" PERFORM SOUSTRACTION
            WHEN "*" PERFORM MULTIPLICATION
            WHEN "/" PERFORM DIVISIOON
            WHEN OTHER DISPLAY "Opérateur non valide."
            END-EVALUATE

           DISPLAY "Le resultat est :" RESULTAT
           STOP RUN.
           
      *****       addition                                         *****    
       ADDITION.
           ADD CHIFFRE1 TO CHIFFRE2 GIVING RESULTAT.
           EXIT.
      *****       Soustraction                                     *****
       SOUSTRACTION.
           SUBTRACT CHIFFRE1 FROM CHIFFRE2 GIVING RESULTAT.
           EXIT.
      *****       Multiplication                                  ******
       MULTIPLICATION.
           MULTIPLY CHIFFRE1 BY CHIFFRE2 GIVING RESULTAT.
           EXIT.
      *****      DIVISION                                          *****
       DIVISIOON.
           IF CHIFFRE2 NOT = 0
             COMPUTE RESULTAT = CHIFFRE1 / CHIFFRE2
           ELSE 
             DISPLAY "Division par zero impossible."
           EXIT.
           
           
           
           

           

           





