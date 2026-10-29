@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Utilization & performance'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_UTIL_PER2_1
with parameters
    p_frm   : zbegda,
    p_to    : zbegda

as select from ZPM_TYRE_MATNR_REV2 as A1
                                              inner join I_MaterialDocumentItem_2 as A2 
                                               on A1.MaterialDocument = A2.MaterialDocument 
                                               and A1.MaterialDocumentItem = A2.MaterialDocumentItem
{ 
key A2.Reservation,
A2.MaterialBaseUnit ,
@Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
sum(A2.QuantityInEntryUnit) as qty

}
 where A1.ZIND = 'R' and A2.PostingDate between $parameters.p_frm and $parameters.p_to
group by
A2.MaterialBaseUnit,
A2.Reservation
