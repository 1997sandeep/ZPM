@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Utilization & Performance Report'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_UTIL_PER7_1
  with parameters
    p_plant : zplant,
    p_frm   : zbegda,              
    p_to    : zbegda


  as select from ZPM_UTIL_PER7 ( p_plant: $parameters.p_plant, p_frm : $parameters.p_frm , p_to: $parameters.p_to )
{
    key Plant,
    key Equipment,
    key serial_no,
    key EquipmentName,
    key Zobjtyp,                                
    equip_status,                      
    
    
    
    
    
    
    
    YY1_EngineMake_IEQ,
//    YY1_RegNo_IEQ,
//    EquipmentStatus,
    shift,
    break_hr,
    idle_hr,
    total_prd,
    total_hr,
    tot_run,
//    stdfuelconkm,
//    stdfuelconhr,
    BaseUnit,
    Utili,
    Brkdwn,
    Avail,
    kmbyl,
    lbyhr,
    lastdate,
    uom,
    FuelConsKm,
    FuelConsHr,
    cast(shift as abap.fltp) as shift_n,
    cast(break_hr as abap.fltp) as break_hr_n,
    ($projection.shift_n - $projection.break_hr_n) as SHIFT_BRK, 
    shift - break_hr  as SHIFT_BRK1,
    dat
}
where
  Plant = $parameters.p_plant
    and dat between $parameters.p_frm and $parameters.p_to
