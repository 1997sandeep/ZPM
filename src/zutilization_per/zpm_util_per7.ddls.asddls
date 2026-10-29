@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Utilization & Performance'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_UTIL_PER7
  with parameters
    p_plant : zplant,
    p_frm   : zbegda,
    p_to    : zbegda


  as select from ZPM_UTIL_PER6 ( p_plant: $parameters.p_plant, p_frm : $parameters.p_frm , p_to: $parameters.p_to ) 
{                      

key Plant,                   
key Equipment,
key serial_no,
key EquipmentName,
key Zobjtyp,
equip_status,
YY1_EngineMake_IEQ,
//YY1_RegNo_IEQ,
//EquipmentStatus,
sum(shift) as shift,
sum(break_hr) as break_hr,
sum(idle_hr) as idle_hr,
sum(total_prd) as total_prd,
sum(total_hr) as total_hr,
sum(tot_run) as tot_run,
//sum(stdfuelconkm) as stdfuelconkm,
//sum(stdfuelconhr) as stdfuelconhr,
BaseUnit,
sum(Utili) as Utili,
sum(Brkdwn) as Brkdwn,
sum(Avail) as Avail,
sum(kmbyl) as kmbyl,
sum(lbyhr) as lbyhr,
lastdate,
uom,
FuelConsKm,
FuelConsHr,
dat


//cast(A.stdfuelconkm as abap.dec( 10, 2 )) as stdfuelconkm,

}
where
  Plant = $parameters.p_plant
    and dat between $parameters.p_frm and $parameters.p_to
group by 
Plant,
Equipment,
serial_no,
EquipmentName,
Zobjtyp,
equip_status,
YY1_EngineMake_IEQ,
//YY1_RegNo_IEQ,
//EquipmentStatus,
BaseUnit,
lastdate,
uom,
FuelConsKm,
FuelConsHr,
dat


  
