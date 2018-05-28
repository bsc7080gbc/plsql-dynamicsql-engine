
  CREATE OR REPLACE PACKAGE BODY "DYNSQL_ENGINE" 
IS
   --
   -- Extract of PS_PARSE from past edition of Oracle PL/SQL Programming (O'Reilly)
   --
   /* Package variables used repeatedly throughout the body. */
   len_string         NUMBER;
   start_loc          NUMBER;
   next_loc           NUMBER;
   /*
                           || Since the PUT_LINE procedure regards a string of one or more
   || spaces as NULL, it will not display a space, which is in
   || PS_Parse a valid atomic. So I save a_blank in the PL/SQL
   || table instead of the space itself.
   */
   a_blank CONSTANT   VARCHAR2 (3) := '" "';

   /*--------------------- Private Modules ---------------------------
                           || The following functions are available only to other modules in
   || package. No user of PS_Parse can see or use these functions.
   ------------------------------------------------------------------*/
   FUNCTION canonical_to_date (p_canonical_date IN VARCHAR2)
      RETURN DATE
   IS
   --
   BEGIN
      RETURN TO_DATE (p_canonical_date, 'YYYYMMDD HH24:MI:SS');
   END canonical_to_date;

   FUNCTION date_to_canonical (p_date IN DATE)
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN TO_CHAR (p_date, 'YYYYMMDD HH24:MI:SS');
   END date_to_canonical;

   FUNCTION a_delimiter (character_in    IN VARCHAR2,
                         delimiters_in   IN VARCHAR2:= std_delimiters)
      RETURN BOOLEAN
   /*
                           || Returns TRUE if the character passed into the function is found
   || in the list of delimiters.
   */
   IS
   BEGIN
      RETURN INSTR (delimiters_in, character_in) > 0;
   END;

   FUNCTION string_length (string_in IN VARCHAR2)
      RETURN INTEGER
   IS
   BEGIN
      RETURN LENGTH (LTRIM (RTRIM (string_in)));
   END;

   FUNCTION next_atom_loc (string_in           IN VARCHAR2,
                           start_loc_in        IN NUMBER,
                           scan_increment_in   IN NUMBER:= +1)
      /*
                              || The next_atom_loc function returns the location
      || in the string of the starting point of the next atomic (from the
      || start location). The function scans forward if scan_increment_in is
      || +1, otherwise it scans backwards through the string. Here is the
      || logic to determine when the next atomic starts:
      ||
      ||        1. If current atomic is a delimiter (if, that is, the character
      ||            at the start_loc_in of the string is a delimiter), then the
      ||            the next character starts the next atomic since all
      ||            delimiters are a single character in length.
      ||
      ||        2. If current atomic is a word (if, that is, the character
      ||            at the start_loc_in of the string is a delimiter), then the
      ||            next atomic starts at the next delimiter. Any letters or
      ||            numbers in between are part of the current atomic.
      ||
      || So I loop through the string a character at a time and apply these
      || tests. I also have to check for end of string. If I scan forward
      || the end of string comes when the SUBSTR which pulls out the next
      || character returns NULL. If I scan backward, then the end of the
      || string comes when the location is less than 0.
      */
      RETURN NUMBER
   IS
      /* Boolean variable which uses private function to determine
                                                      || if the current character is a delimiter or not.
      */
      was_a_delimiter BOOLEAN
            := a_delimiter (SUBSTR (string_in, start_loc_in, 1)) ;
      /* If not a delimiter, then it was a word. */
      was_a_word     BOOLEAN := NOT was_a_delimiter;
      /* The next character scanned in the string */
      next_char      VARCHAR2 (1);
      /*
                                                      || The value returned by the function. This location is the start
      || of the next atomic found. Initialize it to next character,
      || forward or backward depending on increment.
      */
      return_value   NUMBER := start_loc_in + scan_increment_in;
   BEGIN
      LOOP
         -- Extract the next character.
         next_char := SUBSTR (string_in, return_value, 1);
         -- Exit the loop if:
         EXIT WHEN        /* On a delimiter, since that is always an atomic */
                  a_delimiter (next_char)
                   OR             /* Was a delimiter, but am now in a word. */
                      (was_a_delimiter AND NOT a_delimiter (next_char))
                   OR            /* Reached end of string scanning forward. */
                     next_char IS NULL
                   OR     /* Reached beginning of string scanning backward. */
                     return_value < 0;
         /* Shift return_value to move the next character. */
         return_value := return_value + scan_increment_in;
      END LOOP;

      -- If the return_value is negative, return 0, else the return_value
      RETURN GREATEST (return_value, 0);
   END;

   PROCEDURE increment_counter (counter_inout   IN OUT NUMBER,
                                count_type_in   IN     VARCHAR2,
                                atomic_in       IN     CHAR)
    /*
                                                    || The increment_counter procedure is used by nth_atomic and
    || number_of_atomics to add to the count of atomics. Since you
    || can request a count by ALL atomics, just the WORD atomics or
    || just the DELIMITER atomics. I use the a_delimiter function to
    || decide whether I should add to the counter. This is not a terribly
    || complex procedure. I bury this logic into a separate module,
however,
    || to make it easier to read and debug the main body of the programs.
    */
   IS
   BEGIN
      IF    count_type_in = 'ALL'
         OR (count_type_in = 'WORD' AND NOT a_delimiter (atomic_in))
         OR (count_type_in = 'DELIMITER' AND a_delimiter (atomic_in))
      THEN
         counter_inout := counter_inout + 1;
      END IF;
   END increment_counter;

   /* ------------------------- Public Modules -----------------------*/
   PROCEDURE display_atomics (table_in      IN atoms_tabtype,
                              num_rows_in   IN NUMBER)
   /*
                           || Program to dump out contents of table. Notice I must also pass in
   || the number of rows in the table so that I know when to stop the
   || loop. Otherwise I will raise a NO_DATA_FOUND exception. For a more
   || elaborate display_table module, see Chapter 7 on PL/SQL tables.
   */
   IS
   BEGIN
      FOR table_row IN 1 .. num_rows_in
      LOOP
         DBMS_OUTPUT.put_line (NVL (table_in (table_row), 'NULL'));
      END LOOP;
   END;

   PROCEDURE parse_string (
      string_in          IN     VARCHAR2,
      atomics_list_out      OUT atoms_tabtype,
      num_atomics_out    IN OUT NUMBER,
      delimiters_in      IN     VARCHAR2:= std_delimiters
   )
   /*
                           || Version of parse_string which stores the list of atomics
   || in a PL/SQL table.
   ||
   || Parameters:
   ||        string_in - the string to be parsed.
   ||        atomics_list_out - the table of atomics.
   ||        num_atomics_out - the number of atomics found.
   ||        delimiters_in - the set of delimiters used in parse.
   */
   IS
   BEGIN
      /* Initialize variables. */
      num_atomics_out := 0;
      len_string := string_length (string_in);

      IF len_string IS NOT NULL
      THEN
         /*
                                                         || Only scan the string if made of something more than blanks.
         || Start at first non-blank character. Remember: INSTR returns 0
         || if a space is not found. Stop scanning if at end of string.
         */
         start_loc := LEAST (1, INSTR (string_in, ' ') + 1);

         WHILE start_loc <= len_string
         LOOP
            /*
                                                                                    || Find the starting point of the NEXT atomic. Go ahead and
            || increment counter for the number of atomics. Then have to
            || actually pull out the atomic. Two cases to consider:
            ||        1. Last atomic goes to end of string.
            ||        2. The atomic is a single blank. Use special constant.
            ||        3. Anything else.
            */
            next_loc := next_atom_loc (string_in, start_loc);
            num_atomics_out := num_atomics_out + 1;

            IF next_loc > len_string
            THEN
               -- Atomic is all characters right to the end of the string.
               atomics_list_out (num_atomics_out) :=
                  SUBSTR (string_in, start_loc);
            ELSE
               /*
                                                                                                                                       || Internal atomic. If RTRIMs to NULL, have a blank
               || Use special-case string to stuff a " " in the table.
               */
               atomics_list_out (num_atomics_out) :=
                  NVL (
                     RTRIM (
                        SUBSTR (string_in, start_loc, next_loc - start_loc)
                     ),
                     a_blank
                  );
            END IF;

            -- Move starting point of scan for next atomic.
            start_loc := next_loc;
         END LOOP;
      END IF;
   END parse_string;

   PROCEDURE parse_string (
      string_in          IN     VARCHAR2,
      atomics_list_out   IN OUT VARCHAR2,
      num_atomics_out    IN OUT NUMBER,
      delimiters_in      IN     VARCHAR2:= std_delimiters
   )
   /*
                                                                                                   || The version of parse_string which writes the atomics out to a packed
   || list in the format "|A|,|C|". I do not repeat any of the comments
   || from the first iteration of parse_string.
   */
   IS
   BEGIN
      /* Initialize variables */
      num_atomics_out := 0;
      atomics_list_out := NULL;
      len_string := string_length (string_in);

      IF len_string IS NOT NULL
      THEN
         start_loc := LEAST (1, INSTR (string_in, ' ') + 1);

         WHILE start_loc <= len_string
         LOOP
            next_loc := next_atom_loc (string_in, start_loc);
            num_atomics_out := num_atomics_out + 1;

            IF next_loc > len_string
            THEN
               atomics_list_out :=
                  atomics_list_out || '|' || SUBSTR (string_in, start_loc);
            ELSE
               atomics_list_out :=
                  atomics_list_out || '|'
                  || NVL (
                        RTRIM(SUBSTR (string_in,
                                      start_loc,
                                      next_loc - start_loc)),
                        a_blank
                     );
            END IF;

            start_loc := next_loc;
         END LOOP;

         /* Apply terminating delimiter to the string. */
         atomics_list_out := atomics_list_out || '|';
      END IF;
   END parse_string;

   FUNCTION number_of_atomics (string_in       IN VARCHAR2,
                               count_type_in   IN VARCHAR2:= 'ALL',
                               delimiters_in   IN VARCHAR2:= std_delimiters)
      RETURN INTEGER
   /*
                                                                           || Counts the number of atomics in the string_in. You can specify the
   || type of count you want: ALL for all atomics, WORD to count only the
   || words and DELIMITER to count only the delimiters. You can optionally
   || pass your own set of delimiters into the function.
   */
   IS
      return_value   INTEGER := 0;
   BEGIN
      /* Initialize variables. */
      len_string := string_length (string_in);

      IF len_string IS NOT NULL
      THEN
         /*
                                                         || This loop is much simpler than parse_string. Call the
         || next_atom_loc to move to the next atomic and increment the
         || counter if appropriate. Everything complicated is shifted into
         || sub-programs so that you can read the program "top-down",
         || understand it layer by layer.
         */
         start_loc := LEAST (1, INSTR (string_in, ' ') + 1);

         WHILE start_loc <= len_string
         LOOP
            increment_counter (return_value,
                               UPPER (count_type_in),
                               SUBSTR (string_in, start_loc, 1));
            start_loc := next_atom_loc (string_in, start_loc);
         END LOOP;
      END IF;

      RETURN return_value;
   END number_of_atomics;

   FUNCTION nth_atomic (string_in       IN VARCHAR2,
                        nth_in          IN NUMBER,
                        count_type_in   IN VARCHAR2:= 'ALL',
                        delimiters_in   IN VARCHAR2:= std_delimiters)
      RETURN VARCHAR2
   /*
                                                                           || Find and return the nth atomic in a string. If nth_in is greater
   || the number of atomics, then return NULL. If nth_in is negative the
   || function counts from the back of the string. You can again request
   || a retrieval by ALL atomics, just the WORDs or just the DELIMITER.
   || So you can ask for the third atomic, or the second word from the end
   || of the string. You can pass your own list of delimiters as well.
   */
   IS
      /* Local copy of string. Supports up to 1000 characters. */
      local_string VARCHAR2 (1000)
            := LTRIM (RTRIM (SUBSTR (string_in, 1, 1000))) ;
      /* Running count of atomics so far counted. */
      atomic_count     NUMBER := 1;
      /* Boolean variable which controls the looping logic. */
      still_scanning   BOOLEAN := local_string IS NOT NULL AND nth_in != 0;
      /* The amount by which I increment the counter. */
      scan_increment   INTEGER;
      /* Return value of function, maximum length of 100 characters. */
      return_value     VARCHAR2 (100) := NULL;
   BEGIN
      IF nth_in = 0
      THEN
         /* Not much to do here. Find 0th atomic? */
         RETURN NULL;
      ELSE
         /* Initialize the loop variables. */
         len_string := string_length (local_string);

         IF nth_in > 0
         THEN
            /* Start at first non-blank character and scan forward. */
            next_loc := 1;
            scan_increment := 1;
         ELSE
            /* Start at last non-blank character and scan backward. */
            next_loc := len_string;
            scan_increment := -1;
         END IF;

         /* Loop through the string until the Boolean is FALSE. */
         WHILE still_scanning
         LOOP
            /* Move start of scan in string to loc of last atomic. */
            start_loc := next_loc;
            /* Find the starting point of the next atomic. */
            next_loc :=
               next_atom_loc (local_string, start_loc, scan_increment);
            /* Increment the count of atomics. */
            increment_counter (atomic_count,
                               UPPER (count_type_in),
                               SUBSTR (local_string, start_loc, 1));
            /*
                                                                                                            || Keep scanning if my count hasn't exceeded the request
            || and I am neither at the beginning nor end of the string.
            */
            still_scanning :=
                   atomic_count <= ABS (nth_in)
               AND next_loc <= len_string
               AND next_loc >= 1;
         END LOOP;

         /*
                                                                                                         || Done with the loop. If my count has not exceeded the requested
         || amount, then there weren't enough atomics in the string to
         || satisfy the request.
         */
         IF atomic_count <= ABS (nth_in)
         THEN
            RETURN NULL;
         ELSE
            /*
                                                                                    || I need to extract the atomic from the string. If scanning
            || forward, then I start at start_loc and SUBSTR forward.
            || If I am scanning backwards, I start at next_loc+1 (next_loc
            || is the starting point of the NEXT atomic and I want the
            || current one) and SUBSTR forward (when scanning in
            || reverse, next_loc comes before start_loc in the string.
            */
            IF scan_increment = +1
            THEN
               RETURN SUBSTR (local_string, start_loc, next_loc - start_loc);
            ELSE
               RETURN SUBSTR (local_string,
                              next_loc + 1,
                              start_loc - next_loc);
            END IF;
         END IF;
      END IF;
   END nth_atomic;

   --
   -- ^^^^^^^^ Extract of PS_PARSE from past edition of Oracle PL/SQL Programming (O'Reilly)
   --
   PROCEDURE print_output (p_message IN VARCHAR2)
   IS
   BEGIN
      DBMS_OUTPUT.put_line (SUBSTR (p_message, 1, 250));

      IF LENGTH (p_message) > 250
      THEN
         DBMS_OUTPUT.put_line (SUBSTR (p_message, 251, 250));
      END IF;

      IF LENGTH (p_message) > 501
      THEN
         DBMS_OUTPUT.put_line (SUBSTR (p_message, 501, 250));
      END IF;

      IF LENGTH (p_message) > 751
      THEN
         DBMS_OUTPUT.put_line (SUBSTR (p_message, 751, 250));
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         NULL;              -- Ignore errors... protect buffer overflow's etc.
   END print_output;

   --
   -- VALIDATE_DEMO_PG_CRITERIA
   --
   -- Used to validate criteria grids to be submitted on Q_DEMO_PG_* api calls
   --
   -- Criteria Grid will populate conditional SQL syntax using the following
   -- layout
   --
   /*
                           AND (BLOCK 1
          |
          |__>>> SET 1
            |    |____>> MEMBER 1
            |    |____>> MEMBER 2
            |
            |_>>> SET 2
                    |
                    |___>> MEMBER 1
         )
   AND (BLOCK 2
          |
          |__>>> SET 1
            |    |____>> MEMBER 1
            |    |____>> MEMBER 2
            |
            |_>>> SET 2
                    |
                    |___>> MEMBER 1
                    |___>> MEMBER 2
         )
   The following rules permit highly flexible queries to be generated dynamically.
   The VALIDATE_DEMO_PG_CRITERIA API call will be used to enforce these rules.
   0.  NON RULE VIOLATION ENCOUNTERED, BUT CAUSED FAILURE IN VALIDATION ROUTINE (e.g. Parameters invalid)
   1.  CONDITION MEMBERS ARE SEPARATED BY CONDITION OPERATORS OF 'OR' and 'AND' WHEN MORE THAN ONE CONDITION MEMBER.
   2.  WHEN ONE CONDITION MEMBER ONLY, THEN CONDITION OPERATOR SHOULD BE 'AND'.
   3.  CONDITION OPERATORS APPLY THE CONDITION SET AS A WHOLE AND USED AS A SEPARATOR BETWEEN CONDITION MEMBERS.
   4.  CONDITION SETS CAN ONLY CONTAIN ONE TYPE OF CONDITION OPERATOR. NO MIXING OF OPERATORS.
   5.  ANY GIVEN CONDITION SET CAN CONTAIN ANY NUMBER OF ONE OR MORE CONDITION MEMBERS.
   6.  ANY GIVEN CONDITION BLOCK CAN CONTAIN ANY NUMBER OF ONE OR MORE CONDITION SETS.
   7.  MUST AT LEAST CONTAIN ONE CONDITION BLOCK
   8.  CONDITIONS SETS WITHIN A BLOCK ARE ALWAYS SEPARATED BY 'OR' OPERATORS. MEANING
       ANY ONE OF THE CONDITION SETS CAN BE TRUE, AND DOES REQUIRE ALL CONDITION SETS
       TO BE TRUE TO SATISFY THE QUERY CONDITION LOGIC.
   9.  CONDITION BLOCKS ARE ALWAYS SEPARATED BY 'AND' OPERATORS. MEANING THAT EACH BLOCK MUST BE TRUE TO
       SATISFY QUERY CONDITION LOGIC.
   10. ANY NUMBER OF ONE OR MORE CONDITION BLOCKS CAN BE DEFINED.
   11. CONDITION BLOCK ID's are UNIQUE. CONDITION SET IDs ARE UNIQUE WITHIN A GIVEN CONDITION BLOCK. CONDITION
       MEMBER IDs ARE UNIQUE WITHIN A GIVEN CONDITION SET.
   12. ONLY ONE ORGTREE SEARCH PER PARAMETER_ENTRY_ID.
   13. KEYWORDS NOT AUTHORIZED IN PARAMETER VALUES
           - DBA_
           - DBMS_SQL
           - GRANT
           - CREATE
           - ALTER
           - REVOKE
           - EXECUTE IMMEDIATE
           - SELECT
   */
   --
   --
   PROCEDURE validate_demo_pg_criteria (p_rule_id   OUT NUMBER,
                                        p_success   OUT VARCHAR2)
   IS
      c_process CONSTANT VARCHAR2 (200)
            := 'DYNSQL_ENGINE.VALIDATE_DEMO_PG_CRITERIA' ;
      l_success                    VARCHAR2 (32000) := 'OK';
      l_parameter_enabled          CHAR (1) := 'N';
      l_step                       VARCHAR2 (1000);
      l_parameter_list_data        Q_CURSOR_PARMS_GLOBAL_TEMP%ROWTYPE;
      l_condition_chk_cnt          PLS_INTEGER := 0;
      l_entry_chk_cnt              PLS_INTEGER := 0;
      l_last_condition_id          PLS_INTEGER;
      l_last_parameter_entry_id    PLS_INTEGER;
      l_last_condition_value       VARCHAR2 (10);
      l_rule_id                    PLS_INTEGER := 0;
      l_parameter_name             Q_CURSOR_PARMS_GLOBAL_TEMP.parameter_name%TYPE;
      l_parameter_value_text       Q_CURSOR_PARMS_GLOBAL_TEMP.vdata_text%TYPE;
      l_parameter_value_date       Q_CURSOR_PARMS_GLOBAL_TEMP.vdata_date%TYPE;
      l_parameter_value_number     Q_CURSOR_PARMS_GLOBAL_TEMP.vdata_number%TYPE;
      l_parameter_incl_excl_flag   Q_CURSOR_PARMS_GLOBAL_TEMP.incl_excl_flag%TYPE;
      err_invalid_criteria_grid EXCEPTION;
   BEGIN
      --
      l_step :=
         c_process
         || ' :: RULE#13 - KEYWORDS NOT AUTHORIZED IN PARAMETER VALUES';
      l_rule_id := 13;
      --
      l_condition_chk_cnt := 0;
      l_last_condition_id := NULL;
      l_last_condition_value := NULL;

      --
      FOR c_loop IN (SELECT   vdata_text FROM Q_CURSOR_PARMS_GLOBAL_TEMP)
      LOOP
         IF    UPPER (c_loop.vdata_text) LIKE '%DBA_%'
            OR UPPER (c_loop.vdata_text) LIKE '%DBMS_SQL%'
            OR UPPER (c_loop.vdata_text) LIKE '%GRANT %'
            OR UPPER (c_loop.vdata_text) LIKE '%CREATE %'
            OR UPPER (c_loop.vdata_text) LIKE '%ALTER %'
            OR UPPER (c_loop.vdata_text) LIKE '%REVOKE %'
            OR UPPER (c_loop.vdata_text) LIKE '%EXECUTE IMMEDIATE%'
            OR UPPER (c_loop.vdata_text) LIKE '%SELECT%'
         THEN
            l_condition_chk_cnt := l_condition_chk_cnt + 1;
         END IF;

         EXIT WHEN l_condition_chk_cnt > 0;
      END LOOP;

      IF l_condition_chk_cnt > 0
      THEN
         RAISE err_invalid_criteria_grid;
      END IF;

      --
      --
      l_step :=
         c_process
         || ' :: RULE#4 - VERIFY ONLY ONE CONDITION OPERATOR PER CONDITION SET';
      l_rule_id := 4;
      --
      l_condition_chk_cnt := 0;
      l_last_condition_id := NULL;
      l_last_condition_value := NULL;

      --
      FOR c_loop
      IN (  SELECT   condition_block_id || condition_set_id condition_ids,
                     condition_operator condition_operator,
                     COUNT ('x') cnt
              FROM   Q_CURSOR_PARMS_GLOBAL_TEMP
          GROUP BY   condition_block_id || condition_set_id,
                     condition_operator
          ORDER BY   condition_block_id || condition_set_id)
      LOOP
         IF c_loop.condition_ids =
               NVL (l_last_condition_id, c_loop.condition_ids)
            AND c_loop.condition_operator <>
                  NVL (l_last_condition_value, c_loop.condition_operator)
         THEN
            l_condition_chk_cnt := l_condition_chk_cnt + 1;
         END IF;

         l_last_condition_id := c_loop.condition_ids;
         l_last_condition_value := c_loop.condition_operator;
         EXIT WHEN l_condition_chk_cnt > 0;
      END LOOP;

      IF l_condition_chk_cnt > 0
      THEN
         RAISE err_invalid_criteria_grid;
      END IF;

      --
      l_step :=
         c_process
         || ' :: RULE#12 - ONLY ONE ORGTREE SEARCH PER PARAMETER_ENTRY_ID';
      l_rule_id := 12;
      --
      l_entry_chk_cnt := 0;
      l_last_parameter_entry_id := NULL;

      --
      FOR c_loop IN (  SELECT   parameter_name, parameter_entry_id
                         FROM   Q_CURSOR_PARMS_GLOBAL_TEMP
                        WHERE   parameter_name LIKE 'ORGTREE%'
                     ORDER BY   parameter_entry_id)
      LOOP
         IF c_loop.parameter_entry_id =
               NVL (l_last_parameter_entry_id, c_loop.parameter_entry_id)
         THEN
            l_entry_chk_cnt := l_entry_chk_cnt + 1;
         ELSE
            l_entry_chk_cnt := 0;
            l_entry_chk_cnt := l_entry_chk_cnt + 1;
         END IF;

         l_last_parameter_entry_id := c_loop.parameter_entry_id;
         EXIT WHEN l_entry_chk_cnt > 1;
      END LOOP;

      IF l_entry_chk_cnt > 1
      THEN
         RAISE err_invalid_criteria_grid;
      END IF;

      --
      --
      l_step :=
         c_process
         || ' :: RULE#2 - VERIFY CONDITION SETS WITH A SINGLE CONDITION MEMBER ONLY HAVE CONDITION OPERATOR OF "AND"';
      l_rule_id := 2;
      --
      l_condition_chk_cnt := 0;
      l_last_condition_id := NULL;
      l_last_condition_value := NULL;

      --
      FOR c_loop
      IN (  SELECT   condition_block_id || condition_set_id,
                     condition_operator condition_operator,
                     COUNT ('x') cnt
              FROM   Q_CURSOR_PARMS_GLOBAL_TEMP
          GROUP BY   condition_block_id || condition_set_id,
                     condition_operator
            HAVING   COUNT ('x') = 1
          ORDER BY   condition_block_id || condition_set_id)
      LOOP
         IF c_loop.condition_operator = 'AND'
         THEN
            l_condition_chk_cnt := 0;
         ELSE
            l_condition_chk_cnt := l_condition_chk_cnt + 1;
         END IF;

         EXIT WHEN l_condition_chk_cnt > 0;
      END LOOP;

      IF l_condition_chk_cnt > 0
      THEN
         RAISE err_invalid_criteria_grid;
      END IF;

      --
      --
      l_step :=
         c_process
         || ' :: RULE#7 - VERIFY AT LEAST ONE CONDITION BLOCK EXISTS';
      l_rule_id := 7;
      --
      l_condition_chk_cnt := 0;

      FOR c_loop
      IN (SELECT   COUNT (DISTINCT condition_block_id) cnt
            FROM   Q_CURSOR_PARMS_GLOBAL_TEMP)
      LOOP
         IF c_loop.cnt > 0
         THEN
            l_condition_chk_cnt := 0;
         ELSE
            l_condition_chk_cnt := l_condition_chk_cnt + 1;
         END IF;

         EXIT WHEN l_condition_chk_cnt > 0;
      END LOOP;

      IF l_condition_chk_cnt > 0
      THEN
         RAISE err_invalid_criteria_grid;
      END IF;

      --
      --
      -- REMAINDER RULES ARE HANDLE VIA BUSINESS LOGIC ON THE BACKEND.
      --
      p_success := l_success;
   --
   EXCEPTION
      WHEN DUP_VAL_ON_INDEX
      THEN
         l_rule_id := 11;
         p_rule_id := l_rule_id;
         l_success :=
               'ERROR :: ERR-INVALIDPARMGRID :: '
            || 'INVALID PARAMETER CRITERIA GRID DETECTED ON RULE_ID ['
            || l_rule_id
            || '] ';
         p_success := l_success;

         IF l_debug = 'Y'
         THEN
            print_output (c_process || ' :: ' || l_success);
         END IF;
      WHEN err_invalid_criteria_grid
      THEN
         p_rule_id := l_rule_id;
         l_success :=
               'ERROR :: ERR-INVALIDPARMGRID :: '
            || 'INVALID PARAMETER CRITERIA GRID DETECTED ON RULE_ID ['
            || l_rule_id
            || '] ';
         p_success := l_success;

         IF l_debug = 'Y'
         THEN
            print_output (c_process || ' :: ' || l_success);
         END IF;
      WHEN OTHERS
      THEN
         p_rule_id := l_rule_id;
         l_success :=
               'ERROR :: ERR-ORACLE :: '
            || SQLCODE
            || ' - '
            || SQLERRM
            || ' :: '
            || l_step;
         p_success := l_success;

         IF l_debug = 'Y'
         THEN
            print_output (c_process || ' :: ' || l_success);
         END IF;
   END validate_demo_pg_criteria;

   --
   -- This one uses refcursor for parameter list input
   -- REFCURSORs exist on the oracle server, thus a persistent connection
   -- is required
   --
   PROCEDURE q_demo_pg_current_snap_c1 (
      p_process_desc       IN     VARCHAR2 DEFAULT 'GENERIC' ,
      p_sub_process_desc   IN     VARCHAR2 DEFAULT 'GENERIC' ,
      p_mode               IN     VARCHAR2 DEFAULT 'NORMAL_MODE' ,
      p_parameter_list     IN     Dynsql_Engine.parameter_cur_type,
      p_terms              IN     VARCHAR2 DEFAULT 'N' ,
      p_term_date          IN     DATE DEFAULT TRUNC (SYSDATE) ,
      p_page               IN     NUMBER DEFAULT 1 ,
      p_pagesize           IN     NUMBER DEFAULT NULL ,
      p_column_list        IN     Dynsql_Engine.vc4000_table,
      p_success               OUT VARCHAR2,
      p_sql                   OUT VARCHAR2,
      p_cur                   OUT Dynsql_Engine.c_cursor
   )
   IS
      --
      l_parameter_list_c              Dynsql_Engine.c_cursor := p_parameter_list;
      l_parm_entry_id                 NUMBER := 0;
      --
      l_pagination_mode CONSTANT      VARCHAR2 (30) := 'PAGE_MODE';
      l_normal_mode CONSTANT          VARCHAR2 (30) := 'NORMAL_MODE';
      l_mode                          VARCHAR2 (30);
      l_default_pagesize CONSTANT     NUMBER := 25;
      l_pagesize                      NUMBER;
      l_page                          NUMBER;
      l_page_opt_hint                 VARCHAR2 (30);
      --
      --
      c_process CONSTANT VARCHAR2 (200)
            := 'DYNSQL_ENGINE.Q_DEMO_PG_CURRENT_SNAP_C' ;
      l_success                       VARCHAR2 (32000) := 'OK';
      l_parameter_list_validate       VARCHAR2 (1000) := 'OK';
      l_business_group_id             PLS_INTEGER := 26;
      l_query_length                  PLS_INTEGER := 0;
      --
      lncnt                           PLS_INTEGER := 0;
      lntruecnt                       PLS_INTEGER := 0;
      --
      l_process_desc VARCHAR2 (1000)
            := NVL (LTRIM (RTRIM (UPPER (p_process_desc))), 'GENERIC') ;
      l_sub_process_desc VARCHAR2 (1000)
            := NVL (LTRIM (RTRIM (UPPER (p_sub_process_desc))), 'GENERIC') ;
      --
      l_emp_dataset_cols              VARCHAR2 (32000);
      l_nulldataset_cols              VARCHAR2 (32000);
      --
      l_sql                           VARCHAR2 (32767);
      l_sql_emp                       VARCHAR2 (32767);
      l_hint_text_emp                 VARCHAR2 (200);
      --
      l_emp_search_cols               VARCHAR2 (32000);
      t_emp_search_cols               VARCHAR2 (32000);
      l_search_datatype               VARCHAR2 (30);
      l_emp_special_cond              VARCHAR2 (32000);
      l_emp_parm_cond                 VARCHAR2 (32000);
      l_condition_set_id              NUMBER;
      l_condition_block_id            NUMBER;
      l_condition_member_id           NUMBER;
      --
      --
      l_sql_empty                     VARCHAR2 (32767);
      l_sql_empty_query               VARCHAR2 (32767);
      l_terms_emp                     VARCHAR2 (200);
      l_term_date                     DATE := TRUNC (SYSDATE);
      l_demo_table                    VARCHAR2 (200);
      l_step                          VARCHAR2 (1000);
      --
      lbok                            BOOLEAN;
      l_process_defined_msg           VARCHAR2 (32000);
      l_process_id                    PLS_INTEGER;
      l_sub_process_id                PLS_INTEGER;
      l_tbl_drv_flag_true             VARCHAR2 (10) := 'TRUE';
      l_tbl_drv_flag_false            VARCHAR2 (10) := 'FALSE';
      l_table_driven_flag             VARCHAR2 (10) := l_tbl_drv_flag_true;
      --
      l_parameter_name                Q_CURSOR_PARMS_GLOBAL_TEMP.parameter_name%TYPE;
      l_parameter_value_text          Q_CURSOR_PARMS_GLOBAL_TEMP.vdata_text%TYPE;
      l_parameter_value_date          Q_CURSOR_PARMS_GLOBAL_TEMP.vdata_date%TYPE;
      l_parameter_value_number        Q_CURSOR_PARMS_GLOBAL_TEMP.vdata_number%TYPE;
      l_parameter_incl_excl_flag      Q_CURSOR_PARMS_GLOBAL_TEMP.incl_excl_flag%TYPE;
      l_crcbit                        VARCHAR2 (2000);
      l_parmcombo_err                 VARCHAR2 (1000);
      l_parms_used                    VARCHAR2 (1000);
      l_parm_critname_tbl_empty       Dynsql_Engine.vcnum_table;
      l_parm_critname_tbl Dynsql_Engine.vcnum_table
            := l_parm_critname_tbl_empty ;
      l_parm_critid_tbl_empty         Dynsql_Engine.vnum_table;
      l_parm_critid_tbl Dynsql_Engine.vnum_table
            := l_parm_critid_tbl_empty ;
      l_parm_crit_id2name_tbl_empty   Dynsql_Engine.vtext_table;
      l_parm_crit_id2name_tbl Dynsql_Engine.vtext_table
            := l_parm_crit_id2name_tbl_empty ;
      l_parameter_enabled             CHAR (1) := 'N';
      l_parameter_list_data           Q_CURSOR_PARMS_GLOBAL_TEMP%ROWTYPE;
      l_rule_failed                   PLS_INTEGER;
      --
      l_dataset_cnt                   PLS_INTEGER := 0;
      idx                             PLS_INTEGER;
      --
      rowcnt                          PLS_INTEGER := 0;
      p_count                         PLS_INTEGER := 0;
      ardataset                       Dynsql_Engine.dataset_table;
      --
      l_check_group_a                 PLS_INTEGER := 0;
      l_check_group_b                 PLS_INTEGER := 0;
      l_check_group_c                 PLS_INTEGER := 0;
      l_check_group_d                 PLS_INTEGER := 0;
      --
      -- IF all is well, then check_group_cond will be 0, otherwise 1.
      --
      l_check_group_cond              PLS_INTEGER := 0;
      l_check_noparms                 PLS_INTEGER := 0;
      --
      -- EXCEPTIONS
      --
      err_noparms_passed EXCEPTION;
      err_badparm_combo EXCEPTION;
      err_invalid_parameter EXCEPTION;
      err_placeholder EXCEPTION;
      err_dataset_not_defined EXCEPTION;
      err_parmlistvalidate EXCEPTION;

      --
      CURSOR c_dataset (
         pn_table_driven_flag   IN            VARCHAR2 DEFAULT 'TRUE' ,
         pn_process_id          IN            NUMBER DEFAULT -99 ,
         pn_sub_process_id      IN            NUMBER DEFAULT -99
      )
      IS
         SELECT   TO_NUMBER (NULL) process_id,
                  TO_NUMBER (NULL) sub_process_id,
                  TO_CHAR (NULL) process_desc,
                  TO_CHAR (NULL) sub_process_desc,
                  'Y' enabled,
                  column_alias_name,
                  column_type,
                  column_order,
                  description,
                  hr_secure_column,
                  emp_column_detail
           FROM   QCURSOR_DATASET_COLUMN_MSTR
          WHERE   1 = 1 AND pn_table_driven_flag = 'FALSE'
                  AND column_alias_name IN
                           (SELECT   DISTINCT UPPER (vdata_text)
                              FROM   Q_CURSOR_DYNCOL_GLOBAL_TEMP)
         UNION
         SELECT   process_id,
                  sub_process_id,
                  process_desc,
                  sub_process_desc,
                  enabled,
                  column_alias_name,
                  column_type,
                  column_order,
                  description,
                  hr_secure_column,
                  emp_column_detail
           FROM   QCURSOR_DATASET_COLUMN_DETAIL
          WHERE       1 = 1
                  AND pn_table_driven_flag = 'TRUE'
                  AND process_id = NVL (l_process_id, -99)
                  AND sub_process_id = NVL (l_sub_process_id, -99)
         ORDER BY   8;
   BEGIN
      --
      --
      IF l_debug = 'Y'
      THEN
         print_output (
            'START TIME :: ' || TO_CHAR (SYSDATE, 'DD-MON-YYYY HH24:MI:SS')
         );
      END IF;

      --
      -- Determine Mode we are working in
      --
      IF NVL (UPPER (LTRIM (RTRIM (p_mode))), 'NORMAL_MODE') = 'PAGE_MODE'
      THEN
         l_mode := l_pagination_mode;
      ELSE
         l_mode := l_normal_mode;
      END IF;

      --
      CASE
         WHEN LTRIM (RTRIM (p_pagesize)) IS NULL
         THEN
            l_pagesize := l_default_pagesize;
         ELSE
            l_pagesize := p_pagesize;
      END CASE;

      l_page_opt_hint := '/*+ FIRST_ROWS(' || l_pagesize || ') */';

      CASE
         WHEN LTRIM (RTRIM (p_page)) IS NULL
         THEN
            l_page := 1;
         ELSE
            l_page := p_page;
      END CASE;

      --
      -- Load up the columns passed into the global temp table
      -- if table_driven_flag is FALSE
      --
      l_step := c_process || ' :: SET TABLE DRIVE FLAG';

      BEGIN
         IF p_column_list.COUNT > 0
         THEN
            l_table_driven_flag := l_tbl_drv_flag_false;
         ELSE
            l_table_driven_flag := l_tbl_drv_flag_true;
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            l_table_driven_flag := l_tbl_drv_flag_true;
      END;

      IF l_table_driven_flag = l_tbl_drv_flag_false
      THEN
         FOR c_col_ndx IN p_column_list.FIRST .. p_column_list.LAST
         LOOP
            INSERT INTO Q_CURSOR_DYNCOL_GLOBAL_TEMP (vdata_text)
              VALUES   (UPPER (p_column_list (c_col_ndx)));
         END LOOP;
      END IF;

      l_step := c_process || ' :: SEED SQL_EMPTY_QUERY VARIABLE';
      l_sql_empty_query :=
         '  SELECT 0 ERROR_IN_DATASET FROM DUAL WHERE 1 = 2 ';
      --
      -- The next section handles PROCESS/SUB_PROCESS validation.
      --
      -- We essentially have setup a different set of tables where we manage
      -- and define feeds by PROCESS and SUB_PROCESS. We capture a variety of things
      -- to include but not limited to :
      --
      -- Optimization Hints, What Type of Feed  DELTA vs REAL vs CURRENT, any special
      -- conditions that may apply. This is for another discussion separate from
      -- the example detailed in this sample code, but not included in detail with
      -- this whitepaper.
      --

      --
      -- Now we are going to parse the identify the dataset columns
      --
      l_step := c_process || ' :: POPULATING ARDATASET RECORD ARRAY';

--
                                                --
      OPEN c_dataset (pn_table_driven_flag      => l_table_driven_flag,
                      pn_process_id             => l_process_id,
                      pn_sub_process_id         => l_sub_process_id
                     );

      LOOP
         FETCH c_dataset BULK COLLECT INTO   ardataset LIMIT 500;

         p_count := ardataset.COUNT;
         EXIT WHEN c_dataset%NOTFOUND;
      END LOOP;

      CLOSE c_dataset;

      IF p_count = 0
      THEN
         l_step := c_process || ' :: DATASET IS NOT CONFIGURED CORRECTLY';
         l_sql_empty := l_sql_empty_query;
         l_sql := l_sql_empty;
         RAISE err_dataset_not_defined;
      END IF;

      --
      l_step :=
            c_process
         || ' :: BUILD SQL RETURN COLUMNS FROM ARDATASET RECORD ARRAY ['
         || ardataset.COUNT
         || ']';

      --
      BEGIN
         FOR i IN 1 .. p_count
         LOOP
            IF UPPER (LTRIM (RTRIM (ardataset (i).column_alias_name))) =
                  UPPER(LTRIM(RTRIM(LTRIM (ardataset (i).emp_column_detail,
                                           'hds.'))))
            THEN
               l_emp_dataset_cols :=
                     l_emp_dataset_cols
                  || ardataset (i).emp_column_detail
                  || ', ';
            ELSE
               l_emp_dataset_cols :=
                     l_emp_dataset_cols
                  || ardataset (i).emp_column_detail
                  || ' '
                  || ardataset (i).column_alias_name
                  || ', ';
            END IF;

            IF ardataset (i).column_type = 'DATE'
            THEN
               l_nulldataset_cols :=
                     l_nulldataset_cols
                  || 'TO_DATE(NULL)'
                  || ' '
                  || ardataset (i).column_alias_name
                  || ', ';
            ELSIF ardataset (i).column_type = 'TEXT'
            THEN
               l_nulldataset_cols :=
                     l_nulldataset_cols
                  || 'TO_CHAR(NULL)'
                  || ' '
                  || ardataset (i).column_alias_name
                  || ', ';
            ELSIF ardataset (i).column_type = 'NUMBER'
            THEN
               l_nulldataset_cols :=
                     l_nulldataset_cols
                  || 'TO_NUMBER(NULL)'
                  || ' '
                  || UPPER (LTRIM (RTRIM (ardataset (i).column_alias_name)))
                  || ', ';
            END IF;
         END LOOP;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            NULL;
      END;

      --
      l_step := c_process || ' :: FORMAT DATASET COLUMN STRING';
      --
      l_emp_dataset_cols :=
         ' ' || RTRIM (LTRIM (RTRIM (l_emp_dataset_cols)), ',') || ' ';
      --
      l_nulldataset_cols :=
         ' ' || RTRIM (LTRIM (RTRIM (l_nulldataset_cols)), ',') || ' ';
      --
      -- Let us setup our empty query first
      --
      l_step := c_process || ' :: CREATE EMPTY NULL DATASET';
      l_sql_empty_query :=
            '  SELECT '
         || l_nulldataset_cols
         || ' FROM DUAL
               WHERE 1 = 2 ';
      --
      --
      -- We are going to verify that parameters are not being improperly combined
      -- which could result in unpredictable data returns. If the check_group controllers
      -- detect something that violates the rules, then we will make it so that the
      -- query returns an empty data set. We also make sure that something is passed.
      --
      -- Refer information text preceding procedure to learn the rules that apply
      --

      --
      -- Seed Criteria List from QCURSOR_SEARCH_COLUMNS and related
      -- trap array with NOTUSED flag of 1.  Switch to 2 when used, and to
      -- 0 when problem exists.
      --
      l_step := c_process || ' :: IDENTIFY PARAMETERS PASSED';
      l_parm_critname_tbl := l_parm_critname_tbl_empty;
      l_parm_critid_tbl := l_parm_critid_tbl_empty;
      l_parm_crit_id2name_tbl := l_parm_crit_id2name_tbl_empty;

      --
      -- GLOBAL_TABLE column was used because my in-house solution
      -- has an earlier api that was only able to search for one single
      -- item type, but as an array of that item (item being column of data).
      --
      -- In order to ensure backwards compatibility and draw the line between
      -- the two types of global temp tables in use, I needed to add a new
      -- column to my search columns table. For purposes of this test code
      -- we will only be using the Q_CURSOR_PARMS_GLOBAL_TEMP references.
      --
      FOR c_loop IN (  SELECT   ROWNUM rownumber, column_name
                         FROM   QCURSOR_SEARCH_COLUMNS
                        WHERE   global_table = 'Q_CURSOR_PARMS_GLOBAL_TEMP'
                     ORDER BY   column_name)
      LOOP
         l_parm_critname_tbl (UPPER (c_loop.column_name)) := c_loop.rownumber;
         l_parm_critid_tbl (c_loop.rownumber) := 1;
         l_parm_crit_id2name_tbl (c_loop.rownumber) :=
            UPPER (c_loop.column_name);
      END LOOP;

      l_step := c_process || ' :: FETCH PARAMETER LIST CURSOR';

      LOOP
         FETCH p_parameter_list INTO   l_parameter_list_data;

         EXIT WHEN p_parameter_list%NOTFOUND;
         --
         -- Check to make sure that parameter is enabled
         --
         l_parameter_enabled := 'N';
         l_step := c_process || ' :: VERIFY IF INVALID PARAMETER DETECTED';

         FOR c_loop
         IN (SELECT   enabled_flag
               FROM   QCURSOR_SEARCH_COLUMNS
              WHERE       1 = 1
                      AND enabled_flag = 'Y'
                      AND global_table = 'Q_CURSOR_PARMS_GLOBAL_TEMP'
                      AND column_name =
                            UPPER (l_parameter_list_data.parameter_name))
         LOOP
            l_parameter_enabled := c_loop.enabled_flag;
         END LOOP;

         IF NVL (l_parameter_enabled, 'N') <> 'Y'
         THEN
            RAISE err_invalid_parameter;
         END IF;

         l_step := c_process || ' :: EXTRACT PARAMETER LIST DETAILS';
         l_parameter_name := UPPER (l_parameter_list_data.parameter_name);
         l_parameter_value_text := l_parameter_list_data.vdata_text;
         l_parameter_value_date := l_parameter_list_data.vdata_date;
         l_parameter_value_number := l_parameter_list_data.vdata_number;
         l_parameter_incl_excl_flag :=
            UPPER (l_parameter_list_data.incl_excl_flag);
         l_parm_entry_id := l_parameter_list_data.parameter_entry_id;

         IF l_debug = 'Y'
         THEN
            l_step := c_process || ' :: DISPLAY DEBUG DETAILS';
            print_output(   'PARM_ENTRY_ID := '
                         || l_parm_entry_id
                         || ' :: PARAMETER_NAME := '
                         || l_parameter_name
                         || ' :: PARAMETER_VALUE_TEXT := '
                         || l_parameter_value_text
                         || ' :: PARAMETER_VALUE_DATE := '
                         || TO_CHAR (l_parameter_value_date,
                                     'YYYY/MM/DD HH24:MI:SS')
                         || ' :: PARAMETER_VALUE_NUMBER := '
                         || TO_CHAR (l_parameter_value_number)
                         || ' :: (E)xclude or (I)nclude := '
                         || l_parameter_incl_excl_flag
                         || ' :: BLOCK_ID|SET_ID|MEMBER_ID|OPERATOR := '
                         || l_parameter_list_data.condition_block_id
                         || '|'
                         || l_parameter_list_data.condition_set_id
                         || '|'
                         || l_parameter_list_data.condition_member_id
                         || '|'
                         || l_parameter_list_data.condition_operator);
         END IF;

         --
         l_step :=
            c_process
            || ' :: APPEND PARAMETER_ENTRY_ID TO PERMIT ROLLING OF COMMON VALUESETS';
         --
         l_parameter_name :=
            l_parameter_name || ' [' || l_parm_entry_id || ']';
         --
         l_step := c_process || ' :: LOAD GTT WITH PARAMETER CRITERIA GRID';

         --
         INSERT INTO Q_CURSOR_PARMS_GLOBAL_TEMP (parameter_entry_id,
                                                 parameter_name,
                                                 vdata_text,
                                                 vdata_date,
                                                 vdata_number,
                                                 incl_excl_flag,
                                                 condition_block_id,
                                                 condition_set_id,
                                                 condition_member_id,
                                                 condition_operator)
           VALUES   (l_parm_entry_id,
                     UPPER (l_parameter_name),
                     l_parameter_list_data.vdata_text,
                     l_parameter_list_data.vdata_date,
                     l_parameter_list_data.vdata_number,
                     UPPER (l_parameter_list_data.incl_excl_flag),
                     l_parameter_list_data.condition_block_id,
                     l_parameter_list_data.condition_set_id,
                     l_parameter_list_data.condition_member_id,
                     l_parameter_list_data.condition_operator);

         --
         l_step := c_process || ' :: EVALUATE IF PARAMETER VALUE WAS PASSED';

         IF    l_parameter_list_data.vdata_text IS NOT NULL
            OR l_parameter_list_data.vdata_date IS NOT NULL
            OR l_parameter_list_data.vdata_number IS NOT NULL
         THEN
            l_crcbit :=
               l_parm_critname_tbl (
                  UPPER (l_parameter_list_data.parameter_name)
               );
            l_parm_critid_tbl (l_crcbit) := 2;
         END IF;

         --
         -- You might have some special validation rules that you need
         -- to perform that are specific to the data point being searched
         --
         -- In the cases below, we have a field (in actuality its 2 fields) that
         -- we need to evaluate. Since we know it will be mapping to two separate
         -- fields, we want to confirm that we have an appropriate delimiter in
         -- the data value being passed. We use the delimiter '#'
         --
         l_step := c_process || ' :: SPECIAL COMBO CHECK COID/UDN';

         --
         -- COID and UDN combo value 11701#920
         -- This checks to make sure we included the # separator
         -- if we trip this, then we flip the crcbit to 0 to signify we found a problem.
         --
         IF NVL (INSTR (l_parameter_list_data.vdata_text, '#'), 0) = 0
            AND UPPER (l_parameter_list_data.parameter_name) = 'COID/UDN'
         THEN
            l_check_group_d := l_check_group_d + 1;
            l_crcbit :=
               l_parm_critname_tbl (
                  UPPER (l_parameter_list_data.parameter_name)
               );
            l_parm_critid_tbl (l_crcbit) := 0;
         END IF;

         l_step := c_process || ' :: SPECIAL LAST/FIRST NAME SEARCH CHECK';

         --
         -- Last and First Name searches are sent as combo value Smith#Rob
         -- This checks to make sure we included the # separator
         -- if we trip this, then we flip the crcbit to 0 to signify we found a problem.
         --
         IF NVL (INSTR (l_parameter_list_data.vdata_text, '#'), 0) = 0
            AND UPPER (l_parameter_list_data.parameter_name) =
                  'LAST_AND_FIRST_NAMES'
         THEN
            l_check_group_d := l_check_group_d + 1;
            l_crcbit :=
               l_parm_critname_tbl (
                  UPPER (l_parameter_list_data.parameter_name)
               );
            l_parm_critid_tbl (l_crcbit) := 0;
         END IF;
      --
      --
      END LOOP;

      CLOSE p_parameter_list;

      --
      l_step := c_process || ' :: VALIDATE CRITERIA GRID';
      -- Validate the Criteria Grid
      -- This handles the rules that apply more globally to the
      -- criteria grid
      --
      validate_demo_pg_criteria (p_rule_id   => l_rule_failed,
                                 p_success   => l_parameter_list_validate);
      l_step := c_process || ' :: EVALUATE RESULT OF CRITERIA VALIDATION';

      --
      -- Eval exit success status of validator
      --
      -- If Invalid Parameter selection detected, then redirect to the proper exception handler
      -- otherwise use the err_parmlistvalidate exception
      --
      IF SUBSTR (l_parameter_list_validate, 1, 2) <> 'OK'
      THEN
         RAISE err_parmlistvalidate;
      END IF;

      l_step := c_process || ' :: DISPLAY PARAMETER COUNT DETAILS';

      --
      IF l_debug = 'Y'
      THEN
         l_parms_used := NULL;

         FOR idx_parms IN l_parm_critid_tbl.FIRST .. l_parm_critid_tbl.LAST
         LOOP
            IF l_parm_critid_tbl (idx_parms) IN (0, 2)
            THEN
               l_parms_used :=
                     l_parms_used
                  || ' | '
                  || ' ['
                  || idx_parms
                  || '] '
                  || l_parm_crit_id2name_tbl (idx_parms);
            END IF;
         END LOOP;

         l_parms_used := LTRIM (l_parms_used, ' | ');
         print_output ('.');
         print_output ('PARMS PASSED :=' || l_parms_used);
         print_output ('.');
      END IF;

      l_crcbit := NULL;

      FOR idx_crcbit IN l_parm_critid_tbl.FIRST .. l_parm_critid_tbl.LAST
      LOOP
         l_crcbit := l_crcbit || '[' || l_parm_critid_tbl (idx_crcbit) || ']';
      END LOOP;

      IF l_debug = 'Y'
      THEN
         print_output ('.');
         print_output ('CRCBIT :: ' || l_crcbit);
         print_output ('.');
      END IF;

      CASE
         WHEN NVL (INSTR (l_crcbit, '0'), 0) <> 0
         THEN
            l_check_group_cond := 1;
         ELSE
            l_check_group_cond := 0;
      END CASE;

      IF l_debug = 'Y'
      THEN
         --
         print_output ('GROUP CONDITION := ' || l_check_group_cond);
      --
      END IF;

      --
      IF l_check_group_cond = 1
      THEN
         l_sql_empty := l_sql_empty_query;
      --         print_output ( 'CHECK GROUP CONDITION ISSUE IDENTIFIED' );
      ELSIF NVL (INSTR (l_crcbit, '2'), 0) = 0
      THEN
         l_check_noparms := 1;
         l_sql_empty := l_sql_empty_query;
      --         print_output ( 'BAD REQUEST IDENTIFIED. NOT ENOUGH CONDITIONS' );
      END IF;

      --
      --
      -- P_TERM_DATE serves as a cutoff date so your term search is
      -- from that date to current to return terms that occured during that
      -- time frame
      --
      -- Whereas P_TERMS is a flag to indicate whether you are requesting
      -- to query Terminated individuals, Only active individuals, or both
      -- respectively Y, N, ALL
      --
      --
      IF TRUNC (NVL (p_term_date, SYSDATE)) >= TRUNC (SYSDATE)
      THEN
         l_term_date := TRUNC (SYSDATE);
      ELSE
         l_term_date := TRUNC (p_term_date);
      END IF;

      IF NVL (p_terms, 'ALL') = 'ALL'            -- Return all including terms
      THEN
         IF TRUNC (l_term_date) = TRUNC (SYSDATE)
         THEN
            l_terms_emp := '';
         ELSE
            l_terms_emp :=
                  ' AND ( (NVL(hds.term_date, ''31-DEC-4712'') BETWEEN '
               || ''''
               || TO_CHAR (l_term_date, 'DD-MON-YYYY')
               || ''''
               || ' AND TRUNC(SYSDATE)) OR 1 = 1 AND NVL(hds.term_date, ''31-DEC-4712'') >= '
               || ''''
               || TO_CHAR (l_term_date, 'DD-MON-YYYY')
               || ''''
               || ')'
               || ' ';
         END IF;
      ELSIF NVL (p_terms, 'ALL') = 'Y'
      THEN                                                -- Only return Terms
         IF TRUNC (l_term_date) = TRUNC (SYSDATE)
         THEN
            l_terms_emp :=
               ' AND TRUNC (SYSDATE) >= NVL(hds.term_date,''31-DEC-4712'')'
               || ' ';
         ELSE
            l_terms_emp :=
                  ' AND NVL(hds.term_date, ''31-DEC-4712'') BETWEEN '
               || ''''
               || TO_CHAR (l_term_date, 'DD-MON-YYYY')
               || ''''
               || ' AND TRUNC(SYSDATE) '
               || ' AND TRUNC(SYSDATE) >= NVL(hds.term_date,''31-DEC-4712'')'
               || ' ';
         END IF;
      ELSE                                        -- Include all but the terms
         l_terms_emp :=
            ' AND TRUNC(SYSDATE) <= NVL(hds.term_date,''31-DEC-4712'')'
            || ' ';
      END IF;

      l_step := c_process || ' :: SNAP SQL EMP';

      --
      -- Pagination Hint is built later in script
      -- otherwise we use default. If statistics are up to date
      -- then you can leave NULL on both counts.. and then the
      -- only hints used will be during pagination mode
      --
      IF l_mode = l_pagination_mode
      THEN
         l_hint_text_emp := '';
      ELSE
         l_hint_text_emp := '/*+ FIRST_ROWS(500) */';
      END IF;

      l_sql_emp :=
            ' SELECT '
         || l_hint_text_emp
         || l_emp_dataset_cols
         || ' FROM  demo_snap hds '
         || ' WHERE 1 = 1 '
         || l_terms_emp;

      --
      --
      IF l_debug = 'Y'
      THEN
         print_output ('Length of EMP := ' || LENGTH (l_sql_emp));
      END IF;

      l_query_length := LENGTH (l_sql_emp);

      IF l_debug = 'Y'
      THEN
         print_output ('Length of SUB_TOTAL := ' || l_query_length);
      END IF;

      --
      --
      -- We will now begin the building of the dynamic where clause based upon
      -- the criteria grid provided to the api.
      --
      -- First is the employee section. The remainder sections for Applicants, etc
      -- will be commented out since they are more less repeats of the same and also
      -- not included/necessary for the purposes of this test code.
      --
      --
      -- NEED TO APPEND OUR PIECES FROM THE GLOBAL TEMP TABLE HERE
      -- FOLLOWED BY WRAPPING PAGINATION PIECE IF IN THAT MODE
      --
      l_step := c_process || ' :: CHECK IF WANT EMPLOYEE SNAP';

      --
      IF l_debug = 'Y'
      THEN
         print_output (l_step);
      END IF;

      --
      l_sql := l_sql_emp;
      l_step := c_process || ' :: APPENDING SPECIAL SQL CONDITIONS';

      --
      IF l_debug = 'Y'
      THEN
         print_output (l_step);
      END IF;

      --
      l_sql := l_sql || l_emp_special_cond;
      --
      --
      l_condition_set_id := NULL;
      l_condition_block_id := NULL;
      l_condition_member_id := NULL;
      --
      -- OPEN FIRST BLOCK.
      --
      l_step := c_process || ' :: LOOP THRU CRITERIA GRID';

      IF l_debug = 'Y'
      THEN
         print_output (l_step);
      END IF;

      l_sql := l_sql || ' AND ( ';
      --
      l_parm_entry_id := NULL;

      FOR rec
      IN (  SELECT   (CASE
                         WHEN    (    NVL (pgt.condition_set_id, '0') = 1
                                  AND (NVL (
                                          LEAD (
                                             pgt.condition_block_id,
                                             1
                                          )
                                             OVER (
                                                ORDER BY
                                                   pgt.condition_block_id,
                                                   pgt.condition_set_id,
                                                   pgt.condition_member_id,
                                                   pgt.parameter_entry_id,
                                                   qsc.column_name
                                             ),
                                          '0'
                                       ) <> NVL (pgt.condition_block_id, '0'))
                                  AND (NVL (
                                          LAG (
                                             pgt.condition_block_id,
                                             1
                                          )
                                             OVER (
                                                ORDER BY
                                                   pgt.condition_block_id,
                                                   pgt.condition_set_id,
                                                   pgt.condition_member_id,
                                                   pgt.parameter_entry_id,
                                                   qsc.column_name
                                             ),
                                          '0'
                                       ) <> NVL (pgt.condition_block_id, '0')))
                              OR (    NVL (pgt.condition_set_id, '0') = 1
                                  AND (NVL (
                                          LEAD (
                                             pgt.condition_block_id,
                                             1
                                          )
                                             OVER (
                                                ORDER BY
                                                   pgt.condition_block_id,
                                                   pgt.condition_set_id,
                                                   pgt.condition_member_id,
                                                   pgt.parameter_entry_id,
                                                   qsc.column_name
                                             ),
                                          '0'
                                       ) = NVL (pgt.condition_block_id, '0'))
                                  AND (NVL (
                                          LAG (
                                             pgt.condition_block_id,
                                             1
                                          )
                                             OVER (
                                                ORDER BY
                                                   pgt.condition_block_id,
                                                   pgt.condition_set_id,
                                                   pgt.condition_member_id,
                                                   pgt.parameter_entry_id,
                                                   qsc.column_name
                                             ),
                                          '0'
                                       ) <> NVL (pgt.condition_block_id, '0'))
                                  AND (NVL (
                                          LEAD (
                                             pgt.condition_set_id,
                                             1
                                          )
                                             OVER (
                                                ORDER BY
                                                   pgt.condition_block_id,
                                                   pgt.condition_set_id,
                                                   pgt.condition_member_id,
                                                   pgt.parameter_entry_id,
                                                   qsc.column_name
                                             ),
                                          '0'
                                       ) <> NVL (pgt.condition_set_id, '0')))
                              OR (    NVL (pgt.condition_set_id, '0') > 1
                                  AND (NVL (
                                          LAG (
                                             pgt.condition_block_id,
                                             1
                                          )
                                             OVER (
                                                ORDER BY
                                                   pgt.condition_block_id,
                                                   pgt.condition_set_id,
                                                   pgt.condition_member_id,
                                                   pgt.parameter_entry_id,
                                                   qsc.column_name
                                             ),
                                          '0'
                                       ) = NVL (pgt.condition_block_id, '0'))
                                  AND pgt.condition_member_id = 1
                                  AND (NVL (
                                          LEAD (
                                             pgt.condition_set_id,
                                             1
                                          )
                                             OVER (
                                                ORDER BY
                                                   pgt.condition_block_id,
                                                   pgt.condition_set_id,
                                                   pgt.condition_member_id,
                                                   pgt.parameter_entry_id,
                                                   qsc.column_name
                                             ),
                                          '0'
                                       ) <> NVL (pgt.condition_set_id, '0')))
                         THEN
                            'OPEN_N_CLOSE_PARENTHESIS'
                         WHEN (NVL (LEAD (pgt.condition_block_id, 1)
                                       OVER (ORDER BY pgt.condition_block_id,
                                                      pgt.condition_set_id,
                                                      pgt.condition_member_id,
                                                      pgt.parameter_entry_id,
                                                      qsc.column_name), '0') <>
                                  NVL (pgt.condition_block_id, '0'))
                         THEN
                            'CLOSE_PARENTHESIS'
                         WHEN (NVL (LEAD (pgt.condition_block_id, 1)
                                       OVER (ORDER BY pgt.condition_block_id,
                                                      pgt.condition_set_id,
                                                      pgt.condition_member_id,
                                                      pgt.parameter_entry_id,
                                                      qsc.column_name), '0') =
                                  NVL (pgt.condition_block_id, '0'))
                              AND (NVL (
                                      LEAD (
                                         pgt.condition_set_id,
                                         1
                                      )
                                         OVER (
                                            ORDER BY pgt.condition_block_id,
                                                     pgt.condition_set_id,
                                                     pgt.condition_member_id,
                                                     pgt.parameter_entry_id,
                                                     qsc.column_name
                                         ),
                                      '0'
                                   ) <> NVL (pgt.condition_set_id, '0'))
                         THEN
                            'CLOSE_PARENTHESIS'
                         WHEN NVL (pgt.condition_member_id, '0') = 1
                         THEN
                            'OPEN_PARENTHESIS'
                         WHEN (NVL (LEAD (pgt.parameter_entry_id, 1)
                                       OVER (ORDER BY pgt.condition_block_id,
                                                      pgt.condition_set_id,
                                                      pgt.condition_member_id,
                                                      pgt.parameter_entry_id,
                                                      qsc.column_name), '0') =
                                  NVL (pgt.parameter_entry_id, '0')
                               AND NVL (
                                     LAG (pgt.parameter_entry_id, 1)
                                        OVER (ORDER BY pgt.condition_block_id,
                                                       pgt.condition_set_id,
                                                       pgt.condition_member_id,
                                                       pgt.parameter_entry_id,
                                                       qsc.column_name),
                                     '0'
                                  ) <> NVL (pgt.parameter_entry_id, '0'))
                              AND (NVL (
                                      LAG (
                                         pgt.condition_block_id,
                                         1
                                      )
                                         OVER (
                                            ORDER BY pgt.condition_block_id,
                                                     pgt.condition_set_id,
                                                     pgt.condition_member_id,
                                                     pgt.parameter_entry_id,
                                                     qsc.column_name
                                         ),
                                      '0'
                                   ) = NVL (pgt.condition_block_id, '0'))
                         THEN
                            'OPEN_PARENTHESIS'
                         ELSE
                            'MIDDLE'
                      END)
                        row_flag,
                     (CASE
                         WHEN NVL (LEAD (pgt.condition_block_id, 1)
                                      OVER (ORDER BY pgt.condition_block_id,
                                                     pgt.condition_set_id,
                                                     pgt.condition_member_id,
                                                     pgt.parameter_entry_id,
                                                     qsc.column_name), '0') = 0
                              AND (SELECT   COUNT (
                                               DISTINCT pgt1.condition_set_id
                                            )
                                     FROM   Q_CURSOR_PARMS_GLOBAL_TEMP pgt1
                                    WHERE   pgt1.condition_block_id =
                                               pgt.condition_block_id) > 1
                         THEN
                            'Y'
                         ELSE
                            'N'
                      END)
                        last_in_multiset_block,
                     qsc.*,
                     pgt.*
              FROM   QCURSOR_SEARCH_COLUMNS qsc,
                     (  SELECT   parameter_entry_id,
                                 parameter_name,
                                 incl_excl_flag,
                                 condition_block_id,
                                 condition_set_id,
                                 condition_member_id,
                                 condition_operator
                          FROM   Q_CURSOR_PARMS_GLOBAL_TEMP
                      GROUP BY   parameter_entry_id,
                                 parameter_name,
                                 incl_excl_flag,
                                 condition_block_id,
                                 condition_set_id,
                                 condition_member_id,
                                 condition_operator) pgt
             WHERE       1 = 1
                     AND qsc.enabled_flag = 'Y'
                     AND qsc.global_table = 'Q_CURSOR_PARMS_GLOBAL_TEMP'
                     AND qsc.column_name =
                           NVL (
                              RTRIM(SUBSTR (
                                       pgt.parameter_name,
                                       1,
                                       INSTR (pgt.parameter_name, '[') - 1
                                    )),
                              pgt.parameter_name
                           )
          ORDER BY   pgt.condition_block_id,
                     pgt.condition_set_id,
                     pgt.condition_member_id,
                     pgt.parameter_entry_id,
                     qsc.column_name)
      LOOP
         --
         -- QCURSOR SEARCH COLUMNS ARE STORED AS INCLUSION STATEMENTS
         -- When performing an exclusion we need to reverse some terminology
         --
         --
         IF rec.incl_excl_flag = 'E'
         THEN
            IF NVL (
                  RTRIM(SUBSTR (rec.parameter_name,
                                1,
                                INSTR (rec.parameter_name, '[') - 1)),
                  rec.parameter_name
               ) = 'ORGTREE'
            THEN
               l_step := c_process || ' :: ORGTREE EXCLUSION DETECTED';

               IF l_debug = 'Y'
               THEN
                  print_output (l_step);
               END IF;

               t_emp_search_cols :=
                  REPLACE (
                     REPLACE (rec.emp_condition,
                              '(hds.employee_number IN',
                              '(hds.employee_number NOT IN'),
                     'AND incl_excl_flag = ''I''',
                     'AND incl_excl_flag = ''E'''
                  );
            ELSE
               l_step := c_process || ' :: EXCLUSION DETECTED';

               IF l_debug = 'Y'
               THEN
                  print_output (l_step);
               END IF;

               t_emp_search_cols :=
                  REPLACE (
                     REPLACE (rec.emp_condition, 'EXISTS', 'NOT EXISTS'),
                     'AND incl_excl_flag = ''I''',
                     'AND incl_excl_flag = ''E'''
                  );
            END IF;
         ELSIF rec.incl_excl_flag = 'I'
         THEN
            t_emp_search_cols := rec.emp_condition;
         ELSE
            t_emp_search_cols := ' AND 1 = 2 ';
         END IF;

         --
         l_emp_search_cols := t_emp_search_cols;
         t_emp_search_cols := NULL;
         --
         l_step :=
            c_process
            || ' :: UPDATE PARAMETER_ENTRY_ID IN EMP_SEARCH_COLS CONDITION';
         l_emp_search_cols :=
            REPLACE (l_emp_search_cols,
                     'xxxparameter_entry_idxxx',
                     rec.parameter_entry_id);
         l_search_datatype := rec.data_type;

         IF rec.condition_block_id <>
               NVL (l_condition_block_id, rec.condition_block_id)
            AND l_emp_parm_cond IS NOT NULL
         THEN
            --
            -- BLOCK CHANGED
            -- CLOSE BLOCK AND OPEN NEW BLOCK. BLOCKS ALWAYS SEPARATED WITH "AND" OPERATORS.
            --
            l_step :=
               c_process || ' :: BLOCK CHANGED.CLOSE AND OPEN NEW BLOCK';

            IF l_debug = 'Y'
            THEN
               print_output (l_step);
            END IF;

            l_emp_parm_cond := l_emp_parm_cond || ') AND ( ';
            --
            --
            l_condition_set_id := NULL;
            l_condition_member_id := NULL;
         --
         --
         END IF;

         --
         -- SPLIT CONDITION SETS WITH "OR" OPERATORS
         --
         IF rec.condition_set_id <>
               NVL (l_condition_set_id, rec.condition_set_id)
         THEN
            l_step := c_process || ' :: SET CHANGE DETECTED';

            IF l_debug = 'Y'
            THEN
               print_output (l_step);
            END IF;

            l_emp_parm_cond := l_emp_parm_cond || ' OR ';
         END IF;

         IF UPPER (NVL (l_search_datatype, 'NA')) != 'NA'
         THEN
            IF rec.row_flag = 'OPEN_PARENTHESIS'
            THEN
               --
               IF l_debug = 'Y'
               THEN
                  l_step :=
                        c_process
                     || ' :: OPEN_PARENTHESIS X1 (-ENTRY_ID ['
                     || l_parm_entry_id
                     || '] and +ENTRY_ID ['
                     || rec.parameter_entry_id
                     || '])';
                  print_output (l_step);
               END IF;

               --
               IF     rec.condition_set_id = 1
                  AND rec.condition_member_id = 1
                  AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: SET = 1 AND MEMBER = 1 AND ENTRY_ID is NULL X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        ' ( '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF rec.condition_member_id = 1 AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: MEMBER = 1 AND ENTRY_ID is NULL X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' ( '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF rec.condition_operator = 'OR' AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: OPERATOR = OR X1 AND ENTRY_ID IS NULL X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' OR '
                     || ' (  '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF rec.condition_operator = 'AND' AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: OPERATOR = AND AND ENTRY_ID IS NULL X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' AND '
                     || ' (  '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF rec.condition_operator = 'OR' AND rec.parameter_entry_id > l_parm_entry_id
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: OPERATOR = OR X1 AND ENTRY_ID GREATER THAN LAST X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' '
                     || ' (  '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF rec.condition_operator = 'AND' AND rec.parameter_entry_id > l_parm_entry_id
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: OPERATOR = AND AND ENTRY_ID GREATER THAN LAST X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' '
                     || ' (  '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF NVL (l_parm_entry_id, -99) = rec.parameter_entry_id
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '] SAME AS PREVIOUS DO NOTHING X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  NULL;
               ELSE
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ELSE CONDITION X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' (  '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               END IF;

               IF l_debug = 'Y'
               THEN
                  print_output(   'OPEN_PARENTHESIS :: (-ENTRY_ID ['
                               || l_parm_entry_id
                               || '] and +ENTRY_ID ['
                               || rec.parameter_entry_id
                               || '])'
                               || rec.column_name
                               || ' :: '
                               || rec.incl_excl_flag
                               || '|'
                               || rec.condition_block_id
                               || '|'
                               || rec.condition_set_id
                               || '|'
                               || rec.condition_member_id
                               || '|'
                               || rec.condition_operator);
               END IF;
            ELSIF rec.row_flag = 'MIDDLE'
            THEN
               --
               IF l_debug = 'Y'
               THEN
                  l_step :=
                        c_process
                     || ' :: MIDDLE X2 (-ENTRY_ID ['
                     || l_parm_entry_id
                     || '] and +ENTRY_ID ['
                     || rec.parameter_entry_id
                     || '])';
                  print_output (l_step);
               END IF;

               --
               IF NVL (l_parm_entry_id, rec.parameter_entry_id) =
                     rec.parameter_entry_id
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ENTRY_ID MATCHES LAST X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  NULL;
               ELSIF rec.condition_member_id = 1
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: MEMBER = 1 X2 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF rec.condition_operator = 'OR'
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: OPERATOR = OR X2 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' OR '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF rec.condition_operator = 'AND'
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: OPERATOR = AND X2 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' AND '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSE
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ELSE CONDITION X2 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               END IF;

               IF l_debug = 'Y'
               THEN
                  print_output(   'MORE :: (-ENTRY_ID ['
                               || l_parm_entry_id
                               || '] and +ENTRY_ID ['
                               || rec.parameter_entry_id
                               || '])'
                               || rec.column_name
                               || ' :: '
                               || rec.incl_excl_flag
                               || '|'
                               || rec.condition_block_id
                               || '|'
                               || rec.condition_set_id
                               || '|'
                               || rec.condition_member_id
                               || '|'
                               || rec.condition_operator);
               END IF;
            ELSIF rec.row_flag = 'CLOSE_PARENTHESIS'
            THEN
               --
               IF l_debug = 'Y'
               THEN
                  l_step :=
                        c_process
                     || ' :: CLOSE_PARENTHESIS X3 (-ENTRY_ID ['
                     || l_parm_entry_id
                     || '] and +ENTRY_ID ['
                     || rec.parameter_entry_id
                     || '])';
                  print_output (l_step);
               END IF;

               --
               IF NVL (l_parm_entry_id, -99) = rec.parameter_entry_id
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ENTRY_ID MATCHES LAST X3 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond := l_emp_parm_cond || ') ';
               ELSIF rec.condition_member_id = 1
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: MEMBER = 1 X3 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               ELSIF rec.condition_operator = 'OR'
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: OPERATOR = OR X3 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' OR '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               ELSIF rec.condition_operator = 'AND'
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: OPERATOR = AND X3 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' AND '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               ELSE
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ELSE CONDITION X3 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               END IF;

               IF l_debug = 'Y'
               THEN
                  print_output(   'CLOSE_PARENTHESIS :: (-ENTRY_ID ['
                               || l_parm_entry_id
                               || '] and +ENTRY_ID ['
                               || rec.parameter_entry_id
                               || '])'
                               || rec.column_name
                               || ' :: '
                               || rec.incl_excl_flag
                               || '|'
                               || rec.condition_block_id
                               || '|'
                               || rec.condition_set_id
                               || '|'
                               || rec.condition_member_id
                               || '|'
                               || rec.condition_operator);
               END IF;
            ELSIF rec.row_flag = 'OPEN_N_CLOSE_PARENTHESIS'
            THEN
               --
               IF l_debug = 'Y'
               THEN
                  l_step :=
                        c_process
                     || ' :: OPEN_N_CLOSE_PARENTHESIS X4 (-ENTRY_ID ['
                     || l_parm_entry_id
                     || '] and +ENTRY_ID ['
                     || rec.parameter_entry_id
                     || '])';
                  print_output (l_step);
               END IF;

               --
               IF rec.condition_member_id = 1 AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: MEMBER = 1 AND ENTRY_ID IS NULL X4 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' ( '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               ELSIF rec.condition_operator = 'OR' AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: OPERATOR = OR AND ENTRY_ID IS NULL X4 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' OR ('
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               ELSIF rec.condition_operator = 'AND' AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: OPERATOR = AND AND ENTRY_ID IS NULL X4 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' AND ('
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               ELSIF rec.condition_set_id = 1 AND rec.condition_member_id = 1 AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: SET = 1 AND MEMBER = 1 AND ENTRY_ID IS NULL X4 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        ' ( '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               ELSIF NVL (l_parm_entry_id, rec.parameter_entry_id) = rec.parameter_entry_id
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ENTRY_ID MATCHES LAST X4 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  NULL;
               ELSE
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ELSE CONDITION X4 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' ( '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               END IF;

               IF l_debug = 'Y'
               THEN
                  print_output(   'OPEN_N_CLOSE_PARENTHESIS :: (-ENTRY_ID ['
                               || l_parm_entry_id
                               || '] and +ENTRY_ID ['
                               || rec.parameter_entry_id
                               || '])'
                               || rec.column_name
                               || ' :: '
                               || rec.incl_excl_flag
                               || '|'
                               || rec.condition_block_id
                               || '|'
                               || rec.condition_set_id
                               || '|'
                               || rec.condition_member_id
                               || '|'
                               || rec.condition_operator);
               END IF;
            END IF;
         ELSE
            l_sql_empty := l_sql_empty_query;
            RAISE err_invalid_parameter;
         END IF;

         l_condition_set_id := rec.condition_set_id;
         l_condition_block_id := rec.condition_block_id;
         l_parm_entry_id := rec.parameter_entry_id;
      END LOOP;

      IF l_emp_parm_cond IS NOT NULL
      THEN
         l_sql := l_sql || l_emp_parm_cond || ' ) ';
      END IF;

      --
      --
      -- BUILD PAGINATION WRAPPER
      --
      -- Note : In pagination mode we will always return 1 more record
      -- than the requested pagesize. This will permit the requestor
      -- to display the pagesize requested and provide a navigation option
      -- to retrieve the next set of records when the 'extra' row exists
      -- beyond the requested pagesize. This process is repeated until
      -- there no longer exists the extra row beyond the requested pagesize
      -- meaning... last page and the nav option for next page is no longer
      -- required or can be disabled
      --
      -- Other data provided when in pagination mode are :
      --
      -- Record Number, Page Number, Last Row of Previous Result Set,
      -- Records per Page (pagesize), Start Record for current Page,
      -- End Record for current Page
      --
      -- Optimization Hint is placed around entire generated pagination
      -- query that matches the requested pagesize...using FIRST_ROWS.
      --
      --
      IF l_mode = l_pagination_mode
      THEN
         l_sql :=
            'SELECT ' || l_page_opt_hint || ' :l_page page_number '
            || ', DECODE (:l_page,1,0,NVL((:l_pagesize * (:l_page - 1)),0)) prev_last_row '
            || ' , :l_pagesize recs_per_page,(((((NVL(:l_page, 1 )) - 1) * :l_pagesize))+ 1) page_start_rec '
            || ' , (((NVL(:l_page,1) * :l_pagesize))+ 1) max_page_end_rec '
            || ' , x.* FROM (SELECT a.*, ROW_NUMBER ( ) OVER (ORDER BY a.person_type DESC, a.employee_number) rn '
            || ' FROM ( '
            || l_sql
            || ' ) a) x WHERE x.rn BETWEEN   ((((NVL(:l_page,1)) - 1) * :l_pagesize)) + 1 AND ((NVL( :l_page,1) * :l_pagesize)) + 1';
      END IF;

      --
      l_step := c_process || ' :: END OF SNAP MODE';
      l_query_length := LENGTH (l_sql);

      --
      IF l_debug = 'Y'
      THEN
         print_output ('Length of EXECUTED SQL := ' || l_query_length);
      END IF;

      --    END OF SNAPSHOT MODE

      --
      --   If we set the value of SQL_EMPTY earlier
      --   We are going to detect this here and stub in our NO DATA RETURN QUERY
      --   Columns will be returned but no data in any
      --
      IF l_sql_empty IS NOT NULL
      THEN
         l_sql := l_sql_empty;

         CASE
            WHEN l_check_group_cond = 1
            THEN
               RAISE err_badparm_combo;
            WHEN l_check_noparms = 1
            THEN
               RAISE err_noparms_passed;
            ELSE
               RAISE err_placeholder;
         END CASE;
      END IF;

      --
      -- Only bind variables ever required are if you request
      -- chunk/pagination mode, otherwise it leverages the global temp table
      --
      IF l_mode = l_pagination_mode
      THEN
         OPEN p_cur FOR l_sql
            USING l_page,
                  l_page,
                  l_pagesize,
                  l_page,
                  l_pagesize,
                  l_page,
                  l_pagesize,
                  l_page,
                  l_pagesize,
                  l_page,
                  l_pagesize,
                  l_page,
                  l_pagesize;
      ELSE
         OPEN p_cur FOR l_sql;
      END IF;

      --
      p_sql := l_sql;
      l_success := 'OK';
      p_success := l_success;

      --
      --
      IF l_debug = 'Y'
      THEN
         print_output (
            'FINISH TIME :: ' || TO_CHAR (SYSDATE, 'DD-MON-YYYY HH24:MI:SS')
         );
      END IF;
   --
   EXCEPTION
      WHEN err_parmlistvalidate
      THEN
         l_success :=
               'ERROR :: ERR-INVALIDPARMGRID :: '
            || 'INVALID PARAMETER CRITERIA GRID DETECTED ON RULE_ID ['
            || l_rule_failed
            || ']';
         p_sql := l_sql;
         p_success := l_success;

         --
         -- This ensures that we always return a something in the p_cur value
         -- in this case an empty data set
         --
         -- The calling process can look at the p_sql value to review or handle
         -- the text describing the error that occurred.
         --
         OPEN p_cur FOR l_sql_empty_query;
      WHEN err_invalid_parameter
      THEN
         l_success :=
               'ERROR :: ERR-INVALIDPARM :: '
            || 'INVALID PARAMETER DETECTED ['
            || UPPER (l_parameter_list_data.parameter_name)
            || ']';
         p_sql := l_sql;
         p_success := l_success;

         --
         -- This ensures that we always return a something in the p_cur value
         -- in this case an empty data set
         --
         -- The calling process can look at the p_sql value to review or handle
         -- the text describing the error that occurred.
         --
         OPEN p_cur FOR l_sql_empty_query;
      WHEN err_badparm_combo
      THEN
         l_parmcombo_err := NULL;

         FOR idx_parm_err IN l_parm_critid_tbl.FIRST .. l_parm_critid_tbl.LAST
         LOOP
            IF l_parm_critid_tbl (idx_parm_err) = 0
            THEN
               l_parmcombo_err :=
                     l_parmcombo_err
                  || ', '
                  || l_parm_crit_id2name_tbl (idx_parm_err)
                  || ' ['
                  || idx_parm_err
                  || ']';
            END IF;
         END LOOP;

         l_parmcombo_err := LTRIM (l_parmcombo_err, ', ');
         l_success :=
               'ERROR :: ERR-BADPARMS :: '
            || 'BAD PARAMETER COMBINATIONS DETECTED :: '
            || l_parmcombo_err;
         p_sql := l_sql;
         p_success := l_success;

         --
         -- This ensures that we always return a something in the p_cur value
         -- in this case an empty data set
         --
         -- The calling process can look at the p_sql value to review or handle
         -- the text describing the error that occurred.
         --
         OPEN p_cur FOR l_sql_empty_query;
      WHEN err_noparms_passed
      THEN
         l_success :=
            'ERROR :: ERR-MISSINGPARMS :: '
            || 'BAD REQUEST IDENTIFIED. NOT ENOUGH CONDITIONS ';
         p_sql := l_sql;
         p_success := l_success;

         --
         -- This ensures that we always return a something in the p_cur value
         -- in this case an empty data set
         --
         -- The calling process can look at the p_sql value to review or handle
         -- the text describing the error that occurred.
         --
         OPEN p_cur FOR l_sql_empty_query;
      WHEN err_placeholder
      THEN
         l_success :=
            'ERROR :: ERR-PLACEHOLDER :: '
            || 'UNHANDLED ERRORS SHOULD GO TO THE OTHERS. THIS IS PLACEHOLDER ONLY FOR LAST CASE STATEMENT ';
         p_sql := l_sql;
         p_success := l_success;

         --
         -- This ensures that we always return a something in the p_cur value
         -- in this case an empty data set
         --
         -- The calling process can look at the p_sql value to review or handle
         -- the text describing the error that occurred.
         --
         OPEN p_cur FOR l_sql_empty_query;
      WHEN err_dataset_not_defined
      THEN
         l_success :=
            'ERROR :: ERR-DATASETCOLUMN :: '
            || 'UNDEFINED DATASET COLUMNS. CONTACT IT SUPPORT FOR SETUP/CONFIGURATION.';
         p_sql := l_sql;
         p_success := l_success;

         --
         -- This ensures that we always return a something in the p_cur value
         -- in this case an empty data set
         --
         -- The calling process can look at the p_sql value to review or handle
         -- the text describing the error that occurred.
         --
         OPEN p_cur FOR l_sql_empty_query;
      WHEN OTHERS
      THEN
         l_success :=
               'ERROR :: ERR-ORACLE :: '
            || SQLCODE
            || ' - '
            || SQLERRM
            || ' :: '
            || l_step;
         p_sql := l_sql;
         p_success := l_success;

         --
         -- This ensures that we always return a something in the p_cur value
         -- in this case an empty data set
         --
         -- The calling process can look at the p_sql value to review or handle
         -- the text describing the error that occurred.
         --
         OPEN p_cur FOR l_sql_empty_query;
   END q_demo_pg_current_snap_c1;

   --
   --
   --
   -- This one uses associative array for parameter list input
   -- which we would most likely be more compatible with other platforms
   --
   PROCEDURE q_demo_pg_current_snap_c2 (
      p_process_desc       IN     VARCHAR2 DEFAULT 'GENERIC' ,
      p_sub_process_desc   IN     VARCHAR2 DEFAULT 'GENERIC' ,
      p_mode               IN     VARCHAR2 DEFAULT 'NORMAL_MODE' ,
      p_parameter_list     IN     Dynsql_Engine.vc4000_table,
      p_terms              IN     VARCHAR2 DEFAULT 'N' ,
      p_term_date          IN     DATE DEFAULT TRUNC (SYSDATE) ,
      p_page               IN     NUMBER DEFAULT 1 ,
      p_pagesize           IN     NUMBER DEFAULT NULL ,
      p_column_list        IN     Dynsql_Engine.vc4000_table,
      p_success               OUT VARCHAR2,
      p_sql                   OUT VARCHAR2,
      p_cur                   OUT Dynsql_Engine.c_cursor
   )
   IS
      --
      l_parm_entry_id                 NUMBER := 0;
      --
      l_pagination_mode CONSTANT      VARCHAR2 (30) := 'PAGE_MODE';
      l_normal_mode CONSTANT          VARCHAR2 (30) := 'NORMAL_MODE';
      l_mode                          VARCHAR2 (30);
      l_default_pagesize CONSTANT     NUMBER := 25;
      l_pagesize                      NUMBER;
      l_page                          NUMBER;
      l_page_opt_hint                 VARCHAR2 (30);
      --
      --
      c_process CONSTANT VARCHAR2 (200)
            := 'DYNSQL_ENGINE.Q_DEMO_PG_CURRENT_SNAP_C' ;
      l_success                       VARCHAR2 (32000) := 'OK';
      l_parameter_list_validate       VARCHAR2 (1000) := 'OK';
      l_business_group_id             PLS_INTEGER := 26;
      l_query_length                  PLS_INTEGER := 0;
      --
      --
      lncnt                           PLS_INTEGER := 0;
      lnarray                         atoms_tabtype;
      lnempty_array                   atoms_tabtype;
      lntruecnt                       PLS_INTEGER := 0;
      ln_pos                          PLS_INTEGER := 0;
      ln_parameter_entry_id           Q_CURSOR_PARMS_GLOBAL_TEMP.parameter_entry_id%TYPE;
      ln_parameter_name               Q_CURSOR_PARMS_GLOBAL_TEMP.parameter_name%TYPE;
      ln_vdata_text                   Q_CURSOR_PARMS_GLOBAL_TEMP.vdata_text%TYPE;
      ln_vdata_date                   Q_CURSOR_PARMS_GLOBAL_TEMP.vdata_date%TYPE;
      ln_vdata_number                 Q_CURSOR_PARMS_GLOBAL_TEMP.vdata_number%TYPE;
      ln_incl_excl_flag               Q_CURSOR_PARMS_GLOBAL_TEMP.incl_excl_flag%TYPE;
      ln_condition_block_id           Q_CURSOR_PARMS_GLOBAL_TEMP.condition_block_id%TYPE;
      ln_condition_set_id             Q_CURSOR_PARMS_GLOBAL_TEMP.condition_set_id%TYPE;
      ln_condition_member_id          Q_CURSOR_PARMS_GLOBAL_TEMP.condition_member_id%TYPE;
      ln_condition_operator           Q_CURSOR_PARMS_GLOBAL_TEMP.condition_operator%TYPE;
      --
      l_process_desc VARCHAR2 (1000)
            := NVL (LTRIM (RTRIM (UPPER (p_process_desc))), 'GENERIC') ;
      l_sub_process_desc VARCHAR2 (1000)
            := NVL (LTRIM (RTRIM (UPPER (p_sub_process_desc))), 'GENERIC') ;
      --
      l_emp_dataset_cols              VARCHAR2 (32000);
      l_nulldataset_cols              VARCHAR2 (32000);
      --
      l_sql                           VARCHAR2 (32767);
      l_sql_emp                       VARCHAR2 (32767);
      l_hint_text_emp                 VARCHAR2 (200);
      --
      l_emp_search_cols               VARCHAR2 (32000);
      t_emp_search_cols               VARCHAR2 (32000);
      l_search_datatype               VARCHAR2 (30);
      l_emp_special_cond              VARCHAR2 (32000);
      l_emp_parm_cond                 VARCHAR2 (32000);
      l_condition_set_id              NUMBER;
      l_condition_block_id            NUMBER;
      l_condition_member_id           NUMBER;
      --
      --
      l_sql_empty                     VARCHAR2 (32767);
      l_sql_empty_query               VARCHAR2 (32767);
      l_terms_emp                     VARCHAR2 (200);
      l_term_date                     DATE := TRUNC (SYSDATE);
      l_demo_table                    VARCHAR2 (200);
      l_step                          VARCHAR2 (1000);
      --
      lbok                            BOOLEAN;
      l_process_defined_msg           VARCHAR2 (32000);
      l_process_id                    PLS_INTEGER;
      l_sub_process_id                PLS_INTEGER;
      l_tbl_drv_flag_true             VARCHAR2 (10) := 'TRUE';
      l_tbl_drv_flag_false            VARCHAR2 (10) := 'FALSE';
      l_table_driven_flag             VARCHAR2 (10) := l_tbl_drv_flag_true;
      --
      l_parameter_name                Q_CURSOR_PARMS_GLOBAL_TEMP.parameter_name%TYPE;
      l_parameter_value_text          Q_CURSOR_PARMS_GLOBAL_TEMP.vdata_text%TYPE;
      l_parameter_value_date          Q_CURSOR_PARMS_GLOBAL_TEMP.vdata_date%TYPE;
      l_parameter_value_number        Q_CURSOR_PARMS_GLOBAL_TEMP.vdata_number%TYPE;
      l_parameter_incl_excl_flag      Q_CURSOR_PARMS_GLOBAL_TEMP.incl_excl_flag%TYPE;
      l_crcbit                        VARCHAR2 (2000);
      l_parmcombo_err                 VARCHAR2 (1000);
      l_parms_used                    VARCHAR2 (1000);
      l_parm_critname_tbl_empty       Dynsql_Engine.vcnum_table;
      l_parm_critname_tbl Dynsql_Engine.vcnum_table
            := l_parm_critname_tbl_empty ;
      l_parm_critid_tbl_empty         Dynsql_Engine.vnum_table;
      l_parm_critid_tbl Dynsql_Engine.vnum_table
            := l_parm_critid_tbl_empty ;
      l_parm_crit_id2name_tbl_empty   Dynsql_Engine.vtext_table;
      l_parm_crit_id2name_tbl Dynsql_Engine.vtext_table
            := l_parm_crit_id2name_tbl_empty ;
      l_parameter_enabled             CHAR (1) := 'N';
      l_parameter_list_data           Q_CURSOR_PARMS_GLOBAL_TEMP%ROWTYPE;
      l_rule_failed                   PLS_INTEGER;
      --
      l_dataset_cnt                   PLS_INTEGER := 0;
      idx                             PLS_INTEGER;
      --
      rowcnt                          PLS_INTEGER := 0;
      p_count                         PLS_INTEGER := 0;
      ardataset                       Dynsql_Engine.dataset_table;
      --
      l_check_group_a                 PLS_INTEGER := 0;
      l_check_group_b                 PLS_INTEGER := 0;
      l_check_group_c                 PLS_INTEGER := 0;
      l_check_group_d                 PLS_INTEGER := 0;
      --
      -- IF all is well, then check_group_cond will be 0, otherwise 1.
      --
      l_check_group_cond              PLS_INTEGER := 0;
      l_check_noparms                 PLS_INTEGER := 0;
      --
      -- EXCEPTIONS
      --
      err_noparms_passed EXCEPTION;
      err_badparm_combo EXCEPTION;
      err_invalid_parameter EXCEPTION;
      err_placeholder EXCEPTION;
      err_dataset_not_defined EXCEPTION;
      err_parmlistvalidate EXCEPTION;

      --
      CURSOR c_dataset (
         pn_table_driven_flag   IN            VARCHAR2 DEFAULT 'TRUE' ,
         pn_process_id          IN            NUMBER DEFAULT -99 ,
         pn_sub_process_id      IN            NUMBER DEFAULT -99
      )
      IS
         SELECT   TO_NUMBER (NULL) process_id,
                  TO_NUMBER (NULL) sub_process_id,
                  TO_CHAR (NULL) process_desc,
                  TO_CHAR (NULL) sub_process_desc,
                  'Y' enabled,
                  column_alias_name,
                  column_type,
                  column_order,
                  description,
                  hr_secure_column,
                  (CASE
                      WHEN emp_column_detail IS NULL AND column_type = 'DATE'
                      THEN
                         'TO_DATE(NULL)'
                      WHEN emp_column_detail IS NULL
                           AND column_type = 'NUMBER'
                      THEN
                         'TO_NUMBER(NULL)'
                      WHEN emp_column_detail IS NULL AND column_type = 'TEXT'
                      THEN
                         'TO_CHAR(NULL)'
                      ELSE
                         emp_column_detail
                   END)
                     emp_column_detail
           FROM   QCURSOR_DATASET_COLUMN_MSTR
          WHERE   1 = 1 AND pn_table_driven_flag = 'FALSE'
                  AND column_alias_name IN
                           (SELECT   DISTINCT UPPER (vdata_text)
                              FROM   Q_CURSOR_DYNCOL_GLOBAL_TEMP)
         UNION
         SELECT   process_id,
                  sub_process_id,
                  process_desc,
                  sub_process_desc,
                  enabled,
                  column_alias_name,
                  column_type,
                  column_order,
                  description,
                  hr_secure_column,
                  (CASE
                      WHEN emp_column_detail IS NULL AND column_type = 'DATE'
                      THEN
                         'TO_DATE(NULL)'
                      WHEN emp_column_detail IS NULL
                           AND column_type = 'NUMBER'
                      THEN
                         'TO_NUMBER(NULL)'
                      WHEN emp_column_detail IS NULL AND column_type = 'TEXT'
                      THEN
                         'TO_CHAR(NULL)'
                      ELSE
                         emp_column_detail
                   END)
                     emp_column_detail
           FROM   QCURSOR_DATASET_COLUMN_DETAIL
          WHERE       1 = 1
                  AND pn_table_driven_flag = 'TRUE'
                  AND enabled = 'Y'
                  AND process_id = NVL (l_process_id, -99)
                  AND sub_process_id = NVL (l_sub_process_id, -99)
         ORDER BY   8;
   BEGIN
      --
      --
      IF l_debug = 'Y'
      THEN
         print_output (
            'START TIME :: ' || TO_CHAR (SYSDATE, 'DD-MON-YYYY HH24:MI:SS')
         );
      END IF;

      --
      -- Determine Mode we are working in
      --
      IF NVL (UPPER (LTRIM (RTRIM (p_mode))), 'NORMAL_MODE') = 'PAGE_MODE'
      THEN
         l_mode := l_pagination_mode;
      ELSE
         l_mode := l_normal_mode;
      END IF;

      --
      CASE
         WHEN LTRIM (RTRIM (p_pagesize)) IS NULL
         THEN
            l_pagesize := l_default_pagesize;
         ELSE
            l_pagesize := p_pagesize;
      END CASE;

      l_page_opt_hint := '/*+ FIRST_ROWS(' || l_pagesize || ') */';

      CASE
         WHEN LTRIM (RTRIM (p_page)) IS NULL
         THEN
            l_page := 1;
         ELSE
            l_page := p_page;
      END CASE;

      --
      -- Load up the columns passed into the global temp table
      -- if table_driven_flag is FALSE
      --
      l_step := c_process || ' :: SET TABLE DRIVE FLAG';

      BEGIN
         IF p_column_list.COUNT > 0
         THEN
            l_table_driven_flag := l_tbl_drv_flag_false;
         ELSE
            l_table_driven_flag := l_tbl_drv_flag_true;
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            l_table_driven_flag := l_tbl_drv_flag_true;
      END;

      IF l_table_driven_flag = l_tbl_drv_flag_false
      THEN
         FOR c_col_ndx IN p_column_list.FIRST .. p_column_list.LAST
         LOOP
            INSERT INTO Q_CURSOR_DYNCOL_GLOBAL_TEMP (vdata_text)
              VALUES   (UPPER (p_column_list (c_col_ndx)));
         END LOOP;
      END IF;

      l_step := c_process || ' :: SEED SQL_EMPTY_QUERY VARIABLE';
      l_sql_empty_query :=
         '  SELECT 0 ERROR_IN_DATASET FROM DUAL WHERE 1 = 2 ';

      --
      -- The next section handles PROCESS/SUB_PROCESS validation.
      --
      -- This really needs to be sourced from a master table of process/sub_process
      --
      -- We essentially have setup a different set of tables where we manage
      -- and define feeds by PROCESS and SUB_PROCESS. We capture a variety of things
      -- to include but not limited to :
      --
      -- Optimization Hints, What Type of Feed  DELTA vs REAL vs CURRENT, any special
      -- conditions that may apply. This is for another discussion separate from
      -- the example detailed in this sample code, but not included in detail with
      -- this whitepaper.
      --      --
      IF l_process_desc <> 'GENERIC' AND l_sub_process_desc <> 'GENERIC'
      THEN
         SELECT   process_id, sub_process_id
           INTO   l_process_id, l_sub_process_id
           FROM   QCURSOR_CRITERIA_LIBRARY
          WHERE       ROWNUM = 1
                  AND process_desc = l_process_desc
                  AND sub_process_desc = l_sub_process_desc;
      END IF;

      --
      -- Now we are going to parse the identify the dataset columns
      --
      l_step := c_process || ' :: POPULATING ARDATASET RECORD ARRAY';

--
                                                --
      OPEN c_dataset (pn_table_driven_flag      => l_table_driven_flag,
                      pn_process_id             => l_process_id,
                      pn_sub_process_id         => l_sub_process_id
                     );

      LOOP
         FETCH c_dataset BULK COLLECT INTO   ardataset LIMIT 500;

         p_count := ardataset.COUNT;
         EXIT WHEN c_dataset%NOTFOUND;
      END LOOP;

      CLOSE c_dataset;

      IF p_count = 0
      THEN
         l_step := c_process || ' :: DATASET IS NOT CONFIGURED CORRECTLY';
         l_sql_empty := l_sql_empty_query;
         l_sql := l_sql_empty;
         RAISE err_dataset_not_defined;
      END IF;

      --
      l_step :=
            c_process
         || ' :: BUILD SQL RETURN COLUMNS FROM ARDATASET RECORD ARRAY ['
         || ardataset.COUNT
         || ']';

      --
      BEGIN
         FOR i IN 1 .. p_count
         LOOP
            IF UPPER (LTRIM (RTRIM (ardataset (i).column_alias_name))) =
                  UPPER(LTRIM(RTRIM(LTRIM (ardataset (i).emp_column_detail,
                                           'hds.'))))
            THEN
               l_emp_dataset_cols :=
                     l_emp_dataset_cols
                  || ardataset (i).emp_column_detail
                  || ', ';
            ELSE
               l_emp_dataset_cols :=
                     l_emp_dataset_cols
                  || ardataset (i).emp_column_detail
                  || ' '
                  || ardataset (i).column_alias_name
                  || ', ';
            END IF;

            IF ardataset (i).column_type = 'DATE'
            THEN
               l_nulldataset_cols :=
                     l_nulldataset_cols
                  || 'TO_DATE(NULL)'
                  || ' '
                  || ardataset (i).column_alias_name
                  || ', ';
            ELSIF ardataset (i).column_type = 'TEXT'
            THEN
               l_nulldataset_cols :=
                     l_nulldataset_cols
                  || 'TO_CHAR(NULL)'
                  || ' '
                  || ardataset (i).column_alias_name
                  || ', ';
            ELSIF ardataset (i).column_type = 'NUMBER'
            THEN
               l_nulldataset_cols :=
                     l_nulldataset_cols
                  || 'TO_NUMBER(NULL)'
                  || ' '
                  || UPPER (LTRIM (RTRIM (ardataset (i).column_alias_name)))
                  || ', ';
            END IF;
         END LOOP;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            NULL;
      END;

      --
      l_step := c_process || ' :: FORMAT DATASET COLUMN STRING';
      --
      l_emp_dataset_cols :=
         ' ' || RTRIM (LTRIM (RTRIM (l_emp_dataset_cols)), ',') || ' ';
      --
      l_nulldataset_cols :=
         ' ' || RTRIM (LTRIM (RTRIM (l_nulldataset_cols)), ',') || ' ';
      --
      -- Let us setup our empty query first
      --
      l_step := c_process || ' :: CREATE EMPTY NULL DATASET';
      l_sql_empty_query :=
            '  SELECT '
         || l_nulldataset_cols
         || ' FROM DUAL
               WHERE 1 = 2 ';
      --
      --
      -- We are going to verify that parameters are not being improperly combined
      -- which could result in unpredictable data returns. If the check_group controllers
      -- detect something that violates the rules, then we will make it so that the
      -- query returns an empty data set. We also make sure that something is passed.
      --
      -- Refer information text preceding procedure to learn the rules that apply
      --

      --
      -- Seed Criteria List from QCURSOR_SEARCH_COLUMNS and related
      -- trap array with NOTUSED flag of 1.  Switch to 2 when used, and to
      -- 0 when problem exists.
      --
      l_step := c_process || ' :: IDENTIFY PARAMETERS PASSED';
      l_parm_critname_tbl := l_parm_critname_tbl_empty;
      l_parm_critid_tbl := l_parm_critid_tbl_empty;
      l_parm_crit_id2name_tbl := l_parm_crit_id2name_tbl_empty;

      --
      -- GLOBAL_TABLE column was used because my in-house solution
      -- has an earlier api that was only able to search for one single
      -- item type, but as an array of that item (item being column of data).
      --
      -- In order to ensure backwards compatibility and draw the line between
      -- the two types of global temp tables in use, I needed to add a new
      -- column to my search columns table. For purposes of this test code
      -- we will only be using the Q_CURSOR_PARMS_GLOBAL_TEMP references.
      --
      FOR c_loop IN (  SELECT   ROWNUM rownumber, column_name
                         FROM   QCURSOR_SEARCH_COLUMNS
                        WHERE   global_table = 'Q_CURSOR_PARMS_GLOBAL_TEMP'
                     ORDER BY   column_name)
      LOOP
         l_parm_critname_tbl (UPPER (c_loop.column_name)) := c_loop.rownumber;
         l_parm_critid_tbl (c_loop.rownumber) := 1;
         l_parm_crit_id2name_tbl (c_loop.rownumber) :=
            UPPER (c_loop.column_name);
      END LOOP;

      --
      l_step := c_process || ' :: FETCH PARAMETER CRITERIA GRID';

      --

      --
      FOR p_idx IN p_parameter_list.FIRST .. p_parameter_list.LAST
      LOOP
         --
         l_step := c_process || ' :: RESET PARAMETER CRITERIA TEMP VARIABLES';
         --
         ln_pos := 0;
         ln_parameter_entry_id := NULL;
         ln_parameter_name := NULL;
         ln_vdata_text := NULL;
         ln_vdata_date := NULL;
         ln_vdata_number := NULL;
         ln_incl_excl_flag := NULL;
         ln_condition_block_id := NULL;
         ln_condition_set_id := NULL;
         ln_condition_member_id := NULL;
         ln_condition_operator := NULL;
         --
         l_step := c_process || ' :: EXTRACT CRITERIA REC FROM ARRAY';
         --
         std_delimiters := '|';
         lnarray := lnempty_array;
         parse_string (string_in          => p_parameter_list (p_idx),
                       atomics_list_out   => lnarray,
                       num_atomics_out    => lncnt);
         --
         l_step := c_process || ' :: POPULATE CRITERIA VARIABLES';

         --
         FOR psub_idx IN lnarray.FIRST .. lnarray.LAST
         LOOP
            --
            -- Ignore Delimiter during field incrementer logic
            --
            IF LTRIM (RTRIM (lnarray (psub_idx))) <> '|'
            THEN
               ln_pos := ln_pos + 1;
            END IF;

            --
            -- If in debug mode, we will spitout some additional information
            -- regarding the parm criterias passed. We will replace blanks with ~ so that it is visible
            -- if leading / trailing spaces were utilized or amongst the value that might cause
            -- issues with data being matched or processed. For testing purposes only, and it does not
            -- alter the true values. Display purposes only.
            --
            IF NVL (l_debug, 'N') = 'Y'
            THEN
               print_output(   'LN_POS ['
                            || ln_pos
                            || '] :: PSUB_IDX ['
                            || psub_idx
                            || '] :: '
                            || REPLACE (lnarray (psub_idx), ' ', '~'));
            END IF;

            --
            CASE
               WHEN ln_pos = 1 AND LTRIM (RTRIM (lnarray (psub_idx))) <> '|'
               THEN
                  --
                  l_step :=
                        c_process
                     || ' :: SET CRITERIA ROW PARAMETER_ENTRY_ID ['
                     || lnarray (psub_idx)
                     || ']';
                  --
                  ln_parameter_entry_id := TO_NUMBER (lnarray (psub_idx));
               WHEN ln_pos = 2 AND LTRIM (RTRIM (lnarray (psub_idx))) <> '|'
               THEN
                  --
                  l_step :=
                        c_process
                     || ' :: SET CRITERIA ROW PARAMETER_NAME ['
                     || lnarray (psub_idx)
                     || ']';
                  --
                  ln_parameter_name := lnarray (psub_idx);
               WHEN ln_pos = 3 AND LTRIM (RTRIM (lnarray (psub_idx))) <> '|'
               THEN
                  --
                  l_step :=
                        c_process
                     || ' :: SET CRITERIA ROW VDATA_TEXT ['
                     || lnarray (psub_idx)
                     || ']';

                  --
                  IF lnarray (psub_idx) = 'NULL'
                  THEN
                     ln_vdata_text := TO_CHAR (NULL);
                  ELSE
                     ln_vdata_text := lnarray (psub_idx);
                  END IF;
               WHEN ln_pos = 4 AND LTRIM (RTRIM (lnarray (psub_idx))) <> '|'
               THEN
                  --
                  l_step :=
                        c_process
                     || ' :: SET CRITERIA ROW VDATA_DATE ['
                     || lnarray (psub_idx)
                     || ']';

                  --
                  IF lnarray (psub_idx) = 'NULL'
                  THEN
                     ln_vdata_date := TO_DATE (NULL);
                  ELSE
                     ln_vdata_date := canonical_to_date (lnarray (psub_idx));
                  END IF;
               WHEN ln_pos = 5 AND LTRIM (RTRIM (lnarray (psub_idx))) <> '|'
               THEN
                  --
                  l_step :=
                        c_process
                     || ' :: SET CRITERIA ROW VDATA_NUMBER ['
                     || lnarray (psub_idx)
                     || ']';

                  --
                  IF lnarray (psub_idx) = 'NULL'
                  THEN
                     ln_vdata_number := TO_NUMBER (NULL);
                  ELSE
                     ln_vdata_number := TO_NUMBER (lnarray (psub_idx));
                  END IF;
               WHEN ln_pos = 6 AND LTRIM (RTRIM (lnarray (psub_idx))) <> '|'
               THEN
                  --
                  l_step :=
                        c_process
                     || ' :: SET CRITERIA ROW INCL_EXCL_FLAG ['
                     || lnarray (psub_idx)
                     || ']';
                  --
                  ln_incl_excl_flag := lnarray (psub_idx);
               WHEN ln_pos = 7 AND LTRIM (RTRIM (lnarray (psub_idx))) <> '|'
               THEN
                  --
                  l_step :=
                        c_process
                     || ' :: SET CRITERIA ROW CONDITION_BLOCK_ID ['
                     || lnarray (psub_idx)
                     || ']';
                  --
                  ln_condition_block_id := TO_NUMBER (lnarray (psub_idx));
               WHEN ln_pos = 8 AND LTRIM (RTRIM (lnarray (psub_idx))) <> '|'
               THEN
                  --
                  l_step :=
                        c_process
                     || ' :: SET CRITERIA ROW CONDITION_SET_ID ['
                     || lnarray (psub_idx)
                     || ']';
                  --
                  ln_condition_set_id := TO_NUMBER (lnarray (psub_idx));
               WHEN ln_pos = 9 AND LTRIM (RTRIM (lnarray (psub_idx))) <> '|'
               THEN
                  --
                  l_step :=
                        c_process
                     || ' :: SET CRITERIA ROW CONDITION_MEMBER_ID ['
                     || lnarray (psub_idx)
                     || ']';
                  --
                  ln_condition_member_id := TO_NUMBER (lnarray (psub_idx));
               WHEN ln_pos = 10 AND LTRIM (RTRIM (lnarray (psub_idx))) <> '|'
               THEN
                  --
                  l_step :=
                        c_process
                     || ' :: SET CRITERIA ROW CONDITION_OPERATOR ['
                     || lnarray (psub_idx)
                     || ']';
                  --
                  ln_condition_operator := lnarray (psub_idx);
               WHEN ln_pos = 0 AND LTRIM (RTRIM (lnarray (psub_idx))) <> '|'
               THEN
                  --
                  l_step :=
                        c_process
                     || ' :: DO NOTHING ['
                     || lnarray (psub_idx)
                     || ']';
               --
               ELSE
                  --
                  l_step :=
                        c_process
                     || ' :: DO NOTHING ['
                     || lnarray (psub_idx)
                     || ']';
                  --
                  NULL;
            END CASE;
         END LOOP;

         --
         --
         -- Check to make sure that parameter is enabled
         --
         l_parameter_enabled := 'N';
         l_step := c_process || ' :: VERIFY IF INVALID PARAMETER DETECTED';

         FOR c_loop
         IN (SELECT   enabled_flag
               FROM   QCURSOR_SEARCH_COLUMNS
              WHERE       1 = 1
                      AND enabled_flag = 'Y'
                      AND global_table = 'Q_CURSOR_PARMS_GLOBAL_TEMP'
                      AND column_name = UPPER (ln_parameter_name))
         LOOP
            l_parameter_enabled := c_loop.enabled_flag;
         END LOOP;

         IF NVL (l_parameter_enabled, 'N') <> 'Y'
         THEN
            RAISE err_invalid_parameter;
         END IF;

         --
         l_step := c_process || ' :: EXTRACT PARAMETER LIST DETAILS';
         --
         l_parameter_name := UPPER (ln_parameter_name);
         l_parameter_value_text := ln_vdata_text;
         l_parameter_value_date := ln_vdata_date;
         l_parameter_value_number := ln_vdata_number;
         l_parameter_incl_excl_flag := UPPER (ln_incl_excl_flag);
         l_parm_entry_id := ln_parameter_entry_id;

         IF l_debug = 'Y'
         THEN
            --
            l_step := c_process || ' :: DISPLAY DEBUG DETAILS';
            --
            DBMS_OUTPUT.put_line(   'PARM_ENTRY_ID := '
                                 || l_parm_entry_id
                                 || ' :: PARAMETER_NAME := '
                                 || l_parameter_name
                                 || ' :: PARAMETER_VALUE_TEXT := '
                                 || l_parameter_value_text
                                 || ' :: PARAMETER_VALUE_DATE := '
                                 || TO_CHAR (l_parameter_value_date,
                                             'DD-MON-YYYY HH24:MI:SS')
                                 || ' :: PARAMETER_VALUE_NUMBER := '
                                 || TO_NUMBER (l_parameter_value_number)
                                 || ' :: (E)xclude or (I)nclude := '
                                 || l_parameter_incl_excl_flag
                                 || ' :: BLOCK_ID|SET_ID|MEMBER_ID|OPERATOR := '
                                 || ln_condition_block_id
                                 || '|'
                                 || ln_condition_set_id
                                 || '|'
                                 || ln_condition_member_id
                                 || '|'
                                 || ln_condition_operator);
         END IF;

         --
         l_step :=
            c_process
            || ' :: APPEND PARAMETER_ENTRY_ID TO PERMIT ROLLING OF COMMON VALUESETS';
         --
         l_parameter_name :=
            l_parameter_name || ' [' || l_parm_entry_id || ']';
         --
         l_step := c_process || ' :: LOAD GTT WITH PARAMETER CRITERIA GRID';

         --
         INSERT INTO Q_CURSOR_PARMS_GLOBAL_TEMP (parameter_entry_id,
                                                 parameter_name,
                                                 vdata_text,
                                                 vdata_date,
                                                 vdata_number,
                                                 incl_excl_flag,
                                                 condition_block_id,
                                                 condition_set_id,
                                                 condition_member_id,
                                                 condition_operator)
           VALUES   (l_parm_entry_id,
                     UPPER (l_parameter_name),
                     ln_vdata_text,
                     ln_vdata_date,
                     ln_vdata_number,
                     UPPER (ln_incl_excl_flag),
                     ln_condition_block_id,
                     ln_condition_set_id,
                     ln_condition_member_id,
                     ln_condition_operator);

         --
         l_step := c_process || ' :: EVALUATE IF PARAMETER VALUE WAS PASSED';

         IF    ln_vdata_text IS NOT NULL
            OR ln_vdata_date IS NOT NULL
            OR ln_vdata_number IS NOT NULL
         THEN
            l_crcbit := l_parm_critname_tbl (UPPER (ln_parameter_name));
            l_parm_critid_tbl (l_crcbit) := 2;
         END IF;

         --
         -- You might have some special validation rules that you need
         -- to perform that are specific to the data point being searched
         --
         -- In the cases below, we have a field (in actuality its 2 fields) that
         -- we need to evaluate. Since we know it will be mapping to two separate
         -- fields, we want to confirm that we have an appropriate delimiter in
         -- the data value being passed. We use the delimiter '#'
         --
         l_step := c_process || ' :: SPECIAL COMBO CHECK COID/UDN';

         --
         -- COID and UDN combo value 11701#920
         -- This checks to make sure we included the # separator
         -- if we trip this, then we flip the crcbit to 0 to signify we found a problem.
         --
         IF NVL (INSTR (ln_vdata_text, '#'), 0) = 0
            AND UPPER (ln_parameter_name) = 'COID/UDN'
         THEN
            l_check_group_d := l_check_group_d + 1;
            l_crcbit := l_parm_critname_tbl (UPPER (ln_parameter_name));
            l_parm_critid_tbl (l_crcbit) := 0;
         END IF;

         l_step := c_process || ' :: SPECIAL LAST/FIRST NAME SEARCH CHECK';

         --
         -- Last and First Name searches are sent as combo value Smith#Rob
         -- This checks to make sure we included the # separator
         -- if we trip this, then we flip the crcbit to 0 to signify we found a problem.
         --
         IF NVL (INSTR (ln_vdata_text, '#'), 0) = 0
            AND UPPER (ln_parameter_name) = 'LAST_AND_FIRST_NAMES'
         THEN
            l_check_group_d := l_check_group_d + 1;
            l_crcbit := l_parm_critname_tbl (UPPER (ln_parameter_name));
            l_parm_critid_tbl (l_crcbit) := 0;
         END IF;
      --
      --
      END LOOP;

      --
      l_step := c_process || ' :: VALIDATE CRITERIA GRID';
      -- Validate the Criteria Grid
      -- This handles the rules that apply more globally to the
      -- criteria grid
      --
      validate_demo_pg_criteria (p_rule_id   => l_rule_failed,
                                 p_success   => l_parameter_list_validate);
      l_step := c_process || ' :: EVALUATE RESULT OF CRITERIA VALIDATION';

      --
      -- Eval exit success status of validator
      --
      -- If Invalid Parameter selection detected, then redirect to the proper exception handler
      -- otherwise use the err_parmlistvalidate exception
      --
      IF SUBSTR (l_parameter_list_validate, 1, 2) <> 'OK'
      THEN
         RAISE err_parmlistvalidate;
      END IF;

      l_step := c_process || ' :: DISPLAY PARAMETER COUNT DETAILS';

      --
      IF l_debug = 'Y'
      THEN
         l_parms_used := NULL;

         FOR idx_parms IN l_parm_critid_tbl.FIRST .. l_parm_critid_tbl.LAST
         LOOP
            IF l_parm_critid_tbl (idx_parms) IN (0, 2)
            THEN
               l_parms_used :=
                     l_parms_used
                  || ' | '
                  || ' ['
                  || idx_parms
                  || '] '
                  || l_parm_crit_id2name_tbl (idx_parms);
            END IF;
         END LOOP;

         l_parms_used := LTRIM (l_parms_used, ' | ');
         print_output ('.');
         print_output ('PARMS PASSED :=' || l_parms_used);
         print_output ('.');
      END IF;

      l_crcbit := NULL;

      FOR idx_crcbit IN l_parm_critid_tbl.FIRST .. l_parm_critid_tbl.LAST
      LOOP
         l_crcbit := l_crcbit || '[' || l_parm_critid_tbl (idx_crcbit) || ']';
      END LOOP;

      IF l_debug = 'Y'
      THEN
         print_output ('.');
         print_output ('CRCBIT :: ' || l_crcbit);
         print_output ('.');
      END IF;

      CASE
         WHEN NVL (INSTR (l_crcbit, '0'), 0) <> 0
         THEN
            l_check_group_cond := 1;
         ELSE
            l_check_group_cond := 0;
      END CASE;

      IF l_debug = 'Y'
      THEN
         --
         print_output ('GROUP CONDITION := ' || l_check_group_cond);
      --
      END IF;

      --
      IF l_check_group_cond = 1
      THEN
         l_sql_empty := l_sql_empty_query;
      --         print_output ( 'CHECK GROUP CONDITION ISSUE IDENTIFIED' );
      ELSIF NVL (INSTR (l_crcbit, '2'), 0) = 0
      THEN
         l_check_noparms := 1;
         l_sql_empty := l_sql_empty_query;
      --         print_output ( 'BAD REQUEST IDENTIFIED. NOT ENOUGH CONDITIONS' );
      END IF;

      --
      --
      -- P_TERM_DATE serves as a cutoff date so your term search is
      -- from that date to current to return terms that occured during that
      -- time frame
      --
      -- Whereas P_TERMS is a flag to indicate whether you are requesting
      -- to query Terminated individuals, Only active individuals, or both
      -- respectively Y, N, ALL
      --
      --
      IF TRUNC (NVL (p_term_date, SYSDATE)) >= TRUNC (SYSDATE)
      THEN
         l_term_date := TRUNC (SYSDATE);
      ELSE
         l_term_date := TRUNC (p_term_date);
      END IF;

      IF NVL (p_terms, 'ALL') = 'ALL'            -- Return all including terms
      THEN
         IF TRUNC (l_term_date) = TRUNC (SYSDATE)
         THEN
            l_terms_emp := '';
         ELSE
            l_terms_emp :=
                  ' AND ( (NVL(hds.term_date, ''31-DEC-4712'') BETWEEN '
               || ''''
               || TO_CHAR (l_term_date, 'DD-MON-YYYY')
               || ''''
               || ' AND TRUNC(SYSDATE)) OR 1 = 1 AND NVL(hds.term_date, ''31-DEC-4712'') >= '
               || ''''
               || TO_CHAR (l_term_date, 'DD-MON-YYYY')
               || ''''
               || ')'
               || ' ';
         END IF;
      ELSIF NVL (p_terms, 'ALL') = 'Y'
      THEN                                                -- Only return Terms
         IF TRUNC (l_term_date) = TRUNC (SYSDATE)
         THEN
            l_terms_emp :=
               ' AND TRUNC (SYSDATE) >= NVL(hds.term_date,''31-DEC-4712'')'
               || ' ';
         ELSE
            l_terms_emp :=
                  ' AND NVL(hds.term_date, ''31-DEC-4712'') BETWEEN '
               || ''''
               || TO_CHAR (l_term_date, 'DD-MON-YYYY')
               || ''''
               || ' AND TRUNC(SYSDATE) '
               || ' AND TRUNC(SYSDATE) >= NVL(hds.term_date,''31-DEC-4712'')'
               || ' ';
         END IF;
      ELSE                                        -- Include all but the terms
         l_terms_emp :=
            ' AND TRUNC(SYSDATE) <= NVL(hds.term_date,''31-DEC-4712'')'
            || ' ';
      END IF;

      l_step := c_process || ' :: SNAP SQL EMP';

      --
      -- Pagination Hint is built later in script
      -- otherwise we use default. If statistics are up to date
      -- then you can leave NULL on both counts.. and then the
      -- only hints used will be during pagination mode
      --
      IF l_mode = l_pagination_mode
      THEN
         l_hint_text_emp := '';
      ELSE
         l_hint_text_emp := '/*+ FIRST_ROWS(500) */';
      END IF;

      l_sql_emp :=
            ' SELECT '
         || l_hint_text_emp
         || l_emp_dataset_cols
         || ' FROM  demo_snap hds '
         || ' WHERE 1 = 1 '
         || l_terms_emp;

      --
      --
      IF l_debug = 'Y'
      THEN
         print_output ('Length of EMP := ' || LENGTH (l_sql_emp));
      END IF;

      l_query_length := LENGTH (l_sql_emp);

      IF l_debug = 'Y'
      THEN
         print_output ('Length of SUB_TOTAL := ' || l_query_length);
      END IF;

      --
      --
      -- We will now begin the building of the dynamic where clause based upon
      -- the criteria grid provided to the api.
      --
      -- First is the employee section. The remainder sections for Applicants, etc
      -- will be commented out since they are more less repeats of the same and also
      -- not included/necessary for the purposes of this test code.
      --
      --
      -- NEED TO APPEND OUR PIECES FROM THE GLOBAL TEMP TABLE HERE
      -- FOLLOWED BY WRAPPING PAGINATION PIECE IF IN THAT MODE
      --
      l_step := c_process || ' :: CHECK IF WANT EMPLOYEE SNAP';

      --
      IF l_debug = 'Y'
      THEN
         print_output (l_step);
      END IF;

      --
      l_sql := l_sql_emp;
      l_step := c_process || ' :: APPENDING SPECIAL SQL CONDITIONS';

      --
      IF l_debug = 'Y'
      THEN
         print_output (l_step);
      END IF;

      --
      l_sql := l_sql || l_emp_special_cond;
      --
      --
      l_condition_set_id := NULL;
      l_condition_block_id := NULL;
      l_condition_member_id := NULL;
      --
      -- OPEN FIRST BLOCK.
      --
      l_step := c_process || ' :: LOOP THRU CRITERIA GRID';

      IF l_debug = 'Y'
      THEN
         print_output (l_step);
      END IF;

      l_sql := l_sql || ' AND ( ';
      --
      l_parm_entry_id := NULL;

      FOR rec
      IN (  SELECT   (CASE
                         WHEN    (    NVL (pgt.condition_set_id, '0') = 1
                                  AND (NVL (
                                          LEAD (
                                             pgt.condition_block_id,
                                             1
                                          )
                                             OVER (
                                                ORDER BY
                                                   pgt.condition_block_id,
                                                   pgt.condition_set_id,
                                                   pgt.condition_member_id,
                                                   pgt.parameter_entry_id,
                                                   qsc.column_name
                                             ),
                                          '0'
                                       ) <> NVL (pgt.condition_block_id, '0'))
                                  AND (NVL (
                                          LAG (
                                             pgt.condition_block_id,
                                             1
                                          )
                                             OVER (
                                                ORDER BY
                                                   pgt.condition_block_id,
                                                   pgt.condition_set_id,
                                                   pgt.condition_member_id,
                                                   pgt.parameter_entry_id,
                                                   qsc.column_name
                                             ),
                                          '0'
                                       ) <> NVL (pgt.condition_block_id, '0')))
                              OR (    NVL (pgt.condition_set_id, '0') = 1
                                  AND (NVL (
                                          LEAD (
                                             pgt.condition_block_id,
                                             1
                                          )
                                             OVER (
                                                ORDER BY
                                                   pgt.condition_block_id,
                                                   pgt.condition_set_id,
                                                   pgt.condition_member_id,
                                                   pgt.parameter_entry_id,
                                                   qsc.column_name
                                             ),
                                          '0'
                                       ) = NVL (pgt.condition_block_id, '0'))
                                  AND (NVL (
                                          LAG (
                                             pgt.condition_block_id,
                                             1
                                          )
                                             OVER (
                                                ORDER BY
                                                   pgt.condition_block_id,
                                                   pgt.condition_set_id,
                                                   pgt.condition_member_id,
                                                   pgt.parameter_entry_id,
                                                   qsc.column_name
                                             ),
                                          '0'
                                       ) <> NVL (pgt.condition_block_id, '0'))
                                  AND (NVL (
                                          LEAD (
                                             pgt.condition_set_id,
                                             1
                                          )
                                             OVER (
                                                ORDER BY
                                                   pgt.condition_block_id,
                                                   pgt.condition_set_id,
                                                   pgt.condition_member_id,
                                                   pgt.parameter_entry_id,
                                                   qsc.column_name
                                             ),
                                          '0'
                                       ) <> NVL (pgt.condition_set_id, '0')))
                              OR (    NVL (pgt.condition_set_id, '0') > 1
                                  AND (NVL (
                                          LAG (
                                             pgt.condition_block_id,
                                             1
                                          )
                                             OVER (
                                                ORDER BY
                                                   pgt.condition_block_id,
                                                   pgt.condition_set_id,
                                                   pgt.condition_member_id,
                                                   pgt.parameter_entry_id,
                                                   qsc.column_name
                                             ),
                                          '0'
                                       ) = NVL (pgt.condition_block_id, '0'))
                                  AND pgt.condition_member_id = 1
                                  AND (NVL (
                                          LEAD (
                                             pgt.condition_set_id,
                                             1
                                          )
                                             OVER (
                                                ORDER BY
                                                   pgt.condition_block_id,
                                                   pgt.condition_set_id,
                                                   pgt.condition_member_id,
                                                   pgt.parameter_entry_id,
                                                   qsc.column_name
                                             ),
                                          '0'
                                       ) <> NVL (pgt.condition_set_id, '0')))
                         THEN
                            'OPEN_N_CLOSE_PARENTHESIS'
                         WHEN (NVL (LEAD (pgt.condition_block_id, 1)
                                       OVER (ORDER BY pgt.condition_block_id,
                                                      pgt.condition_set_id,
                                                      pgt.condition_member_id,
                                                      pgt.parameter_entry_id,
                                                      qsc.column_name), '0') <>
                                  NVL (pgt.condition_block_id, '0'))
                         THEN
                            'CLOSE_PARENTHESIS'
                         WHEN (NVL (LEAD (pgt.condition_block_id, 1)
                                       OVER (ORDER BY pgt.condition_block_id,
                                                      pgt.condition_set_id,
                                                      pgt.condition_member_id,
                                                      pgt.parameter_entry_id,
                                                      qsc.column_name), '0') =
                                  NVL (pgt.condition_block_id, '0'))
                              AND (NVL (
                                      LEAD (
                                         pgt.condition_set_id,
                                         1
                                      )
                                         OVER (
                                            ORDER BY pgt.condition_block_id,
                                                     pgt.condition_set_id,
                                                     pgt.condition_member_id,
                                                     pgt.parameter_entry_id,
                                                     qsc.column_name
                                         ),
                                      '0'
                                   ) <> NVL (pgt.condition_set_id, '0'))
                         THEN
                            'CLOSE_PARENTHESIS'
                         WHEN NVL (pgt.condition_member_id, '0') = 1
                         THEN
                            'OPEN_PARENTHESIS'
                         WHEN (NVL (LEAD (pgt.parameter_entry_id, 1)
                                       OVER (ORDER BY pgt.condition_block_id,
                                                      pgt.condition_set_id,
                                                      pgt.condition_member_id,
                                                      pgt.parameter_entry_id,
                                                      qsc.column_name), '0') =
                                  NVL (pgt.parameter_entry_id, '0')
                               AND NVL (
                                     LAG (pgt.parameter_entry_id, 1)
                                        OVER (ORDER BY pgt.condition_block_id,
                                                       pgt.condition_set_id,
                                                       pgt.condition_member_id,
                                                       pgt.parameter_entry_id,
                                                       qsc.column_name),
                                     '0'
                                  ) <> NVL (pgt.parameter_entry_id, '0'))
                              AND (NVL (
                                      LAG (
                                         pgt.condition_block_id,
                                         1
                                      )
                                         OVER (
                                            ORDER BY pgt.condition_block_id,
                                                     pgt.condition_set_id,
                                                     pgt.condition_member_id,
                                                     pgt.parameter_entry_id,
                                                     qsc.column_name
                                         ),
                                      '0'
                                   ) = NVL (pgt.condition_block_id, '0'))
                         THEN
                            'OPEN_PARENTHESIS'
                         ELSE
                            'MIDDLE'
                      END)
                        row_flag,
                     (CASE
                         WHEN NVL (LEAD (pgt.condition_block_id, 1)
                                      OVER (ORDER BY pgt.condition_block_id,
                                                     pgt.condition_set_id,
                                                     pgt.condition_member_id,
                                                     pgt.parameter_entry_id,
                                                     qsc.column_name), '0') = 0
                              AND (SELECT   COUNT (
                                               DISTINCT pgt1.condition_set_id
                                            )
                                     FROM   Q_CURSOR_PARMS_GLOBAL_TEMP pgt1
                                    WHERE   pgt1.condition_block_id =
                                               pgt.condition_block_id) > 1
                         THEN
                            'Y'
                         ELSE
                            'N'
                      END)
                        last_in_multiset_block,
                     qsc.*,
                     pgt.*
              FROM   QCURSOR_SEARCH_COLUMNS qsc,
                     (  SELECT   parameter_entry_id,
                                 parameter_name,
                                 incl_excl_flag,
                                 condition_block_id,
                                 condition_set_id,
                                 condition_member_id,
                                 condition_operator
                          FROM   Q_CURSOR_PARMS_GLOBAL_TEMP
                      GROUP BY   parameter_entry_id,
                                 parameter_name,
                                 incl_excl_flag,
                                 condition_block_id,
                                 condition_set_id,
                                 condition_member_id,
                                 condition_operator) pgt
             WHERE       1 = 1
                     AND qsc.enabled_flag = 'Y'
                     AND qsc.global_table = 'Q_CURSOR_PARMS_GLOBAL_TEMP'
                     AND qsc.column_name =
                           NVL (
                              RTRIM(SUBSTR (
                                       pgt.parameter_name,
                                       1,
                                       INSTR (pgt.parameter_name, '[') - 1
                                    )),
                              pgt.parameter_name
                           )
          ORDER BY   pgt.condition_block_id,
                     pgt.condition_set_id,
                     pgt.condition_member_id,
                     pgt.parameter_entry_id,
                     qsc.column_name)
      LOOP
         --
         -- QCURSOR SEARCH COLUMNS ARE STORED AS INCLUSION STATEMENTS
         -- When performing an exclusion we need to reverse some terminology
         --
         --
         IF rec.incl_excl_flag = 'E'
         THEN
            IF NVL (
                  RTRIM(SUBSTR (rec.parameter_name,
                                1,
                                INSTR (rec.parameter_name, '[') - 1)),
                  rec.parameter_name
               ) = 'ORGTREE'
            THEN
               l_step := c_process || ' :: ORGTREE EXCLUSION DETECTED';

               IF l_debug = 'Y'
               THEN
                  print_output (l_step);
               END IF;

               t_emp_search_cols :=
                  REPLACE (
                     REPLACE (rec.emp_condition,
                              '(hds.employee_number IN',
                              '(hds.employee_number NOT IN'),
                     'AND incl_excl_flag = ''I''',
                     'AND incl_excl_flag = ''E'''
                  );
            ELSE
               l_step := c_process || ' :: EXCLUSION DETECTED';

               IF l_debug = 'Y'
               THEN
                  print_output (l_step);
               END IF;

               t_emp_search_cols :=
                  REPLACE (
                     REPLACE (rec.emp_condition, 'EXISTS', 'NOT EXISTS'),
                     'AND incl_excl_flag = ''I''',
                     'AND incl_excl_flag = ''E'''
                  );
            END IF;
         ELSIF rec.incl_excl_flag = 'I'
         THEN
            t_emp_search_cols := rec.emp_condition;
         ELSE
            t_emp_search_cols := ' AND 1 = 2 ';
         END IF;

         --
         l_emp_search_cols := t_emp_search_cols;
         t_emp_search_cols := NULL;
         --
         l_step :=
            c_process
            || ' :: UPDATE PARAMETER_ENTRY_ID IN EMP_SEARCH_COLS CONDITION';
         l_emp_search_cols :=
            REPLACE (l_emp_search_cols,
                     'xxxparameter_entry_idxxx',
                     rec.parameter_entry_id);
         l_search_datatype := rec.data_type;

         IF rec.condition_block_id <>
               NVL (l_condition_block_id, rec.condition_block_id)
            AND l_emp_parm_cond IS NOT NULL
         THEN
            --
            -- BLOCK CHANGED
            -- CLOSE BLOCK AND OPEN NEW BLOCK. BLOCKS ALWAYS SEPARATED WITH "AND" OPERATORS.
            --
            l_step :=
               c_process || ' :: BLOCK CHANGED.CLOSE AND OPEN NEW BLOCK';

            IF l_debug = 'Y'
            THEN
               print_output (l_step);
            END IF;

            l_emp_parm_cond := l_emp_parm_cond || ') AND ( ';
            --
            --
            l_condition_set_id := NULL;
            l_condition_member_id := NULL;
         --
         --
         END IF;

         --
         -- SPLIT CONDITION SETS WITH "OR" OPERATORS
         --
         IF rec.condition_set_id <>
               NVL (l_condition_set_id, rec.condition_set_id)
         THEN
            l_step := c_process || ' :: SET CHANGE DETECTED';

            IF l_debug = 'Y'
            THEN
               print_output (l_step);
            END IF;

            l_emp_parm_cond := l_emp_parm_cond || ' OR ';
         END IF;

         IF UPPER (NVL (l_search_datatype, 'NA')) != 'NA'
         THEN
            IF rec.row_flag = 'OPEN_PARENTHESIS'
            THEN
               --
               IF l_debug = 'Y'
               THEN
                  l_step :=
                        c_process
                     || ' :: OPEN_PARENTHESIS X1 (-ENTRY_ID ['
                     || l_parm_entry_id
                     || '] and +ENTRY_ID ['
                     || rec.parameter_entry_id
                     || '])';
                  print_output (l_step);
               END IF;

               --
               IF     rec.condition_set_id = 1
                  AND rec.condition_member_id = 1
                  AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: SET = 1 AND MEMBER = 1 AND ENTRY_ID is NULL X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        ' ( '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF rec.condition_member_id = 1 AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: MEMBER = 1 AND ENTRY_ID is NULL X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' ( '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF rec.condition_operator = 'OR' AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: OPERATOR = OR X1 AND ENTRY_ID IS NULL X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' OR '
                     || ' (  '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF rec.condition_operator = 'AND' AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: OPERATOR = AND AND ENTRY_ID IS NULL X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' AND '
                     || ' (  '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF rec.condition_operator = 'OR' AND rec.parameter_entry_id > l_parm_entry_id
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: OPERATOR = OR X1 AND ENTRY_ID GREATER THAN LAST X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' '
                     || ' (  '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF rec.condition_operator = 'AND' AND rec.parameter_entry_id > l_parm_entry_id
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: OPERATOR = AND AND ENTRY_ID GREATER THAN LAST X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' '
                     || ' (  '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF NVL (l_parm_entry_id, -99) = rec.parameter_entry_id
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '] SAME AS PREVIOUS DO NOTHING X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  NULL;
               ELSE
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ELSE CONDITION X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' (  '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               END IF;

               IF l_debug = 'Y'
               THEN
                  print_output(   'OPEN_PARENTHESIS :: (-ENTRY_ID ['
                               || l_parm_entry_id
                               || '] and +ENTRY_ID ['
                               || rec.parameter_entry_id
                               || '])'
                               || rec.column_name
                               || ' :: '
                               || rec.incl_excl_flag
                               || '|'
                               || rec.condition_block_id
                               || '|'
                               || rec.condition_set_id
                               || '|'
                               || rec.condition_member_id
                               || '|'
                               || rec.condition_operator);
               END IF;
            ELSIF rec.row_flag = 'MIDDLE'
            THEN
               --
               IF l_debug = 'Y'
               THEN
                  l_step :=
                        c_process
                     || ' :: MIDDLE X2 (-ENTRY_ID ['
                     || l_parm_entry_id
                     || '] and +ENTRY_ID ['
                     || rec.parameter_entry_id
                     || '])';
                  print_output (l_step);
               END IF;

               --
               IF NVL (l_parm_entry_id, rec.parameter_entry_id) =
                     rec.parameter_entry_id
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ENTRY_ID MATCHES LAST X1 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  NULL;
               ELSIF rec.condition_member_id = 1
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: MEMBER = 1 X2 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF rec.condition_operator = 'OR'
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: OPERATOR = OR X2 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' OR '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSIF rec.condition_operator = 'AND'
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: OPERATOR = AND X2 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' AND '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               ELSE
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ELSE CONDITION X2 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols;
               END IF;

               IF l_debug = 'Y'
               THEN
                  print_output(   'MORE :: (-ENTRY_ID ['
                               || l_parm_entry_id
                               || '] and +ENTRY_ID ['
                               || rec.parameter_entry_id
                               || '])'
                               || rec.column_name
                               || ' :: '
                               || rec.incl_excl_flag
                               || '|'
                               || rec.condition_block_id
                               || '|'
                               || rec.condition_set_id
                               || '|'
                               || rec.condition_member_id
                               || '|'
                               || rec.condition_operator);
               END IF;
            ELSIF rec.row_flag = 'CLOSE_PARENTHESIS'
            THEN
               --
               IF l_debug = 'Y'
               THEN
                  l_step :=
                        c_process
                     || ' :: CLOSE_PARENTHESIS X3 (-ENTRY_ID ['
                     || l_parm_entry_id
                     || '] and +ENTRY_ID ['
                     || rec.parameter_entry_id
                     || '])';
                  print_output (l_step);
               END IF;

               --
               IF NVL (l_parm_entry_id, -99) = rec.parameter_entry_id
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ENTRY_ID MATCHES LAST X3 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond := l_emp_parm_cond || ') ';
               ELSIF rec.condition_member_id = 1
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: MEMBER = 1 X3 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               ELSIF rec.condition_operator = 'OR'
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: OPERATOR = OR X3 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' OR '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               ELSIF rec.condition_operator = 'AND'
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: OPERATOR = AND X3 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' AND '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               ELSE
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ELSE CONDITION X3 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               END IF;

               IF l_debug = 'Y'
               THEN
                  print_output(   'CLOSE_PARENTHESIS :: (-ENTRY_ID ['
                               || l_parm_entry_id
                               || '] and +ENTRY_ID ['
                               || rec.parameter_entry_id
                               || '])'
                               || rec.column_name
                               || ' :: '
                               || rec.incl_excl_flag
                               || '|'
                               || rec.condition_block_id
                               || '|'
                               || rec.condition_set_id
                               || '|'
                               || rec.condition_member_id
                               || '|'
                               || rec.condition_operator);
               END IF;
            ELSIF rec.row_flag = 'OPEN_N_CLOSE_PARENTHESIS'
            THEN
               --
               IF l_debug = 'Y'
               THEN
                  l_step :=
                        c_process
                     || ' :: OPEN_N_CLOSE_PARENTHESIS X4 (-ENTRY_ID ['
                     || l_parm_entry_id
                     || '] and +ENTRY_ID ['
                     || rec.parameter_entry_id
                     || '])';
                  print_output (l_step);
               END IF;

               --
               IF rec.condition_member_id = 1 AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: MEMBER = 1 AND ENTRY_ID IS NULL X4 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' ( '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               ELSIF rec.condition_operator = 'OR' AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: OPERATOR = OR AND ENTRY_ID IS NULL X4 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' OR ('
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               ELSIF rec.condition_operator = 'AND' AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: OPERATOR = AND AND ENTRY_ID IS NULL X4 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' AND ('
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               ELSIF rec.condition_set_id = 1 AND rec.condition_member_id = 1 AND l_parm_entry_id IS NULL
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                        c_process
                        || ' :: SET = 1 AND MEMBER = 1 AND ENTRY_ID IS NULL X4 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        ' ( '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               ELSIF NVL (l_parm_entry_id, rec.parameter_entry_id) = rec.parameter_entry_id
               THEN
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ENTRY_ID MATCHES LAST X4 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  NULL;
               ELSE
                  --
                  IF l_debug = 'Y'
                  THEN
                     l_step :=
                           c_process
                        || ' :: ELSE CONDITION X4 (-ENTRY_ID ['
                        || l_parm_entry_id
                        || '] and +ENTRY_ID ['
                        || rec.parameter_entry_id
                        || '])';
                     print_output (l_step);
                  END IF;

                  --
                  l_emp_parm_cond :=
                        l_emp_parm_cond
                     || ' ( '
                     || ' /* '
                     || rec.column_name
                     || ' */ '
                     || l_emp_search_cols
                     || ') ';
               END IF;

               IF l_debug = 'Y'
               THEN
                  print_output(   'OPEN_N_CLOSE_PARENTHESIS :: (-ENTRY_ID ['
                               || l_parm_entry_id
                               || '] and +ENTRY_ID ['
                               || rec.parameter_entry_id
                               || '])'
                               || rec.column_name
                               || ' :: '
                               || rec.incl_excl_flag
                               || '|'
                               || rec.condition_block_id
                               || '|'
                               || rec.condition_set_id
                               || '|'
                               || rec.condition_member_id
                               || '|'
                               || rec.condition_operator);
               END IF;
            END IF;
         ELSE
            l_sql_empty := l_sql_empty_query;
            RAISE err_invalid_parameter;
         END IF;

         l_condition_set_id := rec.condition_set_id;
         l_condition_block_id := rec.condition_block_id;
         l_parm_entry_id := rec.parameter_entry_id;
      END LOOP;

      IF l_emp_parm_cond IS NOT NULL
      THEN
         l_sql := l_sql || l_emp_parm_cond || ' ) ';
      END IF;

      --
      --
      -- BUILD PAGINATION WRAPPER
      --
      -- Note : In pagination mode we will always return 1 more record
      -- than the requested pagesize. This will permit the requestor
      -- to display the pagesize requested and provide a navigation option
      -- to retrieve the next set of records when the 'extra' row exists
      -- beyond the requested pagesize. This process is repeated until
      -- there no longer exists the extra row beyond the requested pagesize
      -- meaning... last page and the nav option for next page is no longer
      -- required or can be disabled
      --
      -- Other data provided when in pagination mode are :
      --
      -- Record Number, Page Number, Last Row of Previous Result Set,
      -- Records per Page (pagesize), Start Record for current Page,
      -- End Record for current Page
      --
      -- Optimization Hint is placed around entire generated pagination
      -- query that matches the requested pagesize...using FIRST_ROWS.
      --
      --
      IF l_mode = l_pagination_mode
      THEN
         l_sql :=
            'SELECT ' || l_page_opt_hint || ' :l_page page_number '
            || ', DECODE (:l_page,1,0,NVL((:l_pagesize * (:l_page - 1)),0)) prev_last_row '
            || ' , :l_pagesize recs_per_page,(((((NVL(:l_page, 1 )) - 1) * :l_pagesize))+ 1) page_start_rec '
            || ' , (((NVL(:l_page,1) * :l_pagesize))+ 1) max_page_end_rec '
            || ' , x.* FROM (SELECT a.*, ROW_NUMBER ( ) OVER (ORDER BY a.person_type DESC, a.employee_number) rn '
            || ' FROM ( '
            || l_sql
            || ' ) a) x WHERE x.rn BETWEEN   ((((NVL(:l_page,1)) - 1) * :l_pagesize)) + 1 AND ((NVL( :l_page,1) * :l_pagesize)) + 1';
      END IF;

      --
      l_step := c_process || ' :: END OF SNAP MODE';
      l_query_length := LENGTH (l_sql);

      --
      IF l_debug = 'Y'
      THEN
         print_output ('Length of EXECUTED SQL := ' || l_query_length);
      END IF;

      --    END OF SNAPSHOT MODE

      --
      --   If we set the value of SQL_EMPTY earlier
      --   We are going to detect this here and stub in our NO DATA RETURN QUERY
      --   Columns will be returned but no data in any
      --
      IF l_sql_empty IS NOT NULL
      THEN
         l_sql := l_sql_empty;

         CASE
            WHEN l_check_group_cond = 1
            THEN
               RAISE err_badparm_combo;
            WHEN l_check_noparms = 1
            THEN
               RAISE err_noparms_passed;
            ELSE
               RAISE err_placeholder;
         END CASE;
      END IF;

      --
      -- Only bind variables ever required are if you request
      -- chunk/pagination mode, otherwise it leverages the global temp table
      --
      IF l_mode = l_pagination_mode
      THEN
         OPEN p_cur FOR l_sql
            USING l_page,
                  l_page,
                  l_pagesize,
                  l_page,
                  l_pagesize,
                  l_page,
                  l_pagesize,
                  l_page,
                  l_pagesize,
                  l_page,
                  l_pagesize,
                  l_page,
                  l_pagesize;
      ELSE
         OPEN p_cur FOR l_sql;
      END IF;

      --
      p_sql := l_sql;
      l_success := 'OK';
      p_success := l_success;

      --
      --
      IF l_debug = 'Y'
      THEN
         print_output (
            'FINISH TIME :: ' || TO_CHAR (SYSDATE, 'DD-MON-YYYY HH24:MI:SS')
         );
      END IF;
   --
   EXCEPTION
      WHEN err_parmlistvalidate
      THEN
         l_success :=
               'ERROR :: ERR-INVALIDPARMGRID :: '
            || 'INVALID PARAMETER CRITERIA GRID DETECTED ON RULE_ID ['
            || l_rule_failed
            || ']';
         p_sql := l_sql;
         p_success := l_success;

         --
         -- This ensures that we always return a something in the p_cur value
         -- in this case an empty data set
         --
         -- The calling process can look at the p_sql value to review or handle
         -- the text describing the error that occurred.
         --
         OPEN p_cur FOR l_sql_empty_query;
      WHEN err_invalid_parameter
      THEN
         l_success :=
               'ERROR :: ERR-INVALIDPARM :: '
            || 'INVALID PARAMETER DETECTED ['
            || UPPER (l_parameter_name)
            || ']';
         p_sql := l_sql;
         p_success := l_success;

         --
         -- This ensures that we always return a something in the p_cur value
         -- in this case an empty data set
         --
         -- The calling process can look at the p_sql value to review or handle
         -- the text describing the error that occurred.
         --
         OPEN p_cur FOR l_sql_empty_query;
      WHEN err_badparm_combo
      THEN
         l_parmcombo_err := NULL;

         FOR idx_parm_err IN l_parm_critid_tbl.FIRST .. l_parm_critid_tbl.LAST
         LOOP
            IF l_parm_critid_tbl (idx_parm_err) = 0
            THEN
               l_parmcombo_err :=
                     l_parmcombo_err
                  || ', '
                  || l_parm_crit_id2name_tbl (idx_parm_err)
                  || ' ['
                  || idx_parm_err
                  || ']';
            END IF;
         END LOOP;

         l_parmcombo_err := LTRIM (l_parmcombo_err, ', ');
         l_success :=
               'ERROR :: ERR-BADPARMS :: '
            || 'BAD PARAMETER COMBINATIONS DETECTED :: '
            || l_parmcombo_err;
         p_sql := l_sql;
         p_success := l_success;

         --
         -- This ensures that we always return a something in the p_cur value
         -- in this case an empty data set
         --
         -- The calling process can look at the p_sql value to review or handle
         -- the text describing the error that occurred.
         --
         OPEN p_cur FOR l_sql_empty_query;
      WHEN err_noparms_passed
      THEN
         l_success :=
            'ERROR :: ERR-MISSINGPARMS :: '
            || 'BAD REQUEST IDENTIFIED. NOT ENOUGH CONDITIONS ';
         p_sql := l_sql;
         p_success := l_success;

         --
         -- This ensures that we always return a something in the p_cur value
         -- in this case an empty data set
         --
         -- The calling process can look at the p_sql value to review or handle
         -- the text describing the error that occurred.
         --
         OPEN p_cur FOR l_sql_empty_query;
      WHEN err_placeholder
      THEN
         l_success :=
            'ERROR :: ERR-PLACEHOLDER :: '
            || 'UNHANDLED ERRORS SHOULD GO TO THE OTHERS. THIS IS PLACEHOLDER ONLY FOR LAST CASE STATEMENT ';
         p_sql := l_sql;
         p_success := l_success;

         --
         -- This ensures that we always return a something in the p_cur value
         -- in this case an empty data set
         --
         -- The calling process can look at the p_sql value to review or handle
         -- the text describing the error that occurred.
         --
         OPEN p_cur FOR l_sql_empty_query;
      WHEN err_dataset_not_defined
      THEN
         l_success :=
            'ERROR :: ERR-DATASETCOLUMN :: '
            || 'UNDEFINED DATASET COLUMNS. CONTACT IT SUPPORT FOR SETUP/CONFIGURATION.';
         p_sql := l_sql;
         p_success := l_success;

         --
         -- This ensures that we always return a something in the p_cur value
         -- in this case an empty data set
         --
         -- The calling process can look at the p_sql value to review or handle
         -- the text describing the error that occurred.
         --
         OPEN p_cur FOR l_sql_empty_query;
      WHEN OTHERS
      THEN
         l_success :=
               'ERROR :: ERR-ORACLE :: '
            || SQLCODE
            || ' - '
            || SQLERRM
            || ' :: '
            || l_step;
         p_sql := l_sql;
         p_success := l_success;

         --
         -- This ensures that we always return a something in the p_cur value
         -- in this case an empty data set
         --
         -- The calling process can look at the p_sql value to review or handle
         -- the text describing the error that occurred.
         --
         OPEN p_cur FOR l_sql_empty_query;
   END q_demo_pg_current_snap_c2;
--
--
END Dynsql_Engine;
/
 
