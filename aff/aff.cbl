      ******************************************************************
      *    Programme simple visant a affecter une valeur au variables  *
      *    préalablement déclaré et a affiché la valeur.               *
      *                                                                *
      ******************************************************************       
          
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  aff.
       AUTHOR. Bafode.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION. 

        01 id-client         PIC 9(8). 
        01 prenom-client     PIC X(10).
        01 profession-client PIC X(17).
        01 email-client      PIC X(26).
        01 code-postale      PIC 9(5).
        01 salaire-client    PIC 9(8).


       PROCEDURE DIVISION.

           MOVE "59050287"                TO id-client.
           MOVE "Oliveur"                 TO prenom-client.
           MOVE "Mecanicien"              TO profession-client.
           MOVE "59008"                   TO code-postale.
           MOVE "Solange.Oliveur@pro.com" TO email-client.
           MOVE "00120000"                TO salaire-client.



           DISPLAY id-client prenom-client profession-client
     -      code-postale email-client salaire-client.
          

           STOP RUN.

