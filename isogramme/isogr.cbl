       IDENTIFICATION DIVISION.
       PROGRAM-ID. Isogr.

        DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-MOT PIC X(20).
       01  WS-MOT-S REDEFINES WS-MOT PIC X(20).
       01  WS-Isogram PIC X VALUE 'O'.
       01  Index1 PIC 9(2) VALUE ZEROS.
       01  Index2 PIC 9(2) VALUE ZEROS.

       PROCEDURE DIVISION.
       AFICCHAGE-Message.
           DISPLAY "Enter a un mot : ".
           ACCEPT WS-MOT.

       VERIFICATION-Isogram.
           PERFORM VARYING Index1 FROM 1 BY 1
               UNTIL Index1 > LENGTH OF WS-MOT-S - 1
               PERFORM VARYING Index2 FROM Index1 BY 1
                   UNTIL Index2 > LENGTH OF WS-MOT-S
                   IF WS-MOT-S(Index1:1) = WS-MOT-S(Index2:1)
                       MOVE 'N' TO WS-Isogram
                    ELSE MOVE 'O' TO WS-ISOGRAM 
                       EXIT PERFORM
                   END-IF
               END-PERFORM

               

           IF WS-ISOGRAM = 'N' DISPLAY "Le mot " WS-MOT "nest pas iso"

           ELSE IF  WS-ISOGRAM ='O'
           DISPLAY "Le mot" (WS-MOT) "est bien un isogramme"
                   EXIT PERFORM
               END-IF

           END-PERFORM.
         