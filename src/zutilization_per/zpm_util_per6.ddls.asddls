@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Utilization & Performance'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
} 
define view entity ZPM_UTIL_PER6 
  with parameters
    p_plant : zplant,                      
    p_frm   : zbegda,
    p_to    : zbegda

  as select from ZPM_UTIL_PER4 ( p_plant: $parameters.p_plant, p_frm : $parameters.p_frm , p_to: $parameters.p_to )
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
shift,
cast(break_hr as abap.dec(15,2)) as break_hr,                 
cast(idle_hr as abap.dec(15,2)) as idle_hr,
total_prd,
cast(total_hr as abap.dec(15,2)) as total_hr,
cast(tot_run as abap.dec(15,2)) as tot_run,
//stdfuelconkm,
//stdfuelconhr ,
BaseUnit,
cast(Utili as abap.dec(15,2)) as Utili,
cast(Brkdwn as abap.dec(15,2)) as Brkdwn,
cast(Avail as abap.dec(15,2)) as Avail,
cast(kmbyl as abap.dec(15,2)) as kmbyl,
cast(lbyhr as abap.dec(15,2)) as lbyhr,
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
