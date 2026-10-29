@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tyre Sl No'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TB_REG_TYRE_SL_NO_F4 as select from ZPM_TB_REG_TYRE_SL_NO as a
left outer join zpmt_tb_register as b
on a.tyre_sl_no = b.tyre_sl_no

{
 
 key a.material,
 key a.order_no,
 key a.gi_no,
 a.tyre_sl_no
 
} where b.tyre_sl_no is null
