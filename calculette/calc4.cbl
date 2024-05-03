       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULATRICE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01 NUM1            PIC 9(5).
        01 NUM2            PIC 9(5).
        01 RESULTAT        PIC 9(7).
        01 OPERATEUR       PIC X(1).
       
       PROCEDURE DIVISION.
       DEBUT.
           DISPLAY "Bienvenue dans la calculatrice COBOL."
           ACCEPT NUM1
           ACCEPT OPERATEUR
           ACCEPT NUM2

           EVALUATE OPERATEUR
            WHEN "+" PERFORM ADDITION
            WHEN "-" PERFORM SOUSTRACTION
            WHEN "*" PERFORM MULTIPLICATION
            WHEN "/" PERFORM DIVISIOON
            WHEN OTHER DISPLAY "Opérateur non valide."
            END-EVALUATE

           DISPLAY "Le résultat est : " RESULTAT
           STOP RUN.

       ADDITION.
           COMPUTE RESULTAT = NUM1 + NUM2.
           EXIT.

       SOUSTRACTION.
           COMPUTE RESULTAT = NUM1 - NUM2.
           EXIT.

       MULTIPLICATION.
           COMPUTE RESULTAT = NUM1 * NUM2.
           EXIT.

       DIVISIOON.
           IF NUM2 NOT = 0
            COMPUTE RESULTAT = NUM1 / NUM2
           ELSE
            DISPLAY "Division par zéro impossible."
            END-IF.
            EXIT.
