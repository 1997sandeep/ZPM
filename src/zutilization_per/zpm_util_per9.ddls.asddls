@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Utilization & Performance'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_UTIL_PER9
  with parameters
    p_plant : zplant,
    p_frm   : zbegda,              
    p_to    : zbegda

  as select from ZPM_UTIL_PER8 
  ( p_plant: $parameters.p_plant, p_frm : $parameters.p_frm , p_to: $parameters.p_to ) as a
  left outer join ZPM_UTIL_PER_FUEL_LTR_CUM 
  ( p_plant: $parameters.p_plant, p_frm: $parameters.p_frm, p_to: $parameters.p_to )  as b
  on a.Equipment = b.Equipment
{
key a.Plant,
key a.Equipment,
key a.serial_no,
key a.EquipmentName,
key a.Zobjtyp,
a.equip_status,
a.YY1_EngineMake_IEQ,
//a.YY1_RegNo_IEQ,
//a.EquipmentStatus,
a.shift,
a.break_hr,
a.idle_hr,
a.total_prd,
a.total_hr,
a.tot_run,
//a.stdfuelconkm,
//a.stdfuelconhr,
a.BaseUnit,
a.kmbyl,
a.lbyhr,
a.lastdate,
a.uom,
a.FuelConsKm,
a.FuelConsHr,
cast(a.Utili as abap.dec(15,2)) as Utili,
cast(a.Brkdwn as abap.dec(15,2)) as Brkdwn,
cast(a.Avail as abap.dec(15,2)) as Avail,              
    
b.FUEL_LTR,

case when b.FUEL_LTR is null or b.FUEL_LTR is initial
then cast( 0 as abap.fltp)
else
cast( (a.tot_run) as abap.fltp) / (cast( (b.FUEL_LTR) as abap.fltp)) end as AvgFuelConsKMPerLtr,

case 
when b.FUEL_LTR is null or b.FUEL_LTR is initial or
     a.total_hr is null or a.total_hr is initial
then cast( 0 as abap.fltp)
else
cast( (b.FUEL_LTR) as abap.fltp) / (cast( (a.total_hr) as abap.fltp)) 
end as AvgFuelConsLtrPerHr,
a.dat

}
where
  a.Plant = $parameters.p_plant
    and a.dat between $parameters.p_frm and $parameters.p_to
