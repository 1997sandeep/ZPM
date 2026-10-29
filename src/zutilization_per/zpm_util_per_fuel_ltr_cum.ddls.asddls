@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Utilization Per Equipment Fuel LTR Cumulative'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_UTIL_PER_FUEL_LTR_CUM
 with parameters
    p_plant : zplant,
    p_frm   : zbegda,
    p_to    : zbegda
// p_plant : abap.char(5), //zplant,
//    p_frm   : abap.dats, //zbegda,
//    p_to    : abap.dats //zbegda

  as select from ZPM_UTIL_PER_FUEL_LTR 
  ( p_plant: $parameters.p_plant, p_frm : $parameters.p_frm , p_to: $parameters.p_to )  as a
{
    key Plant,
    key Equipment,
    key EquipmentName,
    Reservation,
    sum(FUEL_LTR) as FUEL_LTR
} 
group by 
Plant,
  Equipment,
  EquipmentName,
  Reservation
