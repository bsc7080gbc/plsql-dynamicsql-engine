WHITEPAPER REGARDING DYNAMIC SQL USING GLOBAL TEMP TABLES AND OTHER NIFTY FEATURES

FILES INCLUDED
--------------

MAIN_BUILD

REQOBJ.SQL		
DYNSQL_ENGINE_HDR.SQL
DYNSQL_ENGINE_BODY.SQL
TESTAPI.SQL

DOCS

README.TXT
DYNSQLPRES.PDF
DYNSQLPRES.PPT
WHITEPAPER-DYNAMICSQL-WEBSERVICEINTEGRATION.PDF

DOCS => TESTCRIPT

TESTSCRIPT.SQL

APEX (OPTIONAL)

CRITDEMO_APEX.SQL

Note : APEX is Oracle Application Express. Download APEX from
http://technet.oracle.com and install to your desktop or laptop. 

After installing the core project here, go into APP mode on APEX
and import the CRITDEMO_APEX application. Then run the application
to perform a live test of the criteria grid functionality.


INSTALL
-------
1. Connect to desired Schema
2. Run REQOBJ.SQL
3. Compile DYNSQL_ENGINE_HDR.SQL, and then DYNSQL_ENGINE_BODY.SQL
4. Compile TESTAPI.SQL, which is a test function for use with APEX
5. Run TESTSCRIPT.SQL and change information as needed for testing,
however recommend try the APEX test utility CRITDEMO_APEX.

This script has been optimized for execution within in TOAD. Review script for added notes.

Note : Remember to issue a commit between tests to clear global temp table.

