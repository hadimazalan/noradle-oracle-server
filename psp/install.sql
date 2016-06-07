-----------------------------------------------------
-- Export file for user PSP                        --
-- Created by Administrator on 2013-4-18, 11:18:01 --
-----------------------------------------------------

set define off
set echo on

whenever sqlerror continue
prompt Notice: all the drop objects errors can be ignored, do not care about it
create table SERVER_CONTROL_BAK as select * from SERVER_CONTROL_T;
create table CLIENT_CONTROL_BAK as select * from CLIENT_CONTROL_T;
drop table SERVER_CONTROL_T cascade constraints;
drop table CLIENT_CONTROL_T cascade constraints;
whenever sqlerror exit

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
prompt Creating package K_RESP_BODY
prompt =======================
prompt
@@k_resp_body.spc
@@k_resp_body.bdy

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
prompt Creating package HTTP_SERVER
prompt ============================
prompt
@@http_server.spc
@@http_server.bdy
prompt
prompt Creating package DATA_SERVER
prompt ============================
prompt
@@data_server.spc
@@data_server.bdy
prompt
prompt Creating package ANY_SERVER
prompt ===========================
prompt
@@any_server.spc
@@any_server.bdy


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
prompt Creating package KV
prompt ===================
prompt
@@kv.spc
@@kv.bdy
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

whenever sqlerror continue
prompt Notice: restore old config data
insert into SERVER_CONTROL_T select * from SERVER_CONTROL_BAK;
insert into CLIENT_CONTROL_T select * from CLIENT_CONTROL_BAK;
insert into EXT_URL_T select * from EXT_URL_BAK;
drop table SERVER_CONTROL_BAK cascade constraints;
drop table CLIENT_CONTROL_BAK cascade constraints;
drop table EXT_URL_BAK cascade constraints;
desc SERVER_CONTROL_T
insert into SERVER_CONTROL_T (CFG_ID, GW_HOST, GW_PORT, MIN_SERVERS, MAX_SERVERS, MAX_REQUESTS, MAX_LIFETIME,IDLE_TIMEOUT)
values ('dispatcher', '127.0.0.1', 1522, 4, 12, 1000, '+0001 00:00:00', 300);
desc CLIENT_CONTROL_T
insert into client_control_t (cid, passwd, min_concurrency, max_concurrency, dbu_default, dbu_filter, allow_sql)
values ('demo', 'demo', '3', '8', 'demo', 'demo', 'Y');
commit;
whenever sqlerror exit

set echo off
set define on
