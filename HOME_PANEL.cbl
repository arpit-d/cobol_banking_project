      ******************************************************************
      * Author: ARPIT D
      * Date: 06/12/22
      * Purpose: READ GADGET DATA & DISPLAY TOTAL VALUE IN FILE
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HOME-PANEL.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           select BANK-DB assign to "BANKDB.TXT"
           organization is relative
           access mode is random
           relative key is WS-IDX
           FILE STATUS IS WS-FILE-STAT.
       DATA DIVISION.
       FILE SECTION.
           FD BANK-DB.
           01 FD-BANK-RECORD.
               02 FD-BANK-ACCOUNT        PIC 9(8).
               02 FD-ACCT-NAME.
                   05 FD-FNAME            PIC X(20).
                   05 FD-LNAME            PIC X(30).
               02 FD-BALANCE              PIC 9(8).
               02 FD-IDX                  PIC 9(2).
       WORKING-STORAGE SECTION.
           01 WS-FILE-STAT         PIC 9(2).
           01 WS-USER-CHOICE       PIC 9.

           01 WS-BANK-RECORD.
               02 WS-BANK-ACCOUNT        PIC 9(8).
               02 WS-ACCT-NAME.
                   05 WS-FNAME            PIC X(20).
                   05 WS-LNAME            PIC X(30).
               02 WS-BALANCE              PIC 9(8).
               02 WS-IDX               PIC 9(2).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
       MAIN.
           PERFORM A0500-WELCOME-SCREEN.
           PERFORM A0750-SHOW-MENU.
           EVALUATE TRUE
               WHEN WS-USER-CHOICE = 1
                   CALL 'NEW-CUST-MOD'  USING REFERENCE WS-ACCT-NAME
                                                        WS-BANK-ACCOUNT

                   PERFORM A4000-WRAP-UP
               WHEN WS-USER-CHOICE = 2
                   PERFORM A5000-HANDLE-EXISTING-CUSTOMER
                   PERFORM A4000-WRAP-UP
               WHEN WS-USER-CHOICE = 0
                   PERFORM A4000-WRAP-UP
               WHEN OTHER
                   DISPLAY 'WRONG VALUE ENTERED, PLEASE TRY AGAIN'
                   PERFORM A0500-WELCOME-SCREEN
           END-EVALUATE.

           A5000-HANDLE-EXISTING-CUSTOMER.
               DISPLAY "WELCOME BACK, PLEASE ENTER YOUR BANK ACCT NO"
               ACCEPT WS-BANK-ACCOUNT.


           A0500-WELCOME-SCREEN.
               PERFORM S1000-DISPLAY-STARS
               DISPLAY "WELCOME TO THE BANK"
               PERFORM S1000-DISPLAY-STARS.

           A0750-SHOW-MENU.
               DISPLAY "PLEASE CHOOSE 1 OF THE BELOW"
               DISPLAY SPACES
               DISPLAY "> 1. NEW CUSTOMER"
               DISPLAY "> 2. EXISTING CUSTOMER"
               DISPLAY "> 0. EXIT"
               ACCEPT WS-USER-CHOICE.

           S1000-DISPLAY-STARS.
               DISPLAY '**************************'.

           A4000-WRAP-UP.
               OPEN OUTPUT BANK-DB
               IF WS-FILE-STAT = '00'
                   MOVE 1 TO WS-IDX
                   MOVE WS-BANK-RECORD TO FD-BANK-RECORD
                   DISPLAY 'FILE OPEEND'
                   DISPLAY FD-BANK-RECORD
                   WRITE FD-BANK-RECORD
                   CLOSE BANK-DB
               ELSE
                   DISPLAY "FILE NOT OPENED"
               END-IF
               DISPLAY "***BYE***"
               STOP RUN.

            a9000-test.
                  DISPLAY 'testttt'.
       END PROGRAM HOME-PANEL.
