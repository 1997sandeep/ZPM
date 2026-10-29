CLASS lhc_zsd_logbook_un DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zsd_logbook_un RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zsd_logbook_un.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zsd_logbook_un.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zsd_logbook_un.

    METHODS read FOR READ
      IMPORTING keys FOR READ zsd_logbook_un RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zsd_logbook_un.

ENDCLASS.

CLASS lhc_zsd_logbook_un IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    DATA: lt_logbook  TYPE STANDARD TABLE OF zsd_log_book_un,
          ls_logbook  TYPE zsd_log_book_un,
          l_equip     TYPE zsd_log_book_un-equip_no,
          l_fuel      TYPE zsd_log_book_un-fuel_typ,
          l_own       TYPE zsd_log_book_un-own_hire,
          l_component TYPE zchar10,
          l_ocomp     TYPE zchar10,
          l_cumhr     TYPE string,
          l_cumkm     TYPE string,
          l_shift     TYPE zdec,
          msg         TYPE string,
          l_error     TYPE zchar1.
    DATA: l_md TYPE zsd_logbook_start_val-measurementdocument.

    SELECT MAX( key_field ) FROM zsd_log_book_un  WHERE equip_no NE '' INTO @DATA(lv_count).

    SELECT plant,
    key_field,
   equip_no,
  equip_desc,
  func_loc,
  func_desc,
  reg_no,
  dat,
  cumm_hrs,
  cumm_km, work_hr, read_km, working_hr
                FROM zsd_log_book_un  WHERE equip_no NE '' INTO TABLE @DATA(lit_data).

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<ls_logbook>).


    SELECT SINGLE Equipment
  FROM ZI_PM_COMPLIANCE
  WHERE Equipment = @<ls_logbook>-Equipment
    AND ComplianceType =  'ROAD TAX'
    AND ComplianceType =   'PERMIT'
    AND ComplianceType =   'FITNESS'
     AND ComplianceType =   'PUC'
    AND ComplianceType =   'REGISTRATION'
    AND ComplianceType =   'INSURANCE'
     AND ComplianceType =  'DRIVER'
  INTO @DATA(equipment_ck).
  if equipment_ck is INITIAL  .



  APPEND VALUE #( %tky = <ls_logbook>-%key  ) TO failed-zsd_logbook_un .
  APPEND VALUE #( %tky = <ls_logbook>-%key
                                   %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                               text = | Please complete compliance details for Equipment  | )
                                                               %element-Equipment = if_abap_behv=>mk-on )  TO reported-zsd_logbook_un.
 RETURN.
ENDIF.


      IF  <ls_logbook>-changeind NE 'D'.
        DATA(l_shift1) = <ls_logbook>-shift.
        IF  ( <ls_logbook>-breakhr + <ls_logbook>-WorkingHr ) GT ( 0 + l_shift1 ) .
*        IF  ( <ls_logbook>-breakhr + <ls_logbook>-TotalHr  ) GT ( 0 + l_shift1 ) .
*          CLEAR msg.
*          CONCATENATE <ls_logbook>-equipment ': BreakDown + Total hours > Shift hours' INTO msg SEPARATED BY space.
*          APPEND VALUE #( %key                = <ls_logbook>-%key ) TO failed-zsd_logbook_un.
*          APPEND VALUE #( %key               = <ls_logbook>-%key
*                          %state_area        = 'BreakDown_Hours'
*                           %msg              = new_message_with_text(
*                                                       text   = msg
*                                                       severity = if_abap_behv_message=>severity-error )
*                        %element-breakhr = if_abap_behv=>mk-on ) TO reported-zsd_logbook_un.
*          l_error = 'X'.
        ENDIF.

*        DATA: lv_fuelcap TYPE string.
*        SELECT SINGLE yy1_fueltankcapacity_ieq FROM I_Technicalobject WHERE TechnicalObject EQ @<ls_logbook>-Equipment
*         INTO @DATA(ls_fuelcap).
*       lv_fuelcap = ls_fuelcap.
*
*      IF ( CONV decfloat34( <ls_logbook>-FuelReceipt ) >=  CONV decfloat34( lv_fuelcap ) ).
*       CLEAR msg.
*       CONCATENATE <ls_logbook>-Equipment ': Fuel Receipt should be <= ' lv_fuelcap INTO msg SEPARATED BY space.
*       APPEND VALUE #( %key                   = <ls_logbook>-%key ) TO failed-zsd_logbook_un.
*       APPEND VALUE #( %key                   = <ls_logbook>-%key
*                       %state_area            = 'Fuel_Capacity'
*                       %msg                   = new_message_with_text(
*                                                text = msg
*                                                severity = if_abap_behv_message=>severity-error )
*                       %element-fuelreceipt = if_abap_behv=>mk-on ) TO reported-zsd_logbook_un.
*        l_error = 'X'.
*      ENDIF.

*        IF ( ( <ls_logbook>-WorkingHr ) GT ( <ls_logbook>-CloseHr - <ls_logbook>-StartHr ) ).
        IF ( ( <ls_logbook>-TotalHr ) GT ( <ls_logbook>-CloseHr - <ls_logbook>-StartHr ) ).

         IF ( <ls_logbook>-CloseHr IS INITIAL ) AND ( <ls_logbook>-StartHr IS INITIAL ) AND
            ( <ls_logbook>-StartKm IS NOT INITIAL ) AND ( <ls_logbook>-CloseKm IS NOT INITIAL ).

         ELSE.
          CLEAR msg.
          CONCATENATE <ls_logbook>-equipment ': Work Hour > (End HMR - Start HMR)' INTO msg SEPARATED BY space.
          APPEND VALUE #( %key                = <ls_logbook>-%key ) TO failed-zsd_logbook_un.
          APPEND VALUE #( %key               = <ls_logbook>-%key
                          %state_area        = 'BreakDown_Hours'
                           %msg              = new_message_with_text(
                                                       text   = msg
                                                       severity = if_abap_behv_message=>severity-error )
                        %element-breakhr = if_abap_behv=>mk-on ) TO reported-zsd_logbook_un.
          l_error = 'X'.
         ENDIF.
        ENDIF.

        IF   <ls_logbook>-WorkingHr GT ( 0 + l_shift1 ).
          CLEAR msg.
          CONCATENATE <ls_logbook>-equipment ': Total hours > Shift hours' INTO msg SEPARATED BY space.
          APPEND VALUE #( %key                = <ls_logbook>-%key ) TO failed-zsd_logbook_un.
          APPEND VALUE #( %key               = <ls_logbook>-%key
                          %state_area        = 'Shift_Hours'
                           %msg              = new_message_with_text(
                                                       text   = msg
                                                       severity = if_abap_behv_message=>severity-error )
                        %element-breakhr = if_abap_behv=>mk-on ) TO reported-zsd_logbook_un.
          l_error = 'X'.
        ENDIF.

        SELECT SINGLE dats FROM zpm_equip_maxdate WHERE equip_no = @<ls_logbook>-equipment INTO @DATA(l_datval).
        IF sy-subrc = 0.
          IF l_datval > <ls_logbook>-dat.
            CLEAR msg.

            CONCATENATE   l_datval+6(2)  l_datval+4(2) l_datval+0(4) INTO DATA(lv_datef) SEPARATED BY '.'.
            CONCATENATE <ls_logbook>-equipment 'data saved for date' lv_datef INTO msg SEPARATED BY space.
            APPEND VALUE #( %key                = <ls_logbook>-%key ) TO failed-zsd_logbook_un.
            APPEND VALUE #( %key               = <ls_logbook>-%key
                            %state_area        = 'Date'
                             %msg              = new_message_with_text(
                                                         text   = msg
                                                         severity = if_abap_behv_message=>severity-error )
                          %element-breakhr = if_abap_behv=>mk-on ) TO reported-zsd_logbook_un.
            l_error = 'X'.
          ENDIF.
        ENDIF.

        IF   <ls_logbook>-closekm LT <ls_logbook>-startkm .
          CLEAR msg.
          CONCATENATE <ls_logbook>-equipment ': End KM is less than Start KM' INTO msg SEPARATED BY space.
          APPEND VALUE #( %key                = <ls_logbook>-%key ) TO failed-zsd_logbook_un.
          APPEND VALUE #( %key               = <ls_logbook>-%key
                          %state_area        = 'END_KM'
                           %msg              = new_message_with_text(
                                                       text   = msg
                                                       severity = if_abap_behv_message=>severity-error )
                        %element-breakhr = if_abap_behv=>mk-on ) TO reported-zsd_logbook_un.
          l_error = 'X'.
        ENDIF.

        IF   <ls_logbook>-closehr LT <ls_logbook>-starthr .
          CLEAR msg.
          CONCATENATE <ls_logbook>-equipment ': End Hrs is less than Start Hrs' INTO msg SEPARATED BY space.
          APPEND VALUE #( %key                = <ls_logbook>-%key ) TO failed-zsd_logbook_un.
          APPEND VALUE #( %key               = <ls_logbook>-%key
                          %state_area        = 'END_HRS'
                           %msg              = new_message_with_text(
                                                       text   = msg
                                                       severity = if_abap_behv_message=>severity-error )
                        %element-breakhr = if_abap_behv=>mk-on ) TO reported-zsd_logbook_un.
          l_error = 'X'.
        ENDIF.
      ENDIF.



      IF  l_error = '' AND <ls_logbook>-changeind NE 'D'.
        READ TABLE lit_data TRANSPORTING NO FIELDS WITH KEY plant = <ls_logbook>-plant
                                                            equip_no = <ls_logbook>-equipment
                                                            key_field = <ls_logbook>-logid
                                                            dat = <ls_logbook>-dat.
        IF sy-subrc = 4.
          ls_logbook-key_field = lv_count + 1.
        ELSE.
          ls_logbook-key_field = <ls_logbook>-logid.
        ENDIF.
        ls_logbook-equip_no = <ls_logbook>-equipment.
        l_equip = ls_logbook-equip_no.
        ls_logbook-break_hr = <ls_logbook>-breakhr.
        ls_logbook-close_hr  = <ls_logbook>-closehr.
*  SOC by Pavan(21.08.2025)
        ls_logbook-close_km_dec  = <ls_logbook>-closekm.
        ls_logbook-close_hr_dec  = <ls_logbook>-CloseHr.
* EOC by Pavan(21.08.2025)
        ls_logbook-close_km  = <ls_logbook>-closekm.
        ls_logbook-dat  = <ls_logbook>-dat.
        DATA(lv_dat) = ls_logbook-dat.
        ls_logbook-equip_desc  = <ls_logbook>-equipmentname.
        ls_logbook-equip_obj  = <ls_logbook>-equipobj.
        ls_logbook-fuel  = <ls_logbook>-fuel.
        ls_logbook-fuel_typ  = <ls_logbook>-fueltyp.
        IF ls_logbook-fuel_typ = 'Diesel'.
          l_fuel = 'DIESEL'.
        ELSEIF    ls_logbook-fuel_typ = 'Petrol'.
          l_fuel = 'PETROL'.
        ENDIF.
        ls_logbook-fuelqty  = <ls_logbook>-fuelqty.
        DATA(l_qty) = ls_logbook-fuelqty  .
        ls_logbook-func_desc  = <ls_logbook>-funcdesc.
        ls_logbook-func_loc  = <ls_logbook>-funcloc.
*       ls_logbook-idle_hr  = <ls_logbook>-shift - ( <ls_logbook>-WorkingHr + <ls_logbook>-breakhr ) .
       ls_logbook-idle_hr  = <ls_logbook>-IdleHr.   " - ( <ls_logbook>-WorkingHr + <ls_logbook>-breakhr ) .
*       ls_logbook-idle_hr  = <ls_logbook>-shift - ( lv_working_hr1 + <ls_logbook>-breakhr ) .
*        ls_logbook-own_hire  = <ls_logbook>-ownhire.
        IF ls_logbook-own_hire = '101'.
          l_own = 'Z11'.
        ELSEIF    ls_logbook-own_hire = '102'.
          l_own = 'Z12'.
        ENDIF.
        ls_logbook-plant  = <ls_logbook>-plant.
        ls_logbook-read_km  = <ls_logbook>-readkm.
*        ls_logbook-reg_no  = <ls_logbook>-regno.
        ls_logbook-remarks  = <ls_logbook>-remarks.
        ls_logbook-start_hr  = <ls_logbook>-starthr.
        ls_logbook-start_km  = <ls_logbook>-startkm.
        ls_logbook-wbs  = <ls_logbook>-wbs.
        ls_logbook-work_hr  = <ls_logbook>-WorkHr.
        ls_logbook-working_hr = <ls_logbook>-WorkingHr.
        ls_logbook-total_hr = <ls_logbook>-TotalHr.
        ls_logbook-meapt_km  = <ls_logbook>-meaptkm.
        ls_logbook-meapt_wh  = <ls_logbook>-meaptwh.
        ls_logbook-shift  = <ls_logbook>-shift.
        ls_logbook-machine_no = <ls_logbook>-machineno.
        ls_logbook-tot_plnt_prd = <ls_logbook>-totplntprd.
        ls_logbook-cumm_hrs = <ls_logbook>-cummhrs.
        ls_logbook-cumm_hrs_mp = <ls_logbook>-cummhrsmp.
        ls_logbook-cumm_km = <ls_logbook>-cummkm.
        ls_logbook-cumm_km_mp = <ls_logbook>-cummkmmp.
        ls_logbook-openingbal = <ls_logbook>-OpeningBal.
        ls_logbook-fuel_receipt = <ls_logbook>-FuelReceipt.
        ls_logbook-closingbal = <ls_logbook>-ClosingBal.
        ls_logbook-act_avg_kml = <ls_logbook>-ActAvgKml.
        ls_logbook-act_avg_lhr = <ls_logbook>-ActAvgLhr.
        ls_logbook-fuel_cash_purch = <ls_logbook>-FuelCashPurch.
        ls_logbook-fuel_theft = <ls_logbook>-FuelTheft.
        ls_logbook-owner_used_hmr = <ls_logbook>-OwnerUsedHmr.
        ls_logbook-owner_used_kmr = <ls_logbook>-OwnerUsedKmr.
        ls_logbook-fuel_used_owner = <ls_logbook>-FuelUsedOwner.
        ls_logbook-hmr_kmr = <ls_logbook>-HmrKmr.
        ls_logbook-hmr_kmr_1 = <ls_logbook>-HmrKmr1.
        ls_logbook-hmr_kmr_2 = <ls_logbook>-HmrKmr2.
        ls_logbook-hmr_kmr_3 = <ls_logbook>-HmrKmr3.
        ls_logbook-hmr_kmr_4 = <ls_logbook>-HmrKmr4.
        ls_logbook-wbs_elem_1 = <ls_logbook>-WbsElem1.
        ls_logbook-wbs_elem_2 = <ls_logbook>-WbsElem2.
        ls_logbook-wbs_elem_3 = <ls_logbook>-WbsElem3.
        ls_logbook-wbs_elem_4 = <ls_logbook>-WbsElem4.
        ls_logbook-breakdown_rsn = <ls_logbook>-BreakDownRsn.
        ls_logbook-last_log_entry = <ls_logbook>-LastLogEntry.
        ls_logbook-uom = <ls_logbook>-Uom.
*        ls_logbook-own_hire = <ls_logbook>-EquipType.
                ls_logbook-equipcondition = <ls_logbook>-EquipCondition.
        IF <ls_logbook>-breakhr IS INITIAL.
          ls_logbook-break_hr = '0.00'.
        ENDIF.
*        ls_logbook-flag = 'X'."<ls_logbook>-cummkmmp.

        DATA(l_change) = <ls_logbook>-changeind.

        IF  l_change = 'C'.
          READ TABLE lit_data INTO DATA(lw_data) WITH KEY equip_no = <ls_logbook>-equipment
                                                          dat = <ls_logbook>-dat.
DATA: lv_working_hr TYPE decfloat16.
lv_working_hr = <ls_logbook>-WorkHr.
          IF  sy-subrc = 0.
*            l_cumhr =  lw_data-cumm_hrs  - lw_data-working_hr + <ls_logbook>-Workhr.
            l_cumhr =  lw_data-cumm_hrs  - lw_data-working_hr + lv_working_hr.
            l_cumkm =  lw_data-cumm_km - lw_data-read_km + <ls_logbook>-readkm.
            ls_logbook-cumm_hrs = l_cumhr.
            ls_logbook-cumm_km =  l_cumkm.
          ENDIF.
        ELSE.
*          l_cumhr = <ls_logbook>-cummhrs + <ls_logbook>-WorkingHr.
          l_cumhr = <ls_logbook>-cummhrs + lv_working_hr.
          l_cumkm = <ls_logbook>-cummkm  + <ls_logbook>-readkm.
          ls_logbook-cumm_hrs = l_cumhr.
          ls_logbook-cumm_km =  l_cumkm.
        ENDIF.

**************************************************************** select query to check if data for equipment exist or not
        SELECT SINGLE * FROM zsd_log_book_un
        WHERE equip_no = @<ls_logbook>-equipment
        AND dat = @<ls_logbook>-dat
         INTO @DATA(lw_equipt) .
        IF lw_equipt IS NOT INITIAL.

**************************************************************** For Working Hours - Start
          IF  lw_equipt-close_hr <> <ls_logbook>-closehr.

            IF  lw_equipt-close_hr > <ls_logbook>-closehr.

*** for reversal and re posting of measurement document where change hours is reduced
              SELECT SINGLE * FROM zsd_logbook_start_val
              WHERE equipment = @ls_logbook-equip_no
              AND measuringpoint = @ls_logbook-meapt_wh
              INTO @DATA(l_wh).
              IF  l_wh IS NOT INITIAL.

                MODIFY ENTITY i_measurementdocumenttp_2
                 EXECUTE activatereversalindicator FROM VALUE #( ( %tky-measurementdocument =  l_wh-measurementdocument  ) )
                 RESULT   DATA(lt_result_r)
                 FAILED   DATA(ls_failed_r)
                 REPORTED DATA(ls_reported_r).

                IF  ls_failed_r IS INITIAL.

                  MODIFY ENTITIES OF i_measurementdocumenttp_2
                     ENTITY measurementdocument
                      CREATE
                        FIELDS ( measuringpoint
                                 measurementcounterreading
                                 measurementreadingentryuom
                                 msmtrdngdate )
                         WITH VALUE #( ( %cid     = 'My%CID_1'
                                         %data    = VALUE #( measuringpoint             = <ls_logbook>-meaptwh
                                                             measurementcounterreading  = <ls_logbook>-closehr
                                                              measurementreadingentryuom = 'STD'
                                                             msmtrdngdate = <ls_logbook>-dat ) ) )
                     MAPPED   DATA(ls_mapped2)
                     FAILED   DATA(ls_failed2)
                     REPORTED DATA(ls_reported_modify2).

                  SELECT SINGLE measurementdocument, equipment FROM zsd_logbook_cumm_hrs
                  WHERE equipment = @ls_logbook-equip_no
                  AND measuringpoint = @ls_logbook-cumm_hrs_mp
                  INTO @DATA(l_cumm_wh).

                  MODIFY ENTITY i_measurementdocumenttp_2
                 EXECUTE activatereversalindicator FROM VALUE #( (  %tky-measurementdocument  =  l_cumm_wh-measurementdocument  ) )
                 RESULT   DATA(lt_result_c2)
                 FAILED   DATA(ls_failed_c2)
                 REPORTED DATA(ls_reported_c2).

                  MODIFY ENTITIES OF i_measurementdocumenttp_2
                     ENTITY measurementdocument
                      CREATE
                        FIELDS ( measuringpoint
                                 measurementcounterreading
                                 measurementreadingentryuom
                                 msmtrdngdate )
                         WITH VALUE #( ( %cid     = 'My%CID_1'
                                         %data    = VALUE #( measuringpoint             = <ls_logbook>-cummhrsmp
                                                             measurementcounterreading  = l_cumhr
                                                             measurementreadingentryuom = 'STD'
                                                             msmtrdngdate = <ls_logbook>-dat ) ) )
                     MAPPED   DATA(ls_mappedc3)
                     FAILED   DATA(ls_failedc3)
                     REPORTED DATA(ls_reported_modifyc3).


                ENDIF.
              ENDIF.
            ELSE.

              MODIFY ENTITIES OF i_measurementdocumenttp_2
                 ENTITY measurementdocument
                  CREATE
                    FIELDS ( measuringpoint
                             measurementcounterreading
                             measurementreadingentryuom
                             msmtrdngdate )
                     WITH VALUE #( ( %cid     = 'My%CID_1'
                                     %data    = VALUE #( measuringpoint             = <ls_logbook>-meaptwh
                                                         measurementcounterreading  = <ls_logbook>-closehr
                                                         measurementreadingentryuom = 'H'
                                                         msmtrdngdate = <ls_logbook>-dat ) ) )
                 MAPPED   DATA(ls_mappedi)
                 FAILED   DATA(ls_failedi)
                 REPORTED DATA(ls_reported_modifyi).

              MODIFY ENTITIES OF i_measurementdocumenttp_2
                      ENTITY measurementdocument
                       CREATE
                         FIELDS ( measuringpoint
                         measurementcounterreading
                         measurementreadingentryuom
                         msmtrdngdate )
                      WITH VALUE #( ( %cid     = 'My%CID_1'
                                      %data    = VALUE #( measuringpoint             = <ls_logbook>-cummhrsmp
                                                          measurementcounterreading  = l_cumhr
                                                          measurementreadingentryuom = 'H'
                                                          msmtrdngdate = <ls_logbook>-dat ) ) )
                  MAPPED   DATA(ls_mappedi1)
                  FAILED   DATA(ls_failedi1)
                  REPORTED DATA(ls_reported_modifyi1).

            ENDIF.



          ENDIF.
**************************************************************** For Working Hours - end

**************************************************************** For kms - start
          SELECT SINGLE * FROM zsd_logbook_startkm_val
          WHERE equipment = @ls_logbook-equip_no
          AND measuringpoint = @ls_logbook-meapt_km
          INTO @DATA(l_km).
          IF  l_km IS NOT INITIAL.

            IF  lw_equipt-close_km <> <ls_logbook>-closekm.

*              IF  lw_equipt-close_km > <ls_logbook>-closekm.   """"""""""""""""""""""""sandeep


                MODIFY ENTITY i_measurementdocumenttp_2
             EXECUTE activatereversalindicator FROM VALUE #( (  %tky-measurementdocument  =  l_km-measurementdocument  ) )
             RESULT   DATA(lt_result_r1)
             FAILED   DATA(ls_failed_r1)
             REPORTED DATA(ls_reported_r1).

                IF ls_failed_r1 IS INITIAL.

                  MODIFY ENTITIES OF i_measurementdocumenttp_2
                   ENTITY measurementdocument
                    CREATE
                      FIELDS ( measuringpoint
                               measurementcounterreading
                               measurementreadingentryuom
                               msmtrdngdate )
                       WITH VALUE #( ( %cid     = 'My%CID_1'
                                       %data    = VALUE #( measuringpoint             = <ls_logbook>-meaptkm
                                                           measurementcounterreading  = <ls_logbook>-closekm
                                                           measurementreadingentryuom = 'KM'
                                                           msmtrdngdate = <ls_logbook>-dat ) ) )
                   MAPPED   DATA(ls_mapped_a)
                   FAILED   DATA(ls_failed_a)
                   REPORTED DATA(ls_reported_modify_a).


                  SELECT SINGLE measurementdocument, equipment FROM zsd_logbook_cumm_kms
                   WHERE equipment = @ls_logbook-equip_no
                   AND measuringpoint = @ls_logbook-cumm_km_mp
                   INTO @DATA(l_cumm_km).

                  MODIFY ENTITY i_measurementdocumenttp_2
                 EXECUTE activatereversalindicator FROM VALUE #( (  %tky-measurementdocument  =  l_cumm_km-measurementdocument  ) )
                 RESULT   DATA(lt_result_c4)
                 FAILED   DATA(ls_failed_c4)
                 REPORTED DATA(ls_reported_c4).

                  MODIFY ENTITIES OF i_measurementdocumenttp_2
                     ENTITY measurementdocument
                      CREATE
                        FIELDS ( measuringpoint
                                 measurementcounterreading
                                 measurementreadingentryuom
                                 msmtrdngdate )
                         WITH VALUE #( ( %cid     = 'My%CID_1'
                                         %data    = VALUE #( measuringpoint             = <ls_logbook>-cummkmmp
                                                             measurementcounterreading  = l_cumkm
                                                             measurementreadingentryuom = 'KM'
                                                             msmtrdngdate = <ls_logbook>-dat ) ) )
                     MAPPED   DATA(ls_mappedc5)
                     FAILED   DATA(ls_failedc5)
                     REPORTED DATA(ls_reported_modifyc5).


                ENDIF.

              ELSE.
                MODIFY ENTITIES OF i_measurementdocumenttp_2
                 ENTITY measurementdocument
                  CREATE
                    FIELDS ( measuringpoint
                             measurementcounterreading
                             measurementreadingentryuom
                             msmtrdngdate )
                     WITH VALUE #( ( %cid     = 'My%CID_1'
                                     %data    = VALUE #( measuringpoint             = <ls_logbook>-meaptkm
                                                         measurementcounterreading  = <ls_logbook>-closekm
                                                         measurementreadingentryuom = 'KM'
                                                         msmtrdngdate = <ls_logbook>-dat ) ) )
                 MAPPED   DATA(ls_mapped)
                 FAILED   DATA(ls_failed)
                 REPORTED DATA(ls_reported_modify).

                MODIFY ENTITIES OF i_measurementdocumenttp_2
                   ENTITY measurementdocument
                    CREATE
                      FIELDS ( measuringpoint
                               measurementcounterreading
                               measurementreadingentryuom
                               msmtrdngdate )
                       WITH VALUE #( ( %cid     = 'My%CID_1'
                                       %data    = VALUE #( measuringpoint             = <ls_logbook>-cummkmmp
                                                           measurementcounterreading  = l_cumkm
                                                           measurementreadingentryuom = 'KM'
                                                           msmtrdngdate = <ls_logbook>-dat ) ) )
                   MAPPED   DATA(ls_mappedi2)
                   FAILED   DATA(ls_failedi2)
                   REPORTED DATA(ls_reported_modifyi2).


*              ENDIF.
            ENDIF.

          ENDIF.
**************************************************************** For kms - end


********************************************************************** For NEWly created measurement document
        ELSEIF l_change = ' '.

          IF  <ls_logbook>-startkm IS NOT INITIAL AND <ls_logbook>-closekm IS NOT INITIAL.
            "Added code for Measurement Doc creation
            MODIFY ENTITIES OF i_measurementdocumenttp_2
             ENTITY measurementdocument
              CREATE
                FIELDS ( measuringpoint
                         measurementcounterreading
                         measurementreadingentryuom
                         msmtrdngdate )
                 WITH VALUE #( ( %cid     = 'My%CID_1'
                                 %data    = VALUE #( measuringpoint             = <ls_logbook>-meaptkm
                                                     measurementcounterreading  = <ls_logbook>-closekm
                                                     measurementreadingentryuom = 'KM'
*                                                     measurementreadingentryuom = 'HMR'
                                                     msmtrdngdate = <ls_logbook>-dat ) ) )
             MAPPED   DATA(ls_mapped3)
             FAILED   DATA(ls_failed3)
             REPORTED DATA(ls_reported_modify3).

            MODIFY ENTITIES OF i_measurementdocumenttp_2
             ENTITY measurementdocument
              CREATE
                FIELDS ( measuringpoint
                         measurementcounterreading
                         measurementreadingentryuom
                         msmtrdngdate )
                 WITH VALUE #( ( %cid     = 'My%CID_1'
                                 %data    = VALUE #( measuringpoint             = <ls_logbook>-cummkmmp   """"""sandeep
                                                     measurementcounterreading  = l_cumkm
                                                     measurementreadingentryuom = 'KM'
*                                                     measurementreadingentryuom = 'HMR'
                                                     msmtrdngdate = <ls_logbook>-dat ) ) )
             MAPPED   DATA(ls_mappedc)
             FAILED   DATA(ls_failedc)
             REPORTED DATA(ls_reported_modifyc).


          ENDIF.

          IF  <ls_logbook>-starthr IS NOT INITIAL AND <ls_logbook>-closehr IS NOT INITIAL.
            MODIFY ENTITIES OF i_measurementdocumenttp_2
               ENTITY measurementdocument
                CREATE
                  FIELDS ( measuringpoint
                           measurementcounterreading
                           measurementreadingentryuom
                           msmtrdngdate )
                   WITH VALUE #( ( %cid     = 'My%CID_1'
                                   %data    = VALUE #( measuringpoint             =  <ls_logbook>-meaptwh  "VALUE #( measuringpoint             =  '000000000038' " <ls_logbook>-meaptwh
                                                       measurementcounterreading  = <ls_logbook>-closehr
                                                       measurementreadingentryuom = 'H'
*                                                       measurementreadingentryuom = 'STD'
                                                       msmtrdngdate = <ls_logbook>-dat ) ) )
               MAPPED   DATA(ls_mapped4)
               FAILED   DATA(ls_failed4)
               REPORTED DATA(ls_reported_modify4).

            MODIFY ENTITIES OF i_measurementdocumenttp_2
              ENTITY measurementdocument
              CREATE
                  FIELDS ( measuringpoint
                  measurementcounterreading
                  measurementreadingentryuom
                  msmtrdngdate )
                  WITH VALUE #( ( %cid     = 'My%CID_1'
                      %data    = VALUE #( measuringpoint             =  <ls_logbook>-cummhrsmp "VALUE #( measuringpoint             =  '000000000038'     "<ls_logbook>-cummhrsmp
                                          measurementcounterreading  = l_cumhr
*                                          measurementreadingentryuom = 'STD'
                                          measurementreadingentryuom = 'H'
                                          msmtrdngdate = <ls_logbook>-dat ) ) )
                  MAPPED   DATA(ls_mappedc1)
                  FAILED   DATA(ls_failedc1)
                  REPORTED DATA(ls_reported_modifyc1).
          ENDIF.

***        ELSEIF l_change = 'D'.
***
***          DELETE zsd_log_book_un FROM @ls_logbook.

        ENDIF.
**        IF   l_change NE 'D'.
        IF  ( <ls_logbook>-closekm IS NOT INITIAL OR <ls_logbook>-closehr IS NOT INITIAL ).
          MODIFY zsd_log_book_un FROM @ls_logbook.
        ENDIF.
**        ENDIF.
      ELSEIF <ls_logbook>-changeind = 'D'.


        ls_logbook-equip_no = <ls_logbook>-equipment.
        l_equip = ls_logbook-equip_no.
        ls_logbook-break_hr = <ls_logbook>-breakhr.
        ls_logbook-close_hr  = <ls_logbook>-closehr.
        ls_logbook-close_km  = <ls_logbook>-closekm.
        ls_logbook-dat  = <ls_logbook>-dat.
        ls_logbook-plant  = <ls_logbook>-plant.
        ls_logbook-read_km  = <ls_logbook>-readkm.
*        ls_logbook-reg_no  = <ls_logbook>-regno.
        ls_logbook-remarks  = <ls_logbook>-remarks.
        ls_logbook-start_hr  = <ls_logbook>-starthr.
        ls_logbook-start_km  = <ls_logbook>-startkm.
        ls_logbook-wbs  = <ls_logbook>-wbs.
        ls_logbook-work_hr  = <ls_logbook>-WorkingHr.
        ls_logbook-working_hr = <ls_logbook>-WorkingHr.
        ls_logbook-total_hr = <ls_logbook>-TotalHr.
        ls_logbook-meapt_km  = <ls_logbook>-meaptkm.
        ls_logbook-meapt_wh  = <ls_logbook>-meaptwh.
        ls_logbook-shift  = <ls_logbook>-shift.
        ls_logbook-machine_no = <ls_logbook>-machineno.
        ls_logbook-tot_plnt_prd = <ls_logbook>-totplntprd.
        ls_logbook-cumm_hrs = <ls_logbook>-cummhrs.
        ls_logbook-cumm_hrs_mp = <ls_logbook>-cummhrsmp.
        ls_logbook-cumm_km = <ls_logbook>-cummkm.
        ls_logbook-cumm_km_mp = <ls_logbook>-cummkmmp.
        ls_logbook-openingbal = <ls_logbook>-OpeningBal.
        ls_logbook-fuel_receipt = <ls_logbook>-FuelReceipt.
        ls_logbook-closingbal = <ls_logbook>-ClosingBal.
        ls_logbook-act_avg_kml = <ls_logbook>-ActAvgKml.
        ls_logbook-act_avg_lhr = <ls_logbook>-ActAvgLhr.
        ls_logbook-fuel_cash_purch = <ls_logbook>-FuelCashPurch.
        ls_logbook-fuel_theft = <ls_logbook>-FuelTheft.
        ls_logbook-owner_used_hmr = <ls_logbook>-OwnerUsedHmr.
        ls_logbook-owner_used_kmr = <ls_logbook>-OwnerUsedKmr.
        ls_logbook-fuel_used_owner = <ls_logbook>-FuelUsedOwner.
        ls_logbook-hmr_kmr = <ls_logbook>-HmrKmr.
        ls_logbook-hmr_kmr_1 = <ls_logbook>-HmrKmr1.
        ls_logbook-hmr_kmr_2 = <ls_logbook>-HmrKmr2.
        ls_logbook-hmr_kmr_3 = <ls_logbook>-HmrKmr3.
        ls_logbook-hmr_kmr_4 = <ls_logbook>-HmrKmr4.
        ls_logbook-wbs_elem_1 = <ls_logbook>-WbsElem1.
        ls_logbook-wbs_elem_2 = <ls_logbook>-WbsElem2.
        ls_logbook-wbs_elem_3 = <ls_logbook>-WbsElem3.
        ls_logbook-wbs_elem_4 = <ls_logbook>-WbsElem4.
        ls_logbook-breakdown_rsn = <ls_logbook>-BreakDownRsn.
        ls_logbook-last_log_entry = <ls_logbook>-LastLogEntry.
        ls_logbook-uom = <ls_logbook>-Uom.
*        ls_logbook-own_hire = <ls_logbook>-EquipType.
        ls_logbook-equipcondition = <ls_logbook>-EquipCondition.
*** for reversal measurement document of work hours
        SELECT SINGLE * FROM zsd_logbook_start_val_f( pdate = @ls_logbook-dat )
        WHERE equipment = @ls_logbook-equip_no
        AND measuringpoint = @ls_logbook-meapt_wh
        INTO @DATA(l_wh1).
        IF  l_wh1 IS NOT INITIAL.

          MODIFY ENTITY i_measurementdocumenttp_2
           EXECUTE activatereversalindicator FROM VALUE #( ( %tky-measurementdocument =  l_wh1-measurementdocument  ) )
           RESULT   DATA(lt_result0)
           FAILED   DATA(ls_failed0)
           REPORTED DATA(ls_reported0).
        ENDIF.

*** for reversal measurement document of Kilometers
        SELECT SINGLE * FROM zsd_logbook_startkm_val_f( pdate = @ls_logbook-dat )
          WHERE equipment = @ls_logbook-equip_no
          AND measuringpoint = @ls_logbook-meapt_km
          INTO @data(l_km1).
        IF  l_km1 IS NOT INITIAL.

          MODIFY ENTITY i_measurementdocumenttp_2
       EXECUTE activatereversalindicator FROM VALUE #( (  %tky-measurementdocument  =  l_km1-measurementdocument  ) )
       RESULT   DATA(lt_result1)
       FAILED   DATA(ls_failed1)
       REPORTED DATA(ls_reported1).

        ENDIF.

*** for reversal measurement document of Cummulative Work hours
        SELECT SINGLE measurementdocument, equipment FROM zsd_logbook_cumm_hrs_f( pdate = @ls_logbook-dat )
          WHERE equipment = @ls_logbook-equip_no
          AND measuringpoint = @ls_logbook-cumm_hrs_mp
          INTO @l_cumm_wh.
        IF l_cumm_wh IS NOT INITIAL.
          MODIFY ENTITY i_measurementdocumenttp_2
         EXECUTE activatereversalindicator FROM VALUE #( (  %tky-measurementdocument  =  l_cumm_wh-measurementdocument  ) )
         RESULT   DATA(lt_result2)
         FAILED   DATA(ls_failed02)
         REPORTED DATA(ls_reported2).
        ENDIF.
*** for reversal measurement document of Cummulative Kilometers
        SELECT SINGLE measurementdocument, equipment FROM zsd_logbook_cumm_kms_f( pdate = @ls_logbook-dat )
         WHERE equipment = @ls_logbook-equip_no
         AND measuringpoint = @ls_logbook-cumm_km_mp
         INTO @l_cumm_km.
        IF l_cumm_km IS NOT INITIAL.
          MODIFY ENTITY i_measurementdocumenttp_2
         EXECUTE activatereversalindicator FROM VALUE #( (  %tky-measurementdocument  =  l_cumm_km-measurementdocument  ) )
         RESULT   DATA(lt_result3)
         FAILED   DATA(ls_failed03)
         REPORTED DATA(ls_reported3).
        ENDIF.



        ls_logbook-key_field = <ls_logbook>-logid.
        DELETE FROM zsd_log_book_un WHERE key_field = @ls_logbook-key_field.
        CLEAR ls_logbook-key_field.
      ENDIF.
    ENDLOOP.


  ENDMETHOD.

  METHOD update.

  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.


ENDCLASS.

CLASS lsc_zsd_logbook_un DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zsd_logbook_un IMPLEMENTATION.

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
