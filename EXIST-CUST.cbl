      ******************************************************************
      * Author: ARPIT D
      * Date: 12/12/22
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXIST-CUST.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 WS-USER-CHOICE         PIC 9.
           01 WS-INPUT-AMOUNT        PIC 9(8).
           01 WS-BAL-AFTR-PROC       PIC $$$$$$$9.
       LINKAGE SECTION.
           01 LS-BANK-ACCOUNT        PIC 9(8).
           01 LS-ACCT-NAME.
               2 LS-FNAME            PIC X(20).
               2 LS-LNAME            PIC X(30).
           01 LS-BAL                 PIC 9(8).
           01 LS-IDX                 PIC 9(2) VALUE 1.

       PROCEDURE DIVISION USING LS-BAL
                                LS-BANK-ACCOUNT.


       MAIN-PROCEDURE.

       MAIN.
           A1000-DISPLAY-USER-MENU.

               DISPLAY "PLEASE CHOOSE 1 OF THE BELOW"
               DISPLAY SPACES
               DISPLAY "> 1. WITHDRAW"
               DISPLAY "> 2. DEPOSIT"
               DISPLAY "> 3. CHECK BALANCE"
               DISPLAY "> 4. GO BACK"
               ACCEPT WS-USER-CHOICE.
               EVALUATE WS-USER-CHOICE
                   WHEN 1
                   WHEN 2
                       PERFORM A2000-PROCESS-WITH-AND-DEP
                   WHEN 3
                       PERFORM A9000-DISPLAY-BALANCE
                       PERFORM A1000-DISPLAY-USER-MENU
                   WHEN 0
                   WHEN 4
                       DISPLAY "GOING BACK TO HOME PANEL"
                       EXIT
                       GOBACK.

           A2000-PROCESS-WITH-AND-DEP.
               DISPLAY "ENTER AMOUNT TO WITHDRAW"
               ACCEPT WS-INPUT-AMOUNT
               IF WS-INPUT-AMOUNT EQUALS ZEROES
                   DISPLAY "INVALID VALUE ENTERED. PLEASE TRY AGAIN"
                   PERFORM MAIN
               ELSE
                   IF WS-USER-CHOICE = 1
                      IF WS-INPUT-AMOUNT > LS-BAL
                        DISPLAY "CAN'T WITHDRAW MORE THAN ACCNT BALANCE"
                      ELSE
                       COMPUTE LS-BAL = LS-BAL - WS-INPUT-AMOUNT
                       DISPLAY "SUCCESFULLY WITHDRAWED"
                      END-IF
                   ELSE
                       COMPUTE LS-BAL = LS-BAL + WS-INPUT-AMOUNT
                       DISPLAY "SUCCESFULLY DEPOSITED"
                   END-IF
               PERFORM A9000-DISPLAY-BALANCE
               END-IF
               PERFORM A1000-DISPLAY-USER-MENU.

           A9000-DISPLAY-BALANCE.
               MOVE LS-BAL TO WS-BAL-AFTR-PROC
               DISPLAY "CURRENT BALANCE IS " WS-BAL-AFTR-PROC

       EXIT.
