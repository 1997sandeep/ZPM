@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tyre & Battery Register 2(order No'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TB_REG2 as select from I_MaintOrderComponentDEX as a
left outer join I_MaterialDocumentItem_2 as b
 on a.MaintenanceOrder = b.OrderID
left outer join I_SerialNumberMaterialDoc_2 as c
 on b.MaterialDocument = c.MaterialDocument

{
   key a.Equipment as equipment,
   a.MaintenanceOrder as order_no,
   b.MaterialDocument as gi_no, 
   c.SerialNumber

   
}
