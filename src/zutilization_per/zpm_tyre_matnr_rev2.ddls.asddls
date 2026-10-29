@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material for NE reversed1'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_TYRE_MATNR_REV2
  as select from    ZPM_TYRE_MATNR_REV  as a1
    left outer join ZPM_TYRE_MATNR_REV1 as a2 on  a1.MaterialDocument     = a2.ReversedMaterialDocument
                                              and a1.MaterialDocumentItem = a2.ReversedMaterialDocumentItem

{
  key a1.MaterialDocumentYear,
  key a1.MaterialDocument,
  key a1.MaterialDocumentItem,
      a1.Material,
      a1.Plant,
      a1.DocumentDate,
      a1.OrderID,
      a1.OrderItem,
      case a2.IND
      when 'X' then a2.IND
      else 'R'
      end as ZIND

}
