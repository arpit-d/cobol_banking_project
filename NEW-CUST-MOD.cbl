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
               2 LS-FNAME            PIC X(20).
               2 LS-LNAME            PIC X(30).

       PROCEDURE DIVISION USING LS-ACCT-NAME
                                LS-BANK-ACCOUNT.

       MAIN-PROCEDURE.
           A1000-GET-USER-INFORMATION.
               DISPLAY 'WE ARE GLAD TO WELCOME YOU ONBOARD!!'
               DISPLAY SPACES
               DISPLAY 'FIRST NAME?'
               ACCEPT LS-FNAME
               DISPLAY 'WELCOME, ' LS-FNAME
               DISPLAY 'LAST NAME?'
               ACCEPT LS-LNAME.

           A2000-GENERATE-ACCOUNT-NO.
              MOVE FUNCTION CURRENT-DATE(9:8) to LS-BANK-ACCOUNT.

           A3000-SAVE-ACCOUNT-TO-FILE.
                  DISPLAY spaces.


       EXIT.
