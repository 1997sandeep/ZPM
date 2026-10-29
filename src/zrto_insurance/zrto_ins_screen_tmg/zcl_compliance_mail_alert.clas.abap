CLASS zcl_compliance_mail_alert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_apj_dt_exec_object.
  INTERFACES if_apj_rt_exec_object.
  INTERFACES if_oo_adt_classrun .

      CLASS-METHODS READ_DATA
       importing    DATE      type sy-datum
        RETURNING VALUE(RESULT12) TYPE STRING
         RAISING cx_static_check.

        CLASS-DATA: lx_bcs_mail TYPE REF TO cx_bcs_mail,
                    SY_DT TYPE SY-DATUM.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_COMPLIANCE_MAIL_ALERT IMPLEMENTATION.


METHOD if_apj_dt_exec_object~get_parameters.


et_parameter_def = VALUE #(
      ( selname = 'S_ID'    kind = if_apj_dt_exec_object=>select_option datatype = 'C' length = 10 param_text = 'My ID'                                      changeable_ind = abap_true )
      ( selname = 'P_DESCR' kind = if_apj_dt_exec_object=>parameter     datatype = 'C' length = 80 param_text = 'My Description'   lowercase_ind = abap_true changeable_ind = abap_true )
      ( selname = 'P_COUNT' kind = if_apj_dt_exec_object=>parameter     datatype = 'I' length = 10 param_text = 'My Count'                                   changeable_ind = abap_true )
      ( selname = 'P_SIMUL' kind = if_apj_dt_exec_object=>parameter     datatype = 'C' length =  1 param_text = 'My Simulate Only' checkbox_ind = abap_true  changeable_ind = abap_true )
    ).


 et_parameter_val = VALUE #(
      ( selname = 'S_ID'    kind = if_apj_dt_exec_object=>select_option sign = 'I' option = 'EQ' low = '4711' )
      ( selname = 'P_DESCR' kind = if_apj_dt_exec_object=>parameter     sign = 'I' option = 'EQ' low = 'My Default Description' )
      ( selname = 'P_COUNT' kind = if_apj_dt_exec_object=>parameter     sign = 'I' option = 'EQ' low = '200' )
      ( selname = 'P_SIMUL' kind = if_apj_dt_exec_object=>parameter     sign = 'I' option = 'EQ' low = abap_true )
    ).




ENDMETHOD.


METHOD if_apj_rt_exec_object~execute.


TYPES ty_id TYPE c LENGTH 10.

    DATA s_id    TYPE RANGE OF ty_id.
    DATA p_descr TYPE c LENGTH 80.
    DATA p_count TYPE i.
    DATA p_simul TYPE abap_boolean.

    LOOP AT it_parameters INTO DATA(ls_parameter).
      CASE ls_parameter-selname.
        WHEN 'S_ID'.
          APPEND VALUE #( sign   = ls_parameter-sign
                          option = ls_parameter-option
                          low    = ls_parameter-low
                          high   = ls_parameter-high ) TO s_id.
        WHEN 'P_DESCR'. p_descr = ls_parameter-low.
        WHEN 'P_COUNT'. p_count = ls_parameter-low.
        WHEN 'P_SIMUL'. p_simul = ls_parameter-low.
      ENDCASE.
    ENDLOOP.
 DATA: date TYPE SY-datum.
    ME->read_data( DATE ).

 ENDMETHOD.


   METHOD if_oo_adt_classrun~main.
    DATA: date TYPE SY-datum.
    TRY.
        DATA(return_data) = read_data( DATE = sy-datum ) .
    ENDTRY.
  ENDMETHOD.


METHOD read_data.
 TYPES : BEGIN OF it_solisti1 ,
                line TYPE c LENGTH 255,
              END OF it_solisti1.

      DATA : i_objtx       TYPE STANDARD TABLE OF it_solisti1,
             i_objtxt      TYPE it_solisti1,
             supplier_name TYPE string,
             lv            TYPE string,
             lv1           TYPE string,
             mail_id(512)  TYPE c,
             indctr        TYPE c,
             recevie(512)  TYPE c,
             recevie1(512) TYPE c,
             recevie2(512) TYPE c,
             recevie3(512) TYPE c.

       SELECT from ZI_PM_COMPLIANCE_REPORT
       FIELDS
       *
       into TABLE @data(it_data).

       loop at it_data into data(wa_data).

       DATA: lv_days_remaining TYPE i.
         lv_days_remaining = wa_data-enddate - sy-datum.
          IF lv_days_remaining = 60
         OR lv_days_remaining = 30
         OR lv_days_remaining = 15.



      CLEAR: i_objtx.
      i_objtxt-line = '<HTML> <BODY>'.
      APPEND i_objtxt TO i_objtx.
      CLEAR : i_objtxt.

      CONCATENATE '<p style="font-family:Calibri;font-size:16;">' 'Dear Sir/Madam,' INTO i_objtxt-line.
      APPEND i_objtxt TO i_objtx.
      CLEAR : i_objtxt.


      CONCATENATE '<p>' 'Alert Level :'           INTO i_objtxt-line SEPARATED BY space.
      APPEND i_objtxt-line TO i_objtx.
      CLEAR : i_objtxt .

      CONCATENATE '<p>' 'Equipment No. :'  INTO i_objtxt-line SEPARATED BY space.
      APPEND i_objtxt-line TO i_objtx.
      CLEAR : i_objtxt .

      CONCATENATE '<p>' 'Equipment Desc. :'  INTO i_objtxt-line SEPARATED BY space.
      APPEND i_objtxt-line TO i_objtx.
      CLEAR : i_objtxt .
      CONCATENATE '<p>' 'Plant :'  INTO i_objtxt-line SEPARATED BY space.
      APPEND i_objtxt-line TO i_objtx.
      CLEAR : i_objtxt .
      CONCATENATE '<p>' 'Compliance Type :'  INTO i_objtxt-line SEPARATED BY space.
      APPEND i_objtxt-line TO i_objtx.
      CLEAR : i_objtxt .
      CONCATENATE '<p>' 'Certificate No. :'  INTO i_objtxt-line SEPARATED BY space.
      APPEND i_objtxt-line TO i_objtx.
      CLEAR : i_objtxt .
      CONCATENATE '<p>' 'Start Date :'  INTO i_objtxt-line SEPARATED BY space.
      APPEND i_objtxt-line TO i_objtx.
      CLEAR : i_objtxt .
      CONCATENATE '<p>' 'Expiry Date :'  INTO i_objtxt-line SEPARATED BY space.
      APPEND i_objtxt-line TO i_objtx.
      CLEAR : i_objtxt .
      CONCATENATE '<p>' 'Days Remaining  :'  INTO i_objtxt-line SEPARATED BY space.
      APPEND i_objtxt-line TO i_objtx.
      CLEAR : i_objtxt .
      CONCATENATE '<p>' 'Amount / Total  :'  INTO i_objtxt-line SEPARATED BY space.
      APPEND i_objtxt-line TO i_objtx.
      CLEAR : i_objtxt .
      CONCATENATE '<p>' 'Action Required: Please initiate the certificate renewal process immediately to avoid statutory non-compliance.'  INTO i_objtxt-line SEPARATED BY space.
      APPEND i_objtxt-line TO i_objtx.
      CLEAR : i_objtxt .
      CONCATENATE '<p>' '<b>' 'Regards,' '</b>'  INTO i_objtxt-line SEPARATED BY space.
      APPEND i_objtxt-line TO i_objtx.
      CLEAR : i_objtxt .
      CONCATENATE '<p>' '<b>' 'SAP S/4HANA Public Cloud – SSIPL Compliance Management System' '</b>'  INTO i_objtxt-line SEPARATED BY space.
      APPEND i_objtxt-line TO i_objtx.
      CLEAR : i_objtxt .
      CONCATENATE '<p>' 'This is a system-generated email. Please do not reply.'  INTO i_objtxt-line SEPARATED BY space.
      APPEND i_objtxt-line TO i_objtx.
      CLEAR : i_objtxt .

      i_objtxt-line = '</body> </html>'.
      APPEND i_objtxt TO i_objtx.
      CLEAR i_objtxt.


      DATA : v_lines_txt TYPE i,
             v_lines_bin TYPE i.

      v_lines_txt = lines( i_objtx ).

      LOOP  AT i_objtx INTO i_objtxt .
        IF lv = ''.
          lv = i_objtxt.
        ELSE.
          CONCATENATE lv i_objtxt INTO lv.
          CONDENSE lv .
        ENDIF.
      ENDLOOP.

************************************************************************ MAIL ID ***************************************************************
      TRY.
          DATA(lo_mail) = cl_bcs_mail_message=>create_instance( ).
          lo_mail->set_sender( 'sap.communication@neoliv.in' ).

          IF recevie IS NOT INITIAL.
            lo_mail->add_recipient( recevie ).
          ENDIF.

************************************************************************************************************************************************
          DATA doc TYPE string.
          doc = 'PurchaseOrder.pdf'.
*          lo_mail->set_subject( | 'Approval for Purchase Order '{ po_gpn }-{ wa-PurchaseOrder } 'is Pending' | ).
          lo_mail->set_main( cl_bcs_mail_textpart=>create_instance(
          iv_content      = lv
          iv_content_type = 'text/html'
          ) ).

          lo_mail->add_attachment( cl_bcs_mail_binarypart=>create_instance(
*            iv_content      =  print1
            iv_content_type = 'application/pdf'
            iv_filename     = doc
           ) ).

          lo_mail->send( IMPORTING et_status = DATA(lt_status) ).

        CATCH cx_bcs_mail INTO lx_bcs_mail.

      ENDTRY.

      CLEAR : lv,i_objtxt,i_objtx.

ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
