       IDENTIFICATION DIVISION.
       PROGRAM-ID. promo.
       AUTHOR. LOL.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT F-INPUT
               ASSIGN TO 'input.dat'
               ACCESS MODE IS SEQUENTIAL
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS F-INPUT-STATUS.

           SELECT F-OUTPUT
               ASSIGN TO 'output.dat'
               ACCESS MODE IS SEQUENTIAL
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS F-OUTPUT-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  F-INPUT
           RECORD CONTAINS 2 TO 1000 CHARACTERS
           RECORDING MODE IS V.

       01  REC-F-INPUT-2       PIC 9(02).

       01  REC-STUDENT.
           03 R-S-KEY          PIC 9(02).
           03 R-LASTNAME       PIC X(07).
           03 R-FIRSTNAME      PIC X(06).
           03 R-AGE            PIC 9(02).
           66 R-NAME RENAMES R-LASTNAME THRU R-FIRSTNAME.

       01  REC-COURSE.
           03 R-C-KEY          PIC 9(02).
           03 R-LABEL          PIC X(21).
           03 R-COEF           PIC X(3).
           03 R-GRADE          PIC X(5).

       FD  F-OUTPUT
           RECORD CONTAINS 250 CHARACTERS
           RECORDING MODE IS F.

       01  REC-F-OUTPUT        PIC X(200).

       WORKING-STORAGE SECTION.
       01  F-INPUT-STATUS PIC X(02) VALUE SPACE.
           88 F-INPUT-STATUS-OK  VALUE '00'.
           88 F-INPUT-STATUS-EOF VALUE '10'.

       01  F-OUTPUT-STATUS      PIC X(02)   VALUE SPACE .
           88 F-OUTPUT-STATUS-OK    VALUE '00'.
           88 F-OUTPUT-STATUS-EOF   VALUE '10'.

       01  WS-IND-ID2           PIC 99.
       01  WS-ID2-TAB  OCCURS 1 TO 99 DEPENDING WS-NB-COURSES
                       INDEXED BY IDX-ID2.
           03 WS-ID2-ID          PIC 99.
           03 WS-ID2-GRADE       PIC Z9,99.

       01  WS-IND-CO            PIC 99 VALUE 0.
       01  WS-NEW-COURSE        PIC X(21) .
       01  WS-COURSES.
           03  WS-NB-COURSES          PIC 99 VALUE 0.
           03  WS-COURSE-TAB  OCCURS 1 TO 99
                              DEPENDING WS-NB-COURSES
                              INDEXED BY IDX-COURSE.
              05 WS-COURSE-ID       PIC 99.
              05 WS-COURSE-NAME     PIC X(21).
              05 WS-COURSE-COEF     PIC 9V9.
              05 WS-COURSE-AVG      PIC 9(3)V99   VALUE 0.
              05 WS-COURSE-DIV      PIC 99        VALUE 0.

       01  WS-IND-ST       PIC 99 VALUE 0.
       01  WS-NEW-STUDENT  PIC 9  VALUE 0.
       01  WS-STUDENTS.
           03  WS-NB-STUDENTS  PIC 99 VALUE 0 .
           03  WS-STUDENT-TAB  OCCURS 1 TO 99
                             DEPENDING WS-NB-STUDENTS
                             INDEXED BY IDX-STUDENT.
              05 WS-STUDENT-ID       PIC 99.
              05 WS-STUDENT-NAME     PIC X(13).
              05 WS-STUDENT-AGE      PIC 99.
              05 WS-STUDENT-AVG      PIC 999V99.

       01  WS-IND-CL PIC 99 VALUE 0.
       01  WS-ID1    PIC 99 VALUE 0.
       01  WS-ID2    PIC 99 VALUE 0.

       01  WS-CLASS.
           03  WS-NB-RECORDS PIC 999 VALUE 0.
           03  WS-CLASS-TAB  OCCURS 1 TO 999
                             DEPENDING   WS-NB-RECORDS
                             ASCENDING KEY WS-CLASS-ID1
                                           WS-CLASS-ID2
                             INDEXED BY IDX-CLASS.
              05 WS-CLASS-ID1   PIC 99.
              05 WS-CLASS-ID2   PIC 99.
              05 WS-CLASS-GRADE PIC 99V99.

       01  WS-CLASS-DIV         PIC 99V99    VALUE 0 .
       01  WS-STUDENT-DIV       PIC 99V99    VALUE 0 .
       01  WS-LINE-RAP          PIC X(250).

       01  WS-CLASS-AVG         PIC 999V99   VALUE 0.

       01  WS-CLASS-AVG-LINE     PIC Z9,99.
       01  WS-COURSE-AVG-LINE    PIC 99,99.
       01  WS-COURSE-COEF-LINE   PIC 9,9.
       01  WS-NB-STUDENTS-LINE-1 PIC Z9.
       01  WS-STUDENT-AVG-LINE   PIC Z9,99.

       01  WS-COLONNE    PIC X(3)    VALUE ' | '.
       01  WS-BLANC30    PIC X(30)   VALUE SPACES.
       01  WS-BLANC7     PIC X(7)    VALUE SPACES.
       01  WS-BLANC8     PIC X(8)    VALUE SPACES.
       01  WS-BLANC20    PIC X(20)   VALUE SPACES.
       01  WS-TITRE      PIC X(50)   VALUE 'REPORT OF COBOLP3 CLASS'.

       01  WS-STUDENT-LINE PIC X(22) VALUE 'STUDENT'.
       01  WS-AVG-LINE     PIC X(20) VALUE 'AVERAGE'.
       01  WS-COEF-LINE    PIC X(10) VALUE 'COEF: '.
       01  WS-COURSE1-LINE PIC X(200).
       01  WS-COURSE2-LINE PIC X(200).

       01  WS-NB-STUDENTS-LINE    PIC X(13)   VALUE 'NB STUDENTS :'.

       PROCEDURE DIVISION.
           CALL 'initialize' SET ADDRESS OF INITIALIZE-START.
           CALL 'open-files' SET ADDRESS OF OPEN-FILES-START.
           CALL 'read-file' SET ADDRESS OF READ-FILE-START.

           PERFORM UNTIL (F-INPUT-STATUS-EOF)
               EVALUATE (REC-F-INPUT-2)
                    WHEN '01'
                          CALL 'load-student' SET ADDRESS OF 
                                              LOAD-STUDENT-START
                    WHEN '02'
                          CALL 'load-course' SET ADDRESS OF 
                                             LOAD-COURSE-START
                    WHEN OTHER
                       DISPLAY 'The record type' SPACE
                       REC-F-INPUT-2 SPACE 'is not managed.'
                       'Program stop!'
                       CALL 'close-files' SET ADDRESS OF 
                                          CLOSE-FILES-START
                       GO TO 0010-STOP-PRG
               END-EVALUATE
               CALL 'read-file' SET ADDRESS OF READ-FILE-START
           END-PERFORM.

           CALL 'close-files' SET ADDRESS OF CLOSE-FILES-START.
           CALL 'calc-avg' SET ADDRESS OF CALC-AVG-START.
           CALL 'write-output' SET ADDRESS OF WRITE-OUTPUT-START.

       0010-STOP-PRG.
           STOP RUN.