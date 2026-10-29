*CLASS LHC_PMROLEAUTHORIZATALL DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
*  PUBLIC SECTION.
*    CONSTANTS:
*      CO_ENTITY TYPE abp_entity_name VALUE `ZI_PMROLEAUTHORIZATION_S`,
*      CO_TRANSPORT_OBJECT TYPE mbc_cp_api=>indiv_transaction_obj_name VALUE `ZPMROLEAUTHORIZATION`,
*      CO_AUTHORIZATION_ENTITY TYPE abp_entity_name VALUE `ZI_PMROLEAUTHORIZATION`.
*
*  PRIVATE SECTION.
*    METHODS:
*      GET_INSTANCE_FEATURES FOR INSTANCE FEATURES
*        IMPORTING
*          KEYS REQUEST requested_features FOR PmRoleAuthorizatAll
*        RESULT result,
*      SELECTCUSTOMIZINGTRANSPTREQ FOR MODIFY
*        IMPORTING
*          KEYS FOR ACTION PmRoleAuthorizatAll~SelectCustomizingTransptReq
*        RESULT result,
*      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
*        IMPORTING
*           REQUEST requested_authorizations FOR PmRoleAuthorizatAll
*        RESULT result,
*      EDIT FOR MODIFY
*        IMPORTING
*          KEYS FOR ACTION PmRoleAuthorizatAll~edit.
*ENDCLASS.
*
*CLASS LHC_PMROLEAUTHORIZATALL IMPLEMENTATION.
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
*CLASS LSC_PMROLEAUTHORIZATALL DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_SAVER.
*  PROTECTED SECTION.
*    METHODS:
*      SAVE_MODIFIED REDEFINITION.
*ENDCLASS.
*
*CLASS LSC_PMROLEAUTHORIZATALL IMPLEMENTATION.
*  METHOD SAVE_MODIFIED.
*  mbc_cp_api=>rap_bc_api( )->record_changes(
*    transport_object = lhc_PmRoleAuthorizatAll=>co_transport_object
*    entity           = lhc_PmRoleAuthorizatAll=>co_entity
*    create           = REF #( create )
*    update           = REF #( update )
*    delete           = REF #( delete )
*    reported         = REF #( reported ) ).
*  mbc_cp_api=>rap_bc_api( )->update_last_changed_date_time(
*    maintenance_object = 'ZPMROLEAUTHORIZATION'
*    entity             = lhc_PmRoleAuthorizatAll=>co_authorization_entity
*    create             = REF #( create )
*    update             = REF #( update )
*    delete             = REF #( delete )
*    reported           = REF #( reported ) ).
*  ENDMETHOD.
*ENDCLASS.
*CLASS LHC_PMROLEAUTHORIZATION DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
*  PUBLIC SECTION.
*    CONSTANTS:
*      CO_ENTITY TYPE abp_entity_name VALUE `ZI_PMROLEAUTHORIZATION`.
*
*  PRIVATE SECTION.
*    METHODS:
*      VALIDATEDATACONSISTENCY FOR VALIDATE ON SAVE
*        IMPORTING
*          KEYS FOR PmRoleAuthorization~ValidateDataConsistency,
*      GET_GLOBAL_FEATURES FOR GLOBAL FEATURES
*        IMPORTING
*          REQUEST REQUESTED_FEATURES FOR PmRoleAuthorization
*        RESULT result,
*      VALIDATETRANSPORTREQUEST FOR VALIDATE ON SAVE
*        IMPORTING
*          KEYS_PMROLEAUTHORIZATALL FOR PmRoleAuthorizatAll~ValidateTransportRequest
*          KEYS_PMROLEAUTHORIZATION FOR PmRoleAuthorization~ValidateTransportRequest.
*ENDCLASS.
*
*CLASS LHC_PMROLEAUTHORIZATION IMPLEMENTATION.
*  METHOD VALIDATEDATACONSISTENCY.
*  mbc_cp_api=>rap_bc_api( )->check_consistency(
*    entity   = co_entity
*    fields_not_initial = VALUE #( ( CONV #( 'Werks' ) )
*                                  ( CONV #( 'ApprovalRole' ) )
*                                  ( CONV #( 'UserId' ) ) )
*    keys     = REF #( keys )
*    failed   = REF #( failed )
*    reported = REF #( reported ) ).
*  ENDMETHOD.
*  METHOD GET_GLOBAL_FEATURES.
*  mbc_cp_api=>rap_bc_api( )->get_global_features(
*    transport_object   = lhc_PmRoleAuthorizatAll=>co_transport_object
*    entity             = co_entity
*    requested_features = REF #( requested_features )
*    result             = REF #( result )
*    reported           = REF #( reported ) ).
*  ENDMETHOD.
*  METHOD VALIDATETRANSPORTREQUEST.
*  mbc_cp_api=>rap_bc_api( )->validate_transport_request(
*    transport_object = lhc_PmRoleAuthorizatAll=>co_transport_object
*    entity           = lhc_PmRoleAuthorizatAll=>co_entity
*    validation_keys  = VALUE #( ( REF #( keys_PmRoleAuthorizatAll ) )
*                                ( REF #( keys_PmRoleAuthorization ) ) )
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
*  METHOD GET.
*    result = mbc_cp_api=>rap_tdat_cts( tdat_name = 'ZMATERIALDELETIONAUT'
*                                       table_entity_relations = VALUE #(
*                                         ( entity = 'MaterialDeletionAut' table = 'ZMAT_AUTDEL' )
*                                       ) ) ##NO_TEXT.
*  ENDMETHOD.

 METHOD GET.
    result = mbc_cp_api=>rap_table_cts( table_entity_relations = VALUE #(
                                         ( entity = 'PmRoleAuthorizatAll' table = 'ZPM_ERN_ROLE' )
                                       ) ) ##NO_TEXT.
  ENDMETHOD.

ENDCLASS.
CLASS LHC_PMROLEAUTHORIZATALL DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_INSTANCE_FEATURES FOR INSTANCE FEATURES
        IMPORTING
          KEYS REQUEST requested_features FOR PmRoleAuthorizatAll
        RESULT result,
      SELECTCUSTOMIZINGTRANSPTREQ FOR MODIFY
        IMPORTING
          KEYS FOR ACTION PmRoleAuthorizatAll~SelectCustomizingTransptReq
        RESULT result,
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR PmRoleAuthorizatAll
        RESULT result.
*      EDIT FOR MODIFY
*        IMPORTING
*          KEYS FOR ACTION MaterialDeletionAll~edit.
ENDCLASS.

CLASS LHC_PMROLEAUTHORIZATALL IMPLEMENTATION.
*  METHOD GET_INSTANCE_FEATURES.
*    DATA: edit_flag            TYPE abp_behv_op_ctrl    VALUE if_abap_behv=>fc-o-enabled
*         ,transport_feature    TYPE abp_behv_field_ctrl VALUE if_abap_behv=>fc-f-mandatory
*         ,selecttransport_flag TYPE abp_behv_op_ctrl    VALUE if_abap_behv=>fc-o-enabled.
*
*    IF lhc_rap_tdat_cts=>get( )->is_editable( ) = abap_false.
*      edit_flag = if_abap_behv=>fc-o-disabled.
*    ENDIF.
*    IF lhc_rap_tdat_cts=>get( )->is_transport_allowed( ) = abap_false.
*      selecttransport_flag = if_abap_behv=>fc-o-disabled.
*    ENDIF.
*    IF lhc_rap_tdat_cts=>get( )->is_transport_mandatory( ) = abap_false.
*      transport_feature = if_abap_behv=>fc-f-unrestricted.
*    ENDIF.
*    IF keys[ 1 ]-%IS_DRAFT = if_abap_behv=>mk-off.
*      selecttransport_flag = if_abap_behv=>fc-o-disabled.
*    ENDIF.
*    result = VALUE #( (
*               %TKY = keys[ 1 ]-%TKY
*               %ACTION-edit = edit_flag
*               %ASSOC-_MaterialDeletionAut = edit_flag
*               %FIELD-TransportRequestID = transport_feature
*               %ACTION-SelectCustomizingTransptReq = selecttransport_flag ) ).
*  ENDMETHOD.



 METHOD GET_INSTANCE_FEATURES.
    DATA: selecttransport_flag TYPE abp_behv_flag VALUE if_abap_behv=>fc-o-enabled,
          edit_flag            TYPE abp_behv_flag VALUE if_abap_behv=>fc-o-enabled.

    IF cl_bcfg_cd_reuse_api_factory=>get_cust_obj_service_instance(
        iv_objectname = 'ZPM_ERN_ROLE'
        iv_objecttype = cl_bcfg_cd_reuse_api_factory=>simple_table )->is_editable( ) = abap_false.
      edit_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    DATA(transport_service) = cl_bcfg_cd_reuse_api_factory=>get_transport_service_instance(
                                iv_objectname = 'ZPM_ERN_ROLE '
                                iv_objecttype = cl_bcfg_cd_reuse_api_factory=>simple_table ).
    IF transport_service->is_transport_allowed( ) = abap_false.
      selecttransport_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    READ ENTITIES OF ZI_PmRoleAuthorization_S  IN LOCAL MODE
    ENTITY PmRoleAuthorizatAll
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(all).
    IF all[ 1 ]-%IS_DRAFT = if_abap_behv=>mk-off.
      selecttransport_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    result = VALUE #( (
               %TKY = all[ 1 ]-%TKY
               %ACTION-edit = edit_flag
               %ASSOC-_PmRoleAuthorization = edit_flag
               %ACTION-SelectCustomizingTransptReq = selecttransport_flag ) ).
  ENDMETHOD.

METHOD SELECTCUSTOMIZINGTRANSPTREQ.
    MODIFY ENTITIES OF ZI_PmRoleAuthorization_S IN LOCAL MODE
      ENTITY PmRoleAuthorizatAll
        UPDATE FIELDS ( TransportRequestID )
        WITH VALUE #( FOR key IN keys
                        ( %TKY               = key-%TKY
                          TransportRequestID = key-%PARAM-transportrequestid
                         ) ).

    READ ENTITIES OF ZI_PmRoleAuthorization_S IN LOCAL MODE
      ENTITY PmRoleAuthorizatAll
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(entities).
    result = VALUE #( FOR entity IN entities
                        ( %TKY   = entity-%TKY
                          %PARAM = entity ) ).
  ENDMETHOD.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
    AUTHORITY-CHECK OBJECT 'S_TABU_NAM' ID 'TABLE' FIELD 'ZI_PMROLEAUTHORIZATION' ID 'ACTVT' FIELD '02'.
    DATA(is_authorized) = COND #( WHEN sy-subrc = 0 THEN if_abap_behv=>auth-allowed
                                  ELSE if_abap_behv=>auth-unauthorized ).
    result-%UPDATE      = is_authorized.
    result-%ACTION-Edit = is_authorized.
    result-%ACTION-SelectCustomizingTransptReq = is_authorized.
  ENDMETHOD.
*  METHOD EDIT.
*    CHECK lhc_rap_tdat_cts=>get( )->is_transport_mandatory( ).
*    DATA(transport_request) = lhc_rap_tdat_cts=>get( )->get_transport_request( ).
*    IF transport_request IS NOT INITIAL.
*      MODIFY ENTITY IN LOCAL MODE ZI_MaterialDeletionAut_S
*        EXECUTE SelectCustomizingTransptReq FROM VALUE #( ( %IS_DRAFT = if_abap_behv=>mk-on
*                                                            SingletonID = 1
*                                                            %PARAM-transportrequestid = transport_request ) ).
*      reported-MaterialDeletionAll = VALUE #( ( %IS_DRAFT = if_abap_behv=>mk-on
*                                     SingletonID = 1
*                                     %MSG = mbc_cp_api=>message( )->get_transport_selected( transport_request ) ) ).
*    ENDIF.
*  ENDMETHOD.
ENDCLASS.
CLASS LSC_ZI_MATERIALDELETIONAUT_S DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_SAVER.
  PROTECTED SECTION.
    METHODS:
      SAVE_MODIFIED REDEFINITION,
      CLEANUP_FINALIZE REDEFINITION.
ENDCLASS.

CLASS LSC_ZI_MATERIALDELETIONAUT_S IMPLEMENTATION.
  METHOD SAVE_MODIFIED.
    READ TABLE update-pmroleauthorizatall INDEX 1 INTO DATA(all).
    IF all-TransportRequestID IS NOT INITIAL.
      lhc_rap_tdat_cts=>get( )->record_changes(
                                  transport_request = all-TransportRequestID
                                  create            = REF #( create )
                                  update            = REF #( update )
                                  delete            = REF #( delete ) )->update_last_changed_date_time( view_entity_name   = 'ZI_PMROLEAUTHORIZATION'
                                                                                                        maintenance_object = 'ZPMROLEAUTHORIZATION' ).
    ENDIF.
  ENDMETHOD.
  METHOD CLEANUP_FINALIZE ##NEEDED.
  ENDMETHOD.
ENDCLASS.
CLASS LHC_ZI_MATERIALDELETIONAUT DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
*    METHODS:
*      GET_GLOBAL_FEATURES FOR GLOBAL FEATURES
*        IMPORTING
*          REQUEST REQUESTED_FEATURES FOR MaterialDeletionAut
*        RESULT result,
*      VALIDATETRANSPORTREQUEST FOR VALIDATE ON SAVE
*        IMPORTING
*          KEYS_MATERIALDELETIONAUT FOR MaterialDeletionAut~ValidateTransportRequest.

 METHODS:
      VALIDATETRANSPORTREQUEST FOR VALIDATE ON SAVE
        IMPORTING
          KEYS FOR PmRoleAuthorizatAll~ValidateTransportRequest,
      GET_GLOBAL_FEATURES FOR GLOBAL FEATURES
        IMPORTING
          REQUEST REQUESTED_FEATURES FOR PmRoleAuthorization
        RESULT result.

ENDCLASS.

CLASS LHC_ZI_MATERIALDELETIONAUT IMPLEMENTATION.
*  METHOD GET_GLOBAL_FEATURES.
*    DATA edit_flag TYPE abp_behv_op_ctrl VALUE if_abap_behv=>fc-o-enabled.
*    IF lhc_rap_tdat_cts=>get( )->is_editable( ) = abap_false.
*      edit_flag = if_abap_behv=>fc-o-disabled.
*    ENDIF.
*    result-%UPDATE = edit_flag.
*    result-%DELETE = edit_flag.
*  ENDMETHOD.

 METHOD GET_GLOBAL_FEATURES.
    DATA edit_flag TYPE abp_behv_flag VALUE if_abap_behv=>fc-o-enabled.
    IF cl_bcfg_cd_reuse_api_factory=>get_cust_obj_service_instance(
         iv_objectname = 'ZPM_ERN_ROLE'
         iv_objecttype = cl_bcfg_cd_reuse_api_factory=>simple_table )->is_editable( ) = abap_false.
      edit_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    result-%UPDATE = edit_flag.
    result-%DELETE = edit_flag.
  ENDMETHOD.

*METHOD VALIDATETRANSPORTREQUEST.
*    DATA change TYPE REQUEST FOR CHANGE ZI_MaterialDeletionAut_S.
*    IF keys_MaterialDeletionAut IS NOT INITIAL.
*      DATA(is_draft) = keys_MaterialDeletionAut[ 1 ]-%IS_DRAFT.
*    ELSE.
*      RETURN.
*    ENDIF.
*    READ ENTITY IN LOCAL MODE ZI_MaterialDeletionAut_S
*    FROM VALUE #( ( %IS_DRAFT = is_draft
*                    SingletonID = 1
*                    %CONTROL-TransportRequestID = if_abap_behv=>mk-on ) )
*    RESULT FINAL(transport_from_singleton).
*    lhc_rap_tdat_cts=>get( )->validate_all_changes(
*                                transport_request     = VALUE #( transport_from_singleton[ 1 ]-TransportRequestID OPTIONAL )
*                                table_validation_keys = VALUE #(
*                                                          ( table = 'ZMAT_AUTDEL' keys = REF #( keys_MaterialDeletionAut ) )
*                                                               )
*                                reported              = REF #( reported )
*                                failed                = REF #( failed )
*                                change                = REF #( change ) ).
*  ENDMETHOD.
*ENDCLASS.
METHOD VALIDATETRANSPORTREQUEST.
    DATA change TYPE REQUEST FOR CHANGE ZI_PmRoleAuthorization_S.
    SELECT SINGLE TransportRequestID
      FROM zpm_ern_rol_d_s
      WHERE SingletonID = 1
      INTO @DATA(TransportRequestID).
    lhc_rap_tdat_cts=>get( )->validate_changes(
                                transport_request = transportrequestid
                                table             = 'ZPM_ERN_ROLE'
                                keys              = REF #( keys )
                                reported          = REF #( reported )
                                failed            = REF #( failed )
                                change            = REF #( change-pmroleauthorization ) ).
  ENDMETHOD.


ENDCLASS.
