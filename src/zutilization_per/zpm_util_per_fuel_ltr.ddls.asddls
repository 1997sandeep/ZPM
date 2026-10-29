@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Utilization & Performance Fuel LTR'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_UTIL_PER_FUEL_LTR
  with parameters
    p_plant : zplant,
    p_frm   : zbegda,
    p_to    : zbegda


  as select from ZPM_UTIL_PER_FUEL_LTR_H 
  ( p_plant: $parameters.p_plant, p_frm : $parameters.p_frm , p_to: $parameters.p_to )  as a
 left outer join ZPM_UTIL_PER_FUEL_LTR_S
 ( p_plant: $parameters.p_plant, p_frm: $parameters.p_frm, p_to: $parameters.p_to )  as b
 on a.Plant = b.Plant
and a.Equipment = b.Equipment
and a.Reservation = b.Reservation
and a.PostingDate = b.PostingDate
  { 
  key a.Plant,
  key a.Equipment,
  key a.EquipmentName,
  a.MaintenanceOrderType,
  a.MaterialGroup,
  a.Reservation,
  a.PostingDate,
  
  case 
  when b.Qty is null
    then a.Qty
  else
  cast(a.Qty - b.Qty as abap.dec(15,2))
  end as FUEL_LTR
  }
