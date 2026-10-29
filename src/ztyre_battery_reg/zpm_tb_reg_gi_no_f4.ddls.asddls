@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'GI NO. F4 for Tyre & Battery Register'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TB_REG_GI_NO_F4 as select from I_MaterialDocumentItem_2 as a
left outer join I_SerialNumberMaterialDoc_2 as b
on a.MaterialDocument = b.MaterialDocument
{ 

  key a.Material as material,
  key a.OrderID as order_no,
  key a.MaterialDocument as gi_no
}
 where a.GoodsMovementType = '261'
    or a.GoodsMovementType = '101'
 
group by a.Material,
         a.OrderID ,
         a.MaterialDocument
