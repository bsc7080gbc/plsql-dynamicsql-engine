 
--------------------------------------------------------------------
prompt  APPLICATION 103 - CriteriaGridDemo
--
-- Application Export:
--   Application:     103
--   Name:            CriteriaGridDemo
--   Date and Time:   05:54 Thursday October 16, 2008
--   Exported By:     HR
--   Flashback:       1
--   Version: 2.1.0.00.39
 
-- Import:
--   Using application application builder
--   or
--   Using sqlplus as the Oracle user: FLOWS_020100
 
-- Application Statistics:
--   Pages:                 2
--     Items:               6
--     Computations:        0
--     Validations:         0
--     Processes:           5
--     Regions:             3
--     Buttons:             0
--   Shared Components
--     Breadcrumbs:         0
--        Entries           0
--     Items:               1
--     Computations:        0
--     Processes:           0
--     Parent Tabs:         0
--     Tab Sets:            1
--        Tabs:             1
--     NavBars:             2
--     Lists:               0
--     Shortcuts:           1
--     Themes:              3
--     Templates:
--        Page:            27
--        List:            42
--        Report:          21
--        Label:           15
--        Region:          63
--     Messages:            0
--     Build Options:       0
 
 
set define off
set verify off
set serveroutput on size 1000000
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end; 
/
 
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to sqlplus as the owner (parsing schema) of the application or as the product schema.
  wwv_flow_api.set_security_group_id(p_security_group_id=>715504735983948);
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en-us'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2005.05.01');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := 103;
   wwv_flow_api.g_id_offset := 0;
null;
 
end;
/

 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(103);
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(103);
null;
 
end;
/

 
begin
 
wwv_flow_api.create_flow(
  p_id    => 103,
  p_display_id=> 103,
  p_owner => 'HR',
  p_name  => 'CriteriaGridDemo',
  p_alias => 'CRITERIAGRIDDEMO105',
  p_page_view_logging => 'YES',
  p_default_page_template=> 1425729311000127 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=> 1426008454000130 + wwv_flow_api.g_id_offset,
  p_default_region_template=> 1433727985000164 + wwv_flow_api.g_id_offset,
  p_error_template    => 1425729311000127 + wwv_flow_api.g_id_offset,
  p_checksum_salt_last_reset => '20081016055036',
  p_home_link         => 'f?p=&APP_ID.:1:&SESSION.',
  p_box_width         => '98%',
  p_flow_language     => 'en-us',
  p_flow_language_derived_from=> 'BROWSER',
  p_flow_image_prefix => '/i/',
  p_documentation_banner=> 'Created as default application Tuesday July 16, 2002',
  p_authentication    => 'CUSTOM2',
  p_login_url         => 'f?p=&APP_ID.:LOGIN:&SESSION.',
  p_logout_url        => 'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&p_next_flow_page_sess=&APP_ID.:101',
  p_public_url_prefix => '',
  p_public_user       => '',
  p_dbauth_url_prefix => '',
  p_proxy_server      => '',
  p_cust_authentication_process=> '.'||to_char(313079082691669382 + wwv_flow_api.g_id_offset)||'.',
  p_cust_authentication_page=> '',
  p_custom_auth_login_url=> '',
  p_flow_version      => 'release 1.0',
  p_flow_status       => 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> 'This application is currently unavailable.',
  p_build_status      => 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_vpd               => '',
  p_rejoin_existing_sessions   => 'Y',
  p_csv_encoding    => 'N',
  p_theme_id => 10,
  p_default_label_template => 1441731991000203 + wwv_flow_api.g_id_offset,
  p_default_report_template => 1440620019000197 + wwv_flow_api.g_id_offset,
  p_default_list_template => 1437325036000183 + wwv_flow_api.g_id_offset,
  p_default_menu_template => 1442222472000209 + wwv_flow_api.g_id_offset,
  p_default_button_template => 1426918918000131 + wwv_flow_api.g_id_offset,
  p_default_chart_template => 1428025656000155 + wwv_flow_api.g_id_offset,
  p_default_form_template => 1431631920000161 + wwv_flow_api.g_id_offset,
  p_default_wizard_template => 1430731283000159 + wwv_flow_api.g_id_offset,
  p_default_tabform_template => 1433727985000164 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>1433727985000164 + wwv_flow_api.g_id_offset,
  p_default_menur_template => 1428628009000155 + wwv_flow_api.g_id_offset,
  p_default_listr_template => 1433727985000164 + wwv_flow_api.g_id_offset,
  p_substitution_string_01 => 'APPLICATION_ICON',
  p_substitution_value_01  => 'oracle_platform_white.gif',
  p_last_updated_by => 'HR',
  p_last_upd_yyyymmddhh24miss => '20081016055036',
  p_required_roles             => wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

---------------------------------------
prompt  ...AUTHORIZATION SCHEMES
--
 
begin
 
null;
 
end;
/

--
prompt  ...Navigation Bar Entries
--
 
begin
 
wwv_flow_api.create_icon_bar_item(
  p_id             => 365464645045481324 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_icon_sequence  => 10,
  p_icon_image     => '',
  p_icon_subtext   => 'Print',
  p_icon_target    => 'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.::::YES',
  p_icon_image_alt => '',
  p_icon_height    => null,
  p_icon_width     => null,
  p_icon_height2   => null,
  p_icon_width2    => null,
  p_icon_bar_disp_cond      => '101',
  p_icon_bar_disp_cond_type => 'CURRENT_PAGE_NOT_EQUAL_CONDITION',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
wwv_flow_api.create_icon_bar_item(
  p_id             => 365465359590485438 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_icon_sequence  => 20,
  p_icon_image     => '',
  p_icon_subtext   => 'Logout',
  p_icon_target    => '&LOGOUT_URL.',
  p_icon_image_alt => '',
  p_icon_height    => null,
  p_icon_width     => null,
  p_icon_height2   => null,
  p_icon_width2    => null,
  p_icon_bar_disp_cond      => '101',
  p_icon_bar_disp_cond_type => 'CURRENT_PAGE_NOT_EQUAL_CONDITION',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
 
end;
/

---------------------------------------
prompt  ...Application Level Processes
--
---------------------------------------
prompt  ...Application Level Items
--
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 310836439570499557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'FSP_AFTER_LOGIN_URL',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_item_comment=> 'Used by Custom2 authentication for deep linking support');
 
null;
 
end;
/

---------------------------------------
prompt  ...Application Level Computations
--
 
begin
 
null;
 
end;
/

---------------------------------------
prompt  ...Application Tabs
--
 
begin
 
wwv_flow_api.create_tab (
  p_id=> 1447428043017702 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 25,
  p_tab_name=> 'T_CRITERIA GRID DEMO',
  p_tab_text => 'Criteria&nbsp;Grid&nbsp;Demo',
  p_tab_step => 1,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_tab_comment  => '');
 
 
end;
/

---------------------------------------
prompt  ...Application Parent Tabs
--
 
begin
 
null;
 
end;
/

---------------------------------------
prompt  ...Application Level Lists of Values
--
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 2409135510501279 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'CONDITION_OPERATOR_LOV',
  p_lov_query=> '.'||to_char(2409135510501279 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 2408127199498871 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'INCL_EXCL_FLAG_LOV',
  p_lov_query=> '.'||to_char(2408127199498871 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 1461104140052117 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'USECASELOV',
  p_lov_query=> 'select casenum||'' [''||comments||'']'' d, rvalue r'||chr(10)||
'from   case_view'||chr(10)||
'order by 2');
 
null;
 
end;
/

---------------------------------------
prompt  ...Application Trees
--
 
begin
 
null;
 
end;
/

---------------------------------------
prompt  ...Application Level Lists of Values Entries
--
 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2408356531498878 + wwv_flow_api.g_id_offset,
  p_lov_id=>2408127199498871 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'I',
  p_lov_return_value=>'I',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2408533087498882 + wwv_flow_api.g_id_offset,
  p_lov_id=>2408127199498871 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'E',
  p_lov_return_value=>'E',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2409351355501279 + wwv_flow_api.g_id_offset,
  p_lov_id=>2409135510501279 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>1,
  p_lov_disp_value=>'AND',
  p_lov_return_value=>'AND',
  p_lov_data_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>2409531388501281 + wwv_flow_api.g_id_offset,
  p_lov_id=>2409135510501279 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>2,
  p_lov_disp_value=>'OR',
  p_lov_return_value=>'OR',
  p_lov_data_comment=> '');
 
null;
 
end;
/

---------------------------------------
prompt  ...Page Groups
--
 
begin
 
null;
 
end;
/

 
------------------------------------------
prompt  ...PAGE 1: Criteria Grid Test
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h := null;
ph := null;
wwv_flow_api.create_page(
  p_id     => 1,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_name   => 'Criteria Grid Test',
  p_step_title=> 'Collection on EMP table',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'AUTO_FIRST_ITEM',
  p_help_text => '',
  p_html_page_header => '',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'HR',
  p_last_upd_yyyymmddhh24miss => '20081016055036',
  p_page_is_public_y_n=> 'N',
  p_page_comment  => '');
 
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select  SUB_PROCESS_DESC ,'||chr(10)||
'  PARAMETER_ENTRY_ID  ,'||chr(10)||
'  PARAMETER_NAME      ,'||chr(10)||
'  VDATA_TEXT           ,'||chr(10)||
'  VDATA_DATE         ,'||chr(10)||
'  VDATA_NUMBER        ,'||chr(10)||
'  INCL_EXCL_FLAG      ,'||chr(10)||
'  CONDITION_BLOCK_ID  ,'||chr(10)||
'  CONDITION_SET_ID    ,'||chr(10)||
'  CONDITION_MEMBER_ID  ,'||chr(10)||
'  CONDITION_OPERATOR ,'||chr(10)||
'  COMMENTS            '||chr(10)||
'from qcursor_criteria_library'||chr(10)||
'where sub_process_desc = UPPER(:P1_TESTCASE)'||chr(10)||
'order by parameter_en';

s:=s||'try_id'||chr(10)||
''||chr(10)||
''||chr(10)||
' ';

wwv_flow_api.create_report_region (
  p_id=> 1447619972017706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_name=> 'Criteria Grid',
  p_template=> 1433727985000164+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_error_message=> '#SQLERRM#',
  p_footer                       => '<br><br>',
  p_customized                   => '0',
  p_translate_title              => 'Y',
  p_query_row_template           => 1439215994000191+ wwv_flow_api.g_id_offset,
  p_query_headings_type          => 'COLON_DELMITED_LIST',
  p_query_num_rows               => '50',
  p_query_options                => 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols             => '0',
  p_query_no_data_found          => 'Select a Valid Test Case',
  p_ignore_pagination            => '0',
  p_query_num_rows_type          => 'ROWS_X_TO_Y_OF_Z',
  p_query_row_count_max          => '500',
  p_pagination_display_position  => 'BOTTOM_RIGHT',
  p_csv_output                   => 'N',
  p_query_asc_image              => 'blue_arrow_down.gif',
  p_query_asc_image_attr         => 'width="13" height="12"',
  p_query_desc_image             => 'blue_arrow_up.gif',
  p_query_desc_image_attr        => 'width="13" height="12"',
  p_plug_query_strip_html        => 'Y',
  p_required_patch               => '' + wwv_flow_api.g_id_offset,
  p_comment                      => '');
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1447916871017714 + wwv_flow_api.g_id_offset,
  p_region_id=> 1447619972017706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'SUB_PROCESS_DESC',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Test Case',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1448017563017714 + wwv_flow_api.g_id_offset,
  p_region_id=> 1447619972017706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'PARAMETER_ENTRY_ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'ParmID',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1448122589017714 + wwv_flow_api.g_id_offset,
  p_region_id=> 1447619972017706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'PARAMETER_NAME',
  p_column_display_sequence=> 3,
  p_column_heading=> 'ParmName',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1448202808017714 + wwv_flow_api.g_id_offset,
  p_region_id=> 1447619972017706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'VDATA_TEXT',
  p_column_display_sequence=> 4,
  p_column_heading=> 'vText',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1448316378017714 + wwv_flow_api.g_id_offset,
  p_region_id=> 1447619972017706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'VDATA_DATE',
  p_column_display_sequence=> 5,
  p_column_heading=> 'vDate',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1448431846017714 + wwv_flow_api.g_id_offset,
  p_region_id=> 1447619972017706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'VDATA_NUMBER',
  p_column_display_sequence=> 6,
  p_column_heading=> 'vNumber',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1448501678017714 + wwv_flow_api.g_id_offset,
  p_region_id=> 1447619972017706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'INCL_EXCL_FLAG',
  p_column_display_sequence=> 7,
  p_column_heading=> 'IncExFlag',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1448607088017714 + wwv_flow_api.g_id_offset,
  p_region_id=> 1447619972017706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'CONDITION_BLOCK_ID',
  p_column_display_sequence=> 8,
  p_column_heading=> 'BlkID',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1448703819017714 + wwv_flow_api.g_id_offset,
  p_region_id=> 1447619972017706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'CONDITION_SET_ID',
  p_column_display_sequence=> 9,
  p_column_heading=> 'SetID',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1448807142017714 + wwv_flow_api.g_id_offset,
  p_region_id=> 1447619972017706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'CONDITION_MEMBER_ID',
  p_column_display_sequence=> 10,
  p_column_heading=> 'MbrID',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1448907325017714 + wwv_flow_api.g_id_offset,
  p_region_id=> 1447619972017706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'CONDITION_OPERATOR',
  p_column_display_sequence=> 11,
  p_column_heading=> 'Operator',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1449020218017716 + wwv_flow_api.g_id_offset,
  p_region_id=> 1447619972017706 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'COMMENTS',
  p_column_display_sequence=> 12,
  p_column_heading=> 'Comments',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_default_sort_column_sequence=> 0,
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'DECLARE'||chr(10)||
'l_sql VARCHAR2(32767) DEFAULT NULL;'||chr(10)||
'BEGIN'||chr(10)||
'COMMIT;'||chr(10)||
':P1_TESTCASE_HIDDEN := :P1_TESTCASE;'||chr(10)||
''||chr(10)||
'l_sql := test_api_f ('||chr(10)||
'   p_process_desc       => ''CRITDEMO'','||chr(10)||
'   p_sub_process_desc  => UPPER(:P1_TESTCASE_HIDDEN),'||chr(10)||
'   p_mode               => ''NORMAL_MODE'' ,'||chr(10)||
'   p_terms => ''ALL'','||chr(10)||
'   p_term_date => ''01-JAN-1951'','||chr(10)||
'   p_page => 1,'||chr(10)||
'   p_pagesize => 25);'||chr(10)||
'--htp.p(''<BR><BR>HIDDEN := ''||:P1_TESTCA';

s:=s||'SE_HIDDEN||''<BR><BR>'');'||chr(10)||
'--htp.p(''<BR><BR>SELECTED := ''||:P1_TESTCASE||''<BR><BR>'');'||chr(10)||
''||chr(10)||
'--htp.p(''<BR><BR>''||l_sql||''<BR><BR>'');'||chr(10)||
''||chr(10)||
''||chr(10)||
'htp.p(''<table cellpadding="0" border="0" cellspacing="0" summary=""><tr><td></td></tr> '||chr(10)||
'<tr><td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t10Standard"> '||chr(10)||
'<tr ><th class="t10ReportHeader" align="left" id="GENERATED_SQL">Generated SQL</th></tr';

s:=s||'> '||chr(10)||
'<tr onMouseOver="row_mouse_over1447619972017706(this, 1)" onMouseOut="row_mouse_out1447619972017706(this, 1)"><td class="t10data" headers="Generated SQL">''||l_sql||''</td></tr></table>'');'||chr(10)||
''||chr(10)||
'RETURN l_sql;'||chr(10)||
'END;';

wwv_flow_api.create_report_region (
  p_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_name=> 'Demographic Data',
  p_template=> 1433727985000164+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'FUNCTION_RETURNING_SQL_QUERY',
  p_display_error_message=> '#SQLERRM#',
  p_customized                   => '0',
  p_translate_title              => 'Y',
  p_query_row_template           => 1440620019000197+ wwv_flow_api.g_id_offset,
  p_plug_query_max_columns       => 60,
  p_query_headings_type          => 'QUERY_COLUMNS',
  p_query_num_rows               => '15',
  p_query_options                => 'GENERIC_REPORT_COLUMNS',
  p_query_show_nulls_as          => ' - ',
  p_query_no_data_found          => 'no data found',
  p_query_num_rows_type          => 'NEXT_PREVIOUS_LINKS',
  p_query_row_count_max          => '500',
  p_pagination_display_position  => 'BOTTOM_RIGHT',
  p_query_asc_image              => 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr         => 'width="13" height="12"',
  p_query_desc_image             => 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr        => 'width="13" height="12"',
  p_required_patch               => '' + wwv_flow_api.g_id_offset,
  p_comment                      => '');
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1449525030017719 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'COL01',
  p_column_display_sequence=> 1,
  p_column_heading=> 'COL01',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1449625646017719 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'COL02',
  p_column_display_sequence=> 2,
  p_column_heading=> 'COL02',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1449719541017719 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'COL03',
  p_column_display_sequence=> 3,
  p_column_heading=> 'COL03',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1449814872017719 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'COL04',
  p_column_display_sequence=> 4,
  p_column_heading=> 'COL04',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1449906625017719 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'COL05',
  p_column_display_sequence=> 5,
  p_column_heading=> 'COL05',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1450018444017719 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'COL06',
  p_column_display_sequence=> 6,
  p_column_heading=> 'COL06',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1450123188017719 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'COL07',
  p_column_display_sequence=> 7,
  p_column_heading=> 'COL07',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1450203799017719 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'COL08',
  p_column_display_sequence=> 8,
  p_column_heading=> 'COL08',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1450302192017720 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'COL09',
  p_column_display_sequence=> 9,
  p_column_heading=> 'COL09',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1450429239017720 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 10,
  p_form_element_id=> null,
  p_column_alias=> 'COL10',
  p_column_display_sequence=> 10,
  p_column_heading=> 'COL10',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1450512130017720 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 11,
  p_form_element_id=> null,
  p_column_alias=> 'COL11',
  p_column_display_sequence=> 11,
  p_column_heading=> 'COL11',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1450613716017720 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 12,
  p_form_element_id=> null,
  p_column_alias=> 'COL12',
  p_column_display_sequence=> 12,
  p_column_heading=> 'COL12',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1450704714017720 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 13,
  p_form_element_id=> null,
  p_column_alias=> 'COL13',
  p_column_display_sequence=> 13,
  p_column_heading=> 'COL13',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1450830166017720 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 14,
  p_form_element_id=> null,
  p_column_alias=> 'COL14',
  p_column_display_sequence=> 14,
  p_column_heading=> 'COL14',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1450926047017720 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 15,
  p_form_element_id=> null,
  p_column_alias=> 'COL15',
  p_column_display_sequence=> 15,
  p_column_heading=> 'COL15',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1451032449017720 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 16,
  p_form_element_id=> null,
  p_column_alias=> 'COL16',
  p_column_display_sequence=> 16,
  p_column_heading=> 'COL16',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1451114454017720 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 17,
  p_form_element_id=> null,
  p_column_alias=> 'COL17',
  p_column_display_sequence=> 17,
  p_column_heading=> 'COL17',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1451211924017720 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 18,
  p_form_element_id=> null,
  p_column_alias=> 'COL18',
  p_column_display_sequence=> 18,
  p_column_heading=> 'COL18',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1451308286017720 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 19,
  p_form_element_id=> null,
  p_column_alias=> 'COL19',
  p_column_display_sequence=> 19,
  p_column_heading=> 'COL19',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1451403289017720 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 20,
  p_form_element_id=> null,
  p_column_alias=> 'COL20',
  p_column_display_sequence=> 20,
  p_column_heading=> 'COL20',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1451524198017720 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 21,
  p_form_element_id=> null,
  p_column_alias=> 'COL21',
  p_column_display_sequence=> 21,
  p_column_heading=> 'COL21',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1451622963017720 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 22,
  p_form_element_id=> null,
  p_column_alias=> 'COL22',
  p_column_display_sequence=> 22,
  p_column_heading=> 'COL22',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1451724871017722 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 23,
  p_form_element_id=> null,
  p_column_alias=> 'COL23',
  p_column_display_sequence=> 23,
  p_column_heading=> 'COL23',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1451814599017722 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 24,
  p_form_element_id=> null,
  p_column_alias=> 'COL24',
  p_column_display_sequence=> 24,
  p_column_heading=> 'COL24',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1451902771017722 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 25,
  p_form_element_id=> null,
  p_column_alias=> 'COL25',
  p_column_display_sequence=> 25,
  p_column_heading=> 'COL25',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1452018772017722 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 26,
  p_form_element_id=> null,
  p_column_alias=> 'COL26',
  p_column_display_sequence=> 26,
  p_column_heading=> 'COL26',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1452120461017722 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 27,
  p_form_element_id=> null,
  p_column_alias=> 'COL27',
  p_column_display_sequence=> 27,
  p_column_heading=> 'COL27',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1452200021017722 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 28,
  p_form_element_id=> null,
  p_column_alias=> 'COL28',
  p_column_display_sequence=> 28,
  p_column_heading=> 'COL28',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1452323258017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 29,
  p_form_element_id=> null,
  p_column_alias=> 'COL29',
  p_column_display_sequence=> 29,
  p_column_heading=> 'COL29',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1452407685017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 30,
  p_form_element_id=> null,
  p_column_alias=> 'COL30',
  p_column_display_sequence=> 30,
  p_column_heading=> 'COL30',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1452519564017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 31,
  p_form_element_id=> null,
  p_column_alias=> 'COL31',
  p_column_display_sequence=> 31,
  p_column_heading=> 'COL31',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1452600920017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 32,
  p_form_element_id=> null,
  p_column_alias=> 'COL32',
  p_column_display_sequence=> 32,
  p_column_heading=> 'COL32',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1452710614017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 33,
  p_form_element_id=> null,
  p_column_alias=> 'COL33',
  p_column_display_sequence=> 33,
  p_column_heading=> 'COL33',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1452812939017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 34,
  p_form_element_id=> null,
  p_column_alias=> 'COL34',
  p_column_display_sequence=> 34,
  p_column_heading=> 'COL34',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1452926503017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 35,
  p_form_element_id=> null,
  p_column_alias=> 'COL35',
  p_column_display_sequence=> 35,
  p_column_heading=> 'COL35',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1453027482017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 36,
  p_form_element_id=> null,
  p_column_alias=> 'COL36',
  p_column_display_sequence=> 36,
  p_column_heading=> 'COL36',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1453108766017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 37,
  p_form_element_id=> null,
  p_column_alias=> 'COL37',
  p_column_display_sequence=> 37,
  p_column_heading=> 'COL37',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1453209714017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 38,
  p_form_element_id=> null,
  p_column_alias=> 'COL38',
  p_column_display_sequence=> 38,
  p_column_heading=> 'COL38',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1453308127017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 39,
  p_form_element_id=> null,
  p_column_alias=> 'COL39',
  p_column_display_sequence=> 39,
  p_column_heading=> 'COL39',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1453413064017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 40,
  p_form_element_id=> null,
  p_column_alias=> 'COL40',
  p_column_display_sequence=> 40,
  p_column_heading=> 'COL40',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1453515905017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 41,
  p_form_element_id=> null,
  p_column_alias=> 'COL41',
  p_column_display_sequence=> 41,
  p_column_heading=> 'COL41',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1453612243017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 42,
  p_form_element_id=> null,
  p_column_alias=> 'COL42',
  p_column_display_sequence=> 42,
  p_column_heading=> 'COL42',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1453731991017724 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 43,
  p_form_element_id=> null,
  p_column_alias=> 'COL43',
  p_column_display_sequence=> 43,
  p_column_heading=> 'COL43',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1453812317017725 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 44,
  p_form_element_id=> null,
  p_column_alias=> 'COL44',
  p_column_display_sequence=> 44,
  p_column_heading=> 'COL44',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1453925921017725 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 45,
  p_form_element_id=> null,
  p_column_alias=> 'COL45',
  p_column_display_sequence=> 45,
  p_column_heading=> 'COL45',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1454010981017725 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 46,
  p_form_element_id=> null,
  p_column_alias=> 'COL46',
  p_column_display_sequence=> 46,
  p_column_heading=> 'COL46',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1454126470017725 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 47,
  p_form_element_id=> null,
  p_column_alias=> 'COL47',
  p_column_display_sequence=> 47,
  p_column_heading=> 'COL47',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1454223566017725 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 48,
  p_form_element_id=> null,
  p_column_alias=> 'COL48',
  p_column_display_sequence=> 48,
  p_column_heading=> 'COL48',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1454312813017725 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 49,
  p_form_element_id=> null,
  p_column_alias=> 'COL49',
  p_column_display_sequence=> 49,
  p_column_heading=> 'COL49',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1454400455017725 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 50,
  p_form_element_id=> null,
  p_column_alias=> 'COL50',
  p_column_display_sequence=> 50,
  p_column_heading=> 'COL50',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1454521981017725 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 51,
  p_form_element_id=> null,
  p_column_alias=> 'COL51',
  p_column_display_sequence=> 51,
  p_column_heading=> 'COL51',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1454611959017725 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 52,
  p_form_element_id=> null,
  p_column_alias=> 'COL52',
  p_column_display_sequence=> 52,
  p_column_heading=> 'COL52',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1454704513017725 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 53,
  p_form_element_id=> null,
  p_column_alias=> 'COL53',
  p_column_display_sequence=> 53,
  p_column_heading=> 'COL53',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1454827149017725 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 54,
  p_form_element_id=> null,
  p_column_alias=> 'COL54',
  p_column_display_sequence=> 54,
  p_column_heading=> 'COL54',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1454912091017725 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 55,
  p_form_element_id=> null,
  p_column_alias=> 'COL55',
  p_column_display_sequence=> 55,
  p_column_heading=> 'COL55',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1455005381017725 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 56,
  p_form_element_id=> null,
  p_column_alias=> 'COL56',
  p_column_display_sequence=> 56,
  p_column_heading=> 'COL56',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1455115714017725 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 57,
  p_form_element_id=> null,
  p_column_alias=> 'COL57',
  p_column_display_sequence=> 57,
  p_column_heading=> 'COL57',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1455206537017727 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 58,
  p_form_element_id=> null,
  p_column_alias=> 'COL58',
  p_column_display_sequence=> 58,
  p_column_heading=> 'COL58',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1455331534017727 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 59,
  p_form_element_id=> null,
  p_column_alias=> 'COL59',
  p_column_display_sequence=> 59,
  p_column_heading=> 'COL59',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 1455420453017727 + wwv_flow_api.g_id_offset,
  p_region_id=> 1449304222017716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 60,
  p_form_element_id=> null,
  p_column_alias=> 'COL60',
  p_column_display_sequence=> 60,
  p_column_heading=> 'COL60',
  p_column_alignment=> 'LEFT',
  p_heading_alignment=> 'CENTER',
  p_disable_sort_column=> 'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=> 'WITHOUT_MODIFICATION',
  p_pk_col_source=> s,
  p_column_comment               => '');
end;
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>1455915916017738 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_branch_action=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::P1_TESTCASE:&P1_TESTCASE.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_comment=> 'Created 29-SEP-2008 13:59 by HR');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1481113218310307 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_TESTCASE',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 1449304222017716+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'UseCase',
  p_source_type=> 'STATIC',
  p_display_as=> 'COMBOBOX',
  p_named_lov=> 'USECASELOV',
  p_lov => 'select casenum||'' [''||comments||'']'' d, rvalue r'||chr(10)||
'from   case_view'||chr(10)||
'order by 2',
  p_lov_columns=> 1,
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Select a Test Case',
  p_lov_null_value=> '0',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 1442011698000203+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1488806385365024 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_TESTCASE_HIDDEN',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 1447619972017706+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type => 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'ITEM',
  p_display_as=> 'HIDDEN',
  p_lov_columns=> 1,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>1500710843336420 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SUBMIT',
  p_data_type=> 'VARCHAR',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 1449304222017716+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default => 'Go',
  p_prompt=>'Go',
  p_source=>'Go',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_button_image => 'go.gif',
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'BEGIN'||chr(10)||
':P1_TESTCASE_HIDDEN := :P1_TESTCASE;'||chr(10)||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 1494821585416735 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'SET_USECASE',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1
--
 
begin
 
null;
end;
null;
 
end;
/

 
------------------------------------------
prompt  ...PAGE 101: Login Page
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h := null;
ph := null;
wwv_flow_api.create_page(
  p_id     => 101,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> '',
  p_name   => 'Login Page',
  p_alias  => 'LOGIN',
  p_step_title=> 'Login Page',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'AUTO_FIRST_ITEM',
  p_help_text => '',
  p_html_page_header => '',
  p_step_template => '',
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'HR',
  p_last_upd_yyyymmddhh24miss => '20081012204632',
  p_page_is_public_y_n=> 'Y',
  p_page_comment  => 'This page was generated by the Login Page wizard');
 
end;
 
end;
/

declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 310854063548629093 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 101,
  p_plug_name=> 'Login Items',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_display_column  => 1,
  p_plug_display_point   => 'AFTER_SHOW_ITEMS',
  p_plug_source  => s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> '',
  p_required_patch=> '' + wwv_flow_api.g_id_offset,
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>310854146629629101 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_USERNAME',
  p_data_type=> '',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 310854063548629093+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'Username',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>310854252593629103 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_PASSWORD',
  p_data_type=> '',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 310854063548629093+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'Password',
  p_display_as=> 'PASSWORD_WITH_ENTER_SUBMIT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>310854349133629103 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LOGIN',
  p_data_type=> '',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 310854063548629093+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default => 'Login',
  p_prompt=>'Login',
  p_source=>'LOGIN',
  p_display_as=> 'BUTTON',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
'owa_util.mime_header(''text/html'', FALSE);'||chr(10)||
'owa_cookie.send('||chr(10)||
'    name=>''LOGIN_USERNAME_COOKIE'','||chr(10)||
'    value=>lower(:P101_USERNAME));'||chr(10)||
'exception when others then null;'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 310854545284629113 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Set Username Cookie',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'wwv_flow_custom_auth_std.login('||chr(10)||
'    P_UNAME       => :P101_USERNAME,'||chr(10)||
'    P_PASSWORD    => :P101_PASSWORD,'||chr(10)||
'    P_SESSION_ID  => v(''APP_SESSION''),'||chr(10)||
'    P_FLOW_PAGE   => :APP_ID||'':1'''||chr(10)||
'    );';

wwv_flow_api.create_page_process(
  p_id     => 310854442120629105 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Login',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'101';

wwv_flow_api.create_page_process(
  p_id     => 310854649126629113 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Clear',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||chr(10)||
'    v varchar2(255) := null;'||chr(10)||
'    c owa_cookie.cookie;'||chr(10)||
'begin'||chr(10)||
'   c := owa_cookie.get(''LOGIN_USERNAME_COOKIE'');'||chr(10)||
'   :P101_USERNAME := c.vals(1);'||chr(10)||
'exception when others then null;'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 310854750938629113 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get Username Cookie',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_required_patch=>null + wwv_flow_api.g_id_offset,
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 101
--
 
begin
 
null;
end;
null;
 
end;
/

---------------------------------------
prompt  ...Lists
--
---------------------------------------
prompt  ...Breadcrumbs
--
---------------------------------------
prompt  ...Page Templates for application: 103
--
prompt  ......Page template 2352243073873443
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo" width="100%">#LOGO#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%"><br /></td>'||chr(10)||
'<td class="t2tabholder" valign="bottom"><table width="100%" cellpadding="0" cellspacin';

c3:=c3||'g="0" border="0" summary=""><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height="35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td class="t2to';

c3:=c3||'pbar05"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%"><br /></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" class="t2sidebar" valign="top">#REGION_POSITION_02#</td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</';

c3:=c3||'tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valign="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td ';

c3:=c3||'valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 2352243073873443 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_right.png" border="0" alt="" /></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_right.png" border="0" alt="" /></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>'||chr(10)||
'',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 2,
  p_theme_class_id => 16,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 2352432544873450
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t1Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo" width="100%">#LOGO#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height=';

c3:=c3||'"35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td class="t2topbar05"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%"><br /></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" valign="top"><b';

c3:=c3||'r/></td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valign="top" width="100%" colspan="3" valign="top" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_';

c3:=c3||'02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 2352432544873450 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>'||chr(10)||
'',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 2,
  p_theme_class_id => 3,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 2352558268873450
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo" width="100%">#LOGO#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height=';

c3:=c3||'"35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td class="t2topbar05"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%"><br /></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" class="t2sideba';

c3:=c3||'r" valign="top">#REGION_POSITION_02#</td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valign="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BO';

c3:=c3||'DY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 2352558268873450 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 2,
  p_theme_class_id => 17,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 2352344668873448
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 2352344668873448 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Popup',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 2,
  p_theme_class_id => 4,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 1424320669000106
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_10/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>';

c3:=c3||'<table summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 1424320669000106 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Popup',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t10success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t10notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '<a href="#LINK#">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" cellpadding="0" cellspacing="0" summary=""',
  p_theme_id  => 10,
  p_theme_class_id => 4,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 1424506022000120
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_10/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10Logo">#LOGO#</td>'||chr(10)||
'<td class="t10NavBar">&APP_USER.#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'  <tr>'||chr(10)||
'    <td background="#IMAGE_PREFIX#themes/theme_10/tab_top_back_off.gif"><table border="0" cellpadding="0" cellspacing="0" summary=""><tr>';

c3:=c3||'<td><img src="#IMAGE_PREFIX#themes/theme_10/tab_right.gif" alt="" /></td>#TAB_CELLS#<td width="100%"><div class="t10Customize">#CUSTOMIZE#</div></td></tr></table></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t10BreadCrumbRegion">#REGION_POSITION_01#<img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td background="#IMAGE_PREFIX#themes/theme_10/bread';

c3:=c3||'crumb_bottom.gif"><img src="#IMAGE_PREFIX#themes/theme_10/breadcrumb_bottom.gif" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" class="t10ContentBody"><table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr><td valign="top" width="100%"><div class="t10messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITIO';

c3:=c3||'N_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 1424506022000120 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t10success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t10notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '&nbsp;|&nbsp;<a href="#LINK#">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 10,
  p_theme_class_id => 3,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 1424818658000122
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_10/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10Logo">#LOGO#<br /></td>'||chr(10)||
'<td class="t10NavBar">&APP_USER.#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="3" background="#IMAGE_PREFIX#themes/theme_10/tab_top_back_off.gif"><table border="0" cellpadding="0" cellspacing="0" sum';

c3:=c3||'mary=""><tr><td><img src="#IMAGE_PREFIX#themes/theme_10/tab_right.gif" alt="" /></td>#TAB_CELLS#<td width="100%"><div class="t10Customize">#CUSTOMIZE#</div></td></tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" style="background-color:#dfdfb8;"><img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td colspan="2" class="t10BreadCrumbRegion">#REGION_POSITION_01#<im';

c3:=c3||'g src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'  <td valign="top" style="background-color:#dfdfb8;"><img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'    <td colspan="2" background="#IMAGE_PREFIX#themes/theme_10/breadcrumb_bottom.gif"><img src="#IMAGE_PREFIX#themes/theme_10/breadcrumb_bottom.gif" alt="" />';

c3:=c3||'</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'  <td valign="top" style="padding-left:8px;padding-right:8px;background-color:#dfdfb8;" class="t10SidebarLayout">#REGION_POSITION_02#</td>'||chr(10)||
'  <td valign="top" class="t10SidebarLayout2"><img src="#IMAGE_PREFIX#themes/theme_10/sidebar_right.gif" alt="" /></td>'||chr(10)||
'    <td valign="top" class="t10ContentBody"><table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<t';

c3:=c3||'r><td valign="top" width="100%"><div class="t10messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 1424818658000122 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs with Sidebar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t10success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_10/arrows.gif" alt="" /></td>'||chr(10)||
'<td><a href="#TAB_LINK#" class="t10standardtabcurrent">#TAB_LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/tab_right.gif" alt="" />#TAB_INLINE_EDIT#</td>'||chr(10)||
'',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><a href="#TAB_LINK#" class="t10standardtab">#TAB_LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/tab_right.gif" alt="" />#TAB_INLINE_EDIT#</td>'||chr(10)||
'',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t10notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '&nbsp;|&nbsp;<a href="#LINK#">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" cellpadding="0" cellspacing="0" summary=""',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 10,
  p_theme_class_id => 16,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 1425124217000123
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_10/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10Logo">#LOGO#<br /></td>'||chr(10)||
'<td class="t10NavBar">&APP_USER.#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="3" background="#IMAGE_PREFIX#themes/theme_10/tab_top_back_off.gif"><table border="0" cellpadding="0" cellspacing="0" sum';

c3:=c3||'mary=""><tr><td><img src="#IMAGE_PREFIX#themes/theme_10/tab_right.gif" alt="" /></td>#PARENT_TAB_CELLS#<td width="100%"><div class="t10Customize">#CUSTOMIZE#</div></td></tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" style="background-color:#dfdfb8;"><img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td colspan="2" class="t10BreadCrumbRegion">#REGION_POSITION';

c3:=c3||'_01#<img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'  <td valign="top" style="background-color:#dfdfb8;"><img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'    <td colspan="2" background="#IMAGE_PREFIX#themes/theme_10/breadcrumb_bottom.gif"><img src="#IMAGE_PREFIX#themes/theme_10/breadcrumb_bottom.gif" al';

c3:=c3||'t="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'  <td valign="top" style="background-color:#dfdfb8;padding-left:8px;padding-right:8px;" class="t10SidebarLayout">#TAB_CELLS#</td>'||chr(10)||
'  <td valign="top" style="background:url(#IMAGE_PREFIX#themes/theme_10/sidebar_right.gif)right;background-color:#cfcf9f;" class="t10SidebarLayout2"><img src="#IMAGE_PREFIX#themes/theme_10/sidebar_right.gif" alt="" /></td>'||chr(10)||
'    <td valign="top"';

c3:=c3||' class="t10ContentBody"><table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr><td valign="top" width="100%"><div class="t10messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br';

c3:=c3||' /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 1425124217000123 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t10success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<div class="t10childtabcurrent">#TAB_LABEL##TAB_INLINE_EDIT#</div>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<div class="t10childtab"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</div>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_10/arrows.gif" alt="" /></td>'||chr(10)||
'<td><a href="#TAB_LINK#" class="t10standardtabcurrent">#TAB_LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/tab_right.gif" alt="" />#TAB_INLINE_EDIT#</td>'||chr(10)||
'',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><a href="#TAB_LINK#" class="t10standardtab">#TAB_LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/tab_right.gif" alt="" />#TAB_INLINE_EDIT#</td>'||chr(10)||
'',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t10notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '&nbsp;|&nbsp;<a href="#LINK#">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" cellpadding="0" cellspacing="0" summary=""',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 10,
  p_theme_class_id => 2,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '8');
end;
 
null;
 
end;
/

prompt  ......Page template 1425420320000125
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_10/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10Logo">#LOGO#<br /></td>'||chr(10)||
'<td class="t10NavBar">&APP_USER.#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="3" background="#IMAGE_PREFIX#themes/theme_10/tab_top_back_off.gif"><table border="0" cellpadding="0" cellspacing="0" sum';

c3:=c3||'mary=""><tr><td><img src="#IMAGE_PREFIX#themes/theme_10/tab_right.gif" alt="" /></td>#TAB_CELLS#<td width="100%"><div class="t10Customize">#CUSTOMIZE#</div></td></tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" style="background-color:#dfdfb8;"><img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td colspan="2" class="t10BreadCrumbRegion">#REGION_POSITION_01#<im';

c3:=c3||'g src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'  <td valign="top" style="background-color:#dfdfb8;"><img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'    <td colspan="2" background="#IMAGE_PREFIX#themes/theme_10/breadcrumb_bottom.gif"><img src="#IMAGE_PREFIX#themes/theme_10/breadcrumb_bottom.gif" alt="" />';

c3:=c3||'</td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'  <td valign="top" style="padding-left:8px;padding-right:8px;background-color:#dfdfb8;" class="t10SidebarLayout">#REGION_POSITION_02#</td>'||chr(10)||
'  <td valign="top" class="t10SidebarLayout2"><img src="#IMAGE_PREFIX#themes/theme_10/sidebar_right.gif" alt="" /></td>'||chr(10)||
'    <td valign="top" class="t10ContentBody"><table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<t';

c3:=c3||'r><td valign="top" width="100%"><div class="t10messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 1425420320000125 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs with Sidebar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t10success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t10notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '&nbsp;|&nbsp;<a href="#LINK#">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 10,
  p_theme_class_id => 17,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 1425729311000127
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_10/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10Logo">#LOGO#</td>'||chr(10)||
'<td class="t10NavBar">&APP_USER.#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="3" background="#IMAGE_PREFIX#themes/theme_10/tab_top_back_off.gif"><table border="0" cellpadding="0" cellspacing="0" summary="';

c3:=c3||'"><tr><td><img src="#IMAGE_PREFIX#themes/theme_10/tab_right.gif" alt="" /></td>#TAB_CELLS#<td width="100%"><div class="t10Customize">#CUSTOMIZE#</div></td></tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'    <td class="t10BreadCrumbRegion">#REGION_POSITION_01#<img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td background="#IMAGE_PREFIX#themes/theme_10/bre';

c3:=c3||'adcrumb_bottom.gif"><img src="#IMAGE_PREFIX#themes/theme_10/breadcrumb_bottom.gif" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" class="t10ContentBody"><table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr><td valign="top" width="100%"><div class="t10messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSIT';

c3:=c3||'ION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 1425729311000127 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t10success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_10/arrows.gif" alt="" /></td>'||chr(10)||
'<td><a href="#TAB_LINK#" class="t10standardtabcurrent">#TAB_LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/tab_right.gif" alt="" />#TAB_INLINE_EDIT#</td>'||chr(10)||
'',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><a href="#TAB_LINK#" class="t10standardtab">#TAB_LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/tab_right.gif" alt="" />#TAB_INLINE_EDIT#</td>'||chr(10)||
'',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t10notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '&nbsp;|&nbsp;<a href="#LINK#">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" cellpadding="0" cellspacing="0" summary=""',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 10,
  p_theme_class_id => 1,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '12');
end;
 
null;
 
end;
/

prompt  ......Page template 1426008454000130
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_10/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>';

c3:=c3||'<div class="t10messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 1426008454000130 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Printer Friendly',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t10success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t10notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '<a href="#LINK#">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" cellpadding="0" cellspacing="0" summary=""',
  p_theme_id  => 10,
  p_theme_class_id => 5,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '3');
end;
 
null;
 
end;
/

prompt  ......Page template 2352656770873450
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo" width="100%">#LOGO#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%"><br /></td>'||chr(10)||
'<td class="t2tabholder" valign="bottom"><table width="100%" cellpadding="0" cellspacin';

c3:=c3||'g="0" border="0" summary=""><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" height="70%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height="35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td class="t2to';

c3:=c3||'pbar05"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%"><br /></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" valign="top"><br/></td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valig';

c3:=c3||'n="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" height="70%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td ';

c3:=c3||'valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 2352656770873450 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_right.png" border="0" alt="" /></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_right.png" border="0" alt="" /></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>'||chr(10)||
'',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '19');
end;
 
null;
 
end;
/

prompt  ......Page template 2352749189873451
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo" width="100%">#LOGO#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%"><br /></td>'||chr(10)||
'#PARENT_TAB_CELLS#'||chr(10)||
'<td width="6"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_tra';

c3:=c3||'ns.gif" width="6" height="1" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height="35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td class="t2topbar05"><img alt="" src="#IMAGE_PREFIX#t';

c3:=c3||'hemes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%" valign="bottom"><table cellpadding="0" border="0" cellspacing="0" summary=""><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" class="t2sidebar" valign="top"><br /></td>'||chr(10)||
'<td colspan';

c3:=c3||'="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valign="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04##REGION_PO';

c3:=c3||'SITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 2352749189873451 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_on_left.png" alt="" /></td>'||chr(10)||
'<td class="t2subtabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_on_right.png" alt="" /></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_off_left.png" alt="" /></td>'||chr(10)||
'<td class="t2subtabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_off_right.png" alt="" /></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_left.png" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_right.png" alt="" /></td>'||chr(10)||
'',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_left.png" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_right.png" alt="" /></td>',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_03',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 2352854190873451
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'  </body>'||chr(10)||
'</html>'||chr(10)||
'';

c3:=c3||'<div class="t2messages">#NOTIFICATION_MESSAGE#</div>'||chr(10)||
'<table cellpadding="0" border="0" cellspacing="0" summary="" style="margin-top:100px;" align="center">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_';

c3:=c3||'PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ReportsRegion">'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BOX_BODY##REGION_POSITION_01##REGION_POSITI';

c3:=c3||'ON_02##REGION_POSITION_03##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><i';

c3:=c3||'mg alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'#FORM_CLOSE#'||chr(10)||
''||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 2352854190873451 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Login',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>'||chr(10)||
''||chr(10)||
'',
  p_navigation_bar=> '',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 2,
  p_theme_class_id => 6,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '18');
end;
 
null;
 
end;
/

prompt  ......Page template 2352033855873436
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 2352033855873436 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Printer Friendly',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 2,
  p_theme_class_id => 5,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '3');
end;
 
null;
 
end;
/

prompt  ......Page template 2352135504873443
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo" width="100%">#LOGO#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%"><br /></td>'||chr(10)||
'<td class="t2tabholder" valign="bottom"><table width="100%" cellpadding="0" cellspacin';

c3:=c3||'g="0" border="0" summary=""><tr>#PARENT_TAB_CELLS#</tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height="35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td  class="t2topbar05"';

c3:=c3||'><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%" valign="bottom"><table cellpadding="0" border="0" cellspacing="0" summary=""><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" class="t2sidebar" val';

c3:=c3||'ign="top">#REGION_POSITION_02#</td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td align="left" class="t2body" valign="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>';

c3:=c3||'#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 2352135504873443 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success">#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_on_left.png" alt="" /></td>'||chr(10)||
'<td class="t2subtabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_on_right.png" alt="" /></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_off_left.png" alt="" /></td>'||chr(10)||
'<td class="t2subtabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_off_right.png" alt="" /></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_left.png" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_right.png" alt="" /></td>'||chr(10)||
'',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_left.png" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_right.png" alt="" /></td>',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification">#MESSAGE#</div>'||chr(10)||
'',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 2,
  p_theme_class_id => 18,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 1426324230000131
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_10/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10Logo">#LOGO#<br /></td>'||chr(10)||
'<td class="t10NavBar">&APP_USER.#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="3" background="#IMAGE_PREFIX#themes/theme_10/tab_top_back_off.gif"><table border="0" cellpadding="0" cellspacing="0" sum';

c3:=c3||'mary=""><tr><td><img src="#IMAGE_PREFIX#themes/theme_10/tab_right.gif" alt="" /></td>#PARENT_TAB_CELLS#<td width="100%"><div class="t10Customize">#CUSTOMIZE#</div></td></tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" style="background-color:#dfdfb8;"><img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td colspan="2" class="t10BreadCrumbRegion">#REGION_POSITION';

c3:=c3||'_01#<img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="1" height="1" alt="" /><div float:right;">#CUSTOMIZE#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'  <td valign="top" style="background-color:#dfdfb8;"><img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'    <td colspan="2" background="#IMAGE_PREFIX#themes/theme_10/breadcrumb_bottom.gif"><img src="#IMAGE_PREFIX#theme';

c3:=c3||'s/theme_10/breadcrumb_bottom.gif" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'  <td valign="top" style="padding-left:8px;padding-right:8px;background-color:#dfdfb8;" class="t10SidebarLayout">#TAB_CELLS#<br />#REGION_POSITION_02#</td>'||chr(10)||
'  <td valign="top" class="t10SidebarLayout2"><img src="#IMAGE_PREFIX#themes/theme_10/sidebar_right.gif" alt="" /></td>'||chr(10)||
'    <td valign="top" class="t10ContentBody"><table border="0"';

c3:=c3||' cellpadding="0" cellspacing="0" summary="" width="100%">'||chr(10)||
'<tr><td valign="top" width="100%"><div class="t10messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 1426324230000131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs with Sidebar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t10success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<div class="t10childtabcurrent">#TAB_LABEL##TAB_INLINE_EDIT#</div>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<div class="t10childtab"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</div>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_10/arrows.gif" alt="" /></td>'||chr(10)||
'<td><a href="#TAB_LINK#" class="t10standardtabcurrent">#TAB_LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/tab_right.gif" alt="" />#TAB_INLINE_EDIT#</td>'||chr(10)||
'',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><a href="#TAB_LINK#" class="t10standardtab">#TAB_LABEL#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/tab_right.gif" alt="" />#TAB_INLINE_EDIT#</td>'||chr(10)||
'',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t10notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '&nbsp;|&nbsp;<a href="#LINK#">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" cellpadding="0" cellspacing="0" summary=""',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 10,
  p_theme_class_id => 18,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 1426609278000131
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_10/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>'||chr(10)||
'';

c3:=c3||'#NOTIFICATION_MESSAGE#'||chr(10)||
'<table align="center" border="0" cellpadding="0" cellspacing="0" summary="" class="t10Login">'||chr(10)||
'<tr>'||chr(10)||
'<td>#BOX_BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 1426609278000131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Login',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t10success">#MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t10notification">#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '<a href="#LINK#">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%"',
  p_theme_id  => 10,
  p_theme_class_id => 6,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 1530902982814626
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_8/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#'||chr(10)||
'';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t8messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 1530902982814626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Popup',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t8success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t8notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t8NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_theme_id  => 8,
  p_theme_class_id => 4,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 1531215987814629
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_8/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#'||chr(10)||
'';

c2:=c2||'<div class="t8PageBottom"><img src="#IMAGE_PREFIX#themes/theme_8/t3bottom_bg_stripe.gif" alt="" /></div>'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<!-- BEGIN HEADER height="51" -->'||chr(10)||
'<table width="100%"  border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr valign="middle"> '||chr(10)||
'<td height="28" width="100%" class="t8TopBar" valign="bottom"><div id="t8Logo">#LOGO#</div><table border="0" cellpadding="0" cellspacing="0" align="left" summary=""><tr><td><br/></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'<td height="28" class="t8TopBar" valign="bottom">#NAVIG';

c3:=c3||'ATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td colspan="2" class="t8TopBarBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="11" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<!-- END HEADER -->'||chr(10)||
'<!-- BEGIN BODY -->'||chr(10)||
'<table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<!-- tr>'||chr(10)||
'<td height="4" style="background-color:#BFBFB8"><img src="#IMAGE_PREFIX#themes/theme_8/spacer';

c3:=c3||'.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr -->'||chr(10)||
'<tr> '||chr(10)||
'<td width="100%" align="center" valign="top" style="background-color:#E5E5DC;">'||chr(10)||
'<!-- BEGIN FRAME -->'||chr(10)||
'<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr> '||chr(10)||
'<td colspan="3" height="21"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'#REGION_POS';

c3:=c3||'ITION_01#'||chr(10)||
'<tr> '||chr(10)||
'<td colspan="3" height="7"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="26" height="100%"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="26" height="1" alt="" /></td>'||chr(10)||
'<td align="center" valign="top" style="background-color:#BFBFB8" class="t8contentborder"><table summary="" cellpadding="0" width="100%" cells';

c3:=c3||'pacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div '||chr(10)||
'class="t8messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td width="26" height="100%"><img src="#IMAGE_';

c3:=c3||'PREFIX#themes/theme_8/spacer.gif" width="26" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<!-- BEGIN COPYRIGHT -->'||chr(10)||
'<td colspan="3" height="41" align="right" valign="middle" style="background-color:#E5E5DC" class="t8copyright"><span class="t8User">&APP_USER.</span><!-- Copyright --><span class="t8Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'<!-- END COPYRIGHT -->'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<!-- END FRAME -->'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'</tabl';

c3:=c3||'e>'||chr(10)||
'<!-- END BODY -->';

wwv_flow_api.create_template(
  p_id=> 1531215987814629 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t8success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" summary="" class="t8standardtabcurrent">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_right.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt=""/></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt=""/></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#TAB_LINK#" class="t8btn">#TAB_LABEL#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1"  alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" class="t8standardtab" summary="">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_orange_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_orange_right.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt=""/></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt=""/></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#TAB_LINK#" class="t8btn">#TAB_LABEL#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t8notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t8NavigationBar"><table border="0" cellspacing="0" cellpadding="0" summary=""><tr><td></td>#BAR_BODY#</tr></table></div>',
  p_navbar_entry=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" summary="" class="t8standardtabcurrent">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_right.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt=""/></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt=""/></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#LINK#" class="t8btn" style="white-space:nowrap;">#TEXT#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1"  alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 8,
  p_theme_class_id => 1,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 1529528130814602
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_8/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#'||chr(10)||
'';

c2:=c2||'<div class="t8PageBottom"><img src="#IMAGE_PREFIX#themes/theme_8/t3bottom_bg_stripe.gif" alt="" /></div>'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%"  border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr valign="middle"> '||chr(10)||
'<td height="28" width="100%" class="t8TopBar" valign="bottom"><div id="t8Logo">#LOGO#</div></td>'||chr(10)||
'<td height="28" class="t8TopBar" valign="bottom">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td colspan="2" class="t8TopBarBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="11" alt="" /><';

c3:=c3||'/td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr> '||chr(10)||
'<td width="100%" style="background-color:#E5E5DC" align="center" valign="top"><table width="98%" height="98%" border="0" align="center" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr> '||chr(10)||
'<td height="21" colspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" ';

c3:=c3||'alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'#REGION_POSITION_01#'||chr(10)||
'<tr> '||chr(10)||
'<td height="7" colspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="26" height="100%"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="26" height="1" alt="" /></td>'||chr(10)||
'<td align="center" valign="top" style="background-color:BFBFB8" width="100%" class="t8contentborder"><table s';

c3:=c3||'ummary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top" align="center"><div class="t8messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</';

c3:=c3||'table></td>'||chr(10)||
'<td width="26" height="100%"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="26" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td height="41" align="right" valign="middle" colspan="3" class="t8copyright"><span class="t8User">&APP_USER.</span><!-- Copyright --><span class="t8Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 1529528130814602 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t8success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t8notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t8NavigationBar"><table border="0" cellspacing="0" cellpadding="0" summary="" align="right"><tr><td></td>#BAR_BODY#</tr></table></div>',
  p_navbar_entry=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" summary="" class="t8standardtabcurrent">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_right.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt=""/></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt=""/></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#LINK#" class="t8btn" style="white-space:nowrap;">#TEXT#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1"  alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 8,
  p_theme_class_id => 3,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 1529720475814615
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_8/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#'||chr(10)||
''||chr(10)||
'';

c2:=c2||'<div class="t8PageBottom"><img src="#IMAGE_PREFIX#themes/theme_8/t3bottom_bg_stripe.gif" alt="" /></div>'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" height="51" border="0" cellpadding="3" cellspacing="0" summary="">'||chr(10)||
'<tr valign="middle">'||chr(10)||
'<td class="t8TopBar"><div id="t8Logo">#LOGO#</div></td>'||chr(10)||
'<td height="28" class="t8TopBar" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td height="23" colspan="2" class="t8TopBarBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<t';

c3:=c3||'able width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td height="4" style="background-color:E5E5DC; border-right: 1px #BFBFB8;"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="4" style="background-color:BFBFB8"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="4';

c3:=c3||'" style="background-color:BFBFB8"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td align="left" valign="top" class="t8NavBar"><!-- BEGIN LEFT NAV -->#REGION_POSITION_02#<!-- END LEFT NAV --></td>'||chr(10)||
'<td width="1" style="background-color:FFFFFF"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td width="100%" ';

c3:=c3||'align="center" valign="top">'||chr(10)||
'<!-- BEGIN FRAME -->'||chr(10)||
'<table width="98%" height="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="t8contentborder" style="margin-top: 5px;background-color:#E5E5DC" summary="">'||chr(10)||
'<tr> '||chr(10)||
'<td height="21" colspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'#REGION_POSITION_01#'||chr(10)||
'<tr> '||chr(10)||
'<td height="7" colspa';

c3:=c3||'n="3"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="26" height="100%"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="26" height="1" alt="" /></td>'||chr(10)||
'<td align="center" valign="top" style="background-color:BFBFB8" width="100%" class="t8contentborder"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<t';

c3:=c3||'r>'||chr(10)||
'<td width="100%" valign="top" align="center"><div class="t8messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td width="26" height="100%"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gi';

c3:=c3||'f" width="26" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td height="41" align="right" valign="middle" colspan="3" class="t8copyright"><span class="t8User">&APP_USER.</span><!-- Copyright --><span class="t8Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 1529720475814615 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t8success">SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t8notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t8NavigationBar"><table border="0" cellspacing="0" cellpadding="0" summary="" align="right"><tr><td><br /></td>#BAR_BODY#</tr></table></div>',
  p_navbar_entry=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" summary="" class="t8standardtabcurrent">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_right.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt=""/></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt=""/></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#LINK#" class="t8btn" style="white-space:nowrap;">#TEXT#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1"  alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 8,
  p_theme_class_id => 17,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 1530329506814626
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_8/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t8messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 1530329506814626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Printer Friendly',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t8success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t8notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t8NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_theme_id  => 8,
  p_theme_class_id => 5,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '3');
end;
 
null;
 
end;
/

prompt  ......Page template 1530624104814626
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'    #HEAD#'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_8/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'';

c2:=c2||'  </body>'||chr(10)||
'</html>'||chr(10)||
'';

c3:=c3||'<body #ONLOAD#>#FORM_OPEN#'||chr(10)||
'<div class="t8messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||chr(10)||
'<table border="0" summary="" width="100%" style="margin-top:100px;margin-bottom:200px;">'||chr(10)||
'<tr>'||chr(10)||
'<td align="center">'||chr(10)||
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8WizardRegion" style="width:300px;">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader"><img src="#IMAGE_PREFIX#themes';

c3:=c3||'/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" /></td>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody" colspan="2">#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_03##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
'#FORM_CLOSE#'||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 1530624104814626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Login',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t8SuccessMessage">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t8notification">#MESSAGE#</div>',
  p_navigation_bar=> '',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_theme_id  => 8,
  p_theme_class_id => 6,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '18');
end;
 
null;
 
end;
/

prompt  ......Page template 1530017878814624
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_8/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#'||chr(10)||
'';

c2:=c2||'<div class="t8PageBottom"><img src="#IMAGE_PREFIX#themes/theme_8/t3bottom_bg_stripe.gif" alt="" /></div>'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<!-- BEGIN HEADER -->'||chr(10)||
'<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr valign="middle"> '||chr(10)||
'<td height="28" width="100%" class="t8TopBar"><div id="t8Logo">#LOGO#</div><table border="0" cellpadding="0" cellspacing="0" align="left" summary=""><tr><td><br/></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'<td height="28" class="t8TopBar" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td';

c3:=c3||' height="23" colspan="2" class="t8TopBarBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<!-- END HEADER -->'||chr(10)||
'<!-- BEGIN BODY -->'||chr(10)||
'<table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td height="4" style="background-color:#E5E5DC; border-right: 1px #BFBFB8 solid;"><img src="#IMAGE_PREFIX#themes/them';

c3:=c3||'e_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="4" style="background-color:#BFBFB8"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="4" style="background-color:#BFBFB8"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td class="t8NavBar" valign="top"><!-- BEGIN LEFT NAV -->#REGION_P';

c3:=c3||'OSITION_02#<!-- END LEFT NAV --></td>'||chr(10)||
'<td width="1" style="background-color:#FFFFFF"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td width="100%" align="center" valign="top">'||chr(10)||
'<!-- BEGIN FRAME -->'||chr(10)||
'<table width="98%" height="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="t8contentborder" style="margin-top: 5px;background-color:#E5E5DC';

c3:=c3||'" summary="">'||chr(10)||
'<tr> '||chr(10)||
'<td height="21" colspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'#REGION_POSITION_01#'||chr(10)||
'<tr> '||chr(10)||
'<td height="7" colspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="26" height="100%"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="26" height="1" alt=';

c3:=c3||'"" /></td>'||chr(10)||
'<td align="center" valign="top" width="100%" style="background-color:#BFBFB8" class="t8contentborder"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t8messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_';

c3:=c3||'07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td width="26" height="100%"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="26" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td height="41" align="right" valign="middle" colspan="3" class="t8copyright"><span class="t8User">&APP_USER.</span><!-- Copyright --><span class="t8Customize">#CUSTOMIZE#</';

c3:=c3||'span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<!-- END FRAME -->'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<!-- END BODY -->';

wwv_flow_api.create_template(
  p_id=> 1530017878814624 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t8success">SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" summary="" class="t8standardtabcurrent">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1"  alt=""/></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_right.gif" width="2" height="18"  alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14"  alt=""/></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14"  alt=""/></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#TAB_LINK#" class="t8btn">#TAB_LABEL#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1"  alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1"  alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" class="t8standardtab" summary="">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_orange_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_orange_right.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt=""/></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt=""/></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#TAB_LINK#" class="t8btn">#TAB_LABEL#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t8notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t8NavigationBar"><table border="0" cellspacing="0" cellpadding="0" summary=""><tr><td></td>#BAR_BODY#</tr></table></div>',
  p_navbar_entry=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" summary="" class="t8standardtabcurrent">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_right.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt=""/></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt=""/></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#LINK#" class="t8btn" style="white-space:nowrap;">#TEXT#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1"  alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 8,
  p_theme_class_id => 16,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 1531508786814630
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_8/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#'||chr(10)||
'';

c2:=c2||'<div class="t8PageBottom"><img src="#IMAGE_PREFIX#themes/theme_8/t3bottom_bg_stripe.gif" alt="" /></div>'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<!-- BEGIN HEADER -->'||chr(10)||
'<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr valign="middle"> '||chr(10)||
'<td height="28" class="t8TopBar"><div id="t8Logo">#LOGO#</div><table border="0" cellpadding="0" cellspacing="0" align="left" summary=""><tr><td><br/></td>#PARENT_TAB_CELLS#</tr></table></td>'||chr(10)||
'<td height="28" class="t8TopBar" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td colsp';

c3:=c3||'an="2" class="t8TopBarBottom"><img src="#IMAGE_PREFIX#themes/theme_8/t3top_bg_stripe.gif" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="2" class="t8ChildTabs"><table border="0" cellpadding="0" cellspacing="0" align="left" summary=""><tr><td><br/></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<!-- END HEADER -->'||chr(10)||
'<!-- BEGIN BODY -->'||chr(10)||
'<table width="100%" height="90%" border="0" cellpadding="0" cellspacing';

c3:=c3||'="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td height="4" style="background-color:#E5E5DC; border-right: 1px #BFBFB8 solid;"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="4" style="background-color:#BFBFB8"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="4" style="background-color:#BFBFB8"><img src="#IMAGE_PREFIX#th';

c3:=c3||'emes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td class="t8NavBar" valign="top"><!-- BEGIN LEFT NAV -->#REGION_POSITION_02#<!-- END LEFT NAV --></td>'||chr(10)||
'<td width="1" style="background-color:#FFFFFF"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td width="100%" align="center" valign="top">'||chr(10)||
'<!-- BEGIN FRAME -->'||chr(10)||
'<table width="98%" hei';

c3:=c3||'ght="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="t8contentborder" style="margin-top: 5px;" summary="">'||chr(10)||
'<tr> '||chr(10)||
'<td width="26" height="21" style="background-color:#E5E5DC"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="21" style="background-color:#E5E5DC"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="';

c3:=c3||'1" alt="" /></td>'||chr(10)||
'<td width="26" height="21" style="background-color:#E5E5DC"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'#REGION_POSITION_01#'||chr(10)||
'<tr> '||chr(10)||
'<td width="26" height="7" style="background-color:#E5E5DC"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="7" style="background-color:#E5E5DC"><img src';

c3:=c3||'="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td width="26" height="7" style="background-color:#E5E5DC"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="26" height="100%" style="background-color:#E5E5DC"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="26" height="1" alt="" /></td>'||chr(10)||
'<td align="ce';

c3:=c3||'nter" valign="middle" style="background-color:#BFBFB8" class="t8contentborder"><table style="background-color:#BFBFB8"  summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t8messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_';

c3:=c3||'07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td width="26" height="100%" style="background-color:#E5E5DC"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="26" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td height="41" style="background-color:#E5E5DC"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<!--';

c3:=c3||' BEGIN COPYRIGHT -->'||chr(10)||
'<td height="41" align="right" valign="middle" style="background-color:#E5E5DC" class="t8copyright"><span class="t8User">&APP_USER.</span><!-- Copyright --><span class="t8Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'<!-- END COPYRIGHT -->'||chr(10)||
'<td height="41" style="background-color:#E5E5DC"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

c3:=c3||'<!-- END FRAME -->'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<!-- END BODY -->';

wwv_flow_api.create_template(
  p_id=> 1531508786814630 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t8success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" summary="" class="t8standardtabcurrent">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_right.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt=""/></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt=""/></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#TAB_LINK#" class="t8btn">#TAB_LABEL#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1"  alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" class="t8standardtab" summary="">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_orange_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_orange_right.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt=""/></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt=""/></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#TAB_LINK#" class="t8btn">#TAB_LABEL#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" summary="" class="t8standardtabcurrent">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_right.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt=""/></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt=""/></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#TAB_LINK#" class="t8btn">#TAB_LABEL#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1"  alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" class="t8standardtab" summary="">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_orange_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_orange_right.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt=""/></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt=""/></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#TAB_LINK#" class="t8btn">#TAB_LABEL#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t8notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t8NavigationBar"><table border="0" cellspacing="0" cellpadding="0" summary="" align="right"><tr><td></td>#BAR_BODY#</tr></table></div>',
  p_navbar_entry=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" summary="" class="t8standardtabcurrent">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_right.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt=""/></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt=""/></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#LINK#" class="t8btn" style="white-space:nowrap;">#TEXT#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1"  alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 8,
  p_theme_class_id => 18,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ......Page template 1531827562814641
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_8/theme_V2.css" type="text/css" />'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#'||chr(10)||
'';

c2:=c2||'<div class="t8PageBottom"><img src="#IMAGE_PREFIX#themes/theme_8/t3bottom_bg_stripe.gif" alt="" /></div>'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" height="51" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr valign="middle"> '||chr(10)||
'<td height="28" class="t8TopBar"><div id="t8Logo">#LOGO#</div><table border="0" cellpadding="0" cellspacing="0" align="left" summary=""><tr><td><br /></td>#PARENT_TAB_CELLS#</tr></table></td>'||chr(10)||
'<td height="28" class="t8TopBar" align="right">#NAVIGATION_BAR#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td colspan="2" cl';

c3:=c3||'ass="t8TopBarBottom"><img src="#IMAGE_PREFIX#themes/theme_8/t3top_bg_stripe.gif" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="2" class="t8ChildTabs"><table border="0" cellpadding="0" cellspacing="0" align="left" summary=""><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td height="4" style="back';

c3:=c3||'ground-color:E5E5DC; border-right: 1px #BFBFB8;"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="4" style="background-color:BFBFB8"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""  /></td>'||chr(10)||
'<td height="4" style="background-color:BFBFB8"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /><';

c3:=c3||'/td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="1" style="background-color:FFFFFF"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td width="100%" align="center" valign="top">'||chr(10)||
'	<!-- BEGIN FRAME -->'||chr(10)||
'<table height="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:E5E5DC;" summary="">'||chr(10)||
'<tr> '||chr(10)||
'<td height="21" colspan="3"><img src="#IMAGE_PREFIX#t';

c3:=c3||'hemes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<!-- BEGIN TITLE -->#REGION_POSITION_01#<!-- END TITLE -->'||chr(10)||
'<tr> '||chr(10)||
'<td colspan="3" height="7"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="26" height="100%"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="26" height="1" alt="" /></td>'||chr(10)||
'<td align="center" valig';

c3:=c3||'n="top" width="100%" style="background-color:BFBFB8" class="t8contentborder"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t8messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSIT';

c3:=c3||'ION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td width="26" height="100%"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="26" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td height="41" align="right" valign="middle" colspan="3" class="t8copyright"><span class="t8User">&APP_USER.</span><!-- Copyright --><span class="t8Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>';

c3:=c3||''||chr(10)||
'</table>'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 1531827562814641 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t8success">#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" summary="" class="t8standardtabcurrent">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_right.gif" width="2" height="18" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt="" /></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt="" /></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#TAB_LINK#" class="t8btn">#TAB_LABEL#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1"  alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" class="t8standardtab">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_orange_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_orange_right.gif" width="2" height="18" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt="" /></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt="" /></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#TAB_LINK#" class="t8btn">#TAB_LABEL#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" summary="" class="t8standardtabcurrent">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_right.gif" width="2" height="18" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt="" /></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt="" /></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#TAB_LINK#" class="t8btn">#TAB_LABEL#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1"  alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" class="t8standardtab" summary="">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_orange_left.gif" width="2" height="18" alt="" /></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_orange_right.gif" width="2" height="18" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt="" /></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt="" /></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#TAB_LINK#" class="t8btn">#TAB_LABEL#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t8notification">#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t8NavigationBar"><table border="0" cellspacing="0" cellpadding="0" summary="" align="right"><tr><td><br /></td>#BAR_BODY#</tr></table></div>',
  p_navbar_entry=> '<td style="padding-left:5px;"><table height="18"  cellpadding="0" cellspacing="0" border="0" summary="" class="t8standardtabcurrent">'||chr(10)||
'<tr> '||chr(10)||
'<td width="2" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_left.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabTop"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td width="2" height="18" rowspan="3"><img src="#IMAGE_PREFIX#themes/theme_8/t3btn_lit_right.gif" width="2" height="18" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="14" height="14" class="t8TabL"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="14" height="14" alt=""/></td>'||chr(10)||
'<td width="1" class="t8TabM"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="14" alt=""/></td>'||chr(10)||
'<td height="14" class="t8TabR"><a href="#LINK#" class="t8btn" style="white-space:nowrap;">#TEXT#</a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td width="17" height="2" colspan="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt=""/></td>'||chr(10)||
'<td height="2" class="t8TabBottom"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1"  alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 8,
  p_theme_class_id => 2,
  p_required_patch   => null + wwv_flow_api.g_id_offset,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

---------------------------------------
prompt  ...Button Templates
--
prompt  ......Button Template 2352954342873453
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t2ButtonAlternative3" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt3_left.gif" alt="" /></a></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t2R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt3_right.gif" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>2352954342873453 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 3',
  p_translate_this_template => 'N',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 2353029964873453
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t2ButtonAlternative2" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt2_left.gif" alt="" /></a></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t2R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt2_right.gif" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>2353029964873453 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 2',
  p_translate_this_template => 'N',
  p_theme_id  => 2,
  p_theme_class_id => 5,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 2353128410873453
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t2Button" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_left.gif" alt="" /></a></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t2R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_right.gif" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>2353128410873453 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button',
  p_translate_this_template => 'N',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 2353228754873453
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t2ButtonAlternative1" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt1_left.gif" alt="" /></a></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t2R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt1_right.gif" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>2353228754873453 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 1',
  p_translate_this_template => 'N',
  p_theme_id  => 2,
  p_theme_class_id => 4,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 1426918918000131
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t10Button" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_10/button_left.gif" alt="" width="4" height="24" /></a></td>'||chr(10)||
'<td class="t10C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t10R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_10/button_right.gif" width="4" height="24" alt="" /></a></td';

t:=t||'>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>1426918918000131 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button',
  p_translate_this_template => 'N',
  p_theme_id  => 10,
  p_theme_class_id => 1,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 1427125890000141
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t10ButtonAlternative2" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_10/button_alt2_left.gif" alt="" width="11" height="20" /></a></td>'||chr(10)||
'<td class="t10C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t10R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_10/button_alt2_right.gif" width="11" heigh';

t:=t||'t="20" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>1427125890000141 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 2',
  p_translate_this_template => 'N',
  p_theme_id  => 10,
  p_theme_class_id => 5,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 1427307166000142
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t10ButtonAlternative3" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_10/button_alt3_left.gif" alt="" /></a></td>'||chr(10)||
'<td class="t10C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t10R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_10/button_alt3_right.gif" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>1427307166000142 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 3',
  p_translate_this_template => 'N',
  p_theme_id  => 10,
  p_theme_class_id => 2,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 1427507562000142
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t10ButtonAlternative1" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_10/button_alt1_left.gif" alt="" /></a></td>'||chr(10)||
'<td class="t10C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t10R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_10/button_alt1_right.gif" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>1427507562000142 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 1',
  p_translate_this_template => 'N',
  p_theme_id  => 10,
  p_theme_class_id => 4,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 1532018994814643
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8Button" height="18"><tr><td class="t8C"><a href="#LINK#" class="t8C">#LABEL#</a></td></tr></table>';

wwv_flow_api.create_button_templates (
  p_id=>1532018994814643 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button',
  p_translate_this_template => 'N',
  p_theme_id  => 8,
  p_theme_class_id => 1,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 1532210067814649
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8ButtonAlternative3">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="middle"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" style="margin-left:3px;margin-right:3px;" alt=""/></a></td>'||chr(10)||
'<td class="t8R"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" alt="" width="14" height="14" /></td>'||chr(10)||
'<td class="t8C"><a href=';

t:=t||'"#LINK#" class="t8C">#LABEL#</a></td>'||chr(10)||
'<td class="t8L"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" alt="" width="14" height="14" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>1532210067814649 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 3',
  p_translate_this_template => 'N',
  p_theme_id  => 8,
  p_theme_class_id => 2,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 1532419198814649
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8ButtonAlternative2">'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t8C"><a href="#" class="t8C">#LABEL#</a></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>1532419198814649 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 2',
  p_translate_this_template => 'N',
  p_theme_id  => 8,
  p_theme_class_id => 5,
  p_template_comment       => '');
end;
/
prompt  ......Button Template 1532602325814649
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8ButtonAlternative1">'||chr(10)||
'    <tr>'||chr(10)||
'      <td class="t8C"><a href="#" class="t8C">#LABEL#</a></td>'||chr(10)||
'    </tr>'||chr(10)||
'  </table>';

wwv_flow_api.create_button_templates (
  p_id=>1532602325814649 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 1',
  p_translate_this_template => 'N',
  p_theme_id  => 8,
  p_theme_class_id => 4,
  p_template_comment       => '');
end;
/
---------------------------------------
prompt  ...Region Templates
--
prompt  ......Region Template 2353538610873454
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2GCCHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2GCCHeader" align="right" valign="bottom"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2GCCBody" colspan="2" valig';

t:=t||'n="top"><table cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_2/chart.gif" /></td>'||chr(10)||
'<td valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_n';

t:=t||'av-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2353538610873454 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart List',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2353538610873454 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2353644597873454
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div class="t2BreadcrumbRegion"  id="#REGION_ID#">#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2353644597873454 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Breadcrumb Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 6,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2353644597873454 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2353755932873454
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2WizardRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELET';

t:=t||'E##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_P';

t:=t||'REFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2353755932873454 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 2,
  p_theme_class_id => 12,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2353755932873454 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2353842532873454
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ChartRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE';

t:=t||'##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2Body" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#t';

t:=t||'hemes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2353842532873454 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => 2,
  p_theme_class_id => 30,
  p_plug_heading_bgcolor   => '#FFFFFF',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2353842532873454 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2353930390873454
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2FormRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE#';

t:=t||'#EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#<img src="#IMAGE_PREFIX#/themes/theme_2/1px_trans.gif" height="1" width="582" style="display:block;" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#the';

t:=t||'mes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2353930390873454 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Form Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => 2,
  p_theme_class_id => 8,
  p_plug_heading_bgcolor   => '#FFFFFF',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2353930390873454 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2354041724873454
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2SidebarRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td clas';

t:=t||'s="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width';

t:=t||'="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2354041724873454 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region',
  p_plug_table_bgcolor     => '#F7F7E7',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_plug_heading_bgcolor   => '#F7F7E7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2354041724873454 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1427713417000142
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10NavigationRegionAlternative1" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'        <tbody><tr>'||chr(10)||
'          <td><img src="#IMAGE_PREFIX#themes/theme_10/sb1.gif" height="28" width="11" alt=""></td>'||chr(10)||
'          <td background="#IMAGE_PREFIX#themes/theme_10/sb2.gif" nowrap="nowrap"><div align="center"><strong class="tabletophead">#TITLE#</strong><font size="1"><';

t:=t||'/font></div></td>'||chr(10)||
'          <td><img src="#IMAGE_PREFIX#themes/theme_10/sb3.gif" height="28" width="12" alt=""></td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td background="#IMAGE_PREFIX#themes/theme_10/sb4.gif"><br /></td>'||chr(10)||
'          <td bgcolor="#f8f8f8" width="200"><table border="0" cellpadding="0" cellspacing="0" width="100%" summary="">'||chr(10)||
'              <tbody><tr>'||chr(10)||
'                <td class="helptex';

t:=t||'t" width="100"><div>#BODY#</div></td>'||chr(10)||
'              </tr>'||chr(10)||
'</tbody></table></td>'||chr(10)||
'<td background="#IMAGE_PREFIX#themes/theme_10/sb5.gif"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/sb6.gif" height="11" width="11" alt=""></td>'||chr(10)||
'<td background="#IMAGE_PREFIX#themes/theme_10/sb7.gif"><img src="#IMAGE_PREFIX#themes/theme_10/sb7.gif" height="11" width="7" alt=""></td>'||chr(10)||
'<td><img src="';

t:=t||'#IMAGE_PREFIX#themes/theme_10/sb8.gif" height="11" width="12" alt=""></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody></table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1427713417000142 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 10,
  p_theme_class_id => 5,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1427713417000142 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1428025656000155
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10ChartRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_top.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionHeader"><table border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_left.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionTitle">#TITLE#</td';

t:=t||'>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_right.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_top.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10ButtonHolder" align="right">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gi';

t:=t||'f" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#'||chr(10)||
'</td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionBody">#BODY#</td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFI';

t:=t||'X#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_bottom.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/region_middle_bottom.gif" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_bottom.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1428025656000155 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 10,
  p_theme_class_id => 30,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1428025656000155 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1428307825000155
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10ReportsRegion100Width" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_top.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionHeader"><table border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_left.gif" alt=""/></td>'||chr(10)||
'<td class="t10Regi';

t:=t||'onTitle">#TITLE#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_right.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_top.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10ButtonHolder" align="right">#CLOSE#<img src="#IMAGE_PREFI';

t:=t||'X#themes/theme_10/1px_trans.gif" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#'||chr(10)||
'</td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionBody">#BODY#</td>'||chr(10)||
'<td class="t10Regio';

t:=t||'nRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_bottom.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/region_middle_bottom.gif" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_bottom.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1428307825000155 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region 100% Width',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 10,
  p_theme_class_id => 13,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1428307825000155 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1428628009000155
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10RegionwithoutTitle" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_top.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionHeader"><br /></td>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_top.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes';

t:=t||'/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10ButtonHolder" align="right">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#'||chr(10)||
'</td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE';

t:=t||'_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionBody">#BODY#</td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_bottom.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/region_middle_bottom.gif" alt=""/';

t:=t||'></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_bottom.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1428628009000155 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 10,
  p_theme_class_id => 11,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1428628009000155 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1428906035000156
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10RegionwithoutButtonsandTitle" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_top.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionHeader"><br /></td>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_top.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PRE';

t:=t||'FIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionBody">#BODY#</td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_bottom.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/region_middle_bottom.gif" alt=""/></t';

t:=t||'d>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_bottom.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1428906035000156 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Buttons and Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 10,
  p_theme_class_id => 19,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1428906035000156 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2354151085873456
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2HideandShowRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#<a style="margin-left:5px;" href="javascript:hideShow(''region#REGION_SEQUENCE_ID#'',''shIMG#R';

t:=t||'EGION_SEQUENCE_ID#'',''#IMAGE_PREFIX#themes/theme_2/showhide_hidden.gif'',''#IMAGE_PREFIX#themes/theme_2/showhide_show.gif'');" class="t2HideandShowRegionLink"><img src="#IMAGE_PREFIX#themes/theme_2/showhide_hidden.gif" '||chr(10)||
'  id="shIMG#REGION_SEQUENCE_ID#" alt="" /></a></td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'';

t:=t||'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2"><div class="t2Hide" id="region#REGION_SEQUENCE_ID#">#BODY#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt=';

t:=t||'"" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2354151085873456 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Hide and Show Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2354151085873456 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2354231247873456
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2WizardRegionwithIcon">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEX';

t:=t||'T##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2"><table summary="" cellpadding="0" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_2/wizard_icon.gif" alt=""/></td>'||chr(10)||
'<td width="100%" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#the';

t:=t||'mes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2354231247873456 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region with Icon',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 2,
  p_theme_class_id => 20,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2354231247873456 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2355046013873456
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2greyround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-0-3.png" width="9"';

t:=t||' height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2greyround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2greyroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2SidebarRegionAlternative1">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'';

t:=t||'</table></td>'||chr(10)||
'<td class="t2greyround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2greyround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/them';

t:=t||'e_2/grey-region-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2355046013873456 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region, Alternative 1',
  p_plug_table_bgcolor     => '#F7F7E7',
  p_theme_id  => 2,
  p_theme_class_id => 3,
  p_plug_heading_bgcolor   => '#F7F7E7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2355046013873456 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2355139952873456
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table border="0" cellspacing="0" cellpadding="0" summary="" class="t2NavigationRegionAlternative1" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2355139952873456 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region, Alternative 1',
  p_plug_table_bgcolor     => '#F7F7E7',
  p_theme_id  => 2,
  p_theme_class_id => 16,
  p_plug_heading_bgcolor   => '#F7F7E7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2355139952873456 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2355232241873456
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2RegionwithoutTitle">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td';

t:=t||' class="t2RegionBody" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td';

t:=t||'>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2355232241873456 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 11,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2355232241873456 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2355333039873457
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" width="100%" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" wid';

t:=t||'th="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" width="100%" class="t2ReportsRegion100Width">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp';

t:=t||';&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2st';

t:=t||'dround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2355333039873457 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region 100% Width',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 13,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => 'Outline, tab-title, 100%');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2355333039873457 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2353346392873453
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2RegionwithoutButtonsandTitles">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#the';

t:=t||'mes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2353346392873453 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Buttons and Titles',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 19,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2353346392873453 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2354331083873456
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div class="t2NavigationRegion" id="#REGION_ID#">#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2354331083873456 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region',
  p_plug_table_bgcolor     => '#F7F7E7',
  p_theme_id  => 2,
  p_theme_class_id => 5,
  p_plug_heading_bgcolor   => '#F7F7E7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2354331083873456 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2354452680873456
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ButtonRegionwithTitle">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2ButtonHolder" valign="top">#CLOSE#&nbsp;&nbsp;&nbsp;#PREV';

t:=t||'IOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#<img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" style="display:block;" width="582" height="1" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></t';

t:=t||'d>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#BODY#';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2354452680873456 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region with Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 4,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2354452680873456 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2354551068873456
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="600" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" heig';

t:=t||'ht="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ButtonRegionwithoutTitle">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2ButtonHolder" valign="top">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#<img alt="" src';

t:=t||'="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" style="display:block;" width="582" height="1" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#the';

t:=t||'mes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#BODY#';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2354551068873456 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region without Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 17,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2354551068873456 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1429223656000156
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10WizardRegionwithIcon" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="" width="600"><tr>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_top.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionHeader"><table border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_left.gif" alt=""/></td>'||chr(10)||
'<td clas';

t:=t||'s="t10RegionTitle">#TITLE#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_right.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_top.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10ButtonHolder" align="right">#CLOSE#<img src="#I';

t:=t||'MAGE_PREFIX#themes/theme_10/1px_trans.gif" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#'||chr(10)||
'</td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionBody"><table summary="" cel';

t:=t||'lpadding="0" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_10/iconwizard.gif" alt=""/></td>'||chr(10)||
'<td width="100%" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_bottom.gif" alt=""/></td>'||chr(10)||
'<td cl';

t:=t||'ass="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/region_middle_bottom.gif" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_bottom.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1429223656000156 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region with Icon',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 10,
  p_theme_class_id => 20,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1429223656000156 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1429508200000158
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10ReportsRegionAlternative1" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tbody>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/sb1.gif" height="28" width="11" alt=""></td>'||chr(10)||
'<td class="t10RegionHeader">#TITLE#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/sb3.gif" height="28" width="12" alt=""></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10BodyLeft"><br /></td>'||chr(10)||
'<td c';

t:=t||'lass="t10ButtonHolder" align="right">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'<td class="t10BodyRight"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10BodyLeft"><br /></td>'||chr(10)||
'<td class="t10RegionBody" width="100%">#BODY#</td>'||chr(10)||
'<td class="t10BodyRight"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#th';

t:=t||'emes/theme_10/sb6.gif" height="11" width="11" alt=""></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/sb7.gif" height="11" width="7" alt=""></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/sb8.gif" height="11" width="12" alt=""></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1429508200000158 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region, Alternative 1',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 10,
  p_theme_class_id => 10,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1429508200000158 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2354646321873456
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ReportsRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELE';

t:=t||'TE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_';

t:=t||'PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2354646321873456 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => 2,
  p_theme_class_id => 9,
  p_plug_heading_bgcolor   => '#FFFFFF',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2354646321873456 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2354732830873456
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2BorderlessRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##D';

t:=t||'ELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMA';

t:=t||'GE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2354732830873456 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Borderless Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => 2,
  p_theme_class_id => 7,
  p_plug_heading_bgcolor   => '#FFFFFF',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2354732830873456 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2354847980873456
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody">'||chr(10)||
''||chr(10)||
'<table border="0" cellspacing="0" cellpadding="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2GCCHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2GCCHeader" align="right" valign="bottom"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2GCCBody" colspan="2" val';

t:=t||'ign="top"><table cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_2/report.gif" /></td>'||chr(10)||
'<td valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
'</td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/l';

t:=t||'eft_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2354847980873456 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Report List',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 2,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2354847980873456 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2354946435873456
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2greyround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-0-3.png" width="9"';

t:=t||' height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2greyround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2greyroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ReportsRegionAlternative1">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp';

t:=t||';#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2greyround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2greyround2';

t:=t||'1"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2354946435873456 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region, Alternative 1',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => 2,
  p_theme_class_id => 10,
  p_plug_heading_bgcolor   => '#FFFFFF',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2354946435873456 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 2353438155873454
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_ID#" class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height';

t:=t||'="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2BracketedRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DE';

t:=t||'LETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAG';

t:=t||'E_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 2353438155873454 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Bracketed Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => 2,
  p_theme_class_id => 18,
  p_plug_heading_bgcolor   => '#FFFFFF',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 2353438155873454 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1432811485000162
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10BorderlessRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td background="#IMAGE_PREFIX#themes/theme_10/region_middle_top2.gif"><table border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_left.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionTitle">#TITLE#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#th';

t:=t||'emes/theme_10/region_title_right.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10ButtonHolder" align="right">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionBody">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1432811485000162 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Borderless Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 10,
  p_theme_class_id => 7,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1432811485000162 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1433110473000162
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_top.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionHeader"><table border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_left.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionTitle"';

t:=t||'>#TITLE#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_right.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_top.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10ButtonHolder" align="right">#CLOSE#<img src="#IMAGE_PREFIX#themes';

t:=t||'/theme_10/1px_trans.gif" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#<img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" height="1" width="600" style="display:block;" alt=""/></td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_botto';

t:=t||'m.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/region_middle_bottom.gif" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_bottom.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#BODY#';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1433110473000162 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region with Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 10,
  p_theme_class_id => 4,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1433110473000162 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1433401262000162
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10ListRegionwithIcon" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_top.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionHeader"><table border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_left.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionTitle">#TIT';

t:=t||'LE#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_right.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_top.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10ButtonHolder" align="right">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_10/1px_t';

t:=t||'rans.gif" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#'||chr(10)||
'</td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionBody"><table border="0" cellpadding="0" cellspacing="0" summ';

t:=t||'ary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_10/report.gif"/></td><td valign="top">#BODY#<td></tr></table></td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_bottom.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10';

t:=t||'/region_middle_bottom.gif" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_bottom.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1433401262000162 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Report List',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 10,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1433401262000162 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1433727985000164
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_top.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionHeader"><table border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_left.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionTitle"';

t:=t||'>#TITLE#</td>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_title_right.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_top.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10ButtonHolder" align="right">#CLOSE#<img src="#IMAGE_PREFIX#themes';

t:=t||'/theme_10/1px_trans.gif" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#'||chr(10)||
'</td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionBody">#BODY#</td>'||chr(10)||
'<td class="t10RegionRight">';

t:=t||'<img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_bottom.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/region_middle_bottom.gif" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_bottom.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1433727985000164 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 10,
  p_theme_class_id => 9,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1433727985000164 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1533124285814654
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8RegionwithoutButtonsandTitle" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader" width="300"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1533124285814654 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Buttons and Titles',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 8,
  p_theme_class_id => 19,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1533124285814654 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1533414576814655
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8WizardRegion" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader" valign="top"><div style="float:left;"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" />#TITLE#</div><div style="float:right;margin-left:45px;">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_8/1px_trans.gif';

t:=t||'" alt="" width="10" height="1" />#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1533414576814655 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 8,
  p_theme_class_id => 12,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1533414576814655 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1532807855814651
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellspacing="0" cellpadding="0" border="0" class="t8SidebarRegion" summary="" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1532807855814651 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 8,
  p_theme_class_id => 2,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '<table border="0" cellpadding="0" cellspacing="0">'||chr(10)||
'        <tr>'||chr(10)||
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tl_img.gif" border="0" width="4" height="18" alt="" /></td>'||chr(10)||
'          <td bgcolor="#000000" height="1"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>'||chr(10)||
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tr_img.gif" border="0" width="4" height="18" alt="" /></td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td bgcolor="#FF0000" height="16">'||chr(10)||
'            <table border="0" cellpadding="0" cellspacing="0" width="100%">'||chr(10)||
'              <tr>'||chr(10)||
'                <td align=middle valign="top">'||chr(10)||
'                  <div align="center">'||chr(10)||
'                     <font color="#ffffff" face="Arial, Helvetica, sans-serif" size="1">'||chr(10)||
'                      <b>#TITLE# </b></font></div>'||chr(10)||
'                </td>'||chr(10)||
'              </tr>'||chr(10)||
'            </table>'||chr(10)||
'          </td>'||chr(10)||
'        </tr>'||chr(10)||
'</table>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0">'||chr(10)||
'   <tr>'||chr(10)||
'   <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'   <td valign="top" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="146" height="1" border="0" alt="" /><br />'||chr(10)||
'            <table border="0" cellpadding="1" cellspacing="0" width="146" summary="">'||chr(10)||
'              <tr>'||chr(10)||
'                <td colspan="2">'||chr(10)||
'                  <table border="0" cellpadding="2" cellspacing="0" width="124" summary="">'||chr(10)||
'                    <tr>'||chr(10)||
'                      <td>&nbsp;</td>'||chr(10)||
'                      <td valign="top" width="106">'||chr(10)||
'                        <P><FONT face="arial, helvetica" size="1">'||chr(10)||
'                            #BODY#'||chr(10)||
'                           </font>'||chr(10)||
'                        </P>'||chr(10)||
'                      </td>'||chr(10)||
'                    </tr>'||chr(10)||
'                  </table>'||chr(10)||
'            </table>'||chr(10)||
'          </td>'||chr(10)||
'          <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'          <td bgcolor="#9a9c9a" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'          <td bgcolor="#b3b4b3" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'        </tr>'||chr(10)||
'      </table>'||chr(10)||
'      <table border="0" cellpadding="0" cellspacing="0">'||chr(10)||
'        <tr>'||chr(10)||
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#bl_img.gif" border="0" width="4" height="6" alt="" /></td>'||chr(10)||
'          <td bgcolor="#ffffff" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>'||chr(10)||
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#br_img.gif" border="0" width="4" height="6" alt="" /></td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td bgcolor="#000000" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td bgcolor="#9a9c9a" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td bgcolor="#b3b4b3" width="1" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'        </tr>'||chr(10)||
'</table>'||chr(10)||
'');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1532807855814651 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1533726125814655
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8ReportsRegion100Width" width="100%" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader" valign="top"><div style="float:left;"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" />#TITLE#</div><div style="float:right;margin-left:45px;">#CLOSE#<img src="#IMAGE_PREFIX#themes';

t:=t||'/theme_8/1px_trans.gif" alt="" width="10" height="1" />#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1533726125814655 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region 100% Width',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 8,
  p_theme_class_id => 13,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1533726125814655 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1534031613814655
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8ButtonRegionwithoutTitle" id="#REGION_ID#">'||chr(10)||
'<tr><td class="t8ButtonHolder">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_8/1px_trans.gif" alt="" width="10" height="1" />#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#<img src="#IMAGE_PREFIX#themes/theme_8/1px_trans.gif" alt="" width="600" height="1" style="display:block;"/></t';

t:=t||'d></tr>'||chr(10)||
'</table>'||chr(10)||
'#BODY#';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1534031613814655 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region without Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 8,
  p_theme_class_id => 17,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1534031613814655 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1534309313814666
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<tr> '||chr(10)||
'<td style="background-color:E5E5DC"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td align="left" valign="middle" style="background-color:BFBFB8" class="t8BreadCrumbRegion"><div class="t8BreadcrumbHolder" id="#REGION_ID#">#BODY#</div><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'<td style="background-color:E5E';

t:=t||'5DC"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="1" height="1" alt="" /></td>'||chr(10)||
'</tr>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1534309313814666 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Breadcrumb Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 8,
  p_theme_class_id => 6,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1534309313814666 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1534602918814666
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8ReportsRegion" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader" valign="top"><div style="float:left;"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" />#TITLE#</div><div style="float:right;margin-left:45px;">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_8/1px_trans.gi';

t:=t||'f" alt="" width="10" height="1" />#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1534602918814666 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 8,
  p_theme_class_id => 9,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1534602918814666 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1534931133814666
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8HideandShowRegion" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader" valign="top"><div style="float:left;"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" />#TITLE#<a style="margin-left:5px;" href="javascript:hideShow(''region#REGION_SEQUENCE_ID#'',''shIMG#REGION_SEQUEN';

t:=t||'CE_ID#'',''#IMAGE_PREFIX#themes/theme_8/showhide_hidden.gif'',''#IMAGE_PREFIX#themes/theme_8/showhide_show.gif'');" class="htmldbHideShowMinLink"><img src="#IMAGE_PREFIX#themes/theme_8/showhide_hidden.gif" '||chr(10)||
'  id="shIMG#REGION_SEQUENCE_ID#" alt="" /></a></div><div style="float:right;margin-left:45px;">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_8/1px_trans.gif" alt="" width="10" height="1" />#PREVIOUS##';

t:=t||'NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody"><div id="region#REGION_SEQUENCE_ID#" class="t8Hide">#BODY#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1534931133814666 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Hide and Show Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 8,
  p_theme_class_id => 1,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1534931133814666 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1535217065814668
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8FormRegion" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader" valign="top"><div style="float:left;"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" />#TITLE#</div><div style="float:right;margin-left:45px;">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_8/1px_trans.gif" ';

t:=t||'alt="" width="10" height="1" />#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody">#BODY#<img src="#IMAGE_PREFIX#themes/theme_8/1px_trans.gif" alt="" width="600" height="1" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1535217065814668 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Form Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 8,
  p_theme_class_id => 8,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1535217065814668 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1535500800814668
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div class="t8NavigationRegion" id="#REGION_ID#">#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1535500800814668 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 8,
  p_theme_class_id => 5,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1535500800814668 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1535801712814668
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8ListRegionwithIcon" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader" valign="top"><div style="float:left;"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" />#TITLE#</div><div style="float:right;margin-left:45px;">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_8/1px_tra';

t:=t||'ns.gif" alt="" width="10" height="1" />#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody"><table cellpadding="0" cellspacing="0" border="0" summary="" ><tr><td valign="top"><img src="#IMAGE_PREFIX#themes/theme_8/report.gif" alt=""/></td>'||chr(10)||
'<td>#BODY#</td></tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1535801712814668 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Report List',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 8,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1535801712814668 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1536110468814669
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8RegionwithoutTitle" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader" valign="top"><div style="float:left;"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" /></div><div style="float:right;margin-left:45px;">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_8/1px_trans.gif"';

t:=t||' alt="" width="10" height="1" />#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1536110468814669 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 8,
  p_theme_class_id => 11,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1536110468814669 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1536412166814669
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8BracketedRegion" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader" valign="top"><div style="float:left;"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" />#TITLE#</div><div style="float:right;margin-left:45px;">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_8/1px_trans.';

t:=t||'gif" alt="" width="10" height="1" />#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1536412166814669 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Bracketed Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 8,
  p_theme_class_id => 18,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1536412166814669 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1536714239814669
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8NavigationRegionAlternative1" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1536714239814669 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region, Alternative 1',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 8,
  p_theme_class_id => 16,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1536714239814669 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1537013547814669
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8ChartRegion" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader" valign="top"><div style="float:left;"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" />#TITLE#</div><div style="float:right;margin-left:45px;">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_8/1px_trans.gif"';

t:=t||' alt="" width="10" height="1" />#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1537013547814669 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 8,
  p_theme_class_id => 30,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1537013547814669 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1537322014814671
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8ButtonRegionwithTitle" id="#REGION_ID#">'||chr(10)||
'<tr><td class="t8RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" />#TITLE#</td></tr>'||chr(10)||
'<tr><td class="t8ButtonHolder" style="margin:5px;">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_8/1px_trans.gif" alt="" width="1';

t:=t||'0" />#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#<img alt="" src="#IMAGE_PREFIX#themes/theme_5/1px_trans.gif" style="display:block;" width="600" height="1" /></td></tr>'||chr(10)||
'</table>#BODY#'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1537322014814671 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region with Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 8,
  p_theme_class_id => 4,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1537322014814671 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1537621899814671
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8ListRegionwithIcon" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader" valign="top"><div style="float:left;"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" />#TITLE#</div><div style="float:right;margin-left:45px;">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_8/1px_tra';

t:=t||'ns.gif" alt="" width="10" height="1" />#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody" colspan="2"><table cellpadding="0" cellspacing="0" border="0" summary="" ><tr><td valign="top"><img src="#IMAGE_PREFIX#themes/theme_8/chart.gif" alt=""/></td>'||chr(10)||
'<td>#BODY#</td></tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1537621899814671 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart List',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 8,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1537621899814671 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1537931534814671
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8ReportsRegionAlternative1" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader" valign="top"><div style="float:left;"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" />#TITLE#</div><div style="float:right;margin-left:45px;">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_8/';

t:=t||'1px_trans.gif" alt="" width="10" height="1" />#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr><td class="t8RegionBody">#BODY#</td></tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1537931534814671 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region, Alternative 1',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 8,
  p_theme_class_id => 10,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1537931534814671 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1538212799814671
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8BorderlessRegion" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader" valign="top"><div style="float:left;"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" />#TITLE#</div><div style="float:right;margin-left:45px;">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_8/1px_trans';

t:=t||'.gif" alt="" width="10" height="1" />#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1538212799814671 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Borderless Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 8,
  p_theme_class_id => 7,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1538212799814671 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1538525393814672
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t8WizardRegionwithIcon" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader" valign="top"><div style="float:left;"><img src="#IMAGE_PREFIX#themes/theme_8/t8bullet01.gif" width="10" height="10" alt="" style="margin-right:5px;" />#TITLE#</div><div style="float:right;margin-left:45px;">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_8/1px_t';

t:=t||'rans.gif" alt="" width="10" height="1" />#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody"><table summary="" cellpadding="0" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_8/t8iconwizard.gif" alt=""/></td>'||chr(10)||
'<td width="100%" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1538525393814672 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region with Icon',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 8,
  p_theme_class_id => 20,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1538525393814672 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1538812397814672
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellspacing="0" cellpadding="0" border="0" class="t8SidebarRegionAlternative1" summary="" id="#REGION_ID#">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionHeader">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t8RegionBody">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1538812397814672 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region, Alternative 1',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 8,
  p_theme_class_id => 3,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1538812397814672 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1429820751000158
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10NavigationRegionAlternative1" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionHeader"><div class="t10RegionTitle">#TITLE#</div></td>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionBody">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1429820751000158 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region, Alternative 1',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 10,
  p_theme_class_id => 16,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1429820751000158 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1430118583000158
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10BracketedRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_top2.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionHeader"><table border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_left2.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionTi';

t:=t||'tle">#TITLE#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_right2.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_top2.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle2.gif" alt=""/></td>'||chr(10)||
'<td class="t10ButtonHolder" align="right">#CLOSE#<img src="#IMAGE_PREFIX';

t:=t||'#themes/theme_10/1px_trans.gif" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#'||chr(10)||
'</td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle2.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle2.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionBody">#BODY#</td>'||chr(10)||
'<td class="t10Regi';

t:=t||'onRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle2.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_bottom2.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/region_middle_bottom2.gif" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_bottom2.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1430118583000158 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Bracketed Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 10,
  p_theme_class_id => 18,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1430118583000158 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1430427940000159
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_top.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionHeader"><table border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_left.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionTitle"';

t:=t||'>#TITLE#<a style="margin-left:5px;" href="javascript:hideShow(''region#REGION_SEQUENCE_ID#'',''shIMG#REGION_SEQUENCE_ID#'',''#IMAGE_PREFIX#themes/theme_10/showhide_hidden.gif'',''#IMAGE_PREFIX#themes/theme_10/showhide_show.gif'');" class="htmldbHideShowMinLink"><img src="#IMAGE_PREFIX#themes/theme_10/showhide_hidden.gif" '||chr(10)||
'  id="shIMG#REGION_SEQUENCE_ID#" alt="" /></a></</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#th';

t:=t||'emes/theme_10/region_title_right.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_top.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionBody"><div class="t10Hide" id="region#REGION_SEQUENCE_ID#"><div class="t10ButtonHolder" align="right">#';

t:=t||'CLOSE#<img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</div><div class="t10RegionBody">#BODY#</div></div></td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_bottom.gif" alt=""/></td>'||chr(10)||
'<';

t:=t||'td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/region_middle_bottom.gif" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_bottom.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1430427940000159 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Hide and Show Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 10,
  p_theme_class_id => 1,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1430427940000159 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1430731283000159
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10WizardRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="" width="600">'||chr(10)||
'<tr>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_top.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionHeader"><table border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_left.gif" alt=""/></td>'||chr(10)||
'<td class="t10R';

t:=t||'egionTitle">#TITLE#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_right.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_top.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10ButtonHolder" align="right">#CLOSE#<img src="#IMAGE_PR';

t:=t||'EFIX#themes/theme_10/1px_trans.gif" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#'||chr(10)||
'</td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionBody">#BODY#</td>'||chr(10)||
'<td class="t10Re';

t:=t||'gionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_bottom.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/region_middle_bottom.gif" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_bottom.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1430731283000159 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 10,
  p_theme_class_id => 12,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1430731283000159 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1431021788000159
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table border="0" cellpadding="0" cellspacing="0" summary="" class="t10SidebarRegion" id="#REGION_ID#">'||chr(10)||
'<tbody>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/sb1.gif" height="28" width="11" alt=""></td>'||chr(10)||
'<td class="t10RegionHeader">#TITLE#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/sb3.gif" height="28" width="12" alt=""></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10BodyLeft"><br /></td>'||chr(10)||
'<td class="t10Reg';

t:=t||'ionBody" width="100%">#BODY#</td>'||chr(10)||
'<td class="t10BodyRight"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/sb6.gif" height="11" width="11" alt=""></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/sb7.gif" height="11" width="7" alt=""></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/sb8.gif" height="11" width="12" alt=""></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1431021788000159 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 10,
  p_theme_class_id => 2,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1431021788000159 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1431315195000159
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10SidebarRegionAlternative1" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="" width="200">'||chr(10)||
'<tbody>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/a1_sb1.gif" height="28" width="11" alt=""></td>'||chr(10)||
'<td class="t10RegionHeader">#TITLE#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/a1_sb3.gif" height="28" width="12" alt=""></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10BodyLeft"';

t:=t||'><br /></td>'||chr(10)||
'<td class="t10RegionBody" width="100%">#BODY#</td>'||chr(10)||
'<td class="t10BodyRight"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/a1_sb6.gif" height="11" width="11" alt=""></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/a1_sb7.gif" height="11" width="7" alt=""></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/a1_sb8.gif" height="11" width="12" al';

t:=t||'t=""></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1431315195000159 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region, Alternative 1',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 10,
  p_theme_class_id => 3,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1431315195000159 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1431631920000161
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10FormRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_top.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionHeader"><table border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_left.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionTitle">#TITLE#</td>';

t:=t||''||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_right.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_top.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10ButtonHolder" align="right">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif';

t:=t||'" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#'||chr(10)||
'</td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionBody">#BODY#<img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" h';

t:=t||'eight="1" width="600" style="display:block;" alt=""/></td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_bottom.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/region_middle_bottom.gif" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes';

t:=t||'/theme_10/region_right_bottom.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1431631920000161 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Form Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 10,
  p_theme_class_id => 8,
  p_plug_heading_bgcolor   => '#f7f7e7',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1431631920000161 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1431929107000161
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div id="#REGION_ID#" class="t10BreadcrumbRegion">#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1431929107000161 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Breadcrumb Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 10,
  p_theme_class_id => 6,
  p_plug_heading_bgcolor   => '',
  p_plug_font_size         => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1431929107000161 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1432213113000161
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10ReportsRegion" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_top.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionHeader"><br /></td>'||chr(10)||
'<td width="7"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_top.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/them';

t:=t||'e_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10ButtonHolder" align="right">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#<img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" height="1" width="600" style="display:block;" alt=""/></td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#theme';

t:=t||'s/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_bottom.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/region_middle_bottom.gif" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_bottom.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#BODY#';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1432213113000161 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region without Title',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 10,
  p_theme_class_id => 17,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1432213113000161 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ......Region Template 1432527592000162
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t10ListRegionwithIcon" id="#REGION_ID#" border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_top.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionHeader"><table border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_left.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionTitle">#TIT';

t:=t||'LE#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_title_right.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_top.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10ButtonHolder" align="right">#CLOSE#<img src="#IMAGE_PREFIX#themes/theme_10/1px_t';

t:=t||'rans.gif" height="1" width="15" alt=""/>#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#'||chr(10)||
'</td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t10RegionLeft"><img src="#IMAGE_PREFIX#themes/theme_10/region_left_middle.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionBody"><table border="0" cellpadding="0" cellspacing="0" summ';

t:=t||'ary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_10/chart.gif"/></td><td valign="top">#BODY#<td></tr></table></td>'||chr(10)||
'<td class="t10RegionRight"><img src="#IMAGE_PREFIX#themes/theme_10/region_right_middle.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_left_bottom.gif" alt=""/></td>'||chr(10)||
'<td class="t10RegionFooter"><img src="#IMAGE_PREFIX#themes/theme_10/';

t:=t||'region_middle_bottom.gif" alt=""/></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/region_right_bottom.gif" alt=""/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1432527592000162 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart List',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 10,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor   => '#ffffff',
  p_plug_font_size         => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1432527592000162 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

---------------------------------------
prompt  ...List Templates
--
prompt  ......List Template 2355427596873457
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>2355427596873457 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Tree',
  p_theme_id  => 2,
  p_theme_class_id => 22,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 2355557505873459
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem"><a href="#" onclick="javascript:app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)">#TEXT#</a></li>';

t6:=t6||'<li class="dhtmlMenuItem"><a href="#" onclick="javascript:app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)">#TEXT#</a></li>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>2355557505873459 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Menu with Sublist',
  p_theme_id  => 2,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 2356537935873461
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<table class="t2ButtonList" cellspacing="0" cellpadding="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><img src="#IMAGE_PREFIX#/themes/theme_2/button_list_left.png" alt="" /></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#TEXT#</a></td>'||chr(10)||
'<td class="t2R"><img src="#IMAGE_PREFIX#/themes/theme_2/button_list_right.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2:=t2||'<table class="t2ButtonList" cellspacing="0" cellpadding="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><img src="#IMAGE_PREFIX#/themes/theme_2/button_list_left.png" alt="" /></td>'||chr(10)||
'<td class="t2NC"><a href="#LINK#">#TEXT#</a></td>'||chr(10)||
'<td class="t2R"><img src="#IMAGE_PREFIX#/themes/theme_2/button_list_right.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2356537935873461 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => 2,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<div class="t2ButtonList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 2356647586873462
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>2356647586873462 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML List (Image) with Sublist',
  p_theme_id  => 2,
  p_theme_class_id => 21,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu" style="display:none;">'||chr(10)||
'<li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 2356747045873462
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>2356747045873462 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tree List',
  p_theme_id  => 2,
  p_theme_class_id => 23,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1434015110000164
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>1434015110000164 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML List (Image) with Sublist',
  p_theme_id  => 10,
  p_theme_class_id => 21,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu" style="display:none;">'||chr(10)||
'<li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1434318206000172
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>1434318206000172 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tree List',
  p_theme_id  => 10,
  p_theme_class_id => 23,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 2355637704873461
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t2current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /><br />#TEXT#</td></tr>';

t2:=t2||'<tr><td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /><br />#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2355637704873461 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => 2,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary="0" class="t2VerticalImagesList">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 2355748105873461
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a class="t2current" href="#TAB_LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#TAB_LINK#">#TEXT#</a></li>'||chr(10)||
'';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2355748105873461 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => 2,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<ul class="t2TabbedNavigationList">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 2355832699873461
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t2current"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2355832699873461 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<ol class="t2VerticalOrderedList">',
  p_list_template_after_rows=>'</ol>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 2355948673873461
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t2current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2355948673873461 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List without Bullet',
  p_theme_id  => 2,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<ul class="t2VerticalUnorderedListwithoutBullet">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 2356038734873461
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t2current">#TEXT#</li>'||chr(10)||
'';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>'||chr(10)||
'';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2356038734873461 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullet',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="t2VerticalUnorderedListwithBullet">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 2356147653873461
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="t2current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#/><br />#TEXT#</td>';

t2:=t2||'<td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#/></a><br /><a href="#LINK#">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2356147653873461 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => 2,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="t2HorizontalImageswithLabelList"><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 2356234181873461
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t2current">#TEXT#</a>';

t2:=t2||'<a href="#LINK#">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2356234181873461 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => 2,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<div class="t2HorizontalLinksList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 2356336084873461
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t2navcurrent">#TEXT#</a>';

t2:=t2||'<a href="#LINK#" class="t2nav">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2356336084873461 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => 2,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<div class="t2VerticalSidebarList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 2356456581873461
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t2current">#TEXT#<br /><img src="#IMAGE_PREFIX#themes/theme_2/arrow_down.gif" alt="Down" /></td></tr>';

t2:=t2||'<tr><td>#TEXT#<br /><img src="#IMAGE_PREFIX#themes/theme_2/arrow_down.gif" alt="Down" /></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2356456581873461 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List',
  p_theme_id  => 2,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="t2WizardProgressList">',
  p_list_template_after_rows=>'<tr><td>&DONE.</td></tr>'||chr(10)||
'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1434618375000172
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="t10L"><img src="#IMAGE_PREFIX#themes/theme_10/button_alt1_left.gif" alt="" width="4" height="24" /></td>'||chr(10)||
'<td valign="middle" class="t10Current" style="background-image:url(#IMAGE_PREFIX#themes/theme_10/button_alt1_center.gif)">#TEXT#</td>'||chr(10)||
'<td class="t10R"><img src="#IMAGE_PREFIX#themes/theme_10/button_alt1_right.gif" width="4" height="24" alt="" /></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#theme';

t:=t||'s/theme_10/1px_trans.gif" width="5" height="1" alt="" /></td>';

t2:=t2||'<td class="t10L"><img src="#IMAGE_PREFIX#themes/theme_10/button_left.gif" alt="" width="4" height="24" /></td>'||chr(10)||
'<td class="t10C" valign="middle"><a href="#LINK#">#TEXT#</a></td>'||chr(10)||
'<td class="t10R"><img src="#IMAGE_PREFIX#themes/theme_10/button_right.gif" width="4" height="24" alt="" /></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/1px_trans.gif" width="5" height="1" alt="" /></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1434618375000172 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => 10,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<table class="t10ButtonList" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1434919650000175
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t10current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# />#TEXT#</td></tr>';

t2:=t2||'<tr><td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# />#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1434919650000175 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => 10,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="" class="t10VerticalImagesList">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1435226443000175
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="t10current"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/><br />#TEXT#</td>';

t2:=t2||'<td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/></a><br /><a href="#LINK#">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1435226443000175 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => 10,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<table class="t10HorizontalImageswithLabelList"><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1435508179000177
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t10current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1435508179000177 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => 10,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<ol class="t10VerticalOrderedList">',
  p_list_template_after_rows=>'</ol>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1435828327000177
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<span class="t10current">#TEXT#</span>';

t2:=t2||'<a href="#LINK#">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1435828327000177 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => 10,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<div class="t10HorizontalLinksList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1436112363000177
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td><div class="t10current">#TEXT#</div><img src="#IMAGE_PREFIX#themes/theme_4/arrow_down.gif" width="7" height="6" alt="Down" /></td></tr>';

t2:=t2||'<tr><td><div>#TEXT#</div><img src="#IMAGE_PREFIX#themes/theme_4/arrow_down.gif" width="7" height="6" alt="Down" /></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1436112363000177 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List',
  p_theme_id  => 10,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="" class="t10WizardProgressList">',
  p_list_template_after_rows=>'<tr><td>&DONE.</td></tr>'||chr(10)||
'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1436416141000178
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t10current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1436416141000178 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered Links without Bullets',
  p_theme_id  => 10,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<ul class="t10VerticalUnorderedLinkswithoutBullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1436726379000181
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t10current">#TEXT#</td></tr>';

t2:=t2||'<tr><td><a href="#LINK#" class="t10nav">#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1436726379000181 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => 10,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="" class="t10VerticalSidebarList">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1437031852000183
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#TAB_LINK#" class="t10current">#TEXT#</a></li>'||chr(10)||
'';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>'||chr(10)||
'';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1437031852000183 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => 10,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<ul class="t10TabbedNavigationList">'||chr(10)||
'',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1437325036000183
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t10current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1437325036000183 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullets',
  p_theme_id  => 10,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="t10VerticalUnorderedListwithBullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1437626282000186
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem"><a href="#" onclick="javascript:app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)">#TEXT#</a></li>';

t6:=t6||'<li class="dhtmlMenuItem"><a href="#" onclick="javascript:app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)">#TEXT#</a></li>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>1437626282000186 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Menu with Sublist',
  p_theme_id  => 10,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1437915352000186
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>1437915352000186 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Tree',
  p_theme_id  => 10,
  p_theme_class_id => 22,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1539125011814672
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem"><a href="#" onclick="javascript:app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)">#TEXT#</a></li>';

t6:=t6||'<li class="dhtmlMenuItem"><a href="#" onclick="javascript:app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)">#TEXT#</a></li>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>1539125011814672 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Menu with Sublist',
  p_theme_id  => 8,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1539416087814685
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="htmldbMIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>1539416087814685 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML List (Image) with Sublist',
  p_theme_id  => 8,
  p_theme_class_id => 21,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu" style="display:none;">'||chr(10)||
'<li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1539730297814687
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr align="center" valign="middle"> '||chr(10)||
'<td width="15" height="25" align="left"><img src="#IMAGE_PREFIX#themes/theme_8/t3left_nav_mark_orange.gif" width="10" height="13" alt="" /></td>'||chr(10)||
'<td class="t8lefthot">#TEXT#</td>'||chr(10)||
'</tr>';

t2:=t2||'<tr align="center" valign="middle"> '||chr(10)||
'<td width="15" align="left"><img src="#IMAGE_PREFIX#themes/theme_8/t3left_nav_mark_gray.gif" width="10" height="13" alt=""/></td>'||chr(10)||
'<td height="25" class="t8leftnavtable"><a href="#LINK#">#TEXT#</a></td>'||chr(10)||
'</tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1539730297814687 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => 8,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" style="background-color:#e5e5dc;border-right:1px #BFBFB8 solid;" summary="">',
  p_list_template_after_rows=>'<tr> '||chr(10)||
'<td height="18" align="left" style="background-color:E5E5DC" colspan="2"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="170" height="1" alt="0" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr> '||chr(10)||
'<td height="4" align="left" style="background-color:BFBFB8" colspan="2"><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" width="170" height="1" alt="0" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1540000381814687
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="t8C">#TEXT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" alt="" width="14" height="14" /></td>'||chr(10)||
'';

t2:=t2||'<td class="t8C"><a href="#" class="t8C">#TEXT#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_8/spacer.gif" alt="" width="14" height="14" /></td>'||chr(10)||
'';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1540000381814687 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => 8,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<table class="t8ButtonList" summary="" cellpadding="0" cellspacing="0" border="0"><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1540313756814687
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="t8current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#/><br />#TEXT#</td>';

t2:=t2||'<td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#/></a><br /><a href="#LINK#">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1540313756814687 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => 8,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<table cellspacing="0" cellpadding="0" border="0" class="t8HorizontalImageswithLabelList" summary=""><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1540630688814688
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t8VerticalUnorderedListwithBullets"><span class="t8current">#TEXT#</span></li>';

t2:=t2||'<li class="t8VerticalUnorderedListwithBullets"><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1540630688814688 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullets',
  p_theme_id  => 8,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="t8VerticalUnorderedListwithBullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1540902197814688
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t8current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1540902197814688 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List without Bullet',
  p_theme_id  => 8,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<ul class="t8VerticalUnorderedListwithoutBullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1541230276814690
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t8current">#TEXT#<br /><img src="#IMAGE_PREFIX#themes/theme_8/t8arrowdown01.gif" alt="Down" /></td></tr>';

t2:=t2||'<tr><td>#TEXT#<br /><img src="#IMAGE_PREFIX#themes/theme_8/t8arrowdown01.gif" alt="Down" /></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1541230276814690 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List',
  p_theme_id  => 8,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="t8WizardProgressList">',
  p_list_template_after_rows=>'<tr><td>&DONE.</td></tr>'||chr(10)||
'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1541532453814690
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t8current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1541532453814690 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => 8,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<ol class="t8VerticalOrderedList">',
  p_list_template_after_rows=>'</ol>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1541819141814690
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<span class="t8current">#TEXT#</span>';

t2:=t2||'<a href="#LINK#">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1541819141814690 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => 8,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<div class="t8HorizontalLinksList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1542103635814690
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>1542103635814690 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tree List',
  p_theme_id  => 8,
  p_theme_class_id => 23,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1542421596814691
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><img src="#IMAGE_PREFIX#themes/theme_4/rollup_plus_dgray.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>1542421596814691 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Tree',
  p_theme_id  => 8,
  p_theme_class_id => 22,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1542707622814691
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t8current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /><br/>#TEXT#</td></tr>';

t2:=t2||'<tr><td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /><br/>#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1542707622814691 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => 8,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary="0" class="t8VerticalImagesList">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ......List Template 1543001896814691
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a class="t8current" href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1543001896814691 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => 8,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<ul class="t8TabbedNavigationList">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

---------------------------------------
prompt  ...Report Templates
--
prompt  ......Row Template 2356851985873462
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2356851985873462 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2standard">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t2header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 2,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2356851985873462 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 2356937970873465
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<tr><th class="t2header">#COLUMN_HEADER#</th><td class="t2data">#COLUMN_VALUE#</td></tr>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2356937970873465 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr><td><table cellpadding="0" cellspacing="0" border="0" summary="" class="t2ValueAttributePairs">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 2,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2356937970873465 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'<tr><td colspan="2" class="t2seperate"><hr /></td></tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 2357040159873467
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2:=c2||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2dataalt">#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2357040159873467 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard, Alternating Row Colors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2standardalternatingrowcolors">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t2header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'EVEN_ROW_NUMBERS',
  p_row_template_display_cond2=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'EVEN_ROW_NUMBERS',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 2,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2357040159873467 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 2357145007873470
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2357145007873470 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2borderless">'||chr(10)||
''||chr(10)||
'',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t2header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>'||chr(10)||
'',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2357145007873470 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 2357238770873470
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>#COLUMN_VALUE#</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2357238770873470 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr><td><ul class="t2OneColumnUnorderedList">',
  p_row_template_after_rows =>'</ul><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 2,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2357238770873470 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'OMIT');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 2357356491873470
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2357356491873470 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2HorizontalBorder">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t2header"  id="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2357356491873470 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 1438225541000186
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t10data"#ALIGNMENT# headers="#COLUMN_HEADER#">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1438225541000186 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard (PPR)',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr><td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t10Standard">',
  p_row_template_after_rows =>'</table><div class="t10CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table><script language=JavaScript type=text/javascript>'||chr(10)||
'<!--'||chr(10)||
'init_htmlPPRReport(''#REGION_ID#'');'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>'||chr(10)||
'</htmldb:#REGION_ID#>'||chr(10)||
'</div>'||chr(10)||
'',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t10ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t10pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_10/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t10pagination"><img src="#IMAGE_PREFIX#themes/theme_10/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t10pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_10/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t10pagination"><img src="#IMAGE_PREFIX#themes/theme_10/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ededd6',
  p_theme_id  => 10,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1438225541000186 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 1438712131000191
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t10data"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1438712131000191 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr><td><table class="t10Borderless" cellpadding="0" border="0" cellspacing="0" summary="0">',
  p_row_template_after_rows =>'</table><div class="t10CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>'||chr(10)||
'',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t10ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t10pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_10/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t10pagination"><img src="#IMAGE_PREFIX#themes/theme_10/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t10pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_10/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t10pagination"><img src="#IMAGE_PREFIX#themes/theme_10/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ededd6',
  p_theme_id  => 10,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1438712131000191 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 1439215994000191
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t10data"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c2:=c2||'<td class="t10dataalt"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1439215994000191 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard, Alternating Row Colors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr><td><table border="0" cellpadding="0" cellspacing="0" summary="" class="t10StandardAlternatingRowColors">',
  p_row_template_after_rows =>'</table><div class="t10CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t10ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond2=>'NOT_CONDITIONAL',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'ODD_ROW_NUMBERS',
  p_next_page_template=>'<a href="#LINK#" class="t10pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_10/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t10pagination"><img src="#IMAGE_PREFIX#themes/theme_10/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t10pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_10/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t10pagination"><img src="#IMAGE_PREFIX#themes/theme_10/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ededd6',
  p_theme_id  => 10,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1439215994000191 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 1543317114814693
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t8data" #ALIGNMENT#>#COLUMN_VALUE#</td>';

c2:=c2||'<td class="t8dataalt" #ALIGNMENT#>#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1543317114814693 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard, Alternating Row Colors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr><td><table border="0" cellpadding="0" cellspacing="0" summary="" class="t8standardalternatingrowcolors">',
  p_row_template_after_rows =>'</table><div class="t8CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t8ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'ODD_ROW_NUMBERS',
  p_next_page_template=>'<a href="#LINK#" class="t8pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_8/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t8pagination"><img src="#IMAGE_PREFIX#themes/theme_8/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t8pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_8/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t8pagination"><img src="#IMAGE_PREFIX#themes/theme_8/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 8,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1543317114814693 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 2357446014873473
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2357446014873473 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard (PPR)',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2standard">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table><script language=JavaScript type=text/javascript>'||chr(10)||
'<!--'||chr(10)||
'init_htmlPPRReport(''#REGION_ID#'');'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>'||chr(10)||
'</htmldb:#REGION_ID#>'||chr(10)||
'</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t2header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 2,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2357446014873473 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 1543809873814694
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t8data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1543809873814694 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t8standard">',
  p_row_template_after_rows =>'</table><div class="t8CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t8ReportHeader">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t8pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_8/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t8pagination"><img src="#IMAGE_PREFIX#themes/theme_8/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t8pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_8/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t8pagination"><img src="#IMAGE_PREFIX#themes/theme_8/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#EEEEEE',
  p_theme_id  => 8,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1543809873814694 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 1544311264814696
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<tr><th class="t8ReportHeader">#COLUMN_HEADER#</th><td class="t8data">#COLUMN_VALUE#</td></tr>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1544311264814696 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr><td><table cellpadding="0" cellspacing="0" border="0" summary="" class="t8ValueAttributePairs">',
  p_row_template_after_rows =>'</table><div class="t8CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t8pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_8/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t8pagination"><img src="#IMAGE_PREFIX#themes/theme_8/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t8pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_8/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t8pagination"><img src="#IMAGE_PREFIX#themes/theme_8/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 8,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1544311264814696 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'<tr><td colspan="2" class="t8seperate"><hr /></td></tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 1544810276814697
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t8data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1544810276814697 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Bottom Border Only',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" cellspacing="0" border="0" class="t8HorizontalBorder" summary="">',
  p_row_template_after_rows =>'</table><div class="t8CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t8ReportHeader">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t8pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_8/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t8pagination"><img src="#IMAGE_PREFIX#themes/theme_8/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t8pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_8/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t8pagination"><img src="#IMAGE_PREFIX#themes/theme_8/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 8,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1544810276814697 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 1545326102814697
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t8data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1545326102814697 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table class="t8borderless" cellpadding="0" border="0" cellspacing="0" summary="0">',
  p_row_template_after_rows =>'</table><div class="t8CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t8ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t8pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_8/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t8pagination"><img src="#IMAGE_PREFIX#themes/theme_8/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t8pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_8/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t8pagination"><img src="#IMAGE_PREFIX#themes/theme_8/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 8,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1545326102814697 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 1439706756000192
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t10data" #ALIGNMENT#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1439706756000192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr><td><table class="t10HorizontalBorder" border="0" cellpadding="0" cellspacing="0" summary="">',
  p_row_template_after_rows =>'</table><div class="t10CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t10ReportHeader"  id="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t10pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_10/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t10pagination"><img src="#IMAGE_PREFIX#themes/theme_10/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t10pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_10/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t10pagination"><img src="#IMAGE_PREFIX#themes/theme_10/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ededd6',
  p_theme_id  => 10,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1439706756000192 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 1440110320000192
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>#COLUMN_VALUE#</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1440110320000192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'#TOP_PAGINATION#<tr><td><ul class="t10OneColumnUnorderedList">',
  p_row_template_after_rows =>'</ul><div class="t10CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'OMIT',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t10pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_10/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t10pagination"><img src="#IMAGE_PREFIX#themes/theme_10/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t10pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_10/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t10pagination"><img src="#IMAGE_PREFIX#themes/theme_10/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ededd6',
  p_theme_id  => 10,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1440110320000192 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'OMIT');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 1440620019000197
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t10data"#ALIGNMENT# headers="#COLUMN_HEADER#">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1440620019000197 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr><td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t10Standard">',
  p_row_template_after_rows =>'</table><div class="t10CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>'||chr(10)||
'',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th class="t10ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t10pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_10/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t10pagination"><img src="#IMAGE_PREFIX#themes/theme_10/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t10pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_10/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t10pagination"><img src="#IMAGE_PREFIX#themes/theme_10/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ededd6',
  p_theme_id  => 10,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1440620019000197 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 1441132522000198
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<tr><th class="t10ReportHeader">#COLUMN_HEADER#</th><td class="t10data">#COLUMN_VALUE#</td></tr>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1441132522000198 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" class="t10ValueAttributePairs">',
  p_row_template_after_rows =>'</table><div class="t10CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t10pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_10/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t10pagination"><img src="#IMAGE_PREFIX#themes/theme_10/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t10pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_10/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t10pagination"><img src="#IMAGE_PREFIX#themes/theme_10/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 10,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1441132522000198 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'<tr><td colspan="2" class="t10seperate"><hr /></td></tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 1545810041814699
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li class="t8OneColumnUnorderedList">#COLUMN_VALUE#</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1545810041814699 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" summary="" border="0">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr><td><ul class="t8OneColumnUnorderedList">',
  p_row_template_after_rows =>'</ul><div class="t8CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'',
  p_row_template_display_cond1=>'NOT_CONDITIONAL',
  p_row_template_display_cond2=>'NOT_CONDITIONAL',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'NOT_CONDITIONAL',
  p_next_page_template=>'<a href="#LINK#" class="t8pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_8/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t8pagination"><img src="#IMAGE_PREFIX#themes/theme_8/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t8pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_8/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t8pagination"><img src="#IMAGE_PREFIX#themes/theme_8/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 8,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1545810041814699 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'OMIT');
exception when others then null;
end;
null;
 
end;
/

prompt  ......Row Template 1546302057814699
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t8data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1546302057814699 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard (PPR)',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t8standard">',
  p_row_template_after_rows =>'</table><div class="t8CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table><script language=JavaScript type=text/javascript>'||chr(10)||
'<!--'||chr(10)||
'init_htmlPPRReport(''#REGION_ID#'');'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>'||chr(10)||
'</htmldb:#REGION_ID#>'||chr(10)||
'</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template =>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t8ReportHeader">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t8pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_8/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t8pagination"><img src="#IMAGE_PREFIX#themes/theme_8/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t8pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_8/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t8pagination"><img src="#IMAGE_PREFIX#themes/theme_8/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#EEEEEE',
  p_theme_id  => 8,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1546302057814699 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

---------------------------------------
prompt  ...Label Templates
--
prompt  ......Field Template 1546811586814701
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1546811586814701 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_8/required.gif" alt="Required Field Icon" style="margin-right:5px;" /><span class="t8Required">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'<div class="t8InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 8,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 1546929545814705
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1546929545814705 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_8/required.gif" alt="Required Field Icon" style="margin-right:5px;"/><a class="t8RequiredwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'<div class="t8InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 8,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 2357538760873473
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2357538760873473 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t2Optional">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 2,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 2357648769873475
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2357648769873475 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="t2OptionalwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 2357753581873475
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2357753581873475 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="t2NoLabel">',
  p_template_body2=>'</span>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 2,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 2357827664873475
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2357827664873475 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_2/required.gif" alt="Required Field Icon" tabindex="999" style="margin-right:5px;"/><a class="t2RequiredwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 2357952943873475
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2357952943873475 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t2Required"><img src="#IMAGE_PREFIX#themes/theme_2/required.gif" alt="Required Field Icon" style="margin-right:5px;" />',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 2,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 1441631361000198
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1441631361000198 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_10/required.png" alt="Required Field Icon" tabindex="999"  style="margin-right:5px;"/><a class="t5RequiredLabelwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'<div class="t10InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 10,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 1441731991000203
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1441731991000203 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="t10OptionalLabelwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'<div class="t10InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 10,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 1441811128000203
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1441811128000203 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_10/required.png" alt="Required Field Icon" tabindex="999"  style="margin-right:5px;"/><span class="t10RequiredLabel">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'<div class="t10InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 10,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 1441910392000203
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1441910392000203 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="t10NoLabel">',
  p_template_body2=>'</span>',
  p_on_error_before_label=>'<div class="t10InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 10,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 1442011698000203
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1442011698000203 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t10OptionalLabel">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'<div class="t10InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 10,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 1547025553814705
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1547025553814705 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="t8OptionalwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'<div class="t8InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 8,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 1547115638814705
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1547115638814705 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="t8NoLabel">',
  p_template_body2=>'</span>',
  p_on_error_before_label=>'<div class="t8InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 8,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ......Field Template 1547210169814705
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1547210169814705 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t8Optional">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'<div class="t8InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 8,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

---------------------------------------
prompt  ...Breadcrumb Templates
--
prompt  ......Breadcrumb Template 1547309328814705
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 1547309328814705 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'<div class="t8BreadcrumbMenu">',
  p_current_page_option=>'<span class="t8current">#NAME#</span>',
  p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>',
  p_menu_link_attributes=>'',
  p_between_levels=>'&nbsp;/&nbsp;',
  p_after_last=>'</div>',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 8,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

prompt  ......Breadcrumb Template 1547421977814711
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 1547421977814711 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Hierarchical Menu',
  p_before_first=>'<ul class="t1HierarchicalMenu">',
  p_current_page_option=>'<li class="t1current">#NAME#</li>',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'',
  p_after_last=>'</ul>',
  p_max_levels=>11,
  p_start_with_node=>'CHILD_MENU',
  p_theme_id  => 8,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

prompt  ......Breadcrumb Template 2358053548873475
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 2358053548873475 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'<div class="t2BreadcrumbMenu">',
  p_current_page_option=>'<span class="t2current">#NAME#</span>',
  p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>',
  p_menu_link_attributes=>'',
  p_between_levels=>'&nbsp;&gt;&nbsp;',
  p_after_last=>'</div>',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

prompt  ......Breadcrumb Template 2358137558873479
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 2358137558873479 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Hierarchical Menu',
  p_before_first=>'<ul class="t2HierarchicalMenu">',
  p_current_page_option=>'<li class="t2current">#NAME#</li>',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'',
  p_after_last=>'</ul>',
  p_max_levels=>11,
  p_start_with_node=>'CHILD_MENU',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

prompt  ......Breadcrumb Template 1442123436000203
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 1442123436000203 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Hierarchical Menu',
  p_before_first=>'<ul class="t10HierarchicalMenu">',
  p_current_page_option=>'<li class="t10current"><span>#NAME#</span></li>',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'',
  p_after_last=>'</ul>',
  p_max_levels=>11,
  p_start_with_node=>'CHILD_MENU',
  p_theme_id  => 10,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

prompt  ......Breadcrumb Template 1442222472000209
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 1442222472000209 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'<table border="0" cellpadding="0" cellspacing="0" summary="" class="t10BreadcrumbMenu">'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_10/arrows.gif" alt="" /></td>',
  p_current_page_option=>'<td class="t10crumb"><span class="t10current">#NAME#</span></td>',
  p_non_current_page_option=>'<td class="t10crumb"><a href="#LINK#">#NAME#</a></td>',
  p_menu_link_attributes=>'',
  p_between_levels=>'<td>&nbsp;<img src="#IMAGE_PREFIX#themes/theme_10/breadcrumb_sep.gif" alt="" />&nbsp;</td>',
  p_after_last=>'</tr>'||chr(10)||
'</table>',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 10,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

---------------------------------------
prompt  ...Popup List of Values Templates
--
prompt  ......Popup LOV Template 2358848169873489
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 2358848169873489 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme.css" type="text/css">'||chr(10)||
'',
  p_page_body_attr=>'onload="first_field()" style="margin:0;"',
  p_before_field_text=>'<div class="t2PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>10,
  p_before_result_set=>'<div class="t2PopupBody">',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ......Popup LOV Template 1548110320814716
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 1548110320814716 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_8/theme.css" type="text/css">'||chr(10)||
'',
  p_page_body_attr=>'onload="first_field()" style="margin:0;"',
  p_before_field_text=>'<div class="t8PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>10,
  p_before_result_set=>'<div class="t8PopupBody">',
  p_theme_id  => 8,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ......Popup LOV Template 1442932432000214
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 1442932432000214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_10/theme.css" type="text/css">'||chr(10)||
'',
  p_page_body_attr=>'onload="first_field()" style="margin:0px;"',
  p_before_field_text=>'<div class="t10PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>10,
  p_before_result_set=>'<div class="t10PopupBody">',
  p_theme_id  => 10,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

---------------------------------------
prompt  ...Calendar Templates
--
prompt  ......Calendar Template 1547512425814711
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 1547512425814711 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar, Alternative 1',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<th class="t8DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t8CalendarAlternative1Holder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t8MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="4" summary="0" class="t8CalendarAlternative1">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t8DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t8Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t8Today">',
  p_weekend_title_format=> '<div class="t8WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t8WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t8NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t8NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 8,
  p_theme_class_id => 2,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ......Calendar Template 1547717619814715
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 1547717619814715 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<th class="t8DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t8CalendarHolder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t8MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t8Calendar">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t8DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t8Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t8Today">',
  p_weekend_title_format=> '<div class="t8WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t8WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t8NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t8NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 8,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ......Calendar Template 2358256337873479
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 2358256337873479 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar, Alternative 1',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<th class="t2DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2CalendarAlternative1Holder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t2MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="1" summary="0" class="t2CalendarAlternative1">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t2DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t2Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t2Today">',
  p_weekend_title_format=> '<div class="t2WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t2WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t2NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t2NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 2,
  p_theme_class_id => 2,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ......Calendar Template 2358430326873484
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 2358430326873484 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Small Calendar',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<th class="t2DayOfWeek" height="12">#DY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2SmallCalendarHolder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t2MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t2SmallCalendar">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t2DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t2Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t2Today">',
  p_weekend_title_format=> '<div class="t2WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t2WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t2NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t2NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 2,
  p_theme_class_id => 3,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ......Calendar Template 2358656388873487
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 2358656388873487 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<th class="t2DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2CalendarHolder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t2MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t2Calendar">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t2DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t2Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t2Today">',
  p_weekend_title_format=> '<div class="t2WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t2WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t2NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t2NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 2,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ......Calendar Template 1442325039000209
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 1442325039000209 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar, Alternative 1',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<th class="t10DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t10CalendarAlternative1Holder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t10MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t10CalendarAlternative1">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t10DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t10Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t10Today">',
  p_weekend_title_format=> '<div class="t10WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t10WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t10NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t10NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 10,
  p_theme_class_id => 2,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ......Calendar Template 1442520899000212
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 1442520899000212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Small Calender',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t10SmallCalendarHolder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t10MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="1" summary="0" class="t10SmallCalendar">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t10DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t10Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t10Today">',
  p_weekend_title_format=> '<div class="t10WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t10WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t10NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t10NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 10,
  p_theme_class_id => 3,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ......Calendar Template 1442708643000212
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 1442708643000212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<th class="t10DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t10CalendarHolder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t10MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t10Calendar">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t10DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t10Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t10Today">',
  p_weekend_title_format=> '<div class="t10WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t10WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t10NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t10NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 10,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ......Calendar Template 1547916827814715
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 1547916827814715 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Small Calendar',
  p_translate_this_template=> 'Y',
  p_day_of_week_format=> '<th class="t8DayOfWeek" height="12">#DY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t8SmallCalendarHolder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t8MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t8SmallCalendar">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t8DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t8Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t8Today">',
  p_weekend_title_format=> '<div class="t8WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t8WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t8NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t8NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_theme_id  => 8,
  p_theme_class_id => 3,
  p_reference_id=> null);
end;
null;
 
end;
/

---------------------------------------
prompt  ...Application Themes
--
prompt  ......Theme 2358939950873490
begin
wwv_flow_api.create_theme (
  p_id                        =>2358939950873490 + wwv_flow_api.g_id_offset,
  p_flow_id                   =>wwv_flow.g_flow_id,
  p_theme_id  => 2,
  p_theme_name=>'Blue and Tan',
  p_default_page_template=>2352656770873450 + wwv_flow_api.g_id_offset,
  p_error_template=>2352656770873450 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>2352033855873436 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template            =>2352854190873451 + wwv_flow_api.g_id_offset,
  p_default_button_template   =>2353128410873453 + wwv_flow_api.g_id_offset,
  p_default_region_template   =>2354646321873456 + wwv_flow_api.g_id_offset,
  p_default_chart_template    =>2353842532873454 + wwv_flow_api.g_id_offset,
  p_default_form_template     =>2353930390873454 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>2354646321873456 + wwv_flow_api.g_id_offset,
  p_default_tabform_template  =>2354646321873456 + wwv_flow_api.g_id_offset,
  p_default_wizard_template   =>2353755932873454 + wwv_flow_api.g_id_offset,
  p_default_menur_template    =>2353644597873454 + wwv_flow_api.g_id_offset,
  p_default_listr_template    =>2354646321873456 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>2356851985873462 + wwv_flow_api.g_id_offset,
  p_default_label_template    =>2357648769873475 + wwv_flow_api.g_id_offset,
  p_default_menu_template     =>2358053548873475 + wwv_flow_api.g_id_offset,
  p_default_calendar_template =>2358656388873487 + wwv_flow_api.g_id_offset,
  p_default_list_template     =>2356038734873461 + wwv_flow_api.g_id_offset,
  p_default_option_label      =>2357648769873475 + wwv_flow_api.g_id_offset,
  p_default_required_label    =>2357827664873475 + wwv_flow_api.g_id_offset);
end;
/
prompt  ......Theme 1548217973814721
begin
wwv_flow_api.create_theme (
  p_id                        =>1548217973814721 + wwv_flow_api.g_id_offset,
  p_flow_id                   =>wwv_flow.g_flow_id,
  p_theme_id  => 8,
  p_theme_name=>'Grey And Orange',
  p_default_page_template=>1531215987814629 + wwv_flow_api.g_id_offset,
  p_error_template=>1531215987814629 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>1530329506814626 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template            =>1530624104814626 + wwv_flow_api.g_id_offset,
  p_default_button_template   =>1532018994814643 + wwv_flow_api.g_id_offset,
  p_default_region_template   =>1534602918814666 + wwv_flow_api.g_id_offset,
  p_default_chart_template    =>1537013547814669 + wwv_flow_api.g_id_offset,
  p_default_form_template     =>1535217065814668 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>1534602918814666 + wwv_flow_api.g_id_offset,
  p_default_tabform_template  =>1534602918814666 + wwv_flow_api.g_id_offset,
  p_default_wizard_template   =>1533414576814655 + wwv_flow_api.g_id_offset,
  p_default_menur_template    =>1534309313814666 + wwv_flow_api.g_id_offset,
  p_default_listr_template    =>1534602918814666 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>1543809873814694 + wwv_flow_api.g_id_offset,
  p_default_label_template    =>1547025553814705 + wwv_flow_api.g_id_offset,
  p_default_menu_template     =>1547309328814705 + wwv_flow_api.g_id_offset,
  p_default_calendar_template =>1547717619814715 + wwv_flow_api.g_id_offset,
  p_default_list_template     =>1540630688814688 + wwv_flow_api.g_id_offset,
  p_default_option_label      =>1547025553814705 + wwv_flow_api.g_id_offset,
  p_default_required_label    =>1546929545814705 + wwv_flow_api.g_id_offset);
end;
/
prompt  ......Theme 1443027743000222
begin
wwv_flow_api.create_theme (
  p_id                        =>1443027743000222 + wwv_flow_api.g_id_offset,
  p_flow_id                   =>wwv_flow.g_flow_id,
  p_theme_id  => 10,
  p_theme_name=>'Sand',
  p_default_page_template=>1425729311000127 + wwv_flow_api.g_id_offset,
  p_error_template=>1425729311000127 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>1426008454000130 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template            =>1426609278000131 + wwv_flow_api.g_id_offset,
  p_default_button_template   =>1426918918000131 + wwv_flow_api.g_id_offset,
  p_default_region_template   =>1433727985000164 + wwv_flow_api.g_id_offset,
  p_default_chart_template    =>1428025656000155 + wwv_flow_api.g_id_offset,
  p_default_form_template     =>1431631920000161 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>1433727985000164 + wwv_flow_api.g_id_offset,
  p_default_tabform_template  =>1433727985000164 + wwv_flow_api.g_id_offset,
  p_default_wizard_template   =>1430731283000159 + wwv_flow_api.g_id_offset,
  p_default_menur_template    =>1428628009000155 + wwv_flow_api.g_id_offset,
  p_default_listr_template    =>1433727985000164 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>1440620019000197 + wwv_flow_api.g_id_offset,
  p_default_label_template    =>1441731991000203 + wwv_flow_api.g_id_offset,
  p_default_menu_template     =>1442222472000209 + wwv_flow_api.g_id_offset,
  p_default_calendar_template =>1442708643000212 + wwv_flow_api.g_id_offset,
  p_default_list_template     =>1437325036000183 + wwv_flow_api.g_id_offset,
  p_default_option_label      =>1441731991000203 + wwv_flow_api.g_id_offset,
  p_default_required_label    =>1441631361000198 + wwv_flow_api.g_id_offset);
end;
/
---------------------------------------
prompt  ...Build Options used by APPLICATION 103
--
 
begin
 
null;
 
end;
/

---------------------------------------
prompt  ...Messages Used by Application: 103
--
---------------------------------------
prompt  ...Language Maps for Application 103
--
 
begin
 
null;
 
end;
/

---------------------------------------
prompt  ...Shortcuts
--
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'Would you like to perform this delete action?';

wwv_flow_api.create_shortcut (
 p_id=> 1384309740006357 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'DELETE_CONFIRM_MSG',
 p_shortcut_type=> 'TEXT_ESCAPE_JS',
 p_shortcut=> c1);
end;
 
null;
 
end;
/

---------------------------------------
prompt  ...Configurations for application103
--
 
begin
 
null;
 
end;
/

---------------------------------------
prompt  ...WEB SERVICES (9iR2 or better)
--
---------------------------------------
prompt  ...Authorization Schemes
--
prompt  ......Authentication Schemes 313079082691669382
 
begin
 
declare
  s1 varchar2(32767) := null;
  s2 varchar2(32767) := null;
  s3 varchar2(32767) := null;
  s4 varchar2(32767) := null;
  s5 varchar2(32767) := null;
begin
s1 := null;
s2 := null;
s3 := null;
s4:=s4||'-BUILTIN-';

s5 := null;
wwv_flow_api.create_auth_setup (
  p_id=> 313079082691669382 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Collections Built-In Auth',
  p_description=>'',
  p_page_sentry_function=> s1,
  p_sess_verify_function=> s2,
  p_pre_auth_process=> s3,
  p_auth_function=> s4,
  p_post_auth_process=> s5,
  p_invalid_session_page=>'101',
  p_invalid_session_url=>'',
  p_cookie_name=>'',
  p_cookie_path=>'',
  p_cookie_domain=>'',
  p_ldap_host=>'',
  p_ldap_port=>'',
  p_ldap_string=>'',
  p_attribute_01=>'',
  p_attribute_02=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&p_next_flow_page_sess=&APP_ID.:101',
  p_attribute_03=>'',
  p_attribute_04=>'',
  p_attribute_05=>'',
  p_attribute_06=>'',
  p_attribute_07=>'',
  p_attribute_08=>'',
  p_required_patch=>'');
end;
null;
 
end;
/

---------------------------------------
prompt  ...Application Entry Points
--
 
begin
 
null;
 
end;
/

commit;
commit;
begin 
execute immediate 'alter session set nls_numeric_characters='''||wwv_flow_api.g_nls_numeric_chars||'''';
end;
/
set verify on
set feedback on
prompt  ...done
