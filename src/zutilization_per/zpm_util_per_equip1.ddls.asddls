@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZPM_UTIL_PER_EQUIP1'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_UTIL_PER_EQUIP1
as select from ZPM_UTIL_PER_EQUIP6 as a
left outer join I_Plant as B on ( a.plant12 = B.Plant )
//left outer join ZPM_UTIL_PER_EQUIP4 as b  
// on a.Equipment = b.Equipment
//and a.Dat = b.Dat 
{

 key   a.Dat,
 key   a.Plant,
 key a.plant12,
 
 key   a.Equipment,
 B.PlantName,
    a.EquipmentName,
//    a.serial_no,
    a.YY1_ENGINEMAKE_IEQ,
    a.Zobjtyp,
    a.LastLogEntry,
    a.shift, 
    a.StartHr,
    a.CloseHr, 
    a.WorkHr,
    a.CummulativeHrs,
    a.StartKm,
    a.CloseKm,
    a.ReadKm,
    a.CummulativeKm,
    a.TotPlntPrd,
    a.uom,
    a.BreakHr,
    a.IdleHr,
    a.OpeningBal,
    a.FuelReceipt,
    a.FuelConsumption,
    a.ClosingBal,
    a.ActAvgKml,
    a.ActAvgLhr,
    a.FuelCashPurch,
    a.FuelTheft,
    a.OwnerUsedHmr,
    a.FuelUsedOwner,
    a.WbsElem1,
    a.HmrKmr1,
    a.WbsElem2,
    a.HmrKmr2,
    a.WbsElem3,
    a.HmrKmr3,
    a.WbsElem4,
    a.HmrKmr4,
    a.BreakDownRsn,
    a.Remarks,
    a.HmrKmr
    

}

group by    
    a.Dat,
    a.Plant,
    a.Equipment,
    a.EquipmentName,
//    a.serial_no,
    a.YY1_ENGINEMAKE_IEQ,
    a.Zobjtyp,
    a.LastLogEntry,
    a.shift,
    a.StartHr,
    a.CloseHr,
    a.WorkHr,
    a.CummulativeHrs,
    a.StartKm,
    a.CloseKm,
    a.ReadKm,
    a.CummulativeKm,
    a.TotPlntPrd,
    a.plant12,
    a.uom,
    a.BreakHr,
    a.IdleHr,
    a.OpeningBal,
    B.PlantName,
    a.FuelReceipt,
    a.FuelConsumption,
    a.ClosingBal,
    a.ActAvgKml,
    a.ActAvgLhr,
    a.FuelCashPurch,
    a.FuelTheft,
    a.OwnerUsedHmr,
    a.FuelUsedOwner,
    a.WbsElem1,
    a.HmrKmr1,
    a.WbsElem2,
    a.HmrKmr2,
    a.WbsElem3,
    a.HmrKmr3,
    a.WbsElem4,
    a.HmrKmr4,
    a.BreakDownRsn,
    a.Remarks,
    a.HmrKmr
