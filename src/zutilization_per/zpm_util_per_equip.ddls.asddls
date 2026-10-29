@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZPM_UTIL_PER_EQUIP'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_UTIL_PER_EQUIP
  with parameters
    p_equip : zeqip,
    p_frm   : zbegda,
    p_plant : zplant,
    p_to    : zbegda
  as select from    ZPM_UTIL_PER_EQUIP1

    left outer join I_TechnicalObject as I_TechnicalObject on ZPM_UTIL_PER_EQUIP1.Equipment = I_TechnicalObject.Equipment





    left outer join ZPM_UTIL_PER9(
                    p_plant: $parameters.p_plant,
                    p_frm  : $parameters.p_frm,
                    p_to   : $parameters.p_to
                    )                 as A1                on(
                     ZPM_UTIL_PER_EQUIP1.Equipment     = A1.Equipment
                     and ZPM_UTIL_PER_EQUIP1.Plant     = A1.Plant
                   )
{
  key ZPM_UTIL_PER_EQUIP1.Dat,
  key ZPM_UTIL_PER_EQUIP1.plant12,
      ZPM_UTIL_PER_EQUIP1.Plant,
      ZPM_UTIL_PER_EQUIP1.PlantName,

      ZPM_UTIL_PER_EQUIP1.Equipment,
       case I_TechnicalObject.YY1_EquipmentTypee_IEQ
            when '101' then 'OWN'
            when '102' then 'HIRED'
            when '103' then 'RENTAL'
            end   as EquipType,
//      I_TechnicalObject.YY1_EquipmentType_IEQ  as EquipType,
I_TechnicalObject.YY1_EquipmentStatus_IEQ  as EquipmentStatus,
I_TechnicalObject.YY1_FuelType_IEQ,
case 
when ZPM_UTIL_PER_EQUIP1.HmrKmr = 'H' then  ZPM_UTIL_PER_EQUIP1.FuelConsumption
end as YY1_FuelConsHr_IEQ ,
case 
when ZPM_UTIL_PER_EQUIP1.HmrKmr = 'K' then  ZPM_UTIL_PER_EQUIP1.FuelConsumption
end as YY1_FuelConsKm_IEQ ,
//      I_TechnicalObject.YY1_FuelConsKm_IEQ,
//      I_TechnicalObject.YY1_FuelConsHr_IEQ,
//       I_TechnicalObject.YY1_EquipmentStatus_IEQ as EquipmentStatus,
      I_TechnicalObject.YY1_FuelType_IEQ  as YY1_RegNo_IEQ,
//      A1.EquipmentStatus,
cast(A1.Utili as abap.dec(15,2)) as Utili,
cast(A1.Brkdwn as abap.dec(15,2)) as Brkdwn,
      cast(A1.Avail as abap.dec(15,2)) as Avail,
      ZPM_UTIL_PER_EQUIP1.EquipmentName,
//      ZPM_UTIL_PER_EQUIP1.serial_no,
      ZPM_UTIL_PER_EQUIP1.YY1_ENGINEMAKE_IEQ,
      ZPM_UTIL_PER_EQUIP1.Zobjtyp,
      ZPM_UTIL_PER_EQUIP1.LastLogEntry,
      ZPM_UTIL_PER_EQUIP1.shift,
      ZPM_UTIL_PER_EQUIP1.StartHr,
      ZPM_UTIL_PER_EQUIP1.CloseHr,
      ZPM_UTIL_PER_EQUIP1.WorkHr,
      ZPM_UTIL_PER_EQUIP1.CummulativeHrs,
      ZPM_UTIL_PER_EQUIP1.StartKm,
      ZPM_UTIL_PER_EQUIP1.CloseKm,
      ZPM_UTIL_PER_EQUIP1.ReadKm,
      ZPM_UTIL_PER_EQUIP1.CummulativeKm,
      ZPM_UTIL_PER_EQUIP1.TotPlntPrd,
      ZPM_UTIL_PER_EQUIP1.uom,
      ZPM_UTIL_PER_EQUIP1.BreakHr,
      ZPM_UTIL_PER_EQUIP1.IdleHr,
      ZPM_UTIL_PER_EQUIP1.OpeningBal,
      ZPM_UTIL_PER_EQUIP1.FuelReceipt,
      ZPM_UTIL_PER_EQUIP1.FuelConsumption,
      ZPM_UTIL_PER_EQUIP1.ClosingBal,
      ZPM_UTIL_PER_EQUIP1.ActAvgKml,
      ZPM_UTIL_PER_EQUIP1.ActAvgLhr,
      ZPM_UTIL_PER_EQUIP1.FuelCashPurch,
      ZPM_UTIL_PER_EQUIP1.FuelTheft,
      ZPM_UTIL_PER_EQUIP1.OwnerUsedHmr,
      ZPM_UTIL_PER_EQUIP1.FuelUsedOwner,
      ZPM_UTIL_PER_EQUIP1.WbsElem1,
      ZPM_UTIL_PER_EQUIP1.HmrKmr1,
      ZPM_UTIL_PER_EQUIP1.WbsElem2,
      ZPM_UTIL_PER_EQUIP1.HmrKmr2,
      ZPM_UTIL_PER_EQUIP1.WbsElem3,
      ZPM_UTIL_PER_EQUIP1.HmrKmr3,
      ZPM_UTIL_PER_EQUIP1.WbsElem4,
      ZPM_UTIL_PER_EQUIP1.HmrKmr4,
      ZPM_UTIL_PER_EQUIP1.BreakDownRsn,
      ZPM_UTIL_PER_EQUIP1.Remarks,
      ZPM_UTIL_PER_EQUIP1.HmrKmr
      
      //key Dat,
      // key_field,
      // Plant,
      // Equipment,
      // serial_no,
      // EquipmentName,
      // Zobjtyp,
      //equip_status,
      //YY1_ENGINEMAKE_IEQ,
      //YY1_REGISTRATIONNO_IEQ,
      //FunctionalLocation,
      //FunctionalDescription,
      //RegistrationNo,
      //EquipmentObject,
      //OwnHire,
      //Wbs,
      //StartHr,
      //CloseHr,
      //WorkHr,
      //IdleHr,
      //BreakHr,
      //DatS,
      //FuelType,
      //Fuel,
      //FuelQty,
      //StartKm,
      //CloseKm,
      //ReadKm,
      //Remarks,
      //Meaptkm,
      //Meaptwh,
      //FiscYear,
      //FiscMnth,
      //Shift,
      //TotPlntPrd,
      //MachineNo,
      //ChStrHmr,
      //ChStrKmr,
      //ChangeInd,
      //ChangeDays,
      //CummulativeHrs,
      //CummulativeHrsMeasPt,
      //CummulativeKm,
      //CummulativeKmMeasPt,
      //Flag,
      //OpeningBal,
      //FuelReceipt,
      //ClosingBal,
      //ActAvgKml,
      //ActAvgLhr,
      //FuelCashPurch,
      //FuelTheft,
      //OwnerUsedHmr,
      //OwnerUsedKmr,
      //FuelUsedOwner,
      //HmrKmr,
      //WbsElem1,
      //HmrKmr1,
      //WbsElem2,
      //HmrKmr2,
      //WbsElem3,
      //HmrKmr3,
      //WbsElem4,
      //HmrKmr4,
      //BreakDownRsn,
      //LastLogEntry,
      //Uom,
      //Startdate,
      //Enddate,
      //TechCategory

//      case I_TechnicalObject.YY1_Rental_IEQ
//      when '101' then 'OWN'
//      when '102' then 'HIRED'
//      when '103' then 'RENTAL'
//      end as EquipType
      


}
where
      ZPM_UTIL_PER_EQUIP1.Equipment = $parameters.p_equip
  and ZPM_UTIL_PER_EQUIP1.plant12   = $parameters.p_plant
  and ZPM_UTIL_PER_EQUIP1.Dat       between $parameters.p_frm and $parameters.p_to
