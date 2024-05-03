       IDENTIFICATION DIVISION.
       PROGRAM-ID. Isotest.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-MOT-TEST PIC X(20).
       01  WS-Lettre-O PIC 9(26) VALUE ZEROS.
       01  WS-Index PIC 9(2) VALUE ZEROS.
       01  WS-Isogram PIC X VALUE 'O'.

       PROCEDURE DIVISION.
       Display-Message.
           DISPLAY "Entrer un mot a tester : ".
           ACCEPT WS-MOT-TEST.

       Perform-Check.
           PERFORM VARYING WS-INDEX FROM 1 BY 1
               UNTIL WS-INDEX > LENGTH OF WS-MOT-TEST
               IF (WS-MOT-TEST(WS-Index:1) NOT EQUAL SPACE)
                   ADD WS-LETTRE-O((WS-MOT-TEST(WS-Index:1)) 
                   - ('A') + 1) = 
                       WS-LETTRE-O((WS-MOT-TEST(WS-Index:1))
                        - ('A') + 1) + 1
               END-IF
           END-PERFORM.

       VERIFICATION.
           PERFORM VARYING WS-Index FROM 1 BY 1
               UNTIL WS-Index > 26
               IF WS-LETTRE-O(WS-Index) > 1
                   MOVE 'N' TO WS-Isogram
               END-IF
           END-PERFORM.

       AFFICHAGE-FIN.
           IF WS-Isogram = 'O'
               DISPLAY "LE mot "WS-MOT-TEST "est un isogram."
           ELSE
               DISPLAY "Le mot "WS-MOT-TEST " n'est pas un isogram."
           END-IF.

       STOP RUN.
