@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Utilization & Performance'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_UTIL_PER8
  with parameters
    p_plant : zplant,
    p_frm   : zbegda,
    
                     
    
    
    
    
    p_to    : zbegda


  as select from ZPM_UTIL_PER7_1 ( p_plant: $parameters.p_plant, p_frm : $parameters.p_frm , p_to: $parameters.p_to )
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
    kmbyl,
    lbyhr,     
    lastdate,
    uom,
    FuelConsKm,
    FuelConsHr,
    shift_n,
    break_hr_n,
    SHIFT_BRK, 
    SHIFT_BRK1, 

//    case when $projection.SHIFT_BRK is null
    case when $projection.shift_brk is null or $projection.shift_brk is initial
    then cast( 0 as abap.fltp)
    else 
//    cast( 0 as abap.fltp)
    (100.00* (cast( (total_hr) as abap.fltp)) /  $projection.shift_brk ) 
    end as Utili,
    
    case when shift is null or shift is initial
    then cast( 0 as abap.fltp)
    else
    (100.00*cast( (break_hr) as abap.fltp) / cast( (shift) as abap.fltp))      end  as Brkdwn,
    
    case when shift is null or shift is initial
    then cast( 0 as abap.fltp)
    else
    (100.00*((cast( (shift) as abap.fltp)-cast( (break_hr) as abap.fltp))/(cast((shift) as abap.fltp)))) end as Avail,
    dat
    
}
where
  Plant = $parameters.p_plant
    and dat between $parameters.p_frm and $parameters.p_to
