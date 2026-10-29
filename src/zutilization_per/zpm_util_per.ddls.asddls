//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PM utilization-BK'
define view entity ZPM_UTIL_PER
  with parameters
    p_plant : zplant,
    p_frm   : zbegda,
    p_to    : zbegda

  as select distinct from ZPM_UTIL_PER9 
  ( p_plant: $parameters.p_plant, p_frm : $parameters.p_frm , p_to: $parameters.p_to )as a
      left outer join I_TechnicalObject         as I_TechnicalObject                 on a.Equipment = I_TechnicalObject.Equipment
      left outer join ZPM_UTIL_PER_EQUIP1 as a1 on  ( a.Equipment = a1.Equipment  and a.Plant = a1.Plant )
//  left outer join zsd_log_book_un as a1 on ( a.Plant = a1.plant and a.Equipment = a1.equip_no  )
  
{

key a.Plant,
key a.Equipment,
key a.serial_no,
key a.EquipmentName,             


key a.Zobjtyp,
 case I_TechnicalObject.YY1_EquipmentTypee_IEQ
            when '101' then 'OWN'
            when '102' then 'HIRED'
            when '103' then 'RENTAL'
            end   as EquipType,
I_TechnicalObject.YY1_EquipmentStatus_IEQ  as EquipmentStatus,
I_TechnicalObject.YY1_FuelType_IEQ,
case I_TechnicalObject.YY1_STDFuelConsumption_IEQ
when '102' then 'L/HR'
end as YY1_FuelConsHr_IEQ ,
case I_TechnicalObject.YY1_STDFuelConsumption_IEQ
when '101' then 'KM/L'
end as YY1_FuelConsKm_IEQ ,

//key a1.Dat as DAT1,
//a1.FuelReceipt,
//a1.WorkHr,
//a1.ReadKm,
//I_TechnicalObject.YY1_FuelConsKm_IEQ,
//I_TechnicalObject.YY1_FuelConsHr_IEQ,                    
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
a.Utili,
a.Brkdwn,
a.Avail,
a.kmbyl,
a.lbyhr,
a.lastdate,                   
a.uom,
a.FuelConsKm,
a.FuelConsHr,
a.FUEL_LTR,                        
cast(a.AvgFuelConsKMPerLtr as abap.dec(15,2)) as AvgFuelConsKMPerLtr,
cast(a.AvgFuelConsLtrPerHr as abap.dec(15,2)) as AvgFuelConsLtrPerHr,
a.dat
//      case I_TechnicalObject.YY1_Rental_IEQ
//      when '101' then 'OWN'
//      when '102' then 'HIRED'                       
//      when '103' then 'RENTAL'
//      end                                                                               as EquipType

}


//key a.Equipment,
//key a.serial_no,
//key a.EquipmentName,
//key a.Zobjtyp,
//a.equip_status,
//a.YY1_EngineMake_IEQ,
//a.YY1_RegNo_IEQ,
//a.EquipmentStatus,
//a.shift,
//a.break_hr,
//a.idle_hr, 
//a.total_prd,
//a.total_hr,
//a.tot_run,
//a.stdfuelconkm,
//a.stdfuelconhr,
//a.BaseUnit,
//a.Utili,
//a.Brkdwn,
//a.Avail,
//a.kmbyl,
//a.lbyhr,
//a.lastdate,
//a.uom,
//a.FuelConsKm,
//a.FuelConsHr,
//
//'' as FUEL_LTR
where
  a.Plant = $parameters.p_plant
    and a.dat between $parameters.p_frm and $parameters.p_to
