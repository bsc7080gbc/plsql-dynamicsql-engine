
  CREATE OR REPLACE PACKAGE "DYNSQL_ENGINE" 
IS
   --
   /* REF CURSOR is defined */
   TYPE c_cursor IS REF CURSOR;

   TYPE vc4000_table
   IS
      TABLE OF VARCHAR2 (4000)
         INDEX BY BINARY_INTEGER;

   TYPE vnum_table
   IS
      TABLE OF NUMBER
         INDEX BY BINARY_INTEGER;

   TYPE vtext_table
   IS
      TABLE OF VARCHAR2 (80)
         INDEX BY BINARY_INTEGER;

   TYPE vcnum_table
   IS
      TABLE OF NUMBER
         INDEX BY VARCHAR2 (80);

   TYPE parameter_cur_type IS REF CURSOR
      RETURN q_cursor_parms_global_temp%ROWTYPE;

   search_data         qcursor_col_tbl := qcursor_col_tbl ();

   TYPE dataset_table
   IS
      TABLE OF qcursor_dataset_column_detail%ROWTYPE
         INDEX BY PLS_INTEGER;

   --
   -- Extract of PS_PARSE from past edition of Oracle PL/SQL Programming (O'Reilly)
   --
   /*
            || PL/SQL table structures to hold atomics retrieved by parse_string.
   || This includes the table type definition, a table (though you can
   || declare your own as well, and an empty table, which you can use
   || to clear out your table which contains atomics.
   */
   TYPE atoms_tabtype
   IS
      TABLE OF VARCHAR2 (32767)
         INDEX BY BINARY_INTEGER;

   atoms_table         atoms_tabtype;
   empty_atoms_table   atoms_tabtype;
   /*
            || The standard list of delimiters. You can over-ride these with
   || your own list when you call the procedures and functions below.
   || This list is a pretty standard set of delimiters, though.
   */
   std_delimiters      VARCHAR2 (50) := ' !@#$%^&*()-_=+\|`~{[]};:",<.>/?';

   FUNCTION canonical_to_date (p_canonical_date IN VARCHAR2)
      RETURN DATE;

   FUNCTION date_to_canonical (p_date IN DATE)
      RETURN VARCHAR2;

   /* Display contents of table using DBMS_OUTPUT */
   PROCEDURE display_atomics (table_in      IN atoms_tabtype,
                              num_rows_in   IN NUMBER);

   /*
            || The parse_string procedure: I provide two, overloaded definitions.
   || The first version puts all atomics into a PL/SQL table and would
   || be used in a PL/SQL Version 2 environment. The second version places
   || all atomics into a string, separating each atomic by a vertical bar.
   || (My code does NOT do any special handling when it finds a "|" in
   || the string. You have to deal with that when you extract the atomics.
   ||
   || See the program definition for more details on other parameters.
   */
   PROCEDURE parse_string (
      string_in          IN     VARCHAR2,
      atomics_list_out      OUT atoms_tabtype,
      num_atomics_out    IN OUT NUMBER,
      delimiters_in      IN     VARCHAR2:= std_delimiters
   );

   PROCEDURE parse_string (
      string_in          IN     VARCHAR2,
      atomics_list_out   IN OUT VARCHAR2,
      num_atomics_out    IN OUT NUMBER,
      delimiters_in      IN     VARCHAR2:= std_delimiters
   );

   /* Count the number of atomics in a string */
   FUNCTION number_of_atomics (string_in       IN VARCHAR2,
                               count_type_in   IN VARCHAR2:= 'ALL',
                               delimiters_in   IN VARCHAR2:= std_delimiters)
      RETURN INTEGER;

   /* Return the Nth atomic in the string */
   FUNCTION nth_atomic (string_in       IN VARCHAR2,
                        nth_in          IN NUMBER,
                        count_type_in   IN VARCHAR2:= 'ALL',
                        delimiters_in   IN VARCHAR2:= std_delimiters)
      RETURN VARCHAR2;

   PRAGMA RESTRICT_REFERENCES (number_of_atomics, WNDS);

   --
   -- ^^^^^^^^ Extract of PS_PARSE from past edition of Oracle PL/SQL Programming (O'Reilly)
   --
   PROCEDURE print_output (p_message IN VARCHAR2);

   --
   -- VALIDATE_DEMO_PG_CRITERIA
   --
   -- Used to validate criteria grids to be submitted on Q_DEMO_PG_* api calls
   --
   PROCEDURE validate_demo_pg_criteria (p_rule_id   OUT NUMBER,
                                        p_success   OUT VARCHAR2);

   --
   -- Q_DEMO_PG_CURRENT_SNAP_C1 and C2.
   --
   -- Provides the following features
   --
   -- Pagination
   -- Dynamic Column Selection
   -- Multi-Parameter Selection via REFCURSOR compared to previous which was single column only in from of an array
   --
   -- Modes are NORMAL_MODE and PAGE_MODE
   --
   -- This one uses refcursor for parameter list input
   -- REFCURSORs exist on the oracle server, thus a persistent connection
   -- is required
   --
   PROCEDURE q_demo_pg_current_snap_c1 (
      p_process_desc       IN     VARCHAR2 DEFAULT 'GENERIC' ,
      p_sub_process_desc   IN     VARCHAR2 DEFAULT 'GENERIC' ,
      p_mode               IN     VARCHAR2 DEFAULT 'NORMAL_MODE' ,
      p_parameter_list     IN     dynsql_engine.parameter_cur_type,
      p_terms              IN     VARCHAR2 DEFAULT 'N' ,
      p_term_date          IN     DATE DEFAULT TRUNC (SYSDATE) ,
      p_page               IN     NUMBER DEFAULT 1 ,
      p_pagesize           IN     NUMBER DEFAULT NULL ,
      p_column_list        IN     dynsql_engine.vc4000_table,
      p_success               OUT VARCHAR2,
      p_sql                   OUT VARCHAR2,
      p_cur                   OUT dynsql_engine.c_cursor
   );

   --
   -- This one uses associative array for parameter list input
   -- which we would most likely be more compatible with other platforms
   --
   PROCEDURE q_demo_pg_current_snap_c2 (
      p_process_desc       IN     VARCHAR2 DEFAULT 'GENERIC' ,
      p_sub_process_desc   IN     VARCHAR2 DEFAULT 'GENERIC' ,
      p_mode               IN     VARCHAR2 DEFAULT 'NORMAL_MODE' ,
      p_parameter_list     IN     dynsql_engine.vc4000_table,
      p_terms              IN     VARCHAR2 DEFAULT 'N' ,
      p_term_date          IN     DATE DEFAULT TRUNC (SYSDATE) ,
      p_page               IN     NUMBER DEFAULT 1 ,
      p_pagesize           IN     NUMBER DEFAULT NULL ,
      p_column_list        IN     dynsql_engine.vc4000_table,
      p_success               OUT VARCHAR2,
      p_sql                   OUT VARCHAR2,
      p_cur                   OUT dynsql_engine.c_cursor
   );

   --
   -- Set dynsql_engine.l_debug  (in your anonymous script) to Y
   -- to see /* vdata fields */ on q_demo_pg_current_snap_c1 and c2
   --
   l_debug             CHAR (1) := 'N';
END dynsql_engine;
/
 
