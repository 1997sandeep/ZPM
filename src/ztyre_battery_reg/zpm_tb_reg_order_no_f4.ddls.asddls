@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tyre & Battery Register Order No. F4'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TB_REG_ORDER_NO_F4 as select from I_MaintOrderComponentDEX as a

{
   key a.Equipment as equipment,
   Material as material,
   a.MaintenanceOrder as order_no
}
group by a.Equipment,
   Material,
   a.MaintenanceOrder
