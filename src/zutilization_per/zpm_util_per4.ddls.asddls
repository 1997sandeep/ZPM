@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Utilization & performance'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_UTIL_PER4
  with parameters
    p_plant : zplant,
    p_frm   : zbegda,
    p_to    : zbegda

  as select distinct from ZPM_UTIL_PER3 
  ( p_plant: $parameters.p_plant, p_frm : $parameters.p_frm , p_to: $parameters.p_to ) as a1
    left outer join       zsd_log_book_un  as a2 on a1.Equipment = a2.equip_no and a1.Plant = a2.plant
    left outer join       ZPM_UTIL_PER5  as a3 on a1.Equipment = a3.Equipment
    
{
  key a1.Plant,
  key a1.Equipment,
  key a1.serial_no,
  key a1.EquipmentName,
  key a1.Zobjtyp,
      a1.equip_status,
      a1.YY1_EngineMake_IEQ,
//      a1.YY1_RegNo_IEQ,
//      a1.EquipmentStatus,
      a1.shift,
      a1.break_hr,
      a1.idle_hr,
      a1.total_prd,
      a1.total_hr,
      a1.tot_run,
//      a3.stdfuelconkm,
//      a3.stdfuelconhr,
      a1.BaseUnit,
//      a1.fuel_ltr,
      //    case a1.total_hr when 0 then 0 else

      //  (100.00*((cast( (a1.total_hr) as abap.fltp)/(cast( (a1.shift) as abap.fltp))) - cast((a1.break_hr) as abap.fltp)))   as Utili,
      (100.00*((cast( (a1.total_hr) as abap.fltp)/(cast( (a1.shift) as abap.fltp))) - cast((a1.break_hr) as abap.fltp))) as Utili,
      //    (100.00*cast( (a1.total_hr) as abap.fltp)/(cast( (a1.shift) as abap.fltp)-cast((a1.break_hr) as abap.fltp))) as Utili,
      (100.00*cast( (a1.break_hr) as abap.fltp) / cast( (a1.shift) as abap.fltp))                                        as Brkdwn,
      (100.00*((cast( (a1.shift) as abap.fltp)-cast( (a1.break_hr) as abap.fltp))/(cast((a1.shift) as abap.fltp))))      as Avail,
      //  (100.00*(cast( (a1.shift) as abap.fltp)-cast( (a1.break_hr) as abap.fltp))/(cast((a1.shift) as abap.fltp))) as Avail,
      case a1.fuel_ltr when 0.00 then 0.00 else
      ((a1.tot_run))/(cast( (a1.fuel_ltr) as abap.fltp)) end                                                             as kmbyl,
      case (a1.total_hr) when 0.00 then 0.00 else
      cast( (a1.fuel_ltr) as abap.fltp)/(cast( (a1.total_hr) as abap.fltp)) end                                          as lbyhr,

      max(a2.dat)                                                                                                       as lastdate,
      a1.uom,
      a1.FuelConsKm,
      a1.FuelConsHr,
      a1.dat                                       
      
      
      
      
      
      
      
      
      
      

}
where
  a1.Plant = $parameters.p_plant
    and a1.dat between $parameters.p_frm and $parameters.p_to
group by
  a1.Plant,
  a1.Equipment,
  a1.serial_no,
  a1.EquipmentName,
//  a1.EquipmentStatus,
  a1.Zobjtyp,
  a1.equip_status,
  a1.YY1_EngineMake_IEQ,
//  a1.YY1_RegNo_IEQ,
  a1.shift,
  a1.dat,
  a1.break_hr,
  a1.idle_hr,
  a1.total_prd,
  a1.total_hr,
  a1.tot_run,
//  a3.stdfuelconkm,
//  a3.stdfuelconhr,
  a1.BaseUnit,
  a1.fuel_ltr,
  a1.total_hr,
  a1.shift,
  a1.break_hr,
  a1.tot_run,
  a1.uom,
  a1.FuelConsKm,
  a1.FuelConsHr
