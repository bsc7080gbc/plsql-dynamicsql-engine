DECLARE
/*

Script is optimized for execution in TOAD.

Input Parameters :
    l_dynamic_column_list   =>  [STRING]    If Y, it will read column_list array submitted
                                            for columns to return, otherwise it will read from table
                                            the assigned columns to the feed
    l_user_refcursor        =>  [STRING]    If Y, it will read refcursor info otherwise uses associative array entries
    l_email_flag            =>  [STRING]    Required. Y/N to gen email containing SQL executed.
    l_smtp_server           =>  [STRING]    Required if l_email_flag = Y. SMTP Server name.
    l_domain                =>  [STRING]    Required "  ". Server Domain.
    l_from_email            =>  [STRING]    Required "  ". Sender email address.
    l_from_name             =>  [STRING]    Required "  ". Text Name of Sender e.g. Barry Chase.
    l_to_email              =>  [STRING]    Required "  ". Recipient email address.
    l_test_case             =>  [STRING]    Required. Test Case to execute.
    l_mode                  =>  [STRING]    Required. NORMAL_MODE or PAGE_MODE.
    l_terms                 =>  [STRING]    Required. Y, N, or ALL (includes Active and Termed).
    l_term_date_boundary    =>  [DATE]      Required only if l_terms = Y or ALL.
                                            Date to limit term search by. Must be less than TRUNC(SYSDATE).
    l_page                  =>  [STRING]    Required only if l_mode = PAGE_MODE.
                                            Page Number to view when in PAGE_MODE.
    l_pagesize              =>  [STRING]    Required only if l_mode = PAGE_MODE.
                                            Page/Chunk Size. If result is +1 than requested,
                                             increment page and execute again.
    l_cur                   =>  [CURSOR]    Output Parameter. No input value required.
                                            Returns REFCURSOR to data grid.

Additionally, set dbms_output on to see generated debug information.

*/

   --
   lbok                          BOOLEAN;
   l_sql                         VARCHAR2 ( 32767 );
   l_parm_sql                    VARCHAR2 ( 32767 );
   l_success                     VARCHAR2 ( 32000 );
   l_dynsql_error                VARCHAR2 ( 32000 );
   l_dynsql_cur                  dynsql_engine.parameter_cur_type;
   l_parameter_list_data         q_cursor_parms_global_temp%ROWTYPE;
   l_cur                         dynsql_engine.c_cursor;
   l_column_list_empty           dynsql_engine.vc4000_table;
   l_column_list                 dynsql_engine.vc4000_table
                                                       := l_column_list_empty;
   l_parameter_list_empty        dynsql_engine.vc4000_table;
   l_parameter_list              dynsql_engine.vc4000_table
                                                    := l_parameter_list_empty;
--
-- Change email address local variables as needed.
--
-- e.g. bchase@xxxx.com or
--       bchase@xxxx.com,fjohnson@xxxxx.com,staylor@xxxx.com
--
--
   l_from_email_address          VARCHAR2 ( 250 ) := :l_from_email;
   l_from_email_address_name     VARCHAR2 ( 250 ) := :l_from_name;
   l_to_email_address            VARCHAR2 ( 250 ) := :l_to_email;
   l_email_flag                  CHAR ( 1 ) := NVL ( :l_email_flag, 'N' );
   l_smtp_server                 VARCHAR2 ( 100 ) := :l_smtp_server;
   l_domain                      VARCHAR2 ( 100 ) := :l_domain;
--
   v_line                        VARCHAR2 ( 32767 );
--
   pos                           PLS_INTEGER := 1;
   bytes_o_data         CONSTANT PLS_INTEGER := 32767;
   offset                        PLS_INTEGER := bytes_o_data;
   msg_length                    PLS_INTEGER;
   i                             BINARY_INTEGER;
   pos_dbms                      PLS_INTEGER := 1;
   bytes_o_data_dbms    CONSTANT PLS_INTEGER := 1000;
   offset_dbms                   PLS_INTEGER := bytes_o_data_dbms;
   msg_length_dbms               PLS_INTEGER;
--
--
   l_test_case                   PLS_INTEGER := NVL ( :l_test_case, 0 );
--
   err_no_test_selected          EXCEPTION;
   err_dynsql_error              EXCEPTION;

--
   TYPE varchar2_table IS TABLE OF VARCHAR2 ( 1000 )
      INDEX BY BINARY_INTEGER;

--
   c                             UTL_SMTP.connection;

   PROCEDURE send_header ( NAME IN VARCHAR2, header IN VARCHAR2 )
   AS
   BEGIN 
    UTL_SMTP.write_data ( c, NAME || ': ' || header || UTL_TCP.crlf );
   END;

   PROCEDURE dynsql (
      p_sql IN VARCHAR2
    , p_error OUT VARCHAR2
    , p_cur OUT dynsql_engine.c_cursor
   )
   IS
      stmt                          VARCHAR2 ( 32767 );
      c_process            CONSTANT VARCHAR2 ( 30 ) := 'ANONYMOUS_DYNSQL';
   BEGIN
      stmt := p_sql;

      OPEN p_cur FOR stmt;

      p_error := NULL;
   EXCEPTION
      WHEN OTHERS THEN
         p_error :=
            'ERROR IN ' || c_process || ' :: ' || SQLCODE || ' - ' || SQLERRM;
   END;
--
--
BEGIN
   dynsql_engine.print_output ( '.' );
   dynsql_engine.print_output ( '.' );
   dynsql_engine.print_output ( '.' );
   dynsql_engine.print_output ( '.' );
   dynsql_engine.print_output ( '**********************************' );
   dynsql_engine.print_output ( '**********************************' );
   dynsql_engine.print_output ( 'TEST CASE [ ' || l_test_case || ' ]' );
   dynsql_engine.print_output ( '**********************************' );
   dynsql_engine.print_output ( '**********************************' );
   dynsql_engine.print_output ( '.' );
--
-- Columns to include. Modify as needed
--
-- NOTE ** Must be defined in the HUMCUST.QCURSOR_DATASET_COLUMN_MSTR table.
--
-- If l_dynamic_column_list is N then it will read from table the assigned columns
-- HUMCUST.QCURSOR_DATASET_COLUMN_DETAIL
--
   l_column_list.DELETE;

   IF NVL ( :l_dynamic_column_list, 'N' ) = 'Y' THEN
      l_column_list ( 1 ) := 'EMPLOYEE_NUMBER';
      l_column_list ( 2 ) := 'FIRST_NAME';
      l_column_list ( 3 ) := 'LAST_NAME';
      l_column_list ( 4 ) := 'PERSON_TYPE';
      l_column_list ( 5 ) := 'COID';
      l_column_list ( 6 ) := 'UDN';
      l_column_list ( 7 ) := 'SUPERVISOR_NUMBER';
      l_column_list ( 8 ) := 'BASE_ROLE';
      l_column_list ( 9 ) := 'TERMINATION_DATE';
      l_column_list ( 10 ) := 'MIDDLE_NAMES';
      l_column_list ( 11 ) := 'SUFFIX';
      l_column_list ( 12 ) := 'DIRECT_REPORT_EXISTS';
      l_column_list ( 13 ) := 'KNOWN_AS';
      l_column_list ( 14 ) := 'DEPARTMENT';
      l_column_list ( 15 ) := 'HIRE_DATE';
   END IF;

--
-- TEST CASES
-- Modify as needed
--
   CASE
      WHEN NVL ( l_test_case, 0 ) = 0 THEN
         RAISE err_no_test_selected;
      WHEN l_test_case = 1 THEN
         dynsql_engine.print_output ( 'SEARCH FOR A SPECIFIC EMPLOYEE NUMBER' );
         dynsql_engine.print_output ( '.' );
--
--
         l_parameter_list ( 1 ) :=
                              '1|EMPLOYEE_NUMBER|NULL|NULL|10125|I|1|1|1|AND';
--
--
         l_parm_sql :=
               ' SELECT 1 parameter_entry_id, ''EMPLOYEE_NUMBER'' parameter_name, to_char(NULL) vdata_text, '
            || ' TO_DATE(NULL) vdata_date, 10125 vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''AND'' condition_operator FROM DUAL '
            || '';
      WHEN l_test_case = 2 THEN
         dynsql_engine.print_output
            ( 'INCLUDE ORGTREE SUPERVISOR 8163 BUT ONLY THOSE THAT MATCH ROLE'
            );
         dynsql_engine.print_output ( '.' );
--
--
         l_parameter_list ( 1 ) := '1|ORGTREE|NULL|NULL|8163|I|1|1|1|AND';
         l_parameter_list ( 2 ) :=
                   '2|BASE_ROLE|Applications Consultant|NULL|NULL|I|1|1|2|AND';
--
--
         l_parm_sql :=
               ' SELECT 1 parameter_entry_id, ''ORGTREE'' parameter_name, to_char(NULL) vdata_text, '
            || ' TO_DATE(NULL) vdata_date, 8163 vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''AND'' condition_operator FROM DUAL '
            || ' UNION ALL '
            || ' SELECT 2 parameter_entry_id, ''BASE_ROLE'' parameter_name, ''Applications Consultant'' vdata_text, '
            || ' TO_DATE(NULL) vdata_date, to_number(NULL) vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 2 condition_member_id, ''AND'' condition_operator FROM DUAL '
            || '';
      WHEN l_test_case = 3 THEN
         dynsql_engine.print_output
                      ( 'INCLUDE ORGTREE SUPERVISOR 8163 NOT INCLUDING 8163.' );
         dynsql_engine.print_output ( '.' );
--
--
         l_parameter_list ( 1 ) := '1|ORGTREE|NULL|NULL|8163|I|1|1|1|AND';
--
--
         l_parm_sql :=
               ' SELECT 1 parameter_entry_id, ''ORGTREE'' parameter_name,  to_char(NULL) vdata_text, '
            || ' TO_DATE(NULL) vdata_date, 8163 vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''AND'' condition_operator FROM DUAL '
            || '';
      WHEN l_test_case = 4 THEN
         dynsql_engine.print_output
                          ( 'INCLUDE ORGTREE SUPERVISOR 8163 INCLUDING 8163.' );
         dynsql_engine.print_output ( '.' );
--
--
         l_parameter_list ( 1 ) := '1|ORGTREE|NULL|NULL|8163|I|1|1|1|OR';
         l_parameter_list ( 2 ) :=
                                '2|EMPLOYEE_NUMBER|NULL|NULL|8163|I|1|1|2|OR';
--
--
         l_parm_sql :=
               ' SELECT 1 parameter_entry_id, ''ORGTREE'' parameter_name,  to_char(NULL) vdata_text, '
            || ' TO_DATE(NULL) vdata_date, 8163 vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''OR'' condition_operator FROM DUAL '
            || ' UNION ALL '
            || ' SELECT 2 parameter_entry_id, ''EMPLOYEE_NUMBER'' parameter_name,  to_char(NULL) vdata_text, '
            || ' TO_DATE(NULL) vdata_date, 8163 vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 2 condition_member_id, ''OR'' condition_operator FROM DUAL '
            || '';
      WHEN l_test_case = 5 THEN
         dynsql_engine.print_output
            ( 'INCLUDE NAMES LIKE xxxx . NOTICE SAME PARAMETER_ENTRY_ID IS USED WHICH ROLLS SIMILAR VALUESETS INTO ONE CONDITION'
            );
         dynsql_engine.print_output ( '.' );
--
--
         l_parameter_list ( 1 ) :=
                        '1|LAST_AND_FIRST_NAMES|BECKER#%|NULL|NULL|I|1|1|1|OR';
         l_parameter_list ( 2 ) :=
                       '1|LAST_AND_FIRST_NAMES|JOHNSON#%|NULL|NULL|I|1|1|1|OR';
--
--
         l_parm_sql :=
               ' SELECT 1 parameter_entry_id, ''LAST_AND_FIRST_NAMES'' parameter_name, ''BECKER#%'' vdata_text, '
            || ' to_date(NULL) vdata_date, to_number(NULL) vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''OR'' condition_operator FROM DUAL '
            || ' UNION ALL '
            || ' SELECT 1 parameter_entry_id, ''LAST_AND_FIRST_NAMES'' parameter_name, ''JOHNSON#%'' vdata_text, '
            || ' to_date(NULL) vdata_date, to_number(NULL) vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''OR'' condition_operator FROM DUAL '
            || '';
      WHEN l_test_case = 6 THEN
         dynsql_engine.print_output
                       ( 'INCLUDE EITHER FROM ONE ORGTREE OR THE OTHER OTHER' );
         dynsql_engine.print_output ( '.' );
--
--
         l_parameter_list ( 1 ) := '1|ORGTREE|NULL|NULL|537|I|1|1|1|OR';
         l_parameter_list ( 2 ) := '2|ORGTREE|NULL|NULL|11578|I|1|1|2|OR';
--
--
         l_parm_sql :=
               ' SELECT 1 parameter_entry_id, ''ORGTREE'' parameter_name,  to_char(NULL) vdata_text, '
            || ' TO_DATE(NULL) vdata_date, 537 vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''OR'' condition_operator FROM DUAL '
            || ' UNION ALL '
            || ' SELECT 2 parameter_entry_id, ''ORGTREE'' parameter_name,  to_char(NULL) vdata_text, '
            || ' TO_DATE(NULL) vdata_date, 11578 vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 2 condition_member_id, ''OR'' condition_operator FROM DUAL '
            || '';
      WHEN l_test_case = 7 THEN
         dynsql_engine.print_output
                  ( 'INCLUDE ORGTREE BUT EXCLUDE ONE OF THE SUPERVISOR NODES' );
         dynsql_engine.print_output ( '.' );
--
--
         l_parameter_list ( 1 ) := '1|ORGTREE|NULL|NULL|8163|I|1|1|1|AND';
         l_parameter_list ( 2 ) :=
                             '2|SUPEVISOR_NUMBER|NULL|NULL|11578|E|2|1|1|AND';
--
--
         l_parm_sql :=
               ' SELECT 1 parameter_entry_id, ''ORGTREE'' parameter_name,  to_char(NULL) vdata_text, '
            || ' TO_DATE(NULL) vdata_date, 8163 vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''AND'' condition_operator FROM DUAL '
            || ' UNION ALL '
            || ' SELECT 2 parameter_entry_id, ''SUPERVISOR_NUMBER'' parameter_name,  to_char(NULL) vdata_text, '
            || ' TO_DATE(NULL) vdata_date, 11578 vdata_number, ''E'' incl_excl_flag, '
            || ' 2 condition_block_id,1 condition_set_id, 1 condition_member_id, ''AND'' condition_operator FROM DUAL '
            || '';
      WHEN l_test_case = 8 THEN
         dynsql_engine.print_output
            (    'SAME AS BEFORE BUT WE LIMITED THE RESULT SET BY MAKING'
              || ' IT FALL INTO SEPERATE BLOCKS FORCING THE AND CONDITION TO BE APPLIED'
            );
         dynsql_engine.print_output ( '.' );
--
--
         l_parameter_list ( 1 ) := '1|ORGTREE|NULL|NULL|8163|I|1|1|1|AND';
         l_parameter_list ( 2 ) := '2|ORGTREE|NULL|NULL|11578|I|2|1|1|AND';
--
--
         l_parm_sql :=
               ' SELECT 1 parameter_entry_id, ''ORGTREE'' parameter_name,  to_char(NULL) vdata_text, '
            || ' TO_DATE(NULL) vdata_date, 8163 vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''AND'' condition_operator FROM DUAL '
            || ' UNION ALL '
            || ' SELECT 2 parameter_entry_id, ''ORGTREE'' parameter_name,  to_char(NULL) vdata_text, '
            || ' TO_DATE(NULL) vdata_date, 11578 vdata_number, ''I'' incl_excl_flag, '
            || ' 2 condition_block_id,1 condition_set_id, 1 condition_member_id, ''AND'' condition_operator FROM DUAL '
            || '';
      WHEN l_test_case = 9 THEN
         dynsql_engine.print_output
            (    'NAMES LIKE xxxx ROLLING INTO SAME PARAMETER_ENTRY_ID'
              || ' (INCLUDING CHECKING THE KNOWN AS FIELD FOR FIRST NAME CHECKS)'
            );
         dynsql_engine.print_output ( '.' );
--
--
         l_parameter_list ( 1 ) :=
                         '1|LAST_AND_FIRST_NAMES|%#ROCKY|NULL|NULL|I|1|1|1|OR';
         l_parameter_list ( 2 ) :=
                       '1|LAST_AND_FIRST_NAMES|JOHNSON#%|NULL|NULL|I|1|1|1|OR';
--
--
         l_parm_sql :=
               ' SELECT 1 parameter_entry_id, ''LAST_AND_FIRST_NAMES'' parameter_name, ''%#ROCKY'' vdata_text, '
            || ' to_date(NULL) vdata_date, to_number(NULL) vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''OR'' condition_operator FROM DUAL '
            || ' UNION ALL '
            || ' SELECT 1 parameter_entry_id, ''LAST_AND_FIRST_NAMES'' parameter_name, ''JOHNSON#%'' vdata_text, '
            || ' to_date(NULL) vdata_date, to_number(NULL) vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''OR'' condition_operator FROM DUAL '
            || '';
      WHEN l_test_case = 10 THEN
         dynsql_engine.print_output
            ( 'NAMES LIKE xxx AND (EXCLUDE NAMES LIKE yyyy) AND ONLY THOSE IN DEPARTMENT zzzz'
            );
         dynsql_engine.print_output ( '.' );
--
--
         l_parameter_list ( 1 ) :=
                         '1|LAST_AND_FIRST_NAMES|%#ROCKY|NULL|NULL|I|1|1|1|OR';
         l_parameter_list ( 2 ) :=
                       '1|LAST_AND_FIRST_NAMES|JOHNSON#%|NULL|NULL|I|1|1|1|OR';
         l_parameter_list ( 3 ) :=
                         '1|LAST_AND_FIRST_NAMES|CHASE#%|NULL|NULL|I|1|1|1|OR';
         l_parameter_list ( 4 ) :=
                   '2|LAST_AND_FIRST_NAMES|JOHNSON#OLGA|NULL|NULL|E|2|1|1|AND';
         l_parameter_list ( 5 ) :=
                        '2|LAST_AND_FIRST_NAMES|ELLIS#%|NULL|NULL|E|2|1|1|AND';
         l_parameter_list ( 6 ) :=
                             '3|DEPARTMENT_LIKE|Payroll|NULL|NULL|I|3|1|1|AND';
--
--
         l_parm_sql :=
               ' SELECT 1 parameter_entry_id, ''LAST_AND_FIRST_NAMES'' parameter_name, ''%#ROCKY'' vdata_text, '
            || ' to_date(NULL) vdata_date, to_number(NULL) vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''OR'' condition_operator FROM DUAL '
            || ' UNION ALL '
            || ' SELECT 1 parameter_entry_id, ''LAST_AND_FIRST_NAMES'' parameter_name, ''JOHNSON#%'' vdata_text, '
            || ' to_date(NULL) vdata_date, to_number(NULL) vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''OR'' condition_operator FROM DUAL '
            || ' UNION ALL '
            || ' SELECT 1 parameter_entry_id, ''LAST_AND_FIRST_NAMES'' parameter_name, ''CHASE#%'' vdata_text, '
            || ' to_date(NULL) vdata_date, to_number(NULL) vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''OR'' condition_operator FROM DUAL '
            || ' UNION ALL '
            || ' SELECT 2 parameter_entry_id, ''LAST_AND_FIRST_NAMES'' parameter_name, ''JOHNSON#OLGA'' vdata_text, '
            || ' to_date(NULL) vdata_date, to_number(NULL) vdata_number, ''E'' incl_excl_flag, '
            || ' 2 condition_block_id,1 condition_set_id, 1 condition_member_id, ''AND'' condition_operator FROM DUAL '
            || ' UNION ALL '
            || ' SELECT 2 parameter_entry_id, ''LAST_AND_FIRST_NAMES'' parameter_name, ''ELLIS#%'' vdata_text, '
            || ' to_date(NULL) vdata_date, to_number(NULL) vdata_number, ''E'' incl_excl_flag, '
            || ' 2 condition_block_id,1 condition_set_id, 1 condition_member_id, ''AND'' condition_operator FROM DUAL '
            || ' UNION ALL '
            || ' SELECT 3 parameter_entry_id, ''DEPARTMENT_LIKE'' parameter_name, ''Payroll'' vdata_text, '
            || ' to_date(NULL) vdata_date, to_number(NULL) vdata_number, ''I'' incl_excl_flag, '
            || ' 3 condition_block_id,1 condition_set_id, 1 condition_member_id, ''AND'' condition_operator FROM DUAL '
            || '';
      WHEN l_test_case = 11 THEN
         dynsql_engine.print_output
            (    'INCLUDE THOSE WITH HIRE_DATE BETWEEN xxxx and yyyy'
              || ' OR THOSE WITH HIRE_DATE BETWEEN aaaa and bbbb'
              || ' NOTE :: CHANGE TERMS SEARCH TO ALL AND THE TERM_DATE'
              || ' LIMITER BACK TO 01/01/2000 AND YOU WILL PULL UP THE'
              || ' INDIVIDUALS OF HIRE DATE BETWEEN 01-NOV-2000 and 30-NOV-2000'
            );
         dynsql_engine.print_output ( '.' );
--
--
         l_parameter_list ( 1 ) :=
            '1|HIRE_DATE_BTWN_DT1_DT2|01-SEP-2005#30-SEP-2005|NULL|NULL|I|1|1|1|OR';
         l_parameter_list ( 2 ) :=
            '2|HIRE_DATE_BTWN_DT1_DT2|01-NOV-2000#30-NOV-2000|NULL|NULL|I|1|1|2|OR';
--
--
         l_parm_sql :=
               ' SELECT 1 parameter_entry_id,''HIRE_DATE_BTWN_DT1_DT2'' parameter_name, ''01-SEP-2005#30-SEP-2005'' vdata_text, '
            || ' TO_DATE(NULL) vdata_date, TO_NUMBER(NULL) vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 1 condition_member_id, ''OR'' condition_operator FROM DUAL '
            || ' UNION ALL '
            || ' SELECT 2 parameter_entry_id,''HIRE_DATE_BTWN_DT1_DT2'' parameter_name, ''01-NOV-2000#30-NOV-2000'' vdata_text, '
            || ' TO_DATE(NULL) vdata_date, TO_NUMBER(NULL) vdata_number, ''I'' incl_excl_flag, '
            || ' 1 condition_block_id,1 condition_set_id, 2 condition_member_id, ''OR'' condition_operator FROM DUAL '
            || '';
      ELSE
         RAISE err_no_test_selected;
   END CASE;

--
--
   IF NVL ( :l_use_refcursor, 'N' ) = 'Y' THEN
      dynsql ( p_sql =>                         l_parm_sql
             , p_error =>                       l_dynsql_error
             , p_cur =>                         l_dynsql_cur
             );

--
--
      IF l_dynsql_error IS NOT NULL THEN
         dynsql_engine.print_output ( l_dynsql_error );
         RAISE err_dynsql_error;
      END IF;
   END IF;

--
-- Check global temp table for stored recs. Important to issue a COMMIT
-- before you run script again in order to clear out global temp table
--
   dynsql_engine.l_debug := 'Y';

--
--
   IF NVL ( :l_use_refcursor, 'N' ) = 'Y' THEN
      dynsql_engine.q_demo_pg_current_snap_c1
                                       ( p_process_desc =>                'GENERIC'
                                       , p_sub_process_desc =>            'GENERIC'
                                       , p_mode =>                        :l_mode
                                       , p_parameter_list =>              l_dynsql_cur
                                       , p_terms =>                       :l_terms
                                       , p_term_date =>                   :l_term_date_boundary
                                       , p_page =>                        :l_page
                                       , p_pagesize =>                    :l_pagesize
                                       , p_column_list =>                 l_column_list
                                       , p_success =>                     l_success
                                       , p_sql =>                         l_sql
                                       , p_cur =>                         :l_cur
                                       );
   ELSE
      dynsql_engine.q_demo_pg_current_snap_c2
                                      ( p_process_desc =>                'GENERIC'
                                      , p_sub_process_desc =>            'GENERIC'
                                      , p_mode =>                        :l_mode
                                      , p_parameter_list =>              l_parameter_list
                                      , p_terms =>                       :l_terms
                                      , p_term_date =>                   :l_term_date_boundary
                                      , p_page =>                        :l_page
                                      , p_pagesize =>                    :l_pagesize
                                      , p_column_list =>                 l_column_list
                                      , p_success =>                     l_success
                                      , p_sql =>                         l_sql
                                      , p_cur =>                         :l_cur
                                      );
   END IF;

   IF UPPER ( NVL ( l_email_flag, 'N' )) = 'Y' THEN
      msg_length := DBMS_LOB.getlength ( l_sql );
      c := UTL_SMTP.open_connection ( l_smtp_server );
      UTL_SMTP.helo ( c, l_domain );
      UTL_SMTP.mail ( c, l_from_email_address );
     UTL_SMTP.rcpt ( c, l_to_email_address );
    UTL_SMTP.open_data ( c );
      send_header ( 'From'
                  ,    '"'
                    || l_from_email_address_name
                    || '" <'
                    || l_from_email_address
                    || '>'
                  );
      send_header ( 'To', l_to_email_address );
      send_header ( 'Subject'
                  , 'TESTING EMAIL ONLY :: TEST CASE [ ' || l_test_case
                    || ' ]'
                  );
--
      UTL_SMTP.write_data ( c, UTL_TCP.crlf );

--
      WHILE pos < msg_length LOOP
         UTL_SMTP.write_data ( c, DBMS_LOB.SUBSTR ( l_sql, offset, pos ));
         pos := pos + offset;
         offset := LEAST ( bytes_o_data, msg_length - offset );
      END LOOP;

--
      UTL_SMTP.close_data ( c );
      UTL_SMTP.quit ( c );
   END IF;

   dynsql_engine.print_output ( l_success );
--
--
-- DISPLAY SQL ON OUTPUT IF YOU CANNOT EMAIL SOMEWHERE
-- REMEMBER IT DOES NOT LOGICALLY CUTOFF AFTER COMPLETE WORDS
-- SO YOU MAY HAVE TO ADJUST THE RESULTING OUTPUT A LITTLE
-- BEFORE ATTEMPTING TO EXECUTE OR ANALYZE FURTHER
--
--   dynsql_engine.print_output ( '.' );
--   dynsql_engine.print_output ( '.' );
--   dynsql_engine.print_output ( '.' );
--   msg_length_dbms := DBMS_LOB.getlength ( l_sql );

--   WHILE pos_dbms < msg_length_dbms LOOP
--      dynsql_engine.print_output ( DBMS_LOB.SUBSTR ( l_sql
--                                                    , offset_dbms
--                                                    , pos_dbms
--                                                    ));
--      pos_dbms := pos_dbms + offset_dbms;
--      offset_dbms :=
--                    LEAST ( bytes_o_data_dbms, msg_length_dbms - offset_dbms );
--   END LOOP;
--
EXCEPTION
   WHEN err_dynsql_error THEN
      raise_application_error
                     ( -20000
                     , 'DYNSQL Error occurred. Check your test criteria SQL.'
                     );
   WHEN err_no_test_selected THEN
      raise_application_error
         ( -20000
         , 'Invalid Test Case Selected. Choose a valid l_test_case in script and rerun.'
         );
   WHEN UTL_SMTP.transient_error OR UTL_SMTP.permanent_error THEN
      BEGIN
         UTL_SMTP.quit ( c );
      EXCEPTION
         WHEN UTL_SMTP.transient_error OR UTL_SMTP.permanent_error THEN
            NULL;    -- When the SMTP server is down or unavailable, we don't
                     -- have a connection to the server. The quit call will
                     -- raise an exception that we can ignore.
      END;

      raise_application_error
                       ( -20000
                       ,    'Failed to send mail due to the following error: '
                         || SQLERRM
                       );
END;
--
-- TEST QUERIES
--
   /*
--
-- DISPLAY SUBMITTED CRITERIA GRID AS LONG AS COMMIT HAS NOT BEEN ISSUED.
--

SELECT NVL(RTRIM ( SUBSTR ( parameter_name
                                        , 1
                                        , INSTR ( parameter_name, '[' )
                                          - 1
                                        )
                               ),parameter_name) clipped,x.*
  FROM q_cursor_parms_global_temp x

--
-- DISPLAY CONDITIONAL LOGIC BUILD
--

SELECT   pgt.parameter_name parm_name
--       , ( CASE
--              WHEN TO_CHAR ( pgt.vdata_date, 'YYYY/MM/DD HH24:MI:SS' ) IS NOT NULL THEN TO_CHAR
--                                                                                          ( pgt.vdata_date
--                                                                                          , 'YYYY/MM/DD HH24:MI:SS'
--                                                                                          )
--              WHEN TO_CHAR ( pgt.vdata_number ) IS NOT NULL THEN TO_CHAR
--                                                                   ( pgt.vdata_number
--                                                                   )
--              ELSE pgt.vdata_text
--           END
--         ) parm_value
       , ( CASE
              WHEN (     NVL ( pgt.condition_set_id, '0' ) = 1
                     AND ( NVL
                              ( LEAD ( pgt.condition_block_id, 1 ) OVER ( ORDER BY pgt.condition_block_id
                               , pgt.condition_set_id
                               , pgt.condition_member_id
                               , pgt.parameter_entry_id
                               , qsc.column_name )
                              , '0'
                              ) <> NVL ( pgt.condition_block_id, '0' )
                         )
                     AND ( NVL
                              ( LAG ( pgt.condition_block_id, 1 ) OVER ( ORDER BY pgt.condition_block_id
                               , pgt.condition_set_id
                               , pgt.condition_member_id
                               , pgt.parameter_entry_id
                               , qsc.column_name )
                              , '0'
                              ) <> NVL ( pgt.condition_block_id, '0' )
                         )
                   )
               OR
(     NVL ( pgt.condition_set_id, '0' ) = 1
                     AND ( NVL
                              ( LEAD ( pgt.condition_block_id, 1 ) OVER ( ORDER BY pgt.condition_block_id
                               , pgt.condition_set_id
                               , pgt.condition_member_id
                               , pgt.parameter_entry_id
                               , qsc.column_name )
                              , '0'
                              ) = NVL ( pgt.condition_block_id, '0' )
                         )
                     AND ( NVL
                              ( LAG ( pgt.condition_block_id, 1 ) OVER ( ORDER BY pgt.condition_block_id
                               , pgt.condition_set_id
                               , pgt.condition_member_id
                               , pgt.parameter_entry_id
                               , qsc.column_name )
                              , '0'
                              ) <> NVL ( pgt.condition_block_id, '0' )
                         )
                     AND ( NVL
                              ( LEAD ( pgt.condition_set_id, 1 ) OVER ( ORDER BY pgt.condition_block_id
                               , pgt.condition_set_id
                               , pgt.condition_member_id
                               , pgt.parameter_entry_id
                               , qsc.column_name )
                              , '0'
                              ) <> NVL ( pgt.condition_set_id, '0' )
                         )
                   )
               OR
(     NVL ( pgt.condition_set_id, '0' ) > 1
                     AND ( NVL
                              ( LAG ( pgt.condition_block_id, 1 ) OVER ( ORDER BY pgt.condition_block_id
                               , pgt.condition_set_id
                               , pgt.condition_member_id
                               , pgt.parameter_entry_id
                               , qsc.column_name )
                              , '0'
                              ) = NVL ( pgt.condition_block_id, '0' )
                         )
                     AND pgt.condition_member_id = 1
                     AND ( NVL
                              ( LEAD ( pgt.condition_set_id, 1 ) OVER ( ORDER BY pgt.condition_block_id
                               , pgt.condition_set_id
                               , pgt.condition_member_id
                               , pgt.parameter_entry_id
                               , qsc.column_name )
                              , '0'
                              ) <> NVL ( pgt.condition_set_id, '0' )
                         )
                   )
                   THEN 'OPEN_N_CLOSE_PARENTHESIS'
              WHEN ( NVL
                        ( LEAD ( pgt.condition_block_id, 1 ) OVER ( ORDER BY pgt.condition_block_id
                         , pgt.condition_set_id
                         , pgt.condition_member_id
                         , pgt.parameter_entry_id
                         , qsc.column_name )
                        , '0'
                        ) <> NVL ( pgt.condition_block_id, '0' )
                   ) THEN 'CLOSE_PARENTHESIS'
              WHEN ( NVL
                        ( LEAD ( pgt.condition_block_id, 1 ) OVER ( ORDER BY pgt.condition_block_id
                         , pgt.condition_set_id
                         , pgt.condition_member_id
                         , pgt.parameter_entry_id
                         , qsc.column_name )
                        , '0'
                        ) = NVL ( pgt.condition_block_id, '0' )
                   )
              AND ( NVL
                       ( LEAD ( pgt.condition_set_id, 1 ) OVER ( ORDER BY pgt.condition_block_id
                        , pgt.condition_set_id
                        , pgt.condition_member_id
                        , pgt.parameter_entry_id
                        , qsc.column_name )
                       , '0'
                       ) <> NVL ( pgt.condition_set_id, '0' )
                  ) THEN 'CLOSE_PARENTHESIS'
              WHEN NVL ( pgt.condition_member_id, '0' ) = 1 THEN 'OPEN_PARENTHESIS'
              WHEN (     NVL
                            ( LEAD ( pgt.parameter_entry_id, 1 ) OVER ( ORDER BY pgt.condition_block_id
                             , pgt.condition_set_id
                             , pgt.condition_member_id
                             , pgt.parameter_entry_id
                             , qsc.column_name )
                            , '0'
                            ) = NVL ( pgt.parameter_entry_id, '0' )
                     AND NVL
                            ( LAG ( pgt.parameter_entry_id, 1 ) OVER ( ORDER BY pgt.condition_block_id
                             , pgt.condition_set_id
                             , pgt.condition_member_id
                             , pgt.parameter_entry_id
                             , qsc.column_name )
                            , '0'
                            ) <> NVL ( pgt.parameter_entry_id, '0' )
                   )
              AND ( NVL
                       ( LAG ( pgt.condition_block_id, 1 ) OVER ( ORDER BY pgt.condition_block_id
                        , pgt.condition_set_id
                        , pgt.condition_member_id
                        , pgt.parameter_entry_id
                        , qsc.column_name )
                       , '0'
                       ) = NVL ( pgt.condition_block_id, '0' )
                  ) THEN 'OPEN_PARENTHESIS'
              ELSE 'MIDDLE'
           END
         ) row_flag
         ,(CASE WHEN  NVL
                       ( LEAD ( pgt.condition_block_id, 1 ) OVER ( ORDER BY pgt.condition_block_id
                        , pgt.condition_set_id
                        , pgt.condition_member_id
                        , pgt.parameter_entry_id
                        , qsc.column_name )
                       , '0'
                       ) = 0
                   AND (SELECT COUNT(distinct pgt1.condition_set_id) FROM humcust.q_cursor_parms_global_temp pgt1
                  WHERE pgt1.condition_block_id = pgt.condition_block_id) > 1 THEN
                  'Y'
                  ELSE
                  'N'
         END) last_in_multiset_block
       , pgt.condition_block_id block_id, pgt.condition_set_id set_id
       , pgt.condition_member_id member_id, pgt.condition_operator OPERATOR
       , DECODE ( pgt.incl_excl_flag
                , 'I', 'INCLUDE'
                , 'EXCLUDE'
                ) incl_excl_flag
                ,pgt.parameter_entry_id
    FROM qcursor_search_columns qsc
       , (select parameter_entry_id,parameter_name,incl_excl_flag,condition_block_id,condition_set_id,condition_member_id,condition_operator
       from q_cursor_parms_global_temp group by parameter_entry_id,parameter_name,incl_excl_flag,condition_block_id,condition_set_id,condition_member_id,condition_operator) pgt
   WHERE 1 = 1
     AND qsc.enabled_flag = 'Y'
     AND qsc.global_table = 'Q_CURSOR_PARMS_GLOBAL_TEMP'
     AND qsc.column_name =
            NVL ( RTRIM ( SUBSTR ( pgt.parameter_name
                                 , 1
                                 , INSTR ( pgt.parameter_name, '[' ) - 1
                                 )
                        )
                , pgt.parameter_name
                )
ORDER BY pgt.condition_block_id
       , pgt.condition_set_id
       , pgt.condition_member_id
       , pgt.parameter_entry_id
       , qsc.column_name;


   */
