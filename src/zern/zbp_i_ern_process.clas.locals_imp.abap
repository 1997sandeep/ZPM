"======================================================================
" Local types / buffer
"======================================================================
CLASS lcl_buffer DEFINITION.

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ty_create,
        cid  TYPE abp_behv_cid,
        data TYPE zern_process,
      END OF ty_create.

    TYPES ty_update TYPE STRUCTURE FOR UPDATE zi_ern_process.
    TYPES ty_delete TYPE STRUCTURE FOR KEY OF zi_ern_process.

    CLASS-DATA gv_plant  TYPE werks_d.

    CLASS-DATA gt_create TYPE STANDARD TABLE OF ty_create WITH EMPTY KEY.
    CLASS-DATA gt_update TYPE STANDARD TABLE OF ty_update WITH EMPTY KEY.
    CLASS-DATA gt_delete TYPE STANDARD TABLE OF ty_delete WITH EMPTY KEY.

ENDCLASS.

CLASS lcl_buffer IMPLEMENTATION.
ENDCLASS.

"======================================================================
" Handler class
"======================================================================
CLASS lhc_ern_process DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE ern_process.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE ern_process.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE ern_process.

    METHODS read FOR READ
      IMPORTING keys FOR READ ern_process RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK ern_process.

    METHODS checkauthorization FOR MODIFY
      IMPORTING keys FOR ACTION ern_process~checkauthorization RESULT result.

ENDCLASS.

CLASS lhc_ern_process IMPLEMENTATION.

  "------------------------------------------------------------
  " CREATE : buffer only
  "------------------------------------------------------------
  METHOD create.

    DATA(lv_date) = cl_abap_context_info=>get_system_date( ).
    DATA(lv_user) = cl_abap_context_info=>get_user_technical_name( ).

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs>).

      DATA(ls_data) = CORRESPONDING zern_process(
                        <fs>
                        MAPPING
                          equicat = eqart
                          evtype  = eartx
                          doctype = bsart ).

      ls_data-c_date     = lv_date.
      ls_data-c_by       = lv_user.
      ls_data-last_cdate = lv_date.
      ls_data-last_cby   = lv_user.

      APPEND VALUE #( cid  = <fs>-%cid
                      data = ls_data ) TO lcl_buffer=>gt_create.

    ENDLOOP.

  ENDMETHOD.

  "------------------------------------------------------------
  " UPDATE : buffer whole entity incl. %control
  "------------------------------------------------------------
  METHOD update.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs>).
      APPEND <fs> TO lcl_buffer=>gt_update.
    ENDLOOP.

  ENDMETHOD.

  "------------------------------------------------------------
  " DELETE : buffer only
  "------------------------------------------------------------
  METHOD delete.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<k>).
      APPEND CORRESPONDING #( <k> ) TO lcl_buffer=>gt_delete.
    ENDLOOP.

  ENDMETHOD.

  "------------------------------------------------------------
  " READ
  "------------------------------------------------------------
  METHOD read.

    CHECK keys IS NOT INITIAL.

    SELECT *
      FROM zern_process
      FOR ALL ENTRIES IN @keys
      WHERE werks  = @keys-werks
        AND req_no = @keys-req_no
        AND sl_no  = @keys-sl_no
      INTO TABLE @DATA(lt_db).

    result = CORRESPONDING #(
               lt_db
               MAPPING
                 eqart = equicat
                 eartx = evtype
                 bsart = doctype ).

  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  "------------------------------------------------------------
  " CHECKAUTHORIZATION : site requisition authorization check
  " NOTE: ABAP Cloud requires a STATIC (literal) object name in
  "       AUTHORITY-CHECK, so the objects are checked one by one.
  "------------------------------------------------------------
  METHOD checkauthorization.

*    DATA: lv_site   TYPE c LENGTH 20,
*          lv_subrc  TYPE sy-subrc,
*          lv_subrc2 TYPE sy-subrc.
*
*    READ TABLE keys ASSIGNING FIELD-SYMBOL(<fs_key>) INDEX 1.
*    IF sy-subrc <> 0.
*      RETURN.
*    ENDIF.
*
*    DATA(lv_werks) = <fs_key>-%param-werks.
*    DATA(lv_actvt) = <fs_key>-%param-actvt.
*
*    lcl_buffer=>gv_plant = lv_werks.
*
*    " ---- 1) master authorization (display/07) -------------------------
*    AUTHORITY-CHECK OBJECT 'ZERN_MAST'
*      ID 'ACTVT' FIELD '07'
*      ID 'WERKS' FIELD lcl_buffer=>gv_plant.
*
*    IF sy-subrc = 0.
*      APPEND VALUE #(
*        %cid              = <fs_key>-%cid
*        %param-authorized = abap_true
*        %param-message    = |Authorization to process ZERN_MAST 07|
*      ) TO result.
*      RETURN.
*    ENDIF.
*
*    " ---- 2) role objects with requested activity -----------------------
*    lv_subrc = 4.
*
*    AUTHORITY-CHECK OBJECT 'ZERN_SITE'
*      ID 'ACTVT' FIELD lv_actvt
*      ID 'WERKS' FIELD lcl_buffer=>gv_plant.
*    IF sy-subrc = 0.
*      lv_site  = 'ZERN_SITE'.
*      lv_subrc = 0.
*    ENDIF.
*
*    IF lv_subrc <> 0.
*      AUTHORITY-CHECK OBJECT 'ZERN_PM'
*        ID 'ACTVT' FIELD lv_actvt
*        ID 'WERKS' FIELD lcl_buffer=>gv_plant.
*      IF sy-subrc = 0.
*        lv_site  = 'ZERN_PM'.
*        lv_subrc = 0.
*      ENDIF.
*    ENDIF.
*
**    IF lv_subrc <> 0.
**      AUTHORITY-CHECK OBJECT 'ZERN_BUDG'
**        ID 'ACTVT' FIELD lv_actvt
**        ID 'WERKS' FIELD lcl_buffer=>gv_plant.
**      IF sy-subrc = 0.
**        lv_site  = 'ZERN_BUDG'.
**        lv_subrc = 0.
**      ENDIF.
**    ENDIF.
*
*    IF lv_subrc <> 0.
*      AUTHORITY-CHECK OBJECT 'ZERN_HO'
*        ID 'ACTVT' FIELD lv_actvt
*        ID 'WERKS' FIELD lcl_buffer=>gv_plant.
*      IF sy-subrc = 0.
*        lv_site  = 'ZERN_HO'.
*        lv_subrc = 0.
*      ENDIF.
*    ENDIF.
*
*    " ---- none of the role objects granted the activity -----------------
*    IF lv_subrc <> 0.
*      APPEND VALUE #(
*        %cid              = <fs_key>-%cid
*        %param-authorized = abap_false
*        %param-message    = |No Authorization to process { lv_actvt }|
*      ) TO result.
*      RETURN.
*    ENDIF.
*
*    APPEND VALUE #(
*      %cid              = <fs_key>-%cid
*      %param-authorized = abap_true
*      %param-message    = |Authorization to process { lv_actvt }|
*    ) TO result.
*
*    " ---- 3) additional check for activity 16 on the object found -------
*    lv_subrc2 = 4.
*
*    CASE lv_site.
*      WHEN 'ZERN_SITE'.
*        AUTHORITY-CHECK OBJECT 'ZERN_SITE'
*          ID 'ACTVT' FIELD '16'
*          ID 'WERKS' FIELD lcl_buffer=>gv_plant.
*        lv_subrc2 = sy-subrc.
*      WHEN 'ZERN_PM'.
*        AUTHORITY-CHECK OBJECT 'ZERN_PM'
*          ID 'ACTVT' FIELD '16'
*          ID 'WERKS' FIELD lcl_buffer=>gv_plant.
*        lv_subrc2 = sy-subrc.
**      WHEN 'ZERN_BUDG'.
**        AUTHORITY-CHECK OBJECT 'ZERN_BUDG'
**          ID 'ACTVT' FIELD '16'
**          ID 'WERKS' FIELD lcl_buffer=>gv_plant.
**        lv_subrc2 = sy-subrc.
*      WHEN 'ZERN_HO'.
*        AUTHORITY-CHECK OBJECT 'ZERN_HO'
*          ID 'ACTVT' FIELD '16'
*          ID 'WERKS' FIELD lcl_buffer=>gv_plant.
*        lv_subrc2 = sy-subrc.
*    ENDCASE.
*
*    IF lv_subrc2 <> 0.
*      APPEND VALUE #(
*        %cid              = <fs_key>-%cid
*        %param-authorized = abap_false
*        %param-message    = |No Authorization to process { lv_site } 16|
*      ) TO result.
*    ELSE.
*      APPEND VALUE #(
*        %cid              = <fs_key>-%cid
*        %param-authorized = abap_true
*        %param-message    = |Authorization to process { lv_site } 16|
*      ) TO result.
*    ENDIF.
*
  ENDMETHOD.

ENDCLASS.

"======================================================================
" Saver class
"======================================================================
CLASS lsc_zi_ern_process DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize          REDEFINITION.
    METHODS check_before_save REDEFINITION.
    METHODS adjust_numbers    REDEFINITION.
    METHODS save              REDEFINITION.
    METHODS cleanup           REDEFINITION.
    METHODS cleanup_finalize  REDEFINITION.

ENDCLASS.

CLASS lsc_zi_ern_process IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  "------------------------------------------------------------
  " ADJUST_NUMBERS : number only, NO database statements.
  " Range ZPM_REQ_NO must be buffered in SNRO / number range app.
  "------------------------------------------------------------
  METHOD adjust_numbers.

    DATA lv_req_no TYPE zern_process-req_no.
    DATA lv_all    TYPE string.

    LOOP AT lcl_buffer=>gt_create ASSIGNING FIELD-SYMBOL(<c>)
         GROUP BY <c>-data-werks ASSIGNING FIELD-SYMBOL(<grp>).

      TRY.
          cl_numberrange_runtime=>number_get(
            EXPORTING
              nr_range_nr = '01'
              object      = 'ZPM_REQ_NO'
            IMPORTING
              number      = DATA(lv_number) ).

          lv_req_no = lv_number+10(10).

        CATCH cx_number_ranges INTO DATA(lx_nr).
          APPEND new_message_with_text(
                   severity = if_abap_behv_message=>severity-error
                   text     = lx_nr->get_text( ) )
            TO reported-%other.
          RETURN.
      ENDTRY.

      " give every line of this group the number and return the final key
      LOOP AT GROUP <grp> ASSIGNING FIELD-SYMBOL(<m>).

        <m>-data-req_no = lv_req_no.

        APPEND VALUE #(
          %pid = <m>-cid
          %key = VALUE #( werks  = <m>-data-werks
                          req_no = lv_req_no
                          sl_no  = <m>-data-sl_no )
        ) TO mapped-ern_process.

      ENDLOOP.

      " collect all generated numbers for the success message
      lv_all = COND #( WHEN lv_all IS INITIAL
                       THEN |{ lv_req_no ALPHA = OUT }|
                       ELSE |{ lv_all }, { lv_req_no ALPHA = OUT }| ).

    ENDLOOP.

    " one success message with all requisition numbers
    IF lv_all IS NOT INITIAL.
      APPEND new_message_with_text(
               severity = if_abap_behv_message=>severity-success
               text     = |Requisition No { lv_all } created successfully.| )
        TO reported-%other.
    ENDIF.

  ENDMETHOD.

  "------------------------------------------------------------
  " SAVE : all DB changes
  "------------------------------------------------------------
  METHOD save.

    DATA(lv_date) = cl_abap_context_info=>get_system_date( ).
    DATA(lv_user) = cl_abap_context_info=>get_user_technical_name( ).

    " creates
    IF lcl_buffer=>gt_create IS NOT INITIAL.
      INSERT zern_process FROM TABLE @( VALUE #(
               FOR ls IN lcl_buffer=>gt_create ( ls-data ) ) ).
    ENDIF.

    " updates: only fields flagged in %control
    LOOP AT lcl_buffer=>gt_update ASSIGNING FIELD-SYMBOL(<upd>).

      SELECT SINGLE *
        FROM zern_process
        WHERE werks  = @<upd>-werks
          AND req_no = @<upd>-req_no
          AND sl_no  = @<upd>-sl_no
        INTO @DATA(ls_db).
      CHECK sy-subrc = 0.

      DATA(ls_new) = CORRESPONDING zern_process(
                       BASE ( ls_db )
                       <upd>
                       MAPPING FROM ENTITY
                       USING CONTROL ).

      ls_new-last_cdate = lv_date.
      ls_new-last_cby   = lv_user.

      UPDATE zern_process FROM @ls_new.

    ENDLOOP.

    " deletes
    LOOP AT lcl_buffer=>gt_delete ASSIGNING FIELD-SYMBOL(<del>).
      DELETE FROM zern_process
        WHERE werks  = @<del>-werks
          AND req_no = @<del>-req_no
          AND sl_no  = @<del>-sl_no.
    ENDLOOP.

  ENDMETHOD.

  METHOD cleanup.
    CLEAR: lcl_buffer=>gt_create,
           lcl_buffer=>gt_update,
           lcl_buffer=>gt_delete.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.

