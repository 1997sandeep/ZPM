CLASS lhc_zpm_c_equip_unmanage DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zpm_c_equip_unmanage RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zpm_c_equip_unmanage.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zpm_c_equip_unmanage.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zpm_c_equip_unmanage.

    METHODS read FOR READ
      IMPORTING keys FOR READ zpm_c_equip_unmanage RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zpm_c_equip_unmanage.

ENDCLASS.

CLASS lhc_zpm_c_equip_unmanage IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    DATA: lt_equip  TYPE STANDARD TABLE OF zpm_equipments,
          lv_date   TYPE string,
          lv_date_1 TYPE string,
          ls_equip  TYPE zpm_equipments.

*    SELECT * FROM zpm_equipments INTO TABLE @lt_equip.
*    LOOP AT lt_equip INTO DATA(ls_mb).
*    DELETE zpm_equipments FROM @ls_mb.
*    ENDLOOP.
*    SELECT * FROM zequip_changelog INTO TABLE @data(lt_id).
*    LOOP AT lt_id INTO DATA(ls_mb).
*    DELETE zequip_changelog FROM @ls_mb.
*    ENDLOOP.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<ls_equip>).
      ls_equip-remarks = <ls_equip>-Remarks.
      ls_equip-remarksi = <ls_equip>-RemarksIns.
*      ls_equip-zchassis_no = <ls_equip>-ZchassisNo.
      ls_equip-zclaim = <ls_equip>-Zclaim.
      ls_equip-zcurrkey = <ls_equip>-zcurrkey.
*      ls_equip-zengine_no = <ls_equip>-ZengineNo.
      ls_equip-zentaxamt = <ls_equip>-Zentaxamt.
      ls_equip-zentaxdate = <ls_equip>-Zentaxdate.
      lv_date = <ls_equip>-Zentaxdate.
      SPLIT lv_date AT '-' INTO:  DATA(day) DATA(month) DATA(year).
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zentaxdate1  = lv_date_1.
      ls_equip-zentaxsdate     = <ls_equip>-Zentaxsdate.
      lv_date = <ls_equip>-Zentaxsdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zentaxsdate1   = lv_date_1.
      ls_equip-zentaxedate = <ls_equip>-Zentaxedate.
      lv_date = <ls_equip>-Zentaxedate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zentaxedate1   = lv_date_1.
      ls_equip-zequipment_desc = <ls_equip>-ZequipmentDesc.
      ls_equip-zequipment_id = <ls_equip>-ZequipmentId.
      ls_equip-zfitnessedate = <ls_equip>-Zfitnessedate.
      lv_date = <ls_equip>-Zfitnessedate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zfitnessedate1   = lv_date_1.
      ls_equip-zfitnesssdate = <ls_equip>-Zfitnesssdate.
      lv_date = <ls_equip>-Zfitnesssdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zfitnesssdate1   = lv_date_1.
      ls_equip-zidv = <ls_equip>-Zidv.
      ls_equip-zinsodedate    = <ls_equip>-Zinsodedate.
      lv_date = <ls_equip>-Zinsodedate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zinsodedate1   = lv_date_1.
      ls_equip-zinsodsdate    = <ls_equip>-Zinsodsdate.
      lv_date = <ls_equip>-Zinsodsdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zinsodsdate1    = lv_date_1.
      ls_equip-zinsplace    = <ls_equip>-Zinsplace.
      ls_equip-zinstpedate    = <ls_equip>-Zinstpedate.
      lv_date =   <ls_equip>-Zinstpedate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zinstpedate1   = lv_date_1.
      ls_equip-zinstpsdate    = <ls_equip>-Zinstpsdate.
      lv_date =   <ls_equip>-Zinstpsdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zinstpsdate1  = lv_date_1.
      ls_equip-zinsuco    = <ls_equip>-Zinsuco.
      ls_equip-zobjtyp    = <ls_equip>-Zobjtyp.
      ls_equip-zpermitedate    = <ls_equip>-Zpermitedate.
      lv_date =   <ls_equip>-Zpermitedate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zpermitedate1   = lv_date_1.
      ls_equip-zpucno = <ls_equip>-Zpucno.
      ls_equip-zpucsdate = <ls_equip>-Zpucsdate.
      lv_date =   <ls_equip>-Zpucsdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zpucsdate1  = lv_date_1.
      ls_equip-zpermitsdate    = <ls_equip>-Zpermitsdate.
      lv_date =   <ls_equip>-Zpermitsdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zpermitsdate1   = lv_date_1.
      ls_equip-zplant    = <ls_equip>-Zplant.
      ls_equip-zpolicydate    = <ls_equip>-Zpolicydate.
      lv_date =  <ls_equip>-Zpolicydate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zpolicydate1  = lv_date_1.
      ls_equip-zpolicyno    = <ls_equip>-Zpolicyno.
      ls_equip-zpolicyprem    = <ls_equip>-Zpolicyprem.
      ls_equip-zpucedate    = <ls_equip>-Zpucedate.
      lv_date =  <ls_equip>-Zpucedate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zpucedate1  = lv_date_1.
      ls_equip-zregdate = <ls_equip>-Zregdate.
      lv_date = <ls_equip>-Zregdate.
      SPLIT lv_date AT '-' INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zregdate1   = lv_date_1.
      ls_equip-zregedate = <ls_equip>-Zregedate.
      lv_date = <ls_equip>-Zregedate.
      SPLIT lv_date AT '-' INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zregedate1 = lv_date_1.
      ls_equip-zreg_no = <ls_equip>-ZregNo.
      ls_equip-zvehtaxamt = <ls_equip>-Zvehtaxamt.
      ls_equip-zvehtaxdate = <ls_equip>-Zvehtaxdate.
      lv_date =  <ls_equip>-Zvehtaxdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zvehtaxdate1 = lv_date_1.
      ls_equip-zvehtaxedate    = <ls_equip>-Zvehtaxedate.
      lv_date =  <ls_equip>-Zvehtaxedate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zvehtaxedate1 = lv_date_1.
      ls_equip-zvehtaxsdate    = <ls_equip>-Zvehtaxsdate.
      lv_date =  <ls_equip>-Zvehtaxsdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zvehtaxsdate1 = lv_date_1.

      ls_equip-local_created_by = sy-uname.
      ls_equip-local_created_at = | { sy-uzeit } | && | { sy-datum } |.
      INSERT zpm_equipments FROM @ls_equip.

      IF <ls_equip>-Zregdate IS NOT INITIAL AND ls_equip-zregdate1 > sy-datum.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Reg Date must be on or before Today'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF <ls_equip>-Zregedate IS NOT INITIAL AND ls_equip-zregedate1 < ls_equip-zregdate1.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Reg End Date must be after Reg Date'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF <ls_equip>-Zentaxedate IS NOT INITIAL AND ls_equip-zentaxedate1 < ls_equip-zentaxsdate1.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Environment Tax To Date must be after Environment Tax From Date'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF ls_equip-zfitnessedate1 < ls_equip-zfitnesssdate1 AND <ls_equip>-Zfitnesssdate IS NOT INITIAL
                                             AND <ls_equip>-Zfitnessedate IS NOT INITIAL.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Fitness End Date must be after Fitness Start Date'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF ls_equip-zinsodedate1 < ls_equip-zinsodsdate1 AND <ls_equip>-Zinsodsdate IS NOT INITIAL
                                             AND <ls_equip>-Zinsodedate IS NOT INITIAL.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Insurance OD To Date must be after Insurance OD From Date'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF ls_equip-zinstpedate1 < ls_equip-zinstpsdate1 AND <ls_equip>-Zinstpsdate IS NOT INITIAL
                                             AND <ls_equip>-Zinstpedate IS NOT INITIAL.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Insurance TP To Date must be after Insurance TP From Date'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF ls_equip-zpermitedate1 < ls_equip-zpermitsdate1 AND <ls_equip>-Zpermitedate IS NOT INITIAL
                                             AND <ls_equip>-Zpermitsdate IS NOT INITIAL.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Permit End Date must be after Permit Start Date'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF ls_equip-zpucedate1 < ls_equip-Zpucsdate1 AND <ls_equip>-Zpucedate IS NOT INITIAL
                                             AND <ls_equip>-Zpucsdate IS NOT INITIAL.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'PUC End Date must be after PUC Start Date'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF ls_equip-zvehtaxedate1 < ls_equip-zvehtaxsdate1 AND <ls_equip>-Zvehtaxsdate IS NOT INITIAL
                                             AND <ls_equip>-Zvehtaxedate IS NOT INITIAL.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Vehicle Tax To must be after Vehicle Tax From'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD update.
    DATA: lt_equip        TYPE STANDARD TABLE OF zpm_equipments,
          ls_equip        TYPE zpm_equipments,
          lt_log          TYPE STANDARD TABLE OF zequip_changelog,
          ls_log          TYPE zequip_changelog,
          lv_date         TYPE string,
          lv_date_1       TYPE string,
          lv_previous(30) TYPE c,
          lv_present(30)  TYPE c,
          lv_field(30)    TYPE c.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<ls_equip>).

* Logic for Reading previous value
*SELECT SINGLE * FROM zpm_equipmentsid INTO @DATA(lw_id).
*     if  sy-subrc = 0.
*        if lo_ran->get_next( ) = 0.
*        lo_ran->get_next( ) = 1.
*        ELSE.
*        lo_ran->get_next( )  = lo_ran->get_next( ) + 1.
*        ENDIF.
*     endif.

      SELECT SINGLE * FROM zpm_equipments WHERE zequipment_id = @<ls_equip>-ZequipmentId INTO @DATA(ls_equipment).
      DATA:
        lo_ran  TYPE REF TO cl_abap_random_int,
        lv_seed TYPE i.lv_seed = sy-timlo.
      lo_ran = cl_abap_random_int=>create( min = 1 max = 1000 seed = lv_seed ).

      lv_date = sy-datum.
      CONCATENATE lv_date+6(2) '-' lv_date+4(2) '-' lv_date+0(4) INTO  DATA(lv_date_2).
      DATA(lv_time) = sy-uzeit.
      CONCATENATE lv_time+0(2) ':' lv_time+2(2) ':' lv_time+4(2) INTO  DATA(lv_time_2).

      IF  sy-subrc = 0.

        IF <ls_equip>-Zclaim NE ls_equipment-Zclaim.
          lv_previous =  ls_equipment-Zclaim.
          lv_present =  <ls_equip>-Zclaim.
          lv_field = 'Claim Bonus'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zentaxamt NE ls_equipment-zentaxamt.
          lv_previous =  ls_equipment-zentaxamt.
          lv_present =  <ls_equip>-Zentaxamt.
          lv_field = 'Environment Tax Amount'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zregdate NE ls_equipment-Zregdate.
          lv_previous =  ls_equipment-Zregdate.
          lv_present =  <ls_equip>-Zregdate.
          lv_field = 'Vehicle Registration Date'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zvehtaxamt NE ls_equipment-Zvehtaxamt.
          lv_previous =  ls_equipment-Zvehtaxamt.
          lv_present =  <ls_equip>-Zvehtaxamt.
          lv_field = 'Vehicle Tax Amount'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zpermitsdate NE ls_equipment-Zpermitsdate.
          lv_previous =  ls_equipment-Zpermitsdate.
          lv_present =  <ls_equip>-Zpermitsdate.
          lv_field = 'Permit Start'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zregedate NE ls_equipment-Zregedate.
          lv_previous =  ls_equipment-Zregedate.
          lv_present =  <ls_equip>-Zregedate.
          lv_field = 'Registration End Date'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zvehtaxdate NE ls_equipment-Zvehtaxdate.
          lv_previous = ls_equipment-Zvehtaxdate.
          lv_present =  <ls_equip>-Zvehtaxdate.
          lv_field = 'Vehicle Tax Paid Date'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zentaxdate NE ls_equipment-Zentaxdate.
          lv_previous = ls_equipment-Zentaxdate.
          lv_present =  <ls_equip>-Zentaxdate.
          lv_field = 'Environment Tax Paid Date'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zpermitedate NE ls_equipment-Zpermitedate.
          lv_previous = ls_equipment-Zpermitedate.
          lv_present =  <ls_equip>-Zpermitedate.
          lv_field = 'Permit End'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zpucedate NE ls_equipment-Zpucedate.
          lv_previous =  ls_equipment-Zpucedate.
          lv_present =  <ls_equip>-Zpucedate.
          lv_field = 'PUC End'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zfitnesssdate NE ls_equipment-Zfitnesssdate.
          lv_previous =  ls_equipment-Zfitnesssdate.
          lv_present =  <ls_equip>-Zfitnesssdate.
          lv_field = 'Fitness Start'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zfitnessedate NE ls_equipment-Zfitnessedate.
          lv_previous =  ls_equipment-Zfitnessedate.
          lv_present =  <ls_equip>-Zfitnessedate.
          lv_field = 'Fitness End'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zvehtaxsdate NE ls_equipment-Zvehtaxsdate.
          lv_previous =  ls_equipment-Zvehtaxsdate.
          lv_present =  <ls_equip>-Zvehtaxsdate.
          lv_field = 'Vehicle Tax From'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zvehtaxedate NE ls_equipment-Zvehtaxedate.
          lv_previous =  ls_equipment-Zvehtaxedate.
          lv_present =  <ls_equip>-Zvehtaxedate.
          lv_field = 'Vehicle Tax To'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zentaxsdate NE ls_equipment-Zentaxsdate.
          lv_previous =  ls_equipment-Zentaxsdate.
          lv_present =  <ls_equip>-Zentaxsdate.
          lv_field = 'Environment Tax From'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zentaxedate NE ls_equipment-Zentaxedate.
          lv_previous =  ls_equipment-Zentaxedate.
          lv_present =  <ls_equip>-Zentaxedate.
          lv_field = 'Environment Tax To'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zpucno NE ls_equipment-zpucno.
          lv_previous =  ls_equipment-Zpucno.
          lv_present =  <ls_equip>-Zpucno.
          lv_field = 'PUC No.'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zpucsdate NE ls_equipment-Zpucsdate.
          lv_previous =  ls_equipment-Zpucsdate.
          lv_present =  <ls_equip>-Zpucsdate.
          lv_field = 'PUC Start'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zinsuco NE ls_equipment-Zinsuco.
          lv_previous =  ls_equipment-Zinsuco.
          lv_present =  <ls_equip>-Zinsuco.
          lv_field = 'Insurance Company'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zpolicyno NE ls_equipment-Zpolicyno.
          lv_previous =  ls_equipment-Zpolicyno.
          lv_present =  <ls_equip>-Zpolicyno.
          lv_field = 'Policy No.'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zidv NE ls_equipment-Zidv.
          lv_previous =  ls_equipment-Zidv.
          lv_present =  <ls_equip>-Zidv.
          lv_field = 'IDV Rs'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zinstpsdate NE ls_equipment-Zinstpsdate.
          lv_previous =  ls_equipment-Zinstpsdate.
          lv_present =  <ls_equip>-Zinstpsdate.
          lv_field = 'Insurance TP From'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zinstpedate NE ls_equipment-Zinstpedate.
          lv_previous =  ls_equipment-Zinstpedate.
          lv_present =  <ls_equip>-Zinstpedate.
          lv_field = 'Insurance TP To'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zpolicydate NE ls_equipment-Zpolicydate.
          lv_previous =  ls_equipment-Zpolicydate.
          lv_present =  <ls_equip>-Zpolicydate.
          lv_field = 'Policy Issue Date'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zpolicyprem NE ls_equipment-Zpolicyprem.
          lv_previous =  ls_equipment-Zpolicyprem.
          lv_present =  <ls_equip>-Zpolicyprem.
          lv_field = 'Policy Premium'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zinsplace NE ls_equipment-Zinsplace.
          lv_previous =  ls_equipment-Zinsplace.
          lv_present =  <ls_equip>-Zinsplace.
          lv_field = 'Insurance Place'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zinsodsdate NE ls_equipment-Zinsodsdate.
          lv_previous =  ls_equipment-Zinsodsdate.
          lv_present =  <ls_equip>-Zinsodsdate.
          lv_field = 'Insurance OD From'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

        IF <ls_equip>-Zinsodedate NE ls_equipment-Zinsodedate.
          lv_previous = ls_equipment-Zinsodedate .
          lv_present =  <ls_equip>-Zinsodedate.
          lv_field = 'Insurance OD To'.
          IF sy-subrc = 0.
            ls_log-id = lo_ran->get_next( ).
            ls_log-zequipment_id = ls_equipment-zequipment_id.
            ls_log-fieldname = lv_field.
            ls_log-present = lv_present.
            ls_log-previous = lv_previous.
            ls_log-local_last_changed_at = | { lv_time_2 } | && | { lv_date_2 } |.
            ls_log-local_last_changed_by = sy-uname.
            INSERT zequip_changelog FROM @ls_log.
          ENDIF.
        ENDIF.

*if sy-subrc = 0.
*ls_log-id = lo_ran->get_next( ).
*ls_log-zequipment_id = ls_equipment-zequipment_id.
*ls_log-fieldname = lv_field.
*ls_log-present = lv_present.
*ls_log-previous = lv_previous.
*ls_log-local_last_changed_at = | { sy-uzeit } | && | { sy-datum } |.
*ls_log-local_last_changed_by = sy-uname.
*INSERT zequip_changelog FROM @ls_log.
*endif.
      ENDIF.

      ls_equip-remarks = <ls_equip>-Remarks.
      ls_equip-remarksi = <ls_equip>-RemarksIns.
*      ls_equip-zchassis_no = <ls_equip>-ZchassisNo.
      ls_equip-zclaim = <ls_equip>-Zclaim.
      ls_equip-zcurrkey = <ls_equip>-zcurrkey.
*      ls_equip-zengine_no = <ls_equip>-ZengineNo.
      ls_equip-zentaxamt = <ls_equip>-Zentaxamt.

      ls_equip-zentaxdate = <ls_equip>-Zentaxdate.
      lv_date = <ls_equip>-Zentaxdate.
      SPLIT lv_date AT '-' INTO:  DATA(day) DATA(month) DATA(year).
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zentaxdate1  = lv_date_1.

      ls_equip-zentaxsdate     = <ls_equip>-Zentaxsdate.
      lv_date = <ls_equip>-Zentaxsdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zentaxsdate1   = lv_date_1.

      ls_equip-zentaxedate = <ls_equip>-Zentaxedate.
      lv_date = <ls_equip>-Zentaxedate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zentaxedate1   = lv_date_1.

      ls_equip-zequipment_desc = <ls_equip>-ZequipmentDesc.
      ls_equip-zequipment_id = <ls_equip>-ZequipmentId.

      ls_equip-zfitnessedate = <ls_equip>-Zfitnessedate.
      lv_date = <ls_equip>-Zfitnessedate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zfitnessedate1   = lv_date_1.

      ls_equip-zfitnesssdate = <ls_equip>-Zfitnesssdate.
      lv_date = <ls_equip>-Zfitnesssdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zfitnesssdate1   = lv_date_1.

      ls_equip-zidv = <ls_equip>-Zidv.

      ls_equip-zinsodedate    = <ls_equip>-Zinsodedate.
      lv_date = <ls_equip>-Zinsodedate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zinsodedate1   = lv_date_1.

      ls_equip-zinsodsdate    = <ls_equip>-Zinsodsdate.
      lv_date = <ls_equip>-Zinsodsdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zinsodsdate1    = lv_date_1.

      ls_equip-zinsplace    = <ls_equip>-Zinsplace.

      ls_equip-zinstpedate    = <ls_equip>-Zinstpedate.
      lv_date =   <ls_equip>-Zinstpedate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zinstpedate1   = lv_date_1.

      ls_equip-zinstpsdate    = <ls_equip>-Zinstpsdate.
      lv_date =   <ls_equip>-Zinstpsdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zinstpsdate1  = lv_date_1.

      ls_equip-zinsuco    = <ls_equip>-Zinsuco.
      ls_equip-zobjtyp    = <ls_equip>-Zobjtyp.

      ls_equip-zpermitedate    = <ls_equip>-Zpermitedate.
      lv_date =   <ls_equip>-Zpermitedate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zpermitedate1   = lv_date_1.

      ls_equip-zpucno = <ls_equip>-Zpucno.

      ls_equip-zpucsdate = <ls_equip>-Zpucsdate.
      lv_date =   <ls_equip>-Zpucsdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zpucsdate1  = lv_date_1.

      ls_equip-zpermitsdate    = <ls_equip>-Zpermitsdate.
      lv_date =   <ls_equip>-Zpermitsdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zpermitsdate1   = lv_date_1.

      ls_equip-zplant    = <ls_equip>-Zplant.

      ls_equip-zpolicydate    = <ls_equip>-Zpolicydate.
      lv_date =  <ls_equip>-Zpolicydate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zpolicydate1  = lv_date_1.
      ls_equip-zpolicyno    = <ls_equip>-Zpolicyno.
      ls_equip-zpolicyprem    = <ls_equip>-Zpolicyprem.

      ls_equip-zpucedate    = <ls_equip>-Zpucedate.
      lv_date =  <ls_equip>-Zpucedate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zpucedate1  = lv_date_1.

      ls_equip-zregdate = <ls_equip>-Zregdate.
      lv_date = <ls_equip>-Zregdate.
      SPLIT lv_date AT '-' INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zregdate1   = lv_date_1.

      ls_equip-zregedate = <ls_equip>-Zregedate.
      lv_date = <ls_equip>-Zregedate.
      SPLIT lv_date AT '-' INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zregedate1 = lv_date_1.

      ls_equip-zreg_no = <ls_equip>-ZregNo.
      ls_equip-zvehtaxamt = <ls_equip>-Zvehtaxamt.

      ls_equip-zvehtaxdate = <ls_equip>-Zvehtaxdate.
      lv_date =  <ls_equip>-Zvehtaxdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zvehtaxdate1 = lv_date_1.

      ls_equip-zvehtaxedate    = <ls_equip>-Zvehtaxedate.
      lv_date =  <ls_equip>-Zvehtaxedate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zvehtaxedate1 = lv_date_1.

      ls_equip-zvehtaxsdate    = <ls_equip>-Zvehtaxsdate.
      lv_date =  <ls_equip>-Zvehtaxsdate.
      SPLIT lv_date AT  '-'  INTO:  day month year.
      CONCATENATE  year month day INTO  lv_date_1.
      ls_equip-zvehtaxsdate1 = lv_date_1.

      ls_equip-local_created_by = <ls_equip>-LocalCreatedBy.
      ls_equip-local_created_at = <ls_equip>-LocalCreatedAt.
      ls_equip-local_last_changed_by = sy-uname.
      ls_equip-local_last_changed_at = | { sy-uzeit } | && | { sy-datum } |.
      ls_equip-last_changed_at = | { lv_time } | && | { lv_date } |.

      MODIFY zpm_equipments FROM @ls_equip.

      IF <ls_equip>-Zregdate IS NOT INITIAL AND ls_equip-zregdate1 > sy-datum.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Reg Date must be on or before Today'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF <ls_equip>-Zregedate IS NOT INITIAL AND ls_equip-zregedate1 < ls_equip-zregdate1.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Reg End Date must be after Reg Date'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF <ls_equip>-Zentaxedate IS NOT INITIAL AND ls_equip-zentaxedate1 < ls_equip-zentaxsdate1.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Environment Tax To Date must be after Environment Tax From Date'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF ls_equip-zfitnessedate1 < ls_equip-zfitnesssdate1 AND <ls_equip>-Zfitnesssdate IS NOT INITIAL
                                             AND <ls_equip>-Zfitnessedate IS NOT INITIAL.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Fitness End Date must be after Fitness Start Date'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF ls_equip-zinsodedate1 < ls_equip-zinsodsdate1 AND <ls_equip>-Zinsodsdate IS NOT INITIAL
                                             AND <ls_equip>-Zinsodedate IS NOT INITIAL.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Insurance OD To Date must be after Insurance OD From Date'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF ls_equip-zinstpedate1 < ls_equip-zinstpsdate1 AND <ls_equip>-Zinstpsdate IS NOT INITIAL
                                             AND <ls_equip>-Zinstpedate IS NOT INITIAL.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Insurance TP To Date must be after Insurance TP From Date'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF ls_equip-zpermitedate1 < ls_equip-zpermitsdate1 AND <ls_equip>-Zpermitedate IS NOT INITIAL
                                             AND <ls_equip>-Zpermitsdate IS NOT INITIAL.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Permit End Date must be after Permit Start Date'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF ls_equip-zpucedate1 < ls_equip-Zpucsdate1 AND <ls_equip>-Zpucedate IS NOT INITIAL
                                             AND <ls_equip>-Zpucsdate IS NOT INITIAL.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'PUC End Date must be after PUC Start Date'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
      IF ls_equip-zvehtaxedate1 < ls_equip-zvehtaxsdate1 AND <ls_equip>-Zvehtaxsdate IS NOT INITIAL
                                             AND <ls_equip>-Zvehtaxedate IS NOT INITIAL.
        APPEND VALUE #( %key                = <ls_equip>-%key ) TO failed-zpm_c_equip_unmanage.
        APPEND VALUE #( %key               = <ls_equip>-%key
                        %state_area        = 'VALIDATE_DATES'
                         %msg              = new_message_with_text(
                                                     text   = 'Vehicle Tax To must be after Vehicle Tax From'
                                                     severity = if_abap_behv_message=>severity-error )
                      %element-Zregdate = if_abap_behv=>mk-on ) TO reported-zpm_c_equip_unmanage.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zpm_c_equip_unmanage DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zpm_c_equip_unmanage IMPLEMENTATION.

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
