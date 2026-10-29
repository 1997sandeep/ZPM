@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tyre & Battery Register'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TB_REG_5 as select from zpmt_tb_register
{
    key project ,
    obj_type ,
    equipment,
    asset_code ,
    asset_des,
    reg_no ,
    item_type, 
    product_type, 
    product_group, 
    material ,
    material_des, 
    item_size ,
    item_make ,
    order_no ,
    gi_no ,
    tyre_sl_no, 
    position_of_item,
    fit_on_date,
    fit_at_read,
    dismant_date, 
    dismant_item_sno,
    dismant_at_read ,
    item_life_kmr ,
    item_life_days,
    item_status, 
    remarks 
}
