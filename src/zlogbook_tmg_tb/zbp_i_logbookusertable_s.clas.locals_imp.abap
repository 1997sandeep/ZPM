*CLASS LHC_LOGBOOKUSERTABLEALL DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
*  PUBLIC SECTION.
*    CONSTANTS:
*      CO_ENTITY TYPE abp_entity_name VALUE `ZI_LOGBOOKUSERTABLE_S`,
*      CO_TRANSPORT_OBJECT TYPE mbc_cp_api=>indiv_transaction_obj_name VALUE `ZLOGBOOKUSERTABLE`,
*      CO_AUTHORIZATION_ENTITY TYPE abp_entity_name VALUE `ZI_LOGBOOKUSERTABLE`.
*
*  PRIVATE SECTION.
*    METHODS:
*      GET_INSTANCE_FEATURES FOR INSTANCE FEATURES
*        IMPORTING
*          KEYS REQUEST requested_features FOR LogBookUserTableAll
*        RESULT result,
*      SELECTCUSTOMIZINGTRANSPTREQ FOR MODIFY
*        IMPORTING
*          KEYS FOR ACTION LogBookUserTableAll~SelectCustomizingTransptReq
*        RESULT result,
*      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
*        IMPORTING
*           REQUEST requested_authorizations FOR LogBookUserTableAll
*        RESULT result,
*      EDIT FOR MODIFY
*        IMPORTING
*          KEYS FOR ACTION LogBookUserTableAll~edit.
*ENDCLASS.
*
*CLASS LHC_LOGBOOKUSERTABLEALL IMPLEMENTATION.
*  METHOD GET_INSTANCE_FEATURES.
*  mbc_cp_api=>rap_bc_api( )->get_instance_features(
*    transport_object   = co_transport_object
*    entity             = co_entity
*    keys               = REF #( keys )
*    requested_features = REF #( requested_features )
*    result             = REF #( result )
*    failed             = REF #( failed )
*    reported           = REF #( reported ) ).
*  ENDMETHOD.
*  METHOD SELECTCUSTOMIZINGTRANSPTREQ.
*  mbc_cp_api=>rap_bc_api( )->select_transport_action(
*    entity   = co_entity
*    keys     = REF #( keys )
*    result   = REF #( result )
*    mapped   = REF #( mapped )
*    failed   = REF #( failed )
*    reported = REF #( reported ) ).
*  ENDMETHOD.
*  METHOD GET_GLOBAL_AUTHORIZATIONS.
*  mbc_cp_api=>rap_bc_api( )->get_global_authorizations(
*    entity                   = co_authorization_entity
*    requested_authorizations = REF #( requested_authorizations )
*    result                   = REF #( result )
*    reported                 = REF #( reported ) ).
*  ENDMETHOD.
*  METHOD EDIT.
*  mbc_cp_api=>rap_bc_api( )->get_default_transport_request(
*    transport_object = co_transport_object
*    entity           = co_entity
*    keys             = REF #( keys )
*    mapped           = REF #( mapped )
*    failed           = REF #( failed )
*    reported         = REF #( reported ) ).
*  ENDMETHOD.
*ENDCLASS.
*CLASS LSC_LOGBOOKUSERTABLEALL DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_SAVER.
*  PROTECTED SECTION.
*    METHODS:
*      SAVE_MODIFIED REDEFINITION.
*ENDCLASS.
*
*CLASS LSC_LOGBOOKUSERTABLEALL IMPLEMENTATION.
*  METHOD SAVE_MODIFIED.
*  mbc_cp_api=>rap_bc_api( )->record_changes(
*    transport_object = lhc_LogBookUserTableAll=>co_transport_object
*    entity           = lhc_LogBookUserTableAll=>co_entity
*    create           = REF #( create )
*    update           = REF #( update )
*    delete           = REF #( delete )
*    reported         = REF #( reported ) ).
*  mbc_cp_api=>rap_bc_api( )->update_last_changed_date_time(
*    maintenance_object = 'ZLOGBOOKUSERTABLE'
*    entity             = lhc_LogBookUserTableAll=>co_authorization_entity
*    create             = REF #( create )
*    update             = REF #( update )
*    delete             = REF #( delete )
*    reported           = REF #( reported ) ).
*  ENDMETHOD.
*ENDCLASS.
*CLASS LHC_LOGBOOKUSERTABLE DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
*  PUBLIC SECTION.
*    CONSTANTS:
*      CO_ENTITY TYPE abp_entity_name VALUE `ZI_LOGBOOKUSERTABLE`.
*
*  PRIVATE SECTION.
*    METHODS:
*      VALIDATEDATACONSISTENCY FOR VALIDATE ON SAVE
*        IMPORTING
*          KEYS FOR LogBookUserTable~ValidateDataConsistency,
*      GET_GLOBAL_FEATURES FOR GLOBAL FEATURES
*        IMPORTING
*          REQUEST REQUESTED_FEATURES FOR LogBookUserTable
*        RESULT result,
*      VALIDATETRANSPORTREQUEST FOR VALIDATE ON SAVE
*        IMPORTING
*          KEYS_LOGBOOKUSERTABLEALL FOR LogBookUserTableAll~ValidateTransportRequest
*          KEYS_LOGBOOKUSERTABLE FOR LogBookUserTable~ValidateTransportRequest.
*ENDCLASS.
*
*CLASS LHC_LOGBOOKUSERTABLE IMPLEMENTATION.
*  METHOD VALIDATEDATACONSISTENCY.
*  mbc_cp_api=>rap_bc_api( )->check_consistency(
*    entity   = co_entity
*    fields_not_initial = VALUE #( ( CONV #( 'Usirid' ) ) )
*    keys     = REF #( keys )
*    failed   = REF #( failed )
*    reported = REF #( reported ) ).
*  ENDMETHOD.
*  METHOD GET_GLOBAL_FEATURES.
*  mbc_cp_api=>rap_bc_api( )->get_global_features(
*    transport_object   = lhc_LogBookUserTableAll=>co_transport_object
*    entity             = co_entity
*    requested_features = REF #( requested_features )
*    result             = REF #( result )
*    reported           = REF #( reported ) ).
*  ENDMETHOD.
*  METHOD VALIDATETRANSPORTREQUEST.
*  mbc_cp_api=>rap_bc_api( )->validate_transport_request(
*    transport_object = lhc_LogBookUserTableAll=>co_transport_object
*    entity           = lhc_LogBookUserTableAll=>co_entity
*    validation_keys  = VALUE #( ( REF #( keys_LogBookUserTableAll ) )
*                                ( REF #( keys_LogBookUserTable ) ) )
*    failed           = REF #( failed )
*    reported         = REF #( reported ) ).
*  ENDMETHOD.
*ENDCLASS.








CLASS LHC_RAP_TDAT_CTS DEFINITION FINAL.
  PUBLIC SECTION.
    CLASS-METHODS:
      GET
        RETURNING
          VALUE(RESULT) TYPE REF TO IF_MBC_CP_RAP_TABLE_CTS.

ENDCLASS.

CLASS LHC_RAP_TDAT_CTS IMPLEMENTATION.

 METHOD GET.
    result = mbc_cp_api=>rap_table_cts( table_entity_relations = VALUE #(
                                         ( entity = 'LogBookUserTableAll' table = 'ZLOGBOOK_TMG_TBL' )
                                       ) ) ##NO_TEXT.
  ENDMETHOD.


ENDCLASS.
CLASS LHC_LOGBOOKUSERTABLEALL DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_INSTANCE_FEATURES FOR INSTANCE FEATURES
        IMPORTING
          KEYS REQUEST requested_features FOR LogBookUserTableAll
        RESULT result,
      SELECTCUSTOMIZINGTRANSPTREQ FOR MODIFY
        IMPORTING
          KEYS FOR ACTION LogBookUserTableAll~SelectCustomizingTransptReq
        RESULT result,
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR LogBookUserTableAll
        RESULT result.

ENDCLASS.

CLASS LHC_LOGBOOKUSERTABLEALL IMPLEMENTATION.

 METHOD GET_INSTANCE_FEATURES.
    DATA: selecttransport_flag TYPE abp_behv_flag VALUE if_abap_behv=>fc-o-enabled,
          edit_flag            TYPE abp_behv_flag VALUE if_abap_behv=>fc-o-enabled.

    IF cl_bcfg_cd_reuse_api_factory=>get_cust_obj_service_instance(
        iv_objectname = 'ZLOGBOOK_TMG_TBL'
        iv_objecttype = cl_bcfg_cd_reuse_api_factory=>simple_table )->is_editable( ) = abap_false.
      edit_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    DATA(transport_service) = cl_bcfg_cd_reuse_api_factory=>get_transport_service_instance(
                                iv_objectname = 'ZLOGBOOK_TMG_TBL '
                                iv_objecttype = cl_bcfg_cd_reuse_api_factory=>simple_table ).
    IF transport_service->is_transport_allowed( ) = abap_false.
      selecttransport_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    READ ENTITIES OF ZI_LogBookUserTable_S  IN LOCAL MODE
    ENTITY LogBookUserTableAll
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(all).
    IF all[ 1 ]-%IS_DRAFT = if_abap_behv=>mk-off.
      selecttransport_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    result = VALUE #( (
               %TKY = all[ 1 ]-%TKY
               %ACTION-edit = edit_flag
               %ASSOC-_LogBookUserTable = edit_flag
               %ACTION-SelectCustomizingTransptReq = selecttransport_flag ) ).
  ENDMETHOD.

METHOD SELECTCUSTOMIZINGTRANSPTREQ.
    MODIFY ENTITIES OF ZI_LogBookUserTable_S IN LOCAL MODE
      ENTITY LogBookUserTableAll
        UPDATE FIELDS ( TransportRequestID )
        WITH VALUE #( FOR key IN keys
                        ( %TKY               = key-%TKY
                          TransportRequestID = key-%PARAM-transportrequestid
                         ) ).

    READ ENTITIES OF ZI_LogBookUserTable_S IN LOCAL MODE
      ENTITY LogBookUserTableAll
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(entities).
    result = VALUE #( FOR entity IN entities
                        ( %TKY   = entity-%TKY
                          %PARAM = entity ) ).
  ENDMETHOD.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
    AUTHORITY-CHECK OBJECT 'S_TABU_NAM' ID 'TABLE' FIELD 'ZI_LOGBOOKUSERTABLE' ID 'ACTVT' FIELD '02'.
    DATA(is_authorized) = COND #( WHEN sy-subrc = 0 THEN if_abap_behv=>auth-allowed
                                  ELSE if_abap_behv=>auth-unauthorized ).
    result-%UPDATE      = is_authorized.
    result-%ACTION-Edit = is_authorized.
    result-%ACTION-SelectCustomizingTransptReq = is_authorized.
  ENDMETHOD.

ENDCLASS.
CLASS LSC_ZI_MATERIALDELETIONAUT_S DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_SAVER.
  PROTECTED SECTION.
    METHODS:
      SAVE_MODIFIED REDEFINITION,
      CLEANUP_FINALIZE REDEFINITION.
ENDCLASS.

CLASS LSC_ZI_MATERIALDELETIONAUT_S IMPLEMENTATION.
  METHOD SAVE_MODIFIED.
    READ TABLE update-logbookusertableall INDEX 1 INTO DATA(all).
    IF all-TransportRequestID IS NOT INITIAL.
      lhc_rap_tdat_cts=>get( )->record_changes(
                                  transport_request = all-TransportRequestID
                                  create            = REF #( create )
                                  update            = REF #( update )
                                  delete            = REF #( delete ) )->update_last_changed_date_time( view_entity_name   = 'ZI_LOGBOOKUSERTABLE'
                                                                                                        maintenance_object = 'ZLOGBOOKUSERTABLE' ).
    ENDIF.
  ENDMETHOD.
  METHOD CLEANUP_FINALIZE ##NEEDED.
  ENDMETHOD.
ENDCLASS.
CLASS LHC_ZI_MATERIALDELETIONAUT DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
 METHODS:
      VALIDATETRANSPORTREQUEST FOR VALIDATE ON SAVE
        IMPORTING
          KEYS FOR LogBookUserTableAll~ValidateTransportRequest,
      GET_GLOBAL_FEATURES FOR GLOBAL FEATURES
        IMPORTING
          REQUEST REQUESTED_FEATURES FOR LogBookUserTable
        RESULT result.

ENDCLASS.

CLASS LHC_ZI_MATERIALDELETIONAUT IMPLEMENTATION.


 METHOD GET_GLOBAL_FEATURES.
    DATA edit_flag TYPE abp_behv_flag VALUE if_abap_behv=>fc-o-enabled.
    IF cl_bcfg_cd_reuse_api_factory=>get_cust_obj_service_instance(
         iv_objectname = 'ZLOGBOOK_TMG_TBL'
         iv_objecttype = cl_bcfg_cd_reuse_api_factory=>simple_table )->is_editable( ) = abap_false.
      edit_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    result-%UPDATE = edit_flag.
    result-%DELETE = edit_flag.
  ENDMETHOD.


METHOD VALIDATETRANSPORTREQUEST.
    DATA change TYPE REQUEST FOR CHANGE ZI_LogBookUserTable_S.
    SELECT SINGLE TransportRequestID
      FROM zpm_ern_rol_d_s
      WHERE SingletonID = 1
      INTO @DATA(TransportRequestID).
    lhc_rap_tdat_cts=>get( )->validate_changes(
                                transport_request = transportrequestid
                                table             = 'ZLOGBOOK_TMG_TBL'
                                keys              = REF #( keys )
                                reported          = REF #( reported )
                                failed            = REF #( failed )
                                change            = REF #( change-logbookusertable ) ).
  ENDMETHOD.


ENDCLASS.
