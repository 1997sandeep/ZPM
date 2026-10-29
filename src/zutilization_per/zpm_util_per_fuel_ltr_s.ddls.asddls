@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Utilization & Performance Fuel LTR'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_UTIL_PER_FUEL_LTR_S 
  with parameters
    p_plant : zplant,
    p_frm   : zbegda,
    p_to    : zbegda
  as select from ZPM_UTIL_PER8
  ( p_plant: $parameters.p_plant, p_frm : $parameters.p_frm , p_to: $parameters.p_to ) as a
  left outer join I_MaintOrderComponentDEX as b
  on a.Equipment = b.Equipment 
  left outer join I_MaterialDocumentItem_2 as c
  on b.Reservation = c.Reservation
{
  key a.Plant,
  key a.Equipment,
  key a.EquipmentName,
  b.MaintenanceOrderType,
  b.MaterialGroup,
  b.Reservation,
  c.DebitCreditCode,
  c.PostingDate,
  cast(c.QuantityInEntryUnit as abap.dec(15,2)) as Qty
}where b.MaintenanceOrderType = 'YA04'
 and c.PostingDate between $parameters.p_frm and $parameters.p_to
 and c.DebitCreditCode = 'S'
 and b.MaterialGroup = '1903'
  or b.MaterialGroup = '1904'
  or b.MaterialGroup = '1905'
  or b.MaterialGroup = '1906'

group by 

a.Plant,
  a.Equipment,
  a.EquipmentName,
  b.MaintenanceOrderType,
  b.MaterialGroup,
  b.Reservation,
  c.DebitCreditCode,
  c.PostingDate,
  c.QuantityInEntryUnit
