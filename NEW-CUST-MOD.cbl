      ******************************************************************
      * Author: ARPIT D
      * Date: 12/12/22
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. NEW-CUST-MOD.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
           01 LS-BANK-ACCOUNT        PIC 9(8).
           01 LS-ACCT-NAME.
               02 LS-FNAME            PIC X(20).
               02 LS-LNAME            PIC X(30).
           01 LS-BALANCE             PIC 9(8).
           01 LS-IDX                 PIC 9(2) VALUE 1.

       PROCEDURE DIVISION USING LS-ACCT-NAME
                                LS-BANK-ACCOUNT
                                LS-BALANCE.


       MAIN-PROCEDURE.
           A1000-GET-USER-INFORMATION.
               DISPLAY 'WE ARE GLAD TO WELCOME YOU ONBOARD!!'
               DISPLAY SPACES
               DISPLAY 'FIRST NAME?'
               ACCEPT LS-FNAME
               DISPLAY 'WELCOME, ' LS-FNAME
               DISPLAY 'LAST NAME?'
               ACCEPT LS-LNAME
               DISPLAY 'ENTER INITIAL DEPOSIT'
               ACCEPT LS-BALANCE.

           A2000-GENERATE-ACCOUNT-NO.
              MOVE FUNCTION CURRENT-DATE(9:8) to LS-BANK-ACCOUNT.

       EXIT.
