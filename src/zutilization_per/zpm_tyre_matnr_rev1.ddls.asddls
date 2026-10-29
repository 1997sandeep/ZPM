@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material for NE reversed'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TYRE_MATNR_REV1 as select from I_MaterialDocumentItem_2 as A1
{
  key A1.ReversedMaterialDocumentYear,
  key A1.ReversedMaterialDocument,
  key A1.ReversedMaterialDocumentItem,
      A1.Material,
      A1.Plant,
      A1.PostingDate as DocumentDate,
      A1.OrderID,
      A1.OrderItem,
      cast(ltrim( A1.Material, '0' ) as zmat preserving type ) as matnr,
      'X' as IND


} where A1.ReversedMaterialDocument <> '' //and  A1.GoodsMovementType = '261'
group by
  A1.ReversedMaterialDocumentYear,
  A1.ReversedMaterialDocument,
  A1.ReversedMaterialDocumentItem,
      A1.Material,
      A1.Plant,
      A1.PostingDate ,
      A1.OrderID,
      A1.OrderItem
