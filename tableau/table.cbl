       IDENTIFICATION DIVISION.
       PROGRAM-ID.  table.
       AUTHOR. Bafode.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  TEST-DATA.
           03 FILLER   PIC X(33) VALUE "0001HOKKAI    TARO      0400".
           03 FILLER   PIC X(33) VALUE "0002AOMORI    JIRO      0350".
           03 FILLER   PIC X(33) VALUE "0003AKITA     SABURO    0300".
           03 FILLER   PIC X(33) VALUE "0004IWATE     SHIRO     0900".
           03 FILLER   PIC X(33) VALUE "0005MIYAGI    GORO      0200".
           03 FILLER   PIC X(33) VALUE "0006FUKUSHIMA RIKURO    0150".
           03 FILLER   PIC X(33) VALUE "0007TOCHIGI   SHICHIRO  0100".
           03 FILLER   PIC X(33) VALUE "0008IBARAKI   HACHIRO   1050".
           03 FILLER   PIC X(33) VALUE "0009GUMMA     KURO      0200".
           03 FILLER   PIC X(33) VALUE "0010SAITAMA   JURO      0350".

       01  WS-TBL REDEFINES TEST-DATA.
            03 WS-PERSO OCCURS 10 TIMES.
               05 WS-ID         PIC 9(4).
               05 WS-CODE       PIC X(12).
               05 WS-NOM        PIC X(13).
               05 WS-POINT      PIC 9(4).


       01  I                  PIC 99 VALUE 1.

       PROCEDURE DIVISION.
           
           PERFORM  VARYING I FROM 1 BY 1 UNTIL I > 10
           

           DISPLAY "Resultat:" SPACE I SPACE ':'
           DISPLAY SPACE SPACE SPACE SPACE 'ID'
              SPACE WS-ID OF WS-TBL (I) 
           DISPLAY SPACE SPACE SPACE SPACE 'NOM' 
            SPACE WS-NOM OF WS-TBL (I) 
            DISPLAY SPACE SPACE SPACE SPACE 'SCORE' 
            SPACE WS-POINT OF WS-TBL (I) 
      
           

                  WS-ID     OF   WS-PERSO(I)
                  WS-CODE   OF   WS-PERSO(I)
                  WS-NOM    OF   WS-PERSO(I)
                  WS-POINT  OF   WS-PERSO(I)
           
           END-PERFORM.
           
           STOP RUN.
           


