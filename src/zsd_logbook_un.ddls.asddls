@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Logbook entry'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSD_LOGBOOK_UN
  as select from I_Equipment

  association [1..1] to I_TechnicalObject         on $projection.Equipment = I_TechnicalObject.Equipment

  association [1..1] to I_EquipmentText           on $projection.Equipment = I_EquipmentText.Equipment

  association [1..1] to ZI_TECHNICALOBJECT        on $projection.Equipment = ZI_TECHNICALOBJECT.Equipment

  association [1..1] to I_EquipmentTextDEX        on $projection.Equipment = I_EquipmentTextDEX.Equipment

  association [1..1] to I_TechnicalObjectTypeText on $projection.Equipment = I_TechnicalObjectTypeText.TechnicalObjectType 
  
  //  association [1..1] to ZSD_C_LOGBOOK_PRE1        on $projection.Equipment = ZSD_C_LOGBOOK_PRE1.Equipment

  //  association [1..1] to ZSD_C_LOGBOOK_PRE2        on $projection.Equipment = ZSD_C_LOGBOOK_PRE2.Equipment

  association [1..1] to ZSD_LOGBOOK_START_VAL     on $projection.Equipment = ZSD_LOGBOOK_START_VAL.Equipment

  association [1..1] to ZSD_LOGBOOK_STARTKM_VAL   on $projection.Equipment = ZSD_LOGBOOK_STARTKM_VAL.Equipment

  association [1..1] to ZSD_LOGBOOK_CUMM_HRS      on $projection.Equipment = ZSD_LOGBOOK_CUMM_HRS.Equipment

  association [1..1] to ZSD_LOGBOOK_CUMM_KMS      on $projection.Equipment = ZSD_LOGBOOK_CUMM_KMS.Equipment

  association [1..1] to zsd_log_book_un           on $projection.Equipment = zsd_log_book_un.equip_no

  association [1..1] to ZPM_LOGBOOK_LAST_ENTRY    on $projection.Equipment = ZPM_LOGBOOK_LAST_ENTRY.EquipNo

  association [1..1] to zpm_logbook_openbal       on $projection.Equipment = zpm_logbook_openbal.EquipNo
{
  key zsd_log_book_un.key_field                                                       as LogID,
      @EndUserText.label: 'Maintenance Planning Plant'
      @Consumption.valueHelpDefinition: [{ entity : {element: 'Plant', name: 'ZSD_f4_Plant'  }}]
  key I_TechnicalObject.MaintenancePlanningPlant                                      as Plant,
      @Consumption.valueHelpDefinition: [{ entity : {element: 'Equipment', name: 'ZSD_F4_EQUIPMENT'}}]
      I_Equipment.Equipment,
      zsd_log_book_un.dat                                                             as Dat,
      @EndUserText.label: 'Equipment Description'
      I_EquipmentText.EquipmentName                                                   as EquipmentName,
      @Consumption.valueHelpDefinition: [{ entity : { name: 'ZSD_F4_FUNCLOC', element: 'Funcloc' }}]
      @EndUserText.label: 'Equipment Object Type'
      ZI_TECHNICALOBJECT.SuperiorTechnicalObjectLabel                                 as funcLoc,
      @EndUserText.label: 'Equipment Object Type Description'
      ZI_TECHNICALOBJECT.SuperiorTechnicalObjectName                                  as funcDesc,
//      I_EquipmentTextDEX.YY1_RegisNo_IEQ                                              as RegNo,
//      case I_TechnicalObject.YY1_Rental_IEQ
//      when '101' then 'OWN'
//      when '102' then 'HIRED'
//      when '103' then 'RENTAL'
//      end                                                                               as EquipType,
      I_Equipment.TechnicalObjectType                                                 as ObjTyp,
      @Consumption.valueHelpDefinition: [{ entity : { name: 'ZSD_F4_OBJTYP', element: 'TechnicalObjectTypeDesc' }}]
      I_TechnicalObjectTypeText.TechnicalObjectTypeDesc                               as EquipObj,
      //      @Consumption.valueHelpDefinition: [{ entity : { name: 'ZSD_F4_Ownhire', element: 'YY1_ZOWN_IEQ' }}]
      //      I_EquipmentTextDEX.YY1_ZOWN_IEQ                                                 as OwnHire,
      @Consumption.valueHelpDefinition: [{ entity : { name: 'ZSD_F4_WBS', element: 'ProjectElement' }}]
      zsd_log_book_un.wbs                                                             as Wbs,
      cast(ZSD_LOGBOOK_START_VAL.MeasurementReadingInEntryUoM as abap.dec( 15, 2 ))   as StartHr,
      cast(zsd_log_book_un.close_hr as abap.dec( 15, 2 ))                             as CloseHr,
// Added By Pavan(21.08.2025)
      zsd_log_book_un.close_hr_dec, 
      zsd_log_book_un.close_km_dec,
      cast(zsd_log_book_un.work_hr as abap.dec( 15, 2 ))                              as WorkHr,
      zsd_log_book_un.working_hr                                                      as WorkingHr,
      zsd_log_book_un.total_hr                                                        as TotalHr,
      zsd_log_book_un.idle_hr                                                         as IdleHr,
      zsd_log_book_un.break_hr                                                        as BreakHr,
      zsd_log_book_un.fuel_typ                                                        as FuelTyp,
      zsd_log_book_un.fuel                                                            as Fuel,
      zsd_log_book_un.fuelqty                                                         as FuelQty,
      cast(ZSD_LOGBOOK_STARTKM_VAL.MeasurementReadingInEntryUoM as abap.dec( 15, 2 )) as StartKm,
      cast(zsd_log_book_un.close_km as abap.dec( 15, 2 ))                             as CloseKm,
      cast(zsd_log_book_un.read_km as abap.dec( 15, 2 ))                              as ReadKm,
      zsd_log_book_un.remarks                                                         as Remarks,
      ZSD_LOGBOOK_STARTKM_VAL.MeasuringPoint                                          as Meaptkm,
      ZSD_LOGBOOK_START_VAL.MeasuringPoint                                            as Meaptwh,
      substring(zsd_log_book_un.dat,1,4)                                              as FiscYear,
      substring(zsd_log_book_un.dat,5,2)                                              as FiscMnth,
      zsd_log_book_un.shift                                                           as Shift,
      zsd_log_book_un.tot_plnt_prd                                                    as TotPlntPrd,
      I_TechnicalObject.ManufacturerSerialNumber                                      as MachineNo,
      cast(zsd_log_book_un.start_hr as abap.dec( 15, 2 ))                             as ChStrHmr,
      cast(zsd_log_book_un.start_km as abap.dec( 15, 2 ))                             as ChStrKmr,
      ' '                                                                             as ChangeInd,
      '2'                                                                             as ChangeDays,
      cast(ZSD_LOGBOOK_CUMM_HRS.MeasurementReadingInEntryUoM as abap.dec( 15, 2 ))    as CummHrs,
      ZSD_LOGBOOK_CUMM_HRS.MeasuringPoint                                             as CummHrsMp,
      cast(ZSD_LOGBOOK_CUMM_KMS.MeasurementReadingInEntryUoM as abap.dec( 15, 2 ))    as CummKm,
      ZSD_LOGBOOK_CUMM_KMS.MeasuringPoint                                             as CummKmMp,
      zsd_log_book_un.flag                                                            as Flag,
      zpm_logbook_openbal.closingbal                                                  as OpeningBal,
      zsd_log_book_un.fuel_receipt                                                    as FuelReceipt,
      zsd_log_book_un.closingbal                                                      as ClosingBal,
      zsd_log_book_un.act_avg_kml                                                     as ActAvgKml,
      zsd_log_book_un.act_avg_lhr                                                     as ActAvgLhr,
      zsd_log_book_un.fuel_cash_purch                                                 as FuelCashPurch,
      zsd_log_book_un.fuel_theft                                                      as FuelTheft,
      zsd_log_book_un.owner_used_hmr                                                  as OwnerUsedHmr,
      zsd_log_book_un.owner_used_kmr                                                  as OwnerUsedKmr,
      zsd_log_book_un.fuel_used_owner                                                 as FuelUsedOwner,
      zsd_log_book_un.hmr_kmr                                                         as HmrKmr,
      zsd_log_book_un.wbs_elem_1                                                      as WbsElem1,
      zsd_log_book_un.hmr_kmr_1                                                       as HmrKmr1,
      zsd_log_book_un.wbs_elem_2                                                      as WbsElem2,
      zsd_log_book_un.hmr_kmr_2                                                       as HmrKmr2,
      zsd_log_book_un.wbs_elem_3                                                      as WbsElem3,
      zsd_log_book_un.hmr_kmr_3                                                       as HmrKmr3,
      zsd_log_book_un.wbs_elem_4                                                      as WbsElem4,
      zsd_log_book_un.hmr_kmr_4                                                       as HmrKmr4,
      zsd_log_book_un.breakdown_rsn                                                   as BreakDownRsn,
      ZPM_LOGBOOK_LAST_ENTRY.Dat                                                      as LastLogEntry,
      zsd_log_book_un.uom                                                             as Uom,
      zsd_log_book_un.equipcondition                                                  as EquipCondition,
//      I_TechnicalObject.YY1_ETMStartDate_IEQ                                          as Startdate,
//      I_TechnicalObject.YY1_ETMEndDate_IEQ                                            as Enddate,
      I_TechnicalObject.TechnicalObjectCategory                                       as TechCategory
}
where
      I_TechnicalObject.MaintenancePlanningPlant <> ''
//  and I_TechnicalObject.YY1_Logentry_IEQ         =  'YES' 
