CLASS lhc_ZPM_RTPINS DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zpm_rtpins RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zpm_rtpins.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zpm_rtpins.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zpm_rtpins.

    METHODS read FOR READ
      IMPORTING keys FOR READ zpm_rtpins RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zpm_rtpins.

ENDCLASS.

CLASS lhc_ZPM_RTPINS IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
      DATA: lt_equip  TYPE STANDARD TABLE OF zpmequip,
          lv_date   TYPE string,
          lv_date_1 TYPE string,
          ls_equip  TYPE zpmequip.

*    SELECT * FROM zpm_equipments INTO TABLE @lt_equip.
*    LOOP AT lt_equip INTO DATA(ls_mb).
*    DELETE zpm_equipments FROM @ls_mb.
*    ENDLOOP.
*    SELECT * FROM zequip_changelog INTO TABLE @data(lt_id).
*    LOOP AT lt_id INTO DATA(ls_mb).
*    DELETE zequip_changelog FROM @ls_mb.
*    ENDLOOP.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<ls_equip>).
    MOVE-CORRESPONDING <ls_equip> to ls_equip.
       ls_equip-zequipment_id = <ls_equip>-Equipment.
       ls_equip-zequipment_desc = <ls_equip>-EquipmentName.
       ls_equip-zinsurance = <ls_equip>-zinsurance.
       ls_equip-zremarks = <ls_equip>-zremarks.


              IF ls_equip-zinsurance EQ 'APPLICABLE'.
       ls_equip-zinval = <ls_equip>-zinval.
       ELSE.
       CLEAR ls_equip-zinval .
       ENDIF.
       ls_equip-zregcer = <ls_equip>-zregcer.
       IF ls_equip-zregcer EQ 'APPLICABLE'.
       ls_equip-zregcrval = <ls_equip>-zregcrval.
       ELSE.
       CLEAR ls_equip-zregcrval.
       ENDIF.
       ls_equip-zhypo = <ls_equip>-zhypo.
       ls_equip-zroadtax = <ls_equip>-zroadtax.
       IF ls_equip-zroadtax EQ 'APPLICABLE'.
       ls_equip-zroadval = <ls_equip>-zroadval.
       ELSE.
       CLEAR ls_equip-zroadval .
       ENDIF.
       ls_equip-zgrtax = <ls_equip>-zgrtax.
       IF ls_equip-zgrtax EQ 'APPLICABLE'.
       ls_equip-zgrtaxval = <ls_equip>-zgrtaxval.
       ELSE.
       CLEAR ls_equip-zgrtaxval.
       ENDIF.
       ls_equip-zroadper = <ls_equip>-zroadper.
       IF ls_equip-zroadper  EQ 'APPLICABLE'.
       ls_equip-zroadperval = <ls_equip>-zroadperval.
       ELSE.
       CLEAR  ls_equip-zroadperval.
       ENDIF.
       ls_equip-zpuc = <ls_equip>-zpuc.
        IF ls_equip-zpuc EQ 'APPLICABLE'.
       ls_equip-zpucval = <ls_equip>-zpucval.
       ELSE.
       CLEAR ls_equip-zpucval.
       ENDIF.
       ls_equip-zfitness = <ls_equip>-zfitness.
        IF ls_equip-zfitness EQ 'APPLICABLE'.
       ls_equip-zfitval  = <ls_equip>-zfitval .
       ELSE.
       CLEAR ls_equip-zfitval.
       ENDIF.
       ls_equip-znoc  = <ls_equip>-znoc .
      IF ls_equip-znoc EQ 'APPLICABLE'.
       ls_equip-znocval  = <ls_equip>-znocval .
       ELSE.
       CLEAR ls_equip-znocval .
       ENDIF.
       ls_equip-zpmcal  = <ls_equip>-zpmcal .
         IF  ls_equip-zpmcal EQ 'APPLICABLE'.
       ls_equip-zcalval  = <ls_equip>-zcalval .
       ELSE.
       CLEAR ls_equip-zcalval.
       ENDIF.
       ls_equip-zpmwar  = <ls_equip>-zpmwar .
      IF ls_equip-zpmwar  EQ 'APPLICABLE'.
         ls_equip-zwarval   = <ls_equip>-zwarval  .
         ELSE.
       CLEAR ls_equip-zwarval.
       ENDIF.
       ls_equip-zind   = 'X' .
   IF ls_equip-zinsurance = 'NOT APPLICABLE'.
   clear ls_equip-zinval.
   ENDIF.

      ls_equip-zins_comp = <ls_equip>-zins_comp.
      ls_equip-zins_num = <ls_equip>-zins_num.
      ls_equip-zinv_num = <ls_equip>-zinv_num.

*      ls_equip-zentaxdate = <ls_equip>-Zentaxdate.
*      lv_date = <ls_equip>-Zentaxdate.
*      SPLIT lv_date AT '-' INTO:  DATA(day) DATA(month) DATA(year).
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zentaxdate1  = lv_date_1.
*      ls_equip-zentaxsdate     = <ls_equip>-Zentaxsdate.
*      lv_date = <ls_equip>-Zentaxsdate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zentaxsdate1   = lv_date_1.
*      ls_equip-zentaxedate = <ls_equip>-Zentaxedate.
*      lv_date = <ls_equip>-Zentaxedate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zentaxedate1   = lv_date_1.
*      ls_equip-zequipment_desc = <ls_equip>-ZequipmentDesc.
*      ls_equip-zequipment_id = <ls_equip>-ZequipmentId.
*      ls_equip-zfitnessedate = <ls_equip>-Zfitnessedate.
*      lv_date = <ls_equip>-Zfitnessedate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zfitnessedate1   = lv_date_1.
*      ls_equip-zfitnesssdate = <ls_equip>-Zfitnesssdate.
*      lv_date = <ls_equip>-Zfitnesssdate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zfitnesssdate1   = lv_date_1.
*      ls_equip-zidv = <ls_equip>-Zidv.
*      ls_equip-zinsodedate    = <ls_equip>-Zinsodedate.
*      lv_date = <ls_equip>-Zinsodedate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zinsodedate1   = lv_date_1.
*      ls_equip-zinsodsdate    = <ls_equip>-Zinsodsdate.
*      lv_date = <ls_equip>-Zinsodsdate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zinsodsdate1    = lv_date_1.
*      ls_equip-zinsplace    = <ls_equip>-Zinsplace.
*      ls_equip-zinstpedate    = <ls_equip>-Zinstpedate.
*      lv_date =   <ls_equip>-Zinstpedate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zinstpedate1   = lv_date_1.
*      ls_equip-zinstpsdate    = <ls_equip>-Zinstpsdate.
*      lv_date =   <ls_equip>-Zinstpsdate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zinstpsdate1  = lv_date_1.
*      ls_equip-zinsuco    = <ls_equip>-Zinsuco.
*      ls_equip-zobjtyp    = <ls_equip>-Zobjtyp.
*      ls_equip-zpermitedate    = <ls_equip>-Zpermitedate.
*      lv_date =   <ls_equip>-Zpermitedate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zpermitedate1   = lv_date_1.
*      ls_equip-zpucno = <ls_equip>-Zpucno.
*      ls_equip-zpucsdate = <ls_equip>-Zpucsdate.
*      lv_date =   <ls_equip>-Zpucsdate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zpucsdate1  = lv_date_1.
*      ls_equip-zpermitsdate    = <ls_equip>-Zpermitsdate.
*      lv_date =   <ls_equip>-Zpermitsdate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zpermitsdate1   = lv_date_1.
*      ls_equip-zplant    = <ls_equip>-Zplant.
*      ls_equip-zpolicydate    = <ls_equip>-Zpolicydate.
*      lv_date =  <ls_equip>-Zpolicydate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zpolicydate1  = lv_date_1.
*      ls_equip-zpolicyno    = <ls_equip>-Zpolicyno.
*      ls_equip-zpolicyprem    = <ls_equip>-Zpolicyprem.
*      ls_equip-zpucedate    = <ls_equip>-Zpucedate.
*      lv_date =  <ls_equip>-Zpucedate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zpucedate1  = lv_date_1.
*      ls_equip-zregdate = <ls_equip>-Zregdate.
*      lv_date = <ls_equip>-Zregdate.
*      SPLIT lv_date AT '-' INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zregdate1   = lv_date_1.
*      ls_equip-zregedate = <ls_equip>-Zregedate.
*      lv_date = <ls_equip>-Zregedate.
*      SPLIT lv_date AT '-' INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zregedate1 = lv_date_1.
*      ls_equip-zreg_no = <ls_equip>-ZregNo.
*      ls_equip-zvehtaxamt = <ls_equip>-Zvehtaxamt.
*      ls_equip-zvehtaxdate = <ls_equip>-Zvehtaxdate.
*      lv_date =  <ls_equip>-Zvehtaxdate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zvehtaxdate1 = lv_date_1.
*      ls_equip-zvehtaxedate    = <ls_equip>-Zvehtaxedate.
*      lv_date =  <ls_equip>-Zvehtaxedate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zvehtaxedate1 = lv_date_1.
*      ls_equip-zvehtaxsdate    = <ls_equip>-Zvehtaxsdate.
*      lv_date =  <ls_equip>-Zvehtaxsdate.
*      SPLIT lv_date AT  '-'  INTO:  day month year.
*      CONCATENATE  year month day INTO  lv_date_1.
*      ls_equip-zvehtaxsdate1 = lv_date_1.
*
*      ls_equip-local_created_by = sy-uname.
*      ls_equip-local_created_at = | { sy-uzeit } | && | { sy-datum } |.
      MODIFY zpmequip FROM @ls_equip.
*
*      IF <ls_equip>-Zregdate IS NOT INITIAL AND ls_equip-zregdate1 > sy-datum.
*        APPEND VALUE #( %tky                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
*        APPEND VALUE #( %tky               = <ls_equip>-%key
*                        %state_area        = 'VALIDATE_DATES'
*                         %msg              = new_message_with_text(
*                                                     text   = 'Reg Date must be on or before Today'
*                                                     severity = if_abap_behv_message=>severity-error )
*                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
*      ENDIF.
*      IF <ls_equip>-Zregedate IS NOT INITIAL AND ls_equip-zregedate1 < ls_equip-zregdate1.
*        APPEND VALUE #( %tky                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
*        APPEND VALUE #( %tky               = <ls_equip>-%key
*                        %state_area        = 'VALIDATE_DATES'
*                         %msg              = new_message_with_text(
*                                                     text   = 'Reg End Date must be after Reg Date'
*                                                     severity = if_abap_behv_message=>severity-error )
*                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
*      ENDIF.
*      IF <ls_equip>-Zentaxedate IS NOT INITIAL AND ls_equip-zentaxedate1 < ls_equip-zentaxsdate1.
*        APPEND VALUE #( %tky                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
*        APPEND VALUE #( %tky               = <ls_equip>-%key
*                        %state_area        = 'VALIDATE_DATES'
*                         %msg              = new_message_with_text(
*                                                     text   = 'Environment Tax To Date must be after Environment Tax From Date'
*                                                     severity = if_abap_behv_message=>severity-error )
*                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
*      ENDIF.
*      IF ls_equip-zfitnessedate1 < ls_equip-zfitnesssdate1 AND <ls_equip>-Zfitnesssdate IS NOT INITIAL
*                                             AND <ls_equip>-Zfitnessedate IS NOT INITIAL.
*        APPEND VALUE #( %tky                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
*        APPEND VALUE #( %tky               = <ls_equip>-%key
*                        %state_area        = 'VALIDATE_DATES'
*                         %msg              = new_message_with_text(
*                                                     text   = 'Fitness End Date must be after Fitness Start Date'
*                                                     severity = if_abap_behv_message=>severity-error )
*                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
*      ENDIF.
*      IF ls_equip-zinsodedate1 < ls_equip-zinsodsdate1 AND <ls_equip>-Zinsodsdate IS NOT INITIAL
*                                             AND <ls_equip>-Zinsodedate IS NOT INITIAL.
*        APPEND VALUE #( %tky                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
*        APPEND VALUE #( %tky               = <ls_equip>-%key
*                        %state_area        = 'VALIDATE_DATES'
*                         %msg              = new_message_with_text(
*                                                     text   = 'Insurance OD To Date must be after Insurance OD From Date'
*                                                     severity = if_abap_behv_message=>severity-error )
*                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
*      ENDIF.
*      IF ls_equip-zinstpedate1 < ls_equip-zinstpsdate1 AND <ls_equip>-Zinstpsdate IS NOT INITIAL
*                                             AND <ls_equip>-Zinstpedate IS NOT INITIAL.
*        APPEND VALUE #( %tky                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
*        APPEND VALUE #( %tky               = <ls_equip>-%key
*                        %state_area        = 'VALIDATE_DATES'
*                         %msg              = new_message_with_text(
*                                                     text   = 'Insurance TP To Date must be after Insurance TP From Date'
*                                                     severity = if_abap_behv_message=>severity-error )
*                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
*      ENDIF.
*      IF ls_equip-zpermitedate1 < ls_equip-zpermitsdate1 AND <ls_equip>-Zpermitedate IS NOT INITIAL
*                                             AND <ls_equip>-Zpermitsdate IS NOT INITIAL.
*        APPEND VALUE #( %tky                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
*        APPEND VALUE #( %tky               = <ls_equip>-%key
*                        %state_area        = 'VALIDATE_DATES'
*                         %msg              = new_message_with_text(
*                                                     text   = 'Permit End Date must be after Permit Start Date'
*                                                     severity = if_abap_behv_message=>severity-error )
*                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
*      ENDIF.
*      IF ls_equip-zpucedate1 < ls_equip-Zpucsdate1 AND <ls_equip>-Zpucedate IS NOT INITIAL
*                                             AND <ls_equip>-Zpucsdate IS NOT INITIAL.
*        APPEND VALUE #( %tky                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
*        APPEND VALUE #( %tky               = <ls_equip>-%key
*                        %state_area        = 'VALIDATE_DATES'
*                         %msg              = new_message_with_text(
*                                                     text   = 'PUC End Date must be after PUC Start Date'
*                                                     severity = if_abap_behv_message=>severity-error )
*                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
*      ENDIF.
*      IF ls_equip-zvehtaxedate1 < ls_equip-zvehtaxsdate1 AND <ls_equip>-Zvehtaxsdate IS NOT INITIAL
*                                             AND <ls_equip>-Zvehtaxedate IS NOT INITIAL.
*        APPEND VALUE #( %tky                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
*        APPEND VALUE #( %tky               = <ls_equip>-%key
*                        %state_area        = 'VALIDATE_DATES'
*                         %msg              = new_message_with_text(
*                                                     text   = 'Vehicle Tax To must be after Vehicle Tax From'
*                                                     severity = if_abap_behv_message=>severity-error )
*                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
*      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD update.
   DATA: lt_equip  TYPE STANDARD TABLE OF zpmequip,
          lv_date   TYPE string,
          lv_date_1 TYPE string,
          ls_equip  TYPE zpmequip.

        LOOP AT entities ASSIGNING FIELD-SYMBOL(<ls_equip>).
       ls_equip-zequipment_id = <ls_equip>-Equipment.
       ls_equip-zequipment_desc = <ls_equip>-EquipmentName.
       ls_equip-zinsurance = <ls_equip>-zinsurance.
       ls_equip-zremarks = <ls_equip>-zremarks.
       IF ls_equip-zinsurance EQ 'APPLICABLE'.
       ls_equip-zinval = <ls_equip>-zinval.
        ELSE.
       CLEAR ls_equip-zinval .
       ENDIF.
       ls_equip-zregcer = <ls_equip>-zregcer.
       IF ls_equip-zregcer EQ 'APPLICABLE'.
       ls_equip-zregcrval = <ls_equip>-zregcrval.
       ELSE.
       CLEAR ls_equip-zregcrval.
       ENDIF.
       ls_equip-zhypo = <ls_equip>-zhypo.
       ls_equip-zroadtax = <ls_equip>-zroadtax.
       IF ls_equip-zroadtax EQ 'APPLICABLE'.
       ls_equip-zroadval = <ls_equip>-zroadval.
       ELSE.
       CLEAR ls_equip-zroadval .
       ENDIF.
       ls_equip-zgrtax = <ls_equip>-zgrtax.
       IF ls_equip-zgrtax EQ 'APPLICABLE'.
       ls_equip-zgrtaxval = <ls_equip>-zgrtaxval.
       ELSE.
       CLEAR ls_equip-zgrtaxval.
       ENDIF.
       ls_equip-zroadper = <ls_equip>-zroadper.
       IF ls_equip-zroadper  EQ 'APPLICABLE'.
       ls_equip-zroadperval = <ls_equip>-zroadperval.
        ELSE.
       CLEAR  ls_equip-zroadperval.
       ENDIF.
       ls_equip-zpuc = <ls_equip>-zpuc.
       IF ls_equip-zpuc EQ 'APPLICABLE'.
       ls_equip-zpucval = <ls_equip>-zpucval.
        ELSE.
       CLEAR ls_equip-zpucval.
       ENDIF.
       ls_equip-zfitness = <ls_equip>-zfitness.
       IF ls_equip-zfitness EQ 'APPLICABLE'.
       ls_equip-zfitval  = <ls_equip>-zfitval .
       ELSE.
       CLEAR ls_equip-zfitval.
       ENDIF.
       ls_equip-znoc  = <ls_equip>-znoc .
       IF ls_equip-znoc EQ 'APPLICABLE'.
       ls_equip-znocval  = <ls_equip>-znocval .
        ELSE.
       CLEAR ls_equip-znocval .
       ENDIF.
       ls_equip-zpmcal  = <ls_equip>-zpmcal .
       IF  ls_equip-zpmcal EQ 'APPLICABLE'.
       ls_equip-zcalval  = <ls_equip>-zcalval .
       ELSE.
       CLEAR ls_equip-zcalval.
       ENDIF.
       ls_equip-zpmwar  = <ls_equip>-zpmwar .
       IF ls_equip-zpmwar  EQ 'APPLICABLE'.
         ls_equip-zwarval   = <ls_equip>-zwarval  .
         ELSE.
       CLEAR ls_equip-zwarval.
       ENDIF.
        MODIFY zpmequip FROM @ls_equip.
      ENDLOOP.

  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZPM_RTPINS DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZPM_RTPINS IMPLEMENTATION.

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
