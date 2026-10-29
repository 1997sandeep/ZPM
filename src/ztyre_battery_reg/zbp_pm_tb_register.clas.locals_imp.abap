CLASS lhc_buffer DEFINITION.
* 1) define the data buffer
  PUBLIC SECTION.
    TYPES tt_posting TYPE TABLE OF zpmt_tb_register.
    CLASS-DATA mt_buffer TYPE  tt_posting.
ENDCLASS.


CLASS lhc_ZPM_TB_REGISTER DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zpm_tb_register RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zpm_tb_register.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zpm_tb_register.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zpm_tb_register.

    METHODS read FOR READ
      IMPORTING keys FOR READ zpm_tb_register RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zpm_tb_register.

ENDCLASS.

CLASS lhc_ZPM_TB_REGISTER IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
*    DATA: lw_tb_reg TYPE zpmt_tb_register.
*    LOOP AT entities INTO DATA(lw_ent).
*
*
* INSERT VALUE #(   project           = lw_ent-project
*  obj_type          = lw_ent-obj_type
*  equipment         = lw_ent-equipment
*  asset_code        = lw_ent-asset_code
*  asset_des         = lw_ent-asset_des
*  reg_no            = lw_ent-reg_no
*  item_type         = lw_ent-item_type
*  product_type      = lw_ent-product_type
*  product_group     = lw_ent-product_group
*  material          = lw_ent-material
*  material_des      = lw_ent-material_des
*  item_size         = lw_ent-item_size
*  item_make         = lw_ent-item_make
*  order_no          = lw_ent-order_no
*  gi_no             = lw_ent-gi_no
*  tyre_sl_no        = lw_ent-tyre_sl_no
*  position_of_item  = lw_ent-position_of_item
*  fit_on_date       = lw_ent-fit_on_date
*  fit_at_read       = lw_ent-fit_at_read
*  dismant_date      = lw_ent-dismant_date
*  dismant_item_sno  = lw_ent-dismant_item_sno
*  dismant_at_read   = lw_ent-dismant_at_read
*  item_life_kmr     = lw_ent-item_life_kmr
*  item_life_days    = lw_ent-item_life_days
*  item_status       = lw_ent-item_status
*  remarks           =  lw_ent-remarks )
*            INTO TABLE lhc_buffer=>mt_buffer.
*
*
**        MOVE-CORRESPONDING lw_ent TO lw_tb_reg.
**        MODIFY zpmt_tb_register FROM @lw_tb_reg.
*
*
*    ENDLOOP.

    DATA : it_tab TYPE STANDARD TABLE OF zpmt_tb_register.
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_tb>).
        APPEND INITIAL LINE TO it_tab ASSIGNING FIELD-SYMBOL(<fs_tab>).
        MOVE-CORRESPONDING <fs_tb> to <fs_tab> .
    ENDLOOP.
    modify zpmt_tb_register from TABLE @it_tab.
  ENDMETHOD.

  METHOD update.
    DATA: lw_tb_reg TYPE zpmt_tb_register.
    LOOP AT entities INTO DATA(lw_ent).
*        MOVE-CORRESPONDING lw_ent TO lw_tb_reg.
*        MODIFY zpmt_tb_register FROM @lw_tb_reg.
    ENDLOOP.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zpm_tb_register DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zpm_tb_register IMPLEMENTATION.

 METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.



  ENDMETHOD.

  METHOD save.
 TYPES tt_posting TYPE TABLE OF zpmt_tb_register.
    DATA: lt_data TYPE  tt_posting.
    DATA: wa_buffer LIKE LINE OF lt_data.

    lt_data = lhc_buffer=>mt_buffer.

    MODIFY zpmt_tb_register FROM TABLE @lt_data.

  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
