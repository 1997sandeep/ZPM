@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Utilization & performance'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_UTIL_PER3
  with parameters
    p_plant : zplant,
    p_frm   : zbegda,
    p_to    : zbegda

  as select from    ZPM_UTIL_PER1
  ( p_plant: $parameters.p_plant, p_frm : $parameters.p_frm , p_to: $parameters.p_to ) as a1
    left outer join I_TechnicalObject   as a2 on a1.Equipment = a2.Equipment
    left outer join I_EquipmentTextDEX     as a3 on a1.Equipment = a3.Equipment
    left outer join ZPM_UTIL_PER2 ( p_frm: $parameters.p_frm, p_to: $parameters.p_to )                                
    as a4 on a1.Equipment = a4.Equipment
    left outer join I_TechnicalObjectTypeText  as a5 on a2.TechnicalObjectType = a5.TechnicalObjectType
    left outer join ZPM_UTIL_PER_SHIFT( p_frm : $parameters.p_frm , p_to: $parameters.p_to  ) as a6
    on a1.Plant = a6.plant
   and a1.Equipment = a6.equip_no  

{
  key a1.Plant,
  key a1.Equipment,
  key a2.ManufacturerSerialNumber as serial_no,
  key a1.EquipmentName,
      @Consumption.valueHelpDefinition: [{ entity:  { name: 'ZPM_F4_ObjectType', element: 'TechnicalObjectTypeDesc' }}]
  key a5.TechnicalObjectTypeDesc  as Zobjtyp,
      //  a2.YY1_EquipmentStatus_IEQ as equip_status,
      //  a3.YY1_EngineMake_IEQ,
      //  a3.YY1_RegNo_IEQ,
      ''                           as equip_status,
     '' as YY1_EngineMake_IEQ,
//      a2.YY1_RegisNo_IEQ as YY1_RegNo_IEQ,
//      a2.YY1_EquipmentStatus_IEQ as EquipmentStatus,
      sum(a1.shift)               as shift,
//      a6.shift,
      sum(a1.break_hr)            as break_hr,
      sum(a1.idle_hr)             as idle_hr,
      sum(a1.TotPlntPrd)          as total_prd,
      sum(a1.total_hr)            as total_hr,
      sum(a1.tot_run)             as tot_run,
//      sum(a2.YY1_FuelConsKm_IEQ)  as stdfuelconkm,
//      sum(a2.YY1_FuelConsHr_IEQ)  as stdfuelconhr,
//      '' as   stdfuelconkm,
//      '' as stdfuelconhr,
      a4.BaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
        a4.qty   as fuel_ltr,
        a1.dat,
//      cast(a4.qty as abap.dec(20,2))   as fuel_ltr,
      a1.uom,
      '' as FuelConsKm,
      '' as FuelConsHr
 
}
where
  a1.Plant = $parameters.p_plant
    and a1.dat between $parameters.p_frm and $parameters.p_to
group by
  a1.Plant,
  a1.Equipment,
  a2.ManufacturerSerialNumber,
//  a2.YY1_RegisNo_IEQ,
//  a2.YY1_EquipmentStatus_IEQ,
  a1.EquipmentName,
  a1.shift,
//  a6.shift,
  //    a1.Zobjtyp,
  //    a2.YY1_EquipmentStatus_IEQ,
  //    a2.YY1_FuelConsKm_IEQ,
  //    a2.YY1_FuelConsHr_IEQ,
  //    a3.YY1_EngineMake_IEQ,
  //    a3.YY1_RegNo_IEQ,
  a4.BaseUnit,
  a5.TechnicalObjectTypeDesc,
  a4.qty,
  a1.dat,
  a1.uom
