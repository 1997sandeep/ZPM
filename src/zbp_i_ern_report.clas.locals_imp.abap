CLASS lhc_ZI_ERN_REPORT DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR zi_ern_report RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR zi_ern_report RESULT result.

    METHODS create FOR MODIFY
       entities FOR CREATE zi_ern_report.

    METHODS update FOR MODIFY
       entities FOR UPDATE zi_ern_report.

    METHODS delete FOR MODIFY
       keys FOR DELETE zi_ern_report.

    METHODS read FOR READ
       keys FOR READ zi_ern_report RESULT result.

    METHODS lock FOR LOCK
       keys FOR LOCK zi_ern_report.

ENDCLASS.

CLASS lhc_ZI_ERN_REPORT IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.
  loop at entities ASSIGNING FIELD-SYMBOL(<fs>).
  if 1 = 1.
  ENDIF.
  ENDLOOP.
  ENDMETHOD.

  METHOD update.
   if 1 = 1.
  ENDIF.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_ERN_REPORT DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_ERN_REPORT IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
