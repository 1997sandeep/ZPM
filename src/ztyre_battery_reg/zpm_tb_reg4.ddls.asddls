@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tyre & Battery Register 4'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TB_REG4 as select from zpmt_tb_register
{  
  key project,
  key obj_type,
  key equipment,
  position_of_item,
  fit_on_date as dismant_date,
  fit_at_read as dismant_at_read,
  tyre_sl_no as dismant_item_sno
   
}
