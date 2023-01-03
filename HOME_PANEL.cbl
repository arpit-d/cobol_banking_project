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
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 WS-USER-CHOICE       PIC 9.
               88 WS-NEW-CUST       VALUE 1.
               88 WS-EXISTING-CUST  VALUE 2.
               88 WS-EXIT           VALUE 0.

           01 WS-BANK-DB-TABLE.
               02 WS-BANK-RECORD OCCURS 50 TIMES INDEXED BY I.
                   03 WS-BANK-ACCOUNT         PIC 9(8).
                   03 WS-ACCT-NAME.
                       05 WS-FNAME            PIC X(20).
                       05 WS-LNAME            PIC X(30).
                   03 WS-BALANCE              PIC 9(8).

           01 WS-IDX                      PIC 9(2) VALUE 01.

           01 WS-IN-ACCT                  PIC 9(8).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
       MAIN.
           PERFORM A0500-WELCOME-SCREEN.
           PERFORM A0750-SHOW-MENU.
           EVALUATE TRUE
               WHEN WS-NEW-CUST
                   CALL 'NEW-CUST-MOD'  USING REFERENCE
                                           WS-ACCT-NAME(WS-IDX)
                                           WS-BANK-ACCOUNT(WS-IDX)
                                           WS-BALANCE(WS-IDX)
                   DISPLAY WS-BANK-RECORD(WS-IDX)

                   COMPUTE WS-IDX = WS-IDX + 1
                   PERFORM MAIN
               WHEN WS-EXISTING-CUST
                   PERFORM A5000-HANDLE-EXISTING-CUSTOMER
                   PERFORM MAIN
               WHEN WS-EXIT
                   PERFORM A4000-WRAP-UP
               WHEN OTHER
                   DISPLAY 'WRONG VALUE ENTERED, PLEASE TRY AGAIN'
                   PERFORM MAIN
           END-EVALUATE.

           A5000-HANDLE-EXISTING-CUSTOMER.
           *>SETTING INDEX VALUE TO 1 SO THAT SEARCH ALWAYS STARTS
           *>FROM 1 AND NOT THE CURRENT VALUE OF INDEX
               SET I TO 1
               DISPLAY "WELCOME BACK, PLEASE ENTER YOUR BANK ACCT NO"
               ACCEPT WS-IN-ACCT
               SEARCH WS-BANK-RECORD
                   AT END
                       DISPLAY "BANK RECORD DOES NOT EXIST"
                   WHEN WS-BANK-ACCOUNT(I) = WS-IN-ACCT

                       CALL 'EXIST-CUST'  USING REFERENCE
                                           WS-BALANCE(I)
                                           WS-BANK-ACCOUNT(I)
               END-SEARCH.

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
               EVALUATE WS-USER-CHOICE
                   WHEN 1
                       SET WS-NEW-CUST TO TRUE
                   WHEN 2
                       SET WS-EXISTING-CUST TO TRUE
                   WHEN 0
                       SET WS-EXIT TO TRUE.

           S1000-DISPLAY-STARS.
               DISPLAY '**************************'.

           A4000-WRAP-UP.
               DISPLAY "***BYE***"
               STOP RUN.


       END PROGRAM HOME-PANEL.
