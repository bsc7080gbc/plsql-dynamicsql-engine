
  CREATE OR REPLACE FUNCTION "TEST_API_F" (p_process_desc       IN VARCHAR2 DEFAULT 'GENERIC' ,
                     p_sub_process_desc   IN VARCHAR2 DEFAULT 'GENERIC' ,
                     p_mode               IN VARCHAR2 DEFAULT 'NORMAL_MODE' ,
                     p_terms              IN VARCHAR2 DEFAULT 'N' ,
                     p_term_date          IN DATE DEFAULT TRUNC (SYSDATE) ,
                     p_page               IN NUMBER DEFAULT 1 ,
                     p_pagesize           IN NUMBER DEFAULT NULL )
   RETURN VARCHAR2
IS
   --
   lbok                     BOOLEAN;
   l_sql                    VARCHAR2 (32767);
   l_parm_sql               VARCHAR2 (32767);
   l_success                VARCHAR2 (32000);
   l_dynsql_error           VARCHAR2 (32000);
   l_dynsql_cur             Dynsql_Engine.parameter_cur_type;
   l_parameter_list_data    Q_CURSOR_PARMS_GLOBAL_TEMP%ROWTYPE;
   l_cur                    Dynsql_Engine.c_cursor;
   l_column_list_empty      Dynsql_Engine.vc4000_table;
   l_column_list            Dynsql_Engine.vc4000_table := l_column_list_empty;
   l_parameter_list_empty   Dynsql_Engine.vc4000_table;
   l_parameter_list Dynsql_Engine.vc4000_table
         := l_parameter_list_empty ;
   --
   pos                      PLS_INTEGER := 1;

   --
   TYPE varchar2_table
   IS
      TABLE OF VARCHAR2 (1000)
         INDEX BY BINARY_INTEGER;

 --
--
-- TEST_API_F
--
-- Simple Test that returns the generated SQL
--
-- Ideally you would loop through the return refcursor and build
-- XML, map to HTML output, load into table, etc.
--
-- For purpose of demo we are using a function that we can
-- capture the SQL and execute the results of same. This API was
-- built purely
--

BEGIN
   --
   -- Columns to include. Modify as needed
   --
   -- NOTE ** Must be defined in the HUMCUST.QCURSOR_DATASET_COLUMN_MSTR table.
   --
   -- If l_dynamic_column_list is N then it will read from table the assigned columns
   -- HUMCUST.QCURSOR_DATASET_COLUMN_DETAIL
   --
   l_column_list.DELETE;

   --
   -- Check global temp table for stored recs. Important to issue a COMMIT
   -- before you run script again in order to clear out global temp table
   --
   Dynsql_Engine.l_debug := 'Y';

   FOR c_parms
   IN (SELECT   parameter_entry_id,
                parameter_name,
                vdata_text,
                vdata_date,
                vdata_number,
                incl_excl_flag,
                condition_block_id,
                condition_set_id,
                condition_member_id,
                condition_operator
         FROM   QCURSOR_CRITERIA_LIBRARY
        WHERE   process_desc = p_process_desc
                AND sub_process_desc = p_sub_process_desc)
   LOOP
      l_parameter_list (pos) :=
            c_parms.parameter_entry_id
         || '|'
         || c_parms.parameter_name
         || '|'
         || c_parms.vdata_text
         || '|'
         || c_parms.vdata_date
         || '|'
         || c_parms.vdata_number
         || '|'
         || c_parms.incl_excl_flag
         || '|'
         || c_parms.condition_block_id
         || '|'
         || c_parms.condition_set_id
         || '|'
         || c_parms.condition_member_id
         || '|'
         || c_parms.condition_operator;
      pos := pos + 1;
   END LOOP;

   --
   Dynsql_Engine.q_demo_pg_current_snap_c2 (
      p_process_desc       => p_process_desc,
      p_sub_process_desc   => p_sub_process_desc,
      p_mode               => p_mode,
      p_parameter_list     => l_parameter_list,
      p_terms              => p_terms,
      p_term_date          => p_term_date,
      p_page               => p_page,
      p_pagesize           => p_pagesize,
      p_column_list        => l_column_list,
      p_success            => l_success,
      p_sql                => l_sql,
      p_cur                => l_cur
   );
   --

--   htp.p('['||p_sub_process_desc||'] ' || l_success);
  -- Dynsql_Engine.print_output (l_success);
   RETURN l_sql;
END Test_Api_F;
/
 
