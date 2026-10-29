CLASS lhc_buffer DEFINITION.
* 1) define the data buffer
  PUBLIC SECTION.
    CLASS-DATA mt_buffer TYPE STANDARD TABLE OF zpmt_compliance.
**    CLASS-DATA mt_buffer1 TYPE TABLE OF zfit_icici_file.
ENDCLASS.

CLASS lhc_ZI_PM_COMPLIANCE DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_pm_compliance RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zi_pm_compliance.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zi_pm_compliance.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zi_pm_compliance.

    METHODS read FOR READ
      IMPORTING keys FOR READ zi_pm_compliance RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zi_pm_compliance.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR zi_pm_compliance RESULT result.

ENDCLASS.
*
CLASS lhc_ZI_PM_COMPLIANCE IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
*  DATA: wa_data TYPE zpmt_compliance,
*          it_data TYPE TABLE OF  zpmt_compliance.
*
*    LOOP AT entities INTO DATA(ls_entity).
*
*      CLEAR wa_data.
*
*      wa_data-zequipment          = ls_entity-Equipment.
*      wa_data-zcomptype           = ls_entity-ComplianceType.
*      wa_data-zplant              = ls_entity-Plant.
*      wa_data-zcompliance_number  = ls_entity-ComplianceNumber.
*      wa_data-zreceipt            = ls_entity-ReceiptNo.
*      wa_data-zstdate             = ls_entity-StartDate.
*      wa_data-zexptype            = ls_entity-ExpiryType.
*      wa_data-zobjecttype         = ls_entity-ObjectType.
*      wa_data-zenddate            = ls_entity-EndDate.
*      wa_data-zcurrency           = ls_entity-Currency.
*      wa_data-zamount             = ls_entity-Amount.
*      wa_data-ztax                = ls_entity-Tax.
*      wa_data-ztotal              = ls_entity-Total.
*      wa_data-zstate              = ls_entity-State.
*      wa_data-zowner              = ls_entity-OwnerName.
*      wa_data-zdms                = ls_entity-DMS.
*      wa_data-zfile               = ls_entity-FileNo.
*      wa_data-zmimetype           = ls_entity-MimeType.
*      wa_data-zfilename           = ls_entity-FileName.
*      wa_data-zremark             = ls_entity-Remark.
*      wa_data-zinstype            = ls_entity-InsuranceType.
*      wa_data-zinscompany         = ls_entity-InsuranceCompany.
*      wa_data-zpolicyno           = ls_entity-PolicyNo.
*      wa_data-zidv                = ls_entity-IDV.
*      wa_data-zpolicytype         = ls_entity-PolicyType.
*      wa_data-zfuncationllocation = ls_entity-FunctionalLocation.
*      wa_data-zflagcu             = ls_entity-FlagCU.
*      wa_data-zflag               = ls_entity-Flag.
*
*
*      APPEND wa_data TO lhc_buffer=>mt_buffer.
*      CLEAR wa_data.
*    ENDLOOP.
*    MODIFY zpmt_compliance FROM TABLE @it_data.

    DATA: wa_data TYPE zpmt_compliance,
          it_data TYPE TABLE OF zpmt_compliance.

    DATA: lv_max_num TYPE numc4,                                   "001+
          lv_running TYPE numc4.                                   "001+

    LOOP AT entities INTO DATA(ls_entity).

      CLEAR wa_data.

      wa_data-zequipment          = ls_entity-Equipment.
      wa_data-zcomptype           = ls_entity-ComplianceType.
      wa_data-zplant              = ls_entity-Plant.
      wa_data-zcompliance_number  = ls_entity-ComplianceNumber.
      wa_data-zreceipt            = ls_entity-ReceiptNo.

      if ls_entity-ComplianceType = 'DRIVER'.
      wa_data-zstdate             = ls_entity-Zdriverfromdate.
      wa_data-zenddate            = ls_entity-Zdrivertodate.
      else.
      wa_data-zstdate             = ls_entity-StartDate.
      wa_data-zenddate            = ls_entity-EndDate.
      endif.
      wa_data-zexptype            = ls_entity-ExpiryType.
      wa_data-zobjecttype         = ls_entity-ObjectType.
      wa_data-zcurrency           = ls_entity-Currency.
      wa_data-zamount             = ls_entity-Amount.
      wa_data-ztax                = ls_entity-Tax.
      wa_data-ztotal              = ls_entity-Total.
      wa_data-zstate              = ls_entity-State.
      wa_data-zowner              = ls_entity-OwnerName.
      wa_data-zdms                = ls_entity-DMS.
      wa_data-zfile               = ls_entity-FileNo.
      wa_data-zmimetype           = ls_entity-MimeType.
      wa_data-zfilename           = ls_entity-FileName.
      wa_data-zremark             = ls_entity-Remark.
      wa_data-zinstype            = ls_entity-InsuranceType.
      wa_data-zinscompany         = ls_entity-InsuranceCompany.
      wa_data-zpolicyno           = ls_entity-PolicyNo.
      wa_data-zidv                = ls_entity-IDV.
      wa_data-zpolicytype         = ls_entity-PolicyType.
      wa_data-zfuncationllocation = ls_entity-FunctionalLocation.
      wa_data-zflagcu             = ls_entity-FlagCU.
      wa_data-zflag               = ls_entity-Flag.
      wa_data-zdrivername = ls_entity-Zdrivername.
      wa_data-zdriveradhar = ls_entity-zdriveradhar.
      wa_data-zdrivelicanceno = ls_entity-zdrivelicanceno.
      wa_data-zdrivertodate = ls_entity-zdrivertodate.
      wa_data-zdriverfromdate = ls_entity-zdriverfromdate.

      wa_data-createdby           = sy-uname.
      wa_data-createdon           = sy-datum.
      wa_data-changedby           = sy-uname.
      wa_data-changedon           = sy-datum.

      APPEND wa_data TO it_data.
      CLEAR wa_data.
    ENDLOOP.

*   --- ComplianceType-wise sequential ComplianceNumber generation ---   "001+
    SORT it_data BY zcomptype.                                          "001+

    LOOP AT it_data ASSIGNING FIELD-SYMBOL(<fs_item>)                   "001+
         GROUP BY <fs_item>-zcomptype INTO DATA(lv_type).               "001+

*     1) Max serial already saved in DB for this ComplianceType
      SELECT SINGLE MAX(
               CAST( substring( zcompliance_number,
                                 LENGTH( zcompliance_number ) - 3, 4 ) AS NUMC ) )
        FROM zpmt_compliance
        WHERE zcomptype = @lv_type
        INTO @lv_max_num.

*     2) Max serial already sitting in buffer (same LUW, not yet saved)
      LOOP AT lhc_buffer=>mt_buffer INTO DATA(ls_buf)
           WHERE zcomptype = lv_type.

        DATA(lv_buf_num) = CONV numc4(
          substring( val = ls_buf-zcompliance_number
                     off = strlen( ls_buf-zcompliance_number ) - 3
                     len = 4 ) ).

        IF lv_buf_num > lv_max_num.
          lv_max_num = lv_buf_num.
        ENDIF.
      ENDLOOP.

      lv_running = lv_max_num.

      LOOP AT GROUP lv_type ASSIGNING FIELD-SYMBOL(<fs_group_item>).
        lv_running = lv_running + 1.
        <fs_group_item>-zcompliance_number = |{ lv_type }-{ lv_running }|.
      ENDLOOP.

    ENDLOOP.
*   --- end ComplianceNumber generation ---                             "001+

    APPEND LINES OF it_data TO lhc_buffer=>mt_buffer.

  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.

  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_PM_COMPLIANCE DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_PM_COMPLIANCE IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  DATA: it_buffer TYPE TABLE OF zpmt_compliance,
          wa_buffer TYPE zpmt_compliance.

    IF lhc_buffer=>mt_buffer IS NOT INITIAL .
      it_buffer = lhc_buffer=>mt_buffer.
      LOOP AT it_buffer INTO wa_buffer.
        MODIFY zpmt_compliance FROM @wa_buffer.
        CLEAR wa_buffer.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.

*CLASS lhc_ZI_PM_COMPLIANCE IMPLEMENTATION.
*
*  METHOD get_instance_authorizations.
*  ENDMETHOD.
*
*  METHOD create.
*
*    DATA : it_data TYPE STANDARD TABLE OF zpmt_compliance,
*         wa_data TYPE zpmt_compliance.
*
*    LOOP AT entities INTO DATA(ls_entity).
*
*      CLEAR wa_data.
*
*      wa_data-zequipment          = ls_entity-Equipment.
*      wa_data-zcomptype           = ls_entity-ComplianceType.
*      wa_data-zcompliance_number  = ls_entity-ComplianceNumber.
*      wa_data-zreceipt            = ls_entity-ReceiptNo.
*      wa_data-zstdate             = ls_entity-StartDate.
*      wa_data-zexptype            = ls_entity-ExpiryType.
*      wa_data-zenddate            = ls_entity-EndDate.
*      wa_data-zcurrency           = ls_entity-Currency.
*      wa_data-zamount             = ls_entity-Amount.
*      wa_data-ztax                = ls_entity-Tax.
*      wa_data-ztotal              = ls_entity-Total.
*      wa_data-zstate              = ls_entity-State.
*      wa_data-zowner              = ls_entity-OwnerName.
*      wa_data-zdms                = ls_entity-DMS.
*      wa_data-zfile               = ls_entity-FileNo.
*      wa_data-zmimetype           = ls_entity-MimeType.
*      wa_data-zfilename           = ls_entity-FileName.
*      wa_data-zremark             = ls_entity-Remark.
*      wa_data-zinstype            = ls_entity-InsuranceType.
*      wa_data-zinscompany         = ls_entity-InsuranceCompany.
*      wa_data-zpolicyno           = ls_entity-PolicyNo.
*      wa_data-zidv                = ls_entity-IDV.
*      wa_data-zpolicytype         = ls_entity-PolicyType.
*      wa_data-zflagcu             = ls_entity-FlagCU.
*      wa_data-zflag               = ls_entity-Flag.
*
*
*      APPEND wa_data TO lhc_buffer=>mt_buffer.
*      CLEAR wa_data.
*    ENDLOOP.
**    MODIFY zpmt_compliance FROM TABLE @it_data.
*
*  ENDMETHOD.
*
*
*
*  METHOD update.
*
*  ENDMETHOD.
*
*
*
*  METHOD delete.
*
*  ENDMETHOD.
*
*
*
*  METHOD read.
*
*  ENDMETHOD.
*
*
*
*  METHOD lock.
*  ENDMETHOD.
*
*ENDCLASS.
*CLASS lsc_ZI_PM_COMPLIANCE IMPLEMENTATION.
*
*  METHOD finalize.
*  ENDMETHOD.
*
*  METHOD check_before_save.
*  ENDMETHOD.
*
*  METHOD save.
*  ENDMETHOD.
*
*  METHOD cleanup.
*  ENDMETHOD.
*
*  METHOD cleanup_finalize.
*  ENDMETHOD.
*
*ENDCLASS.
