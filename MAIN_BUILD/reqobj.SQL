PROMPT .
PROMPT DROP/CREATE QCURSOR_COL_TBL and QCURSOR_COL_RECTYPE
PROMPT .

DROP TYPE qcursor_col_tbl
/
DROP TYPE qcursor_col_rectype
/
--
-- QCURSOR_COL_RECTYPE  (Type)
--
--  Dependencies:
--   STANDARD (Package)
--

CREATE OR REPLACE TYPE qcursor_col_rectype AS OBJECT (
   qcursor_column_name           VARCHAR2 ( 100 )
)
/

--
-- QCURSOR_COL_TBL  (Type)
--
--  Dependencies:
--   STANDARD (Package)
--   QCURSOR_COL_RECTYPE (Type)
--

CREATE OR REPLACE TYPE qcursor_col_tbl AS TABLE OF qcursor_col_rectype
/

PROMPT .
PROMPT DROP/CREATE QCURSOR_DATASET_COLUMN_MSTR
PROMPT OBJECT TO HOLD MASTER LIST OF COLUMNS AND RELATED CONDITIONS
PROMPT .


ALTER TABLE qcursor_dataset_column_mstr
 DROP PRIMARY KEY CASCADE
/
DROP TABLE qcursor_dataset_column_mstr CASCADE CONSTRAINTS
/
--
-- QCURSOR_DATASET_COLUMN_MSTR  (Table)
--
CREATE TABLE qcursor_dataset_column_mstr
(
  column_alias_name       VARCHAR2(100 BYTE),
  column_type             VARCHAR2(30 BYTE),
  column_order            NUMBER(6),
  description             VARCHAR2(500 BYTE),
  hr_secure_column        VARCHAR2(1 BYTE)      DEFAULT 'N',
  emp_column_detail  VARCHAR2(1000 BYTE)
)
LOGGING
NOCOMPRESS
NOCACHE
NOPARALLEL
MONITORING
/
--
-- QCURSOR_DATASET_COLUMN_MSTR_PK  (Index)
--
--  Dependencies:
--   QCURSOR_DATASET_COLUMN_MSTR (Table)
--
CREATE UNIQUE INDEX qcursor_dataset_column_mstr_pk ON qcursor_dataset_column_mstr
(column_alias_name)
LOGGING
NOPARALLEL
/
--
-- Non Foreign Key Constraints for Table QCURSOR_DATASET_COLUMN_MSTR
--
ALTER TABLE qcursor_dataset_column_mstr ADD (
  CONSTRAINT qcursor_dataset_column_mstr_pk
 PRIMARY KEY
 (column_alias_name))
/
PROMPT .
PROMPT DROP/CREATE QCURSOR_DATASET_COLUMN_DETAIL
PROMPT OBJECT TO HOLD LIST OF COLUMNS ASSIGNED TO PRE-DEFINED PROCESS/SUB_PROCESSES
PROMPT .

ALTER TABLE qcursor_dataset_column_detail
 DROP PRIMARY KEY CASCADE
/
DROP TABLE qcursor_dataset_column_detail CASCADE CONSTRAINTS
/
--
-- QCURSOR_DATASET_COLUMN_DETAIL  (Table)
--
--  Dependencies:
--   QCURSOR_DATASET_COLUMN_MSTR (Table)
--
CREATE TABLE qcursor_dataset_column_detail
(
  process_id              NUMBER(6),
  sub_process_id          NUMBER(2),
  process_desc            VARCHAR2(100 BYTE),
  sub_process_desc        VARCHAR2(100 BYTE),
  enabled                 VARCHAR2(1 BYTE),
  column_alias_name       VARCHAR2(100 BYTE),
  column_type             VARCHAR2(30 BYTE),
  column_order            NUMBER(6),
  description             VARCHAR2(500 BYTE),
  hr_secure_column        VARCHAR2(1 BYTE),
  emp_column_detail  VARCHAR2(1000 BYTE)
)
LOGGING
NOCOMPRESS
NOCACHE
NOPARALLEL
MONITORING
/
--
-- QCURSOR_DATASET_COLUMN_DTL_PK  (Index)
--
--  Dependencies:
--   QCURSOR_DATASET_COLUMN_DETAIL (Table)
--
CREATE UNIQUE INDEX qcursor_dataset_column_dtl_pk ON qcursor_dataset_column_detail
(process_id, sub_process_id, column_alias_name)
LOGGING
NOPARALLEL
/
--
-- Non Foreign Key Constraints for Table QCURSOR_DATASET_COLUMN_DETAIL
--
ALTER TABLE qcursor_dataset_column_detail ADD (
  CONSTRAINT qcursor_dataset_column_dtl_pk
 PRIMARY KEY
 (process_id, sub_process_id, column_alias_name))
/
--
-- Foreign Key Constraints for Table QCURSOR_DATASET_COLUMN_DETAIL
--
ALTER TABLE qcursor_dataset_column_detail ADD (
  CONSTRAINT qcursor_dataset_column_dtl_fk2
 FOREIGN KEY (column_alias_name)
 REFERENCES qcursor_dataset_column_mstr (column_alias_name))
/
PROMPT .
PROMPT DROP/CREATE QCURSOR_DYNCOL_GLOBAL_TEMP
PROMPT .

DROP TABLE q_cursor_dyncol_global_temp CASCADE CONSTRAINTS
/
--
-- Q_CURSOR_DYNCOL_GLOBAL_TEMP  (Table)
--
CREATE GLOBAL TEMPORARY TABLE q_cursor_dyncol_global_temp
(
  vdata_text    VARCHAR2(100 BYTE)
)
ON COMMIT DELETE ROWS
NOCACHE
/
PROMPT .
PROMPT DROP/CREATE Q_CURSOR_PARMS_GLOBAL_TEMP
PROMPT .

DROP TABLE q_cursor_parms_global_temp CASCADE CONSTRAINTS
/
--
-- Q_CURSOR_PARMS_GLOBAL_TEMP  (Table)
--
CREATE GLOBAL TEMPORARY TABLE q_cursor_parms_global_temp
( parameter_entry_id NUMBER,
  parameter_name   VARCHAR2(100 BYTE),
  vdata_text    VARCHAR2(4000 BYTE),
  vdata_date    DATE,
  vdata_number  NUMBER,
  incl_excl_flag VARCHAR2(10),
  condition_block_id NUMBER,
  condition_set_id NUMBER,
  condition_member_id NUMBER,
  condition_operator VARCHAR2(30)
)
ON COMMIT DELETE ROWS
NOCACHE
/
ALTER TABLE q_cursor_parms_global_temp ADD
CONSTRAINT q_cursor_parms_global_temp_c01
 CHECK (incl_excl_flag IN ('I','E')) ENABLE
 VALIDATE
/
ALTER TABLE q_cursor_parms_global_temp ADD
CONSTRAINT q_cursor_parms_global_temp_c02
 CHECK (condition_operator IN ('AND','OR')) ENABLE
 VALIDATE
/
CREATE INDEX q_cursor_parms_global_temp_n1 ON q_cursor_parms_global_temp
(parameter_entry_id,condition_block_id, condition_set_id, condition_member_id)
/
PROMPT .
PROMPT DROP/CREATE QCURSOR_SEARCH_COLUMNS
PROMPT .

ALTER TABLE qcursor_search_columns
 DROP PRIMARY KEY CASCADE
/
DROP TABLE qcursor_search_columns CASCADE CONSTRAINTS
/
--
-- QCURSOR_SEARCH_COLUMNS  (Table)
--
CREATE TABLE qcursor_search_columns
(
  column_name       VARCHAR2(100 BYTE),
  description       VARCHAR2(250 BYTE),
  data_type         VARCHAR2(30 BYTE),
  enabled_flag      CHAR(1 BYTE)                DEFAULT 'Y',
  emp_condition     VARCHAR2(4000 BYTE),
  creation_date     DATE                        DEFAULT SYSDATE,
  created_by        NUMBER,
  last_update_date  DATE                        DEFAULT SYSDATE,
  last_updated_by   NUMBER,
  global_table      VARCHAR2(50 BYTE)
)
LOGGING
NOCOMPRESS
NOCACHE
NOPARALLEL
MONITORING
/
--
-- QCURSOR_SEARCH_COLUMNS_PK  (Index)
--
--  Dependencies:
--   QCURSOR_SEARCH_COLUMNS (Table)
--
CREATE UNIQUE INDEX qcursor_search_columns_pk ON qcursor_search_columns
(column_name, global_table, enabled_flag)
LOGGING
NOPARALLEL
/
--
-- Non Foreign Key Constraints for Table QCURSOR_SEARCH_COLUMNS
--
ALTER TABLE qcursor_search_columns ADD (
  CONSTRAINT qcursor_search_columns_pk
 PRIMARY KEY
 (column_name, global_table, enabled_flag))
/
PROMPT .
PROMPT DROP/CREATE DEMO_SNAP TABLE
PROMPT .

--
-- Here is a sample demographic table
--
-- Instead of hitting our live realtime tables, we opted to create
-- a nightly snapshot process that summarized demographic data into
-- a table. Feeds/Interfaces then were permitted to extract data
-- from this table with considerably less impact to the overall
-- database environment since the realtime tables are no longer
-- being hit.
--
-- What you choose to track is up to you.. however for this
-- test we will use this table structure and then populate
-- with the Sample_Data.SQL script.
--

DROP TABLE demo_snap CASCADE CONSTRAINTS
/
--
-- demo_snap  (Table)
--
CREATE TABLE demo_snap
(
  employee_number                        NUMBER,
  first_name                      VARCHAR2(150 BYTE),
  middle_names                    VARCHAR2(60 BYTE),
  last_name                       VARCHAR2(150 BYTE) NOT NULL,
  title                           VARCHAR2(30 BYTE),
  suffix                          VARCHAR2(30 BYTE),
  person_type                     VARCHAR2(30 BYTE),
  term_date                       DATE,
  hire_date                       DATE,
  department                      VARCHAR2(240 BYTE) NOT NULL,
  coid                            VARCHAR2(60 BYTE),
  udn                             VARCHAR2(60 BYTE),
  base_role                       VARCHAR2(60 BYTE),
  known_as                        VARCHAR2(80 BYTE),
  direct_report_exists            CHAR(1 BYTE),
  supervisor_number               NUMBER,
  person_id                       NUMBER,
  supervisor_person_id            NUMBER
)
LOGGING
NOCOMPRESS
NOCACHE
NOPARALLEL
MONITORING
/
--
-- demo_snap_UNI001  (Index)
--
--  Dependencies:
--   demo_snap (Table)
--
CREATE UNIQUE INDEX demo_snap_uni001 ON demo_snap
(employee_number, supervisor_number)
LOGGING
NOPARALLEL
/
--
-- demo_snap_UNI002  (Index)
--
--  Dependencies:
--   demo_snap (Table)
--
CREATE UNIQUE INDEX demo_snap_uni002 ON demo_snap
(supervisor_number, employee_number)
LOGGING
NOPARALLEL
/
--
-- demo_snap_FNC004  (Index)
--
--  Dependencies:
--   demo_snap (Table)
--
CREATE INDEX demo_snap_fnc004 ON demo_snap
(UPPER("FIRST_NAME"))
LOGGING
NOPARALLEL
/
--
-- demo_snap_IDX008  (Index)
--
--  Dependencies:
--   demo_snap (Table)
--
CREATE INDEX demo_snap_idx008 ON demo_snap
(coid, udn)
LOGGING
NOPARALLEL
/
--
-- demo_snap_FNC005  (Index)
--
--  Dependencies:
--   demo_snap (Table)
--
CREATE INDEX demo_snap_fnc005 ON demo_snap
(UPPER("LAST_NAME"))
LOGGING
NOPARALLEL
/
--
-- demo_snap_FNC006  (Index)
--
--  Dependencies:
--   demo_snap (Table)
--
CREATE INDEX demo_snap_fnc006 ON demo_snap
(UPPER("BASE_ROLE"))
LOGGING
NOPARALLEL
/
--
-- demo_snap_FNC002  (Index)
--
--  Dependencies:
--   demo_snap (Table)
--
CREATE INDEX demo_snap_fnc002 ON demo_snap
(NVL("TERM_DATE",TO_DATE('4712-12-31 00:00:00', 'yyyy-mm-dd hh24:mi:ss')))
LOGGING
NOPARALLEL
/
--
-- demo_snap_IDX015  (Index)
--
--  Dependencies:
--   demo_snap (Table)
--
CREATE INDEX demo_snap_idx015 ON demo_snap
(udn)
LOGGING
NOPARALLEL
/
--
-- demo_snap_IDX023  (Index)
--
--  Dependencies:
--   demo_snap (Table)
--
CREATE INDEX demo_snap_idx023 ON demo_snap
(supervisor_person_id)
LOGGING
NOPARALLEL
/
--
-- demo_snap_FNC010  (Index)
--
--  Dependencies:
--   demo_snap (Table)
--
CREATE INDEX demo_snap_fnc010 ON demo_snap
("COID"||'/'||"UDN")
LOGGING
NOPARALLEL
/
PROMPT .
PROMPT INSERT DATA INTO QCURSOR_DATASET_COLUMN_MSTR
PROMPT NOTE :: COLUMN_ORDER PROVIDES FOR A CONSISTENT DISPLAY ORDER OF COLUMNS FROM FEED TO FEED
PROMPT .

INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order, description
            , hr_secure_column, emp_column_detail
            )
     VALUES ( 'LAST_NAME', 'TEXT', 6, 'DATA COLUMN FOR LAST_NAME.'
            , 'N', 'hds.last_name'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order, description
            , hr_secure_column, emp_column_detail
            )
     VALUES ( 'FIRST_NAME', 'TEXT', 7, 'DATA COLUMN FOR FIRST_NAME.'
            , 'N', 'hds.first_name'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order, description
            , hr_secure_column, emp_column_detail
            )
     VALUES ( 'MIDDLE_NAMES', 'TEXT', 8, 'DATA COLUMN FOR MIDDLE_NAMES.'
            , 'N', 'hds.middle_names'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order, description
            , hr_secure_column, emp_column_detail
            )
     VALUES ( 'SUFFIX', 'TEXT', 9, 'DATA COLUMN FOR SUFFIX.'
            , 'N', 'hds.suffix'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order, description
            , hr_secure_column, emp_column_detail
            )
     VALUES ( 'KNOWN_AS', 'TEXT', 10, 'DATA COLUMN FOR KNOWN_AS.'
            , 'N', 'hds.known_as'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order
            , description
            , hr_secure_column, emp_column_detail
            )
     VALUES ( 'TITLE', 'TEXT', 11
            , 'DATA COLUMN FOR TITLE. THIS REPRESENTS THE MR. OR MRS. OF AN INDIVIDUAL.'
            , 'N', 'hds.title'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order
            , description
            , hr_secure_column, emp_column_detail
            )
     VALUES ( 'PERSON_TYPE', 'TEXT', 70
            , 'DATA COLUMN FOR PERSON_TYPE. REPRESENTS THE GROUP QUALIFICATIONS OF EMP (COULD BE OTHERS DEPENDING ON SYSTEM SUPPORT e.g. APL for Applicants). DOES NOT IMPLY TERMINATED STATUS.'
            , 'N', 'hds.person_type'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order, description
            , hr_secure_column, emp_column_detail
            )
     VALUES ( 'BASE_ROLE', 'TEXT', 310, 'DATA COLUMN FOR BASE_ROLE (ROLE).'
            , 'N', 'hds.base_role'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order
            , description, hr_secure_column
            , emp_column_detail
            )
     VALUES ( 'SUPERVISOR_NUMBER', 'NUMBER', 605
            , 'DATA COLUMN FOR SUPERVISOR_NUMBER.', 'N'
            , 'hds.supervisor_number'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order
            , description, hr_secure_column
            , emp_column_detail
            )
     VALUES ( 'DIRECT_REPORT_EXISTS', 'TEXT', 610
            , 'IDENTIFIES IF DIRECT REPORTS EXIST', 'N'
            , 'hds.direct_report_exists'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order, description
            , hr_secure_column, emp_column_detail
            )
     VALUES ( 'COID', 'TEXT', 637, 'DATA COLUMN FOR COID.'
            , 'N', 'hds.coid'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order, description
            , hr_secure_column, emp_column_detail
            )
     VALUES ( 'UDN', 'TEXT', 638, 'DATA COLUMN FOR UDN.'
            , 'N', 'hds.udn'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order, description
            , hr_secure_column, emp_column_detail
            )
     VALUES ( 'DEPARTMENT', 'TEXT', 675, 'DATA COLUMN FOR DEPARTMENT.'
            , 'N', 'hds.department'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order
            , description, hr_secure_column
            , emp_column_detail
            )
     VALUES ( 'SUPERVISOR_PERSON_ID', 'NUMBER', 600
            , 'DATA COLUMN FOR SUPERVISOR_PERSON_ID.', 'N'
            , 'hds.supervisor_person_id'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order
            , description, hr_secure_column, emp_column_detail
            )
     VALUES ( 'EMPLOYEE_NUMBER', 'NUMBER', 1
            , 'DATA COLUMN FOR EMPLOYEE_NUMBER', 'N', 'hds.employee_number'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order, description
            , hr_secure_column, emp_column_detail
            )
     VALUES ( 'PERSON_ID', 'NUMBER', 12, 'DATA COLUMN FOR PERSON_ID.'
            , 'N', 'hds.person_id'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order, description
            , hr_secure_column, emp_column_detail
            )
     VALUES ( 'TERMINATION_DATE', 'DATE', 750, 'DATA COLUMN FOR TERM DATE.'
            , 'N', 'hds.term_date'
            )
/
INSERT INTO qcursor_dataset_column_mstr
            ( column_alias_name, column_type, column_order, description
            , hr_secure_column, emp_column_detail
            )
     VALUES ( 'HIRE_DATE', 'DATE', 751, 'DATA COLUMN FOR HIRE DATE.'
            , 'N', 'hds.hire_date'
            )
/
PROMPT .
PROMPT INSERT DATA INTO QCURSOR_SEARCH_COLUMNS
PROMPT NOTE :: xxxparameter_entry_idxxx is replaced during runtime with appropriate parameter_entry_id
PROMPT .

INSERT INTO qcursor_search_columns
            ( column_name, description, data_type, enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'UDN', '[MULTIPARM] UDN', 'TEXT', 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND EXISTS (SELECT ''x'' FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''UDN''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I'' AND hdsx.UDN = vdata_text))) '
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
INSERT INTO qcursor_search_columns
            ( column_name
            , description
            , data_type, enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'COID/UDN'
            , '[MULTIPARM] COID/UDN Search Combo [Format := COID#UDN e.g. 11701/920]'
            , 'TEXT', 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND EXISTS (SELECT ''x'' FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''COID/UDN''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I'' AND hdsx.coid||''/''||hdsx.udn = SUBSTR(vdata_text,1,INSTR(vdata_text,''#'')-1)||''/''||SUBSTR(vdata_text,INSTR(vdata_text,''#'')+1)))) '
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
INSERT INTO qcursor_search_columns
            ( column_name, description, data_type, enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'COID', '[MULTIPARM] COID', 'TEXT', 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND EXISTS (SELECT ''x'' FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''COID''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I'' AND hdsx.COID = vdata_text))) '
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
INSERT INTO qcursor_search_columns
            ( column_name, description, data_type
            , enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'SUPERVISOR_NUMBER', '[MULTIPARM] SUPERVISOR_NUMBER', 'NUMBER'
            , 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND EXISTS (SELECT ''x'' FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''SUPERVISOR_NUMBER''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I'' AND hdsx.supervisor_number = vdata_number))) '
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
INSERT INTO qcursor_search_columns
            ( column_name, description, data_type, enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'PERSON_ID', '[MULTIPARM] PERSON_ID', 'NUMBER', 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND EXISTS (SELECT ''x'' FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''PERSON_ID''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I'' AND hdsx.PERSON_ID = vdata_number))) '
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
INSERT INTO qcursor_search_columns
            ( column_name
            , description, data_type
            , enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'DIRECT_REPORT_EXISTS'
            , '[MULTIPARM] Direct Report Exists [Submit Y or N]', 'TEXT'
            , 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND EXISTS (SELECT ''x'' FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''DIRECT_REPORT_EXISTS''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I'' AND UPPER(hdsx.direct_report_exists) = UPPER(vdata_text)))) '
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
INSERT INTO qcursor_search_columns
            ( column_name, description
            , data_type, enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'SUPERVISOR_PERSON_ID', '[MULTIPARM] SUPERVISOR_PERSON_ID'
            , 'NUMBER', 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND EXISTS (SELECT ''x'' FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''SUPERVISOR_PERSON_ID''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I'' AND hdsx.SUPERVISOR_PERSON_ID = vdata_number))) '
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
INSERT INTO qcursor_search_columns
            ( column_name
            , description
            , data_type, enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'ORGTREE'
            , '[MULTIPARM] ORGTREE. Only one supervisor per parameter_entry_id.'
            , 'NUMBER', 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND LEVEL > 1 CONNECT BY PRIOR hdsx.employee_number = hdsx.supervisor_number START WITH hdsx.employee_number IN (SELECT vdata_number FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''ORGTREE''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I''))) '
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
INSERT INTO qcursor_search_columns
            ( column_name
            , description
            , data_type, enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'LAST_AND_FIRST_NAMES'
            , '[MULTIPARM] Last Name and First Name Search Combo [Format := LAST#FIRST e.g. Johns#Timo]'
            , 'TEXT', 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND EXISTS (SELECT ''x'' FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''LAST_AND_FIRST_NAMES''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I'' AND (UPPER(hdsx.last_name) LIKE UPPER(SUBSTR(vdata_text,1,INSTR(vdata_text,''#'')-1)||''%'') AND (UPPER(hdsx.known_as) LIKE UPPER(SUBSTR(vdata_text,INSTR(vdata_text,''#'')+1)||''%'') OR UPPER(hdsx.first_name) LIKE UPPER(SUBSTR(vdata_text,INSTR(vdata_text,''#'')+1)||''%'')))))) '
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
INSERT INTO qcursor_search_columns
            ( column_name, description
            , data_type, enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'EMPLOYEE_NUMBER', '[MULTIPARM] Identifier for Employees'
            , 'NUMBER', 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND EXISTS (SELECT ''x'' FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''EMPLOYEE_NUMBER''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I'' AND hdsx.employee_number = vdata_number)))'
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
INSERT INTO qcursor_search_columns
            ( column_name, description, data_type, enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'BASE_ROLE', '[MULTIPARM] Base Role (Job Title)', 'TEXT', 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND EXISTS (SELECT ''x'' FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''BASE_ROLE''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I'' AND UPPER(hdsx.BASE_ROLE) = UPPER(vdata_text)))) '
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
INSERT INTO qcursor_search_columns
            ( column_name, description, data_type, enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'BASE_ROLE_LIKE', '[MULTIPARM] Base Role LIKE', 'TEXT', 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND EXISTS (SELECT ''x'' FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''BASE_ROLE_LIKE''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I'' AND UPPER(hdsx.BASE_ROLE) like ''%''||UPPER(vdata_text)||''%''))) '
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
INSERT INTO qcursor_search_columns
            ( column_name, description, data_type, enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'DEPARTMENT', '[MULTIPARM] Department', 'TEXT', 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND EXISTS (SELECT ''x'' FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''DEPARTMENT''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I'' AND UPPER(hdsx.DEPARTMENT) = UPPER(vdata_text)))) '
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
INSERT INTO qcursor_search_columns
            ( column_name, description, data_type, enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'DEPARTMENT_LIKE', '[MULTIPARM] Department LIKE', 'TEXT', 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND EXISTS (SELECT ''x'' FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''DEPARTMENT_LIKE''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I'' AND UPPER(hdsx.DEPARTMENT) like ''%''||UPPER(vdata_text)||''%''))) '
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '10/01/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
INSERT INTO qcursor_search_columns
            ( column_name
            , description
            , data_type, enabled_flag
            , emp_condition
            , creation_date
            , created_by
            , last_update_date
            , last_updated_by, global_table
            )
     VALUES ( 'HIRE_DATE_BTWN_DT1_DT2'
            , '[MULTIPARM] Hire Date between 2 dates. Only 1 combo permitted per parameter_entry_id. [Format :: 01-JAN-2000#31-JAN-2000]'
            , 'TEXT', 'Y'
            , ' (hds.employee_number IN (SELECT hdsx.employee_number FROM demo_snap hdsx WHERE 1 = 1 AND EXISTS (SELECT ''x'' FROM q_cursor_parms_global_temp WHERE 1 = 1 AND parameter_name = ''HIRE_DATE_BTWN_DT1_DT2''|| '' [xxxparameter_entry_idxxx]'' AND incl_excl_flag = ''I'' AND UPPER(hdsx.hire_date) between to_date(SUBSTR(vdata_text,1,INSTR(vdata_text,''#'')-1),''DD-MON-YYYY'') AND to_date(SUBSTR(vdata_text,INSTR(vdata_text,''#'')+1),''DD-MON-YYYY'') ))) '
            , TO_DATE ( '01/09/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302
            , TO_DATE ( '01/09/2007 01:56:58', 'MM/DD/YYYY HH24:MI:SS' )
            , 1302, 'Q_CURSOR_PARMS_GLOBAL_TEMP'
            )
/
PROMPT .
PROMPT INSERT DATA INTO DEMO_SNAP TABLE
PROMPT .

INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 16099, 'Roxell', 'E', 'Balakrishnan', 'MR.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Payroll'
            , '11701', '922', 'Business Consultant', NULL, 'N'
            , 7049, 21139, 2328
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 1619, 'Srihari', 'X', 'Yi', 'MR.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Payroll'
            , '11701', '922', 'Applications Consultant', NULL, 'N'
            , 7049, 535, 2328
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 1635, 'Dani', NULL, 'Karr', 'MR.'
            , 'Jr', 'EMP', NULL, 'Corporate Systems Development - Finance'
            , '11701', '921', 'Applications Engineer', NULL, 'N'
            , 537, 541, 180
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 16741, 'Kevin', 'T', 'Tadinada', 'MR.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Finance'
            , '11701', '921', 'Applications Engineer', NULL, 'N'
            , 537, 23607, 180
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type
            , term_date
            , department, coid, udn
            , base_role, known_as, direct_report_exists, supervisor_number
            , person_id, supervisor_person_id
            )
     VALUES ( 19167, 'Danny', 'R', 'Vedagiri', 'MR.'
            , NULL, 'EMP'
            , TO_DATE ( '09/14/2007 00:00:00', 'MM/DD/YYYY HH24:MI:SS' )
            , 'Corporate Systems Development - Web', '11701', '923'
            , 'Applications Engineer', NULL, 'N', 11578
            , 30670, 13321
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 21472, 'Martin', 'C', 'Ellis', 'MR.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Finance'
            , '11701', '921', 'Applications Engineer', 'Rocky', 'N'
            , 537, 41342, 180
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 24087, 'Christopher', 'B', 'Geary', 'MR.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Payroll'
            , '11701', '922', 'Applications Engineer', NULL, 'N'
            , 7049, 50851, 2328
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 24306, 'Michael', 'D', 'Johnson', 'MR.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Payroll'
            , '11701', '922', 'Project Manager', NULL, 'N'
            , 7049, 52198, 2328
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 2514, 'Glenn', 'C', 'Beavin', 'MR.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Finance'
            , '11701', '921', 'Applications Engineer', NULL, 'N'
            , 537, 830, 180
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type
            , term_date
            , department, coid, udn
            , base_role, known_as, direct_report_exists, supervisor_number
            , person_id, supervisor_person_id
            )
     VALUES ( 3086, 'Gary', 'M', 'May', 'MR.'
            , NULL, 'EMP'
            , TO_DATE ( '10/13/2006 00:00:00', 'MM/DD/YYYY HH24:MI:SS' )
            , 'Corporate Systems Development - Finance', '11701', '921'
            , 'Applications Engineer', NULL, 'N', 537
            , 1021, 180
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 4398, 'Paul', 'K.', 'Raley', 'MR.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Web'
            , '11701', '923', 'Applications Architect', 'Marty', 'N'
            , 11578, 1450, 13321
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 537, 'Robert', 'J.', 'Smith', 'MR.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Finance'
            , '11701', '921', 'Manager', NULL, 'Y'
            , 8163, 180, 2696
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 5599, 'Arshdeep', 'S', 'Jackson', 'MR.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Payroll'
            , '11701', '922', 'Applications Engineer', NULL, 'N'
            , 7049, 1847, 2328
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 7049, 'Stephen', 'W.', 'Villier', 'MR.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Payroll'
            , '11701', '922', 'Manager', NULL, 'Y'
            , 8163, 2328, 2696
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department, coid
            , udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 8163, 'Charles', 'T.', 'Gill', 'MR.'
            , 'Sr.', 'EMP', NULL, 'Corporate Systems Development', '11701'
            , '920', 'Director', NULL, 'Y'
            , 21422, 2696, 40865
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department, coid
            , udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 10377, 'Vinay', NULL, 'Leon', 'MR.'
            , 'Jr.', 'EMP', NULL, 'Corporate Systems DBA Support', '11701'
            , '924', 'Tech Architect', NULL, 'N'
            , 10125, 3323, 2237
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 10379, 'Norman', 'E.', 'Hogg', 'MR.'
            , 'Jr.', 'EMP', NULL, 'Corporate Systems Development - Web'
            , '11701', '923', 'Applications Consultant', 'Rob', 'N'
            , 11578, 3324, 13321
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 10414, 'Terrance', 'D', 'Hardas', 'MR.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Finance'
            , '11701', '921', 'Applications Consultant', NULL, 'N'
            , 537, 3368, 180
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 10487, 'Michael', 'L.', 'Leach', 'MR.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Web'
            , '11701', '923', 'Applications Consultant', NULL, 'Y'
            , 11578, 3470, 13321
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type
            , term_date
            , department, coid, udn
            , base_role, known_as, direct_report_exists, supervisor_number
            , person_id, supervisor_person_id
            )
     VALUES ( 10494, 'Barry', 'S', 'Becker', 'MR.'
            , 'Jr.', 'EMP'
            , TO_DATE ( '11/29/2002 00:00:00', 'MM/DD/YYYY HH24:MI:SS' )
            , 'Corporate Systems Development - Payroll', '11701', '922'
            , 'Web Designer', NULL, 'N', 7049
            , 3482, 2328
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type
            , term_date
            , department, coid, udn
            , base_role, known_as, direct_report_exists, supervisor_number
            , person_id, supervisor_person_id
            )
     VALUES ( 10972, 'Jeanne', 'M', 'Aldridge', 'MS.'
            , NULL, 'EMP'
            , TO_DATE ( '05/28/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS' )
            , 'Corporate Systems Development - Payroll', '11701', '922'
            , 'Applications Engineer', NULL, 'N', 7049
            , 4353, 2328
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department, coid
            , udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 11282, 'Tammy', 'L', 'Chase', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems DBA Support', '11701'
            , '924', 'Tech Consultant', NULL, 'N'
            , 10125, 10758, 2237
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 11938, 'Takiyah', 'K', 'Wright', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Web'
            , '11701', '923', 'Applications Consultant', NULL, 'N'
            , 11578, 15426, 13321
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 12229, 'Lacey', 'P', 'Cook', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Web'
            , '11701', '923', 'Applications Consultant', NULL, 'N'
            , 11578, 17264, 13321
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 1502, 'Margaret', 'M', 'Cooper', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Payroll'
            , '11701', '922', 'Applications Architect', NULL, 'N'
            , 7049, 496, 2328
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 16824, 'Faye', 'M', 'Burberry', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Payroll'
            , '11701', '922', 'Project Manager', NULL, 'N'
            , 7049, 23690, 2328
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 1734, 'Pamela', 'C', 'Hall', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Finance'
            , '11701', '921', 'Applications Engineer', NULL, 'N'
            , 537, 573, 180
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 19280, 'Olga', NULL, 'Johnson', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Payroll'
            , '11701', '922', 'Applications Engineer', NULL, 'N'
            , 7049, 31013, 2328
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department, coid
            , udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 20920, 'Kathleen', 'S', 'Long', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems DBA Support', '11701'
            , '924', 'Tech Analyst', NULL, 'N'
            , 10125, 37824, 2237
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type
            , term_date
            , department, coid, udn
            , base_role, known_as, direct_report_exists, supervisor_number
            , person_id, supervisor_person_id
            )
     VALUES ( 3544, 'Carol', 'L', 'Madorsky', 'MS.'
            , NULL, 'EMP'
            , TO_DATE ( '10/03/2002 00:00:00', 'MM/DD/YYYY HH24:MI:SS' )
            , 'Corporate Systems Development', '11701', '920'
            , 'Admin Assistant I', NULL, 'N', 8163
            , 1169, 2696
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 4375, 'Ana', 'L', 'Beck', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Payroll'
            , '11701', '922', 'Applications Engineer', NULL, 'N'
            , 7049, 1443, 2328
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 5221, 'Jane', 'E', 'Akins', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Finance'
            , '11701', '921', 'Applications Engineer', NULL, 'N'
            , 537, 1723, 180
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 5350, 'Kathleen', 'L', 'Quinland', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Finance'
            , '11701', '921', 'Applications Engineer', NULL, 'N'
            , 537, 1766, 180
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type
            , term_date
            , department, coid, udn, base_role
            , known_as, direct_report_exists, supervisor_number, person_id
            , supervisor_person_id
            )
     VALUES ( 541, 'Daria', 'C', 'Reinert', 'MS.'
            , NULL, 'EMP'
            , TO_DATE ( '06/29/2001 00:00:00', 'MM/DD/YYYY HH24:MI:SS' )
            , 'Corporate Systems Development', '11701', '920', 'Mgr Systems'
            , NULL, 'N', 8163, 181
            , 2696
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 67, 'Sherry', 'K', 'Riggs', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Payroll'
            , '11701', '922', 'Applications Consultant', NULL, 'N'
            , 7049, 26, 2328
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 7003, 'Kathy', 'S', 'Robinson', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Payroll'
            , '11701', '922', 'Project Manager', NULL, 'N'
            , 7049, 2314, 2328
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 7177, 'Anna', 'S', 'Sawyers', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Finance'
            , '11701', '921', 'Applications Consultant', NULL, 'N'
            , 537, 2368, 180
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type
            , term_date
            , department, coid, udn
            , base_role, known_as, direct_report_exists, supervisor_number
            , person_id, supervisor_person_id
            )
     VALUES ( 7283, 'Elke', 'P', 'Vowels', 'MS.'
            , NULL, 'EMP'
            , TO_DATE ( '10/02/2002 00:00:00', 'MM/DD/YYYY HH24:MI:SS' )
            , 'Corporate Systems Development - Finance', '11701', '921'
            , 'Consulting Application Analyst', NULL, 'N', 537
            , 2403, 180
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 7368, 'Xiuling', NULL, 'Zurada', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Web'
            , '11701', '923', 'Applications Consultant', NULL, 'N'
            , 11578, 2430, 13321
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 7717, 'Latisha', 'B.', 'Phelps', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Payroll'
            , '11701', '922', 'Applications Engineer', NULL, 'N'
            , 7049, 2544, 2328
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 9205, 'Sarah', 'R.', 'Shen', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Finance'
            , '11701', '921', 'Applications Consultant', NULL, 'N'
            , 537, 3040, 180
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type
            , term_date
            , department, coid, udn
            , base_role, known_as, direct_report_exists, supervisor_number
            , person_id, supervisor_person_id
            )
     VALUES ( 9925, 'Lisa', 'G.', 'Schmitt', 'MS.'
            , NULL, 'EMP'
            , TO_DATE ( '12/09/2002 00:00:00', 'MM/DD/YYYY HH24:MI:SS' )
            , 'Corporate Systems Development', '11701', '920'
            , 'Consulting Application Analyst', NULL, 'N', 1619
            , 3278, 535
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department, coid
            , udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 10125, 'Priyanka', NULL, 'Perkins', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems DBA Support', '11701'
            , '924', 'Manager', NULL, 'Y'
            , 8163, 2237, 2696
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type
            , term_date
            , department, coid, udn
            , base_role, known_as, direct_report_exists, supervisor_number
            , person_id, supervisor_person_id
            )
     VALUES ( 10973, 'Sherrie', 'L', 'Nunn', 'MS.'
            , NULL, 'EMP'
            , TO_DATE ( '01/10/2005 00:00:00', 'MM/DD/YYYY HH24:MI:SS' )
            , 'Corporate Systems Development - Finance', '11701', '921'
            , 'Applications Engineer', NULL, 'N', 537
            , 4353, 180
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 11578, 'Latisha', NULL, 'Mittal', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Web'
            , '11701', '923', 'Manager', NULL, 'Y'
            , 8163, 13321, 2696
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type
            , term_date
            , department, coid, udn, base_role
            , known_as, direct_report_exists, supervisor_number, person_id
            , supervisor_person_id
            )
     VALUES ( 11708, 'Sarah', NULL, 'Chilton', 'MS.'
            , NULL, 'EMP'
            , TO_DATE ( '07/30/2004 00:00:00', 'MM/DD/YYYY HH24:MI:SS' )
            , 'Corporate Systems Development', '11701', '920', 'Coordinator'
            , NULL, 'N', 8163, 14016
            , 2696
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 11915, 'Lisa', NULL, 'Nunn', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Web'
            , '11701', '923', 'Applications Consultant', NULL, 'N'
            , 11578, 15153, 13321
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 12450, 'Ana', NULL, 'Matthews', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Web'
            , '11701', '923', 'Applications Engineer', NULL, 'N'
            , 11578, 17687, 13321
            )
/
INSERT INTO demo_snap
            ( employee_number, first_name, middle_names, last_name, title
            , suffix, person_type, term_date, department
            , coid, udn, base_role, known_as, direct_report_exists
            , supervisor_number, person_id, supervisor_person_id
            )
     VALUES ( 1526, 'Thomasina', NULL, 'Valdez', 'MS.'
            , NULL, 'EMP', NULL, 'Corporate Systems Development - Payroll'
            , '11701', '922', 'Applications Consultant', NULL, 'N'
            , 7049, 504, 2328
            )
/
COMMIT
/
PROMPT .
PROMPT UPDATE DEMO_SNAP TO SET HIRE_DATE FIELD
PROMPT TO AN ARBRITRARY DATE
PROMPT .


UPDATE demo_snap
   SET hire_date = ( NVL ( term_date, TRUNC ( SYSDATE )) - 750 )
/
COMMIT
/

PROMPT .
PROMPT DROP/CREATE QCURSOR_CRITERIA_LIBRARY
PROMPT OBJECT TO HOLD LIBRARY CRITERIA GRID ENTRIES
PROMPT .

drop table QCURSOR_CRITERIA_LIBRARY
/
CREATE TABLE "QCURSOR_CRITERIA_LIBRARY" 
   (	"PROCESS_DESC" VARCHAR2(100 BYTE), 
	"SUB_PROCESS_DESC" VARCHAR2(100 BYTE), 
	"PARAMETER_ENTRY_ID" NUMBER, 
	"PARAMETER_NAME" VARCHAR2(100 BYTE), 
	"VDATA_TEXT" VARCHAR2(4000 BYTE), 
	"VDATA_DATE" VARCHAR2(30 BYTE), 
	"VDATA_NUMBER" VARCHAR2(30 BYTE), 
	"INCL_EXCL_FLAG" VARCHAR2(10 BYTE), 
	"CONDITION_BLOCK_ID" NUMBER, 
	"CONDITION_SET_ID" NUMBER, 
	"CONDITION_MEMBER_ID" NUMBER, 
	"CONDITION_OPERATOR" VARCHAR2(30 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"PROCESS_ID" NUMBER(15,0), 
	"SUB_PROCESS_ID" NUMBER(15,0), 
	 CONSTRAINT "QCURSOR_CRITERIA_LIBRARY_C02" CHECK (condition_operator IN ('AND','OR')) ENABLE, 
	 CONSTRAINT "QCURSOR_CRITERIA_LIBRARY_C01" CHECK (incl_excl_flag IN ('I','E')) ENABLE
   ) 
LOGGING
NOCOMPRESS
NOCACHE
NOPARALLEL
MONITORING
/

CREATE INDEX "QCURSOR_CRITERIA_LIBRARY_N1" ON "QCURSOR_CRITERIA_LIBRARY" ("PROCESS_DESC", "SUB_PROCESS_DESC", "PARAMETER_ENTRY_ID", "CONDITION_BLOCK_ID", "CONDITION_SET_ID", "CONDITION_MEMBER_ID") 
/
 
PROMPT .
PROMPT CREATE/REPLACE CASE_VIEW
PROMPT OBJECT TO DISPLAY TEST CASES FOR USE WITH APEX APPLICATION
PROMPT .

CREATE OR REPLACE FORCE VIEW "CASE_VIEW" ("ID", "CASENUM", "RVALUE", "COMMENTS") AS 
  (
SELECT DISTINCT sub_process_id,REPLACE(sub_process_desc,'TEST','CASE') casenum,sub_process_desc,comments
FROM QCURSOR_CRITERIA_LIBRARY
)
/


REM INSERTING into QCURSOR_DATASET_COLUMN_DETAIL
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','Y','LAST_NAME','TEXT',6,'DATA COLUMN FOR LAST_NAME.','N','hds.last_name');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','Y','FIRST_NAME','TEXT',7,'DATA COLUMN FOR FIRST_NAME.','N','hds.first_name');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','N','MIDDLE_NAMES','TEXT',8,'DATA COLUMN FOR MIDDLE_NAMES.','N','hds.middle_names');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','N','SUFFIX','TEXT',9,'DATA COLUMN FOR SUFFIX.','N','hds.suffix');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','N','KNOWN_AS','TEXT',10,'DATA COLUMN FOR KNOWN_AS.','N','hds.known_as');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','N','TITLE','TEXT',11,'DATA COLUMN FOR TITLE. THIS REPRESENTS THE MR. OR MRS. OF AN INDIVIDUAL.','N','hds.title');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','N','PERSON_TYPE','TEXT',70,'DATA COLUMN FOR PERSON_TYPE. REPRESENTS THE GROUP QUALIFICATIONS OF EMP (COULD BE OTHERS DEPENDING ON SYSTEM SUPPORT e.g. APL for Applicants). DOES NOT IMPLY TERMINATED STATUS.','N','hds.person_type');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','Y','BASE_ROLE','TEXT',310,'DATA COLUMN FOR BASE_ROLE (ROLE).','N','hds.base_role');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','Y','SUPERVISOR_NUMBER','NUMBER',605,'DATA COLUMN FOR SUPERVISOR_NUMBER.','N','hds.supervisor_number');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','N','DIRECT_REPORT_EXISTS','TEXT',610,'IDENTIFIES IF DIRECT REPORTS EXIST','N','hds.direct_report_exists');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','N','COID','TEXT',637,'DATA COLUMN FOR COID.','N','hds.coid');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','N','UDN','TEXT',638,'DATA COLUMN FOR UDN.','N','hds.udn');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','N','DEPARTMENT','TEXT',675,'DATA COLUMN FOR DEPARTMENT.','N','hds.department');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','N','SUPERVISOR_PERSON_ID','NUMBER',600,'DATA COLUMN FOR SUPERVISOR_PERSON_ID.','N','hds.supervisor_person_id');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','Y','EMPLOYEE_NUMBER','NUMBER',1,'DATA COLUMN FOR EMPLOYEE_NUMBER','N','hds.employee_number');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','N','PERSON_ID','NUMBER',12,'DATA COLUMN FOR PERSON_ID.','N','hds.person_id');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','N','TERMINATION_DATE','DATE',750,'DATA COLUMN FOR TERM DATE.','N','hds.term_date');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,1,'CRITDEMO','TEST001','N','HIRE_DATE','DATE',751,'DATA COLUMN FOR HIRE DATE.','N','hds.hire_date');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','Y','BASE_ROLE','TEXT',310,'DATA COLUMN FOR BASE_ROLE (ROLE).','N','hds.base_role');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','N','COID','TEXT',637,'DATA COLUMN FOR COID.','N','hds.coid');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','N','DEPARTMENT','TEXT',675,'DATA COLUMN FOR DEPARTMENT.','N','hds.department');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','N','DIRECT_REPORT_EXISTS','TEXT',610,'IDENTIFIES IF DIRECT REPORTS EXIST','N','hds.direct_report_exists');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','Y','EMPLOYEE_NUMBER','NUMBER',1,'DATA COLUMN FOR EMPLOYEE_NUMBER','N','hds.employee_number');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','Y','FIRST_NAME','TEXT',7,'DATA COLUMN FOR FIRST_NAME.','N','hds.first_name');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','N','HIRE_DATE','DATE',751,'DATA COLUMN FOR HIRE DATE.','N','hds.hire_date');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','N','KNOWN_AS','TEXT',10,'DATA COLUMN FOR KNOWN_AS.','N','hds.known_as');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','Y','LAST_NAME','TEXT',6,'DATA COLUMN FOR LAST_NAME.','N','hds.last_name');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','N','MIDDLE_NAMES','TEXT',8,'DATA COLUMN FOR MIDDLE_NAMES.','N','hds.middle_names');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','N','PERSON_ID','NUMBER',12,'DATA COLUMN FOR PERSON_ID.','N','hds.person_id');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','N','PERSON_TYPE','TEXT',70,'DATA COLUMN FOR PERSON_TYPE. REPRESENTS THE GROUP QUALIFICATIONS OF EMP (COULD BE OTHERS DEPENDING ON SYSTEM SUPPORT e.g. APL for Applicants). DOES NOT IMPLY TERMINATED STATUS.','N','hds.person_type');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','N','SUFFIX','TEXT',9,'DATA COLUMN FOR SUFFIX.','N','hds.suffix');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','Y','SUPERVISOR_NUMBER','NUMBER',605,'DATA COLUMN FOR SUPERVISOR_NUMBER.','N','hds.supervisor_number');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','N','SUPERVISOR_PERSON_ID','NUMBER',600,'DATA COLUMN FOR SUPERVISOR_PERSON_ID.','N','hds.supervisor_person_id');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','N','TERMINATION_DATE','DATE',750,'DATA COLUMN FOR TERM DATE.','N','hds.term_date');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','N','TITLE','TEXT',11,'DATA COLUMN FOR TITLE. THIS REPRESENTS THE MR. OR MRS. OF AN INDIVIDUAL.','N','hds.title');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,2,'CRITDEMO','TEST002','N','UDN','TEXT',638,'DATA COLUMN FOR UDN.','N','hds.udn');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','Y','BASE_ROLE','TEXT',310,'DATA COLUMN FOR BASE_ROLE (ROLE).','N','hds.base_role');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','N','COID','TEXT',637,'DATA COLUMN FOR COID.','N','hds.coid');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','Y','DEPARTMENT','TEXT',675,'DATA COLUMN FOR DEPARTMENT.','N','hds.department');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','N','DIRECT_REPORT_EXISTS','TEXT',610,'IDENTIFIES IF DIRECT REPORTS EXIST','N','hds.direct_report_exists');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','Y','EMPLOYEE_NUMBER','NUMBER',1,'DATA COLUMN FOR EMPLOYEE_NUMBER','N','hds.employee_number');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','Y','FIRST_NAME','TEXT',7,'DATA COLUMN FOR FIRST_NAME.','N','hds.first_name');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','N','HIRE_DATE','DATE',751,'DATA COLUMN FOR HIRE DATE.','N','hds.hire_date');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','N','KNOWN_AS','TEXT',10,'DATA COLUMN FOR KNOWN_AS.','N','hds.known_as');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','Y','LAST_NAME','TEXT',6,'DATA COLUMN FOR LAST_NAME.','N','hds.last_name');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','N','MIDDLE_NAMES','TEXT',8,'DATA COLUMN FOR MIDDLE_NAMES.','N','hds.middle_names');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','N','PERSON_ID','NUMBER',12,'DATA COLUMN FOR PERSON_ID.','N','hds.person_id');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','N','PERSON_TYPE','TEXT',70,'DATA COLUMN FOR PERSON_TYPE. REPRESENTS THE GROUP QUALIFICATIONS OF EMP (COULD BE OTHERS DEPENDING ON SYSTEM SUPPORT e.g. APL for Applicants). DOES NOT IMPLY TERMINATED STATUS.','N','hds.person_type');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','N','SUFFIX','TEXT',9,'DATA COLUMN FOR SUFFIX.','N','hds.suffix');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','Y','SUPERVISOR_NUMBER','NUMBER',605,'DATA COLUMN FOR SUPERVISOR_NUMBER.','N','hds.supervisor_number');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','N','SUPERVISOR_PERSON_ID','NUMBER',600,'DATA COLUMN FOR SUPERVISOR_PERSON_ID.','N','hds.supervisor_person_id');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','N','TERMINATION_DATE','DATE',750,'DATA COLUMN FOR TERM DATE.','N','hds.term_date');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','N','TITLE','TEXT',11,'DATA COLUMN FOR TITLE. THIS REPRESENTS THE MR. OR MRS. OF AN INDIVIDUAL.','N','hds.title');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,3,'CRITDEMO','TEST003','N','UDN','TEXT',638,'DATA COLUMN FOR UDN.','N','hds.udn');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','Y','BASE_ROLE','TEXT',310,'DATA COLUMN FOR BASE_ROLE (ROLE).','N','hds.base_role');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','N','COID','TEXT',637,'DATA COLUMN FOR COID.','N','hds.coid');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','Y','DEPARTMENT','TEXT',675,'DATA COLUMN FOR DEPARTMENT.','N','hds.department');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','N','DIRECT_REPORT_EXISTS','TEXT',610,'IDENTIFIES IF DIRECT REPORTS EXIST','N','hds.direct_report_exists');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','Y','EMPLOYEE_NUMBER','NUMBER',1,'DATA COLUMN FOR EMPLOYEE_NUMBER','N','hds.employee_number');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','Y','FIRST_NAME','TEXT',7,'DATA COLUMN FOR FIRST_NAME.','N','hds.first_name');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','N','HIRE_DATE','DATE',751,'DATA COLUMN FOR HIRE DATE.','N','hds.hire_date');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','N','KNOWN_AS','TEXT',10,'DATA COLUMN FOR KNOWN_AS.','N','hds.known_as');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','Y','LAST_NAME','TEXT',6,'DATA COLUMN FOR LAST_NAME.','N','hds.last_name');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','N','MIDDLE_NAMES','TEXT',8,'DATA COLUMN FOR MIDDLE_NAMES.','N','hds.middle_names');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','N','PERSON_ID','NUMBER',12,'DATA COLUMN FOR PERSON_ID.','N','hds.person_id');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','N','PERSON_TYPE','TEXT',70,'DATA COLUMN FOR PERSON_TYPE. REPRESENTS THE GROUP QUALIFICATIONS OF EMP (COULD BE OTHERS DEPENDING ON SYSTEM SUPPORT e.g. APL for Applicants). DOES NOT IMPLY TERMINATED STATUS.','N','hds.person_type');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','N','SUFFIX','TEXT',9,'DATA COLUMN FOR SUFFIX.','N','hds.suffix');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','Y','SUPERVISOR_NUMBER','NUMBER',605,'DATA COLUMN FOR SUPERVISOR_NUMBER.','N','hds.supervisor_number');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','N','SUPERVISOR_PERSON_ID','NUMBER',600,'DATA COLUMN FOR SUPERVISOR_PERSON_ID.','N','hds.supervisor_person_id');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','N','TERMINATION_DATE','DATE',750,'DATA COLUMN FOR TERM DATE.','N','hds.term_date');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','N','TITLE','TEXT',11,'DATA COLUMN FOR TITLE. THIS REPRESENTS THE MR. OR MRS. OF AN INDIVIDUAL.','N','hds.title');
Insert into QCURSOR_DATASET_COLUMN_DETAIL (PROCESS_ID,SUB_PROCESS_ID,PROCESS_DESC,SUB_PROCESS_DESC,ENABLED,COLUMN_ALIAS_NAME,COLUMN_TYPE,COLUMN_ORDER,DESCRIPTION,HR_SECURE_COLUMN,EMP_COLUMN_DETAIL) values (1,4,'CRITDEMO','TEST004','N','UDN','TEXT',638,'DATA COLUMN FOR UDN.','N','hds.udn');


REM INSERTING into QCURSOR_CRITERIA_LIBRARY
Insert into QCURSOR_CRITERIA_LIBRARY (PROCESS_DESC,SUB_PROCESS_DESC,PARAMETER_ENTRY_ID,PARAMETER_NAME,VDATA_TEXT,VDATA_DATE,VDATA_NUMBER,INCL_EXCL_FLAG,CONDITION_BLOCK_ID,CONDITION_SET_ID,CONDITION_MEMBER_ID,CONDITION_OPERATOR,COMMENTS,PROCESS_ID,SUB_PROCESS_ID) values ('CRITDEMO','TEST002',1,'BASE_ROLE_LIKE','Manager','NULL','NULL','I',1,1,1,'AND','Display Managers Only',1,2);
Insert into QCURSOR_CRITERIA_LIBRARY (PROCESS_DESC,SUB_PROCESS_DESC,PARAMETER_ENTRY_ID,PARAMETER_NAME,VDATA_TEXT,VDATA_DATE,VDATA_NUMBER,INCL_EXCL_FLAG,CONDITION_BLOCK_ID,CONDITION_SET_ID,CONDITION_MEMBER_ID,CONDITION_OPERATOR,COMMENTS,PROCESS_ID,SUB_PROCESS_ID) values ('CRITDEMO','TEST001',1,'LAST_AND_FIRST_NAMES','Chase#%','NULL','NULL','I',1,1,1,'AND','Find Last Name Chase',1,1);
Insert into QCURSOR_CRITERIA_LIBRARY (PROCESS_DESC,SUB_PROCESS_DESC,PARAMETER_ENTRY_ID,PARAMETER_NAME,VDATA_TEXT,VDATA_DATE,VDATA_NUMBER,INCL_EXCL_FLAG,CONDITION_BLOCK_ID,CONDITION_SET_ID,CONDITION_MEMBER_ID,CONDITION_OPERATOR,COMMENTS,PROCESS_ID,SUB_PROCESS_ID) values ('CRITDEMO','TEST003',1,'DEPARTMENT_LIKE','DBA','NULL','NULL','I',1,1,1,'AND','DBA Department',1,3);
Insert into QCURSOR_CRITERIA_LIBRARY (PROCESS_DESC,SUB_PROCESS_DESC,PARAMETER_ENTRY_ID,PARAMETER_NAME,VDATA_TEXT,VDATA_DATE,VDATA_NUMBER,INCL_EXCL_FLAG,CONDITION_BLOCK_ID,CONDITION_SET_ID,CONDITION_MEMBER_ID,CONDITION_OPERATOR,COMMENTS,PROCESS_ID,SUB_PROCESS_ID) values ('CRITDEMO','TEST004',1,'BASE_ROLE_LIKE','Manager','NULL','NULL','I',1,1,1,'AND','Display Mgrs, but only reporting to 8163',1,4);
Insert into QCURSOR_CRITERIA_LIBRARY (PROCESS_DESC,SUB_PROCESS_DESC,PARAMETER_ENTRY_ID,PARAMETER_NAME,VDATA_TEXT,VDATA_DATE,VDATA_NUMBER,INCL_EXCL_FLAG,CONDITION_BLOCK_ID,CONDITION_SET_ID,CONDITION_MEMBER_ID,CONDITION_OPERATOR,COMMENTS,PROCESS_ID,SUB_PROCESS_ID) values ('CRITDEMO','TEST004',2,'SUPERVISOR_NUMBER','NULL','NULL','8163','I',1,1,2,'AND','Display Mgrs, but only reporting to 8163',1,4);

COMMIT
/
