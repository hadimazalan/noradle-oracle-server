-----------------------------------------------------
-- Export file for user PSP                        --
-- Created by Administrator on 2013-4-18, 11:18:01 --
-----------------------------------------------------

set define off
set echo on

--------------------------------------------------------------------------------

prompt
prompt Creating table SERVER_CONTROL_T
prompt ===============================
prompt
@@server_control_t.tab
prompt
prompt Creating table CLIENT_CONTROL_T
prompt ===============================
prompt
@@client_control_t.tab

--------------------------------------------------------------------------------

prompt
prompt Creating type ST
prompt ================
prompt
@@st.tps
prompt
prompt Creating type NT
prompt ================
prompt
@@nt.tps
prompt
prompt Creating package TMP
prompt ====================
prompt
@@tmp.spc

--------------------------------------------------------------------------------

prompt
prompt Creating package K_CCFLAG
prompt =========================
prompt
@@k_ccflag.spc
prompt
prompt Creating package PV
prompt ===================
prompt
@@pv.spc

--------------------------------------------------------------------------------

prompt
prompt Creating package G
prompt ==================
prompt
@@g.spc
@@g.bdy

--------------------------------------------------------------------------------

prompt
prompt Creating package RA
prompt ===================
prompt
@@ra.spc
prompt
prompt Creating package RB
prompt ===================
prompt
@@rb.spc
prompt
prompt Creating package RC
prompt ===================
prompt
@@rc.spc
prompt
prompt Creating package R
prompt ==================
prompt
@@r.spc
@@r.bdy

--------------------------------------------------------------------------------

prompt
prompt Creating package K_TYPE_TOOL
prompt ============================
rem rely on r.client_addr in .gen_token
prompt
@@k_type_tool.spc
@@k_type_tool.bdy
create or replace synonym t for k_type_tool;

prompt Creating package E
prompt ==================
prompt
@@e.spc
@@e.bdy
prompt
prompt Creating package K_DEBUG
prompt ========================
prompt
@@k_debug.spc
@@k_debug.bdy
create or replace synonym odb for k_debug;

prompt Creating package HTTP
prompt =======================
prompt
@@http.spc
@@http.bdy
prompt Creating package SCGI
prompt =======================
prompt
@@scgi.spc
@@scgi.bdy
prompt Creating package FCGI
prompt =======================
prompt
@@fcgi.spc
@@fcgi.bdy
prompt Creating package NCGI
prompt =======================
prompt
@@ncgi.spc
@@ncgi.bdy

prompt Creating package K_PARSER
prompt =======================
prompt
@@k_parser.spc
@@k_parser.bdy

prompt Creating package BIOS
prompt =======================
prompt
@@bios.spc
@@bios.bdy
prompt Creating package OUTPUT
prompt =======================
prompt
@@output.spc
@@output.bdy
prompt
prompt Creating package K_RESP_HEAD
prompt =======================
prompt
@@k_resp_head.spc
@@k_resp_head.bdy
create or replace synonym k_http for k_resp_head;
create or replace synonym h for k_resp_head;
create or replace synonym hdr for k_resp_head;
prompt Creating package K_RESP_BODY
prompt =======================
prompt
@@k_resp_body.spc
@@k_resp_body.bdy
create or replace synonym b for k_resp_body;
create or replace synonym bdy for k_resp_body;
--------------------------------------------------------------------------------


prompt
prompt Creating package K_FILTER
prompt =======================
prompt
@@k_filter.spc
@@k_filter.bdy
prompt
prompt Creating package K_GW
prompt =====================
prompt
@@k_gw.spc
@@k_gw.bdy
prompt
prompt Creating procedure DAD_AUTH_ENTRY
prompt =================================
prompt
@@dad_auth_entry.prc
prompt
prompt Creating package K_INIT
prompt =======================
prompt
@@k_init.spc
@@k_init.bdy


prompt
prompt Creating package K_CFG
prompt ======================
@@k_cfg.spc
@@k_cfg.bdy
prompt Creating package K_MGMT_FRAME
prompt ========================
prompt
@@k_mgmt_frame.spc
@@k_mgmt_frame.bdy
prompt Creating package K_MAPPING
prompt ========================
prompt
@@k_mapping.spc
@@k_mapping.bdy
prompt Creating package K_SERVLET
prompt ========================
prompt
@@k_servlet.spc
@@k_servlet.bdy
prompt
prompt Creating package FRAMEWORK
prompt ========================
prompt
@@framework.spc
@@framework.bdy
prompt
prompt Creating procedure kill
prompt ========================
prompt
@@kill.prc
prompt
prompt Creating package K_PMON
prompt =======================
prompt
@@k_pmon.spc
@@k_pmon.bdy


--------------------------------------------------------------------------------

prompt
prompt Creating package CACHE
prompt ======================
prompt
@@cache.spc
@@cache.bdy
prompt
prompt Creating package K_AUTH
prompt =======================
prompt
@@k_auth.spc
@@k_auth.bdy

--------------------------------------------------------------------------------

desc SERVER_CONTROL_T
insert into SERVER_CONTROL_T (CFG_ID, GW_HOST, GW_PORT, MIN_SERVERS, MAX_SERVERS, MAX_REQUESTS, MAX_LIFETIME,IDLE_TIMEOUT)
values ('dispatcher', '127.0.0.1', 1522, 4, 12, 1000, '+0001 00:00:00', 300);
desc CLIENT_CONTROL_T
insert into client_control_t (cid, passwd, min_concurrency, max_concurrency, dbu_default, dbu_filter, allow_sql)
values ('demo', 'demo', '3', '8', 'demo', 'demo', 'Y');
commit;

set echo off
set define on
