@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Logbook CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSD_LOGBOOK_F1
  with parameters
    pdate : zbegda
  as select from    I_Equipment

    left outer join ZSD_LOGBOOK_START_VAL_F( pdate:$parameters.pdate )     on I_Equipment.Equipment = ZSD_LOGBOOK_START_VAL_F.Equipment

    left outer join ZSD_LOGBOOK_STARTKM_VAL_F( pdate:$parameters.pdate )   on I_Equipment.Equipment = ZSD_LOGBOOK_STARTKM_VAL_F.Equipment

    left outer join ZSD_LOGBOOK_CUMM_HRS_F( pdate:$parameters.pdate )      on I_Equipment.Equipment = ZSD_LOGBOOK_CUMM_HRS_F.Equipment

    left outer join ZSD_LOGBOOK_CUMM_KMS_F( pdate:$parameters.pdate )      on I_Equipment.Equipment = ZSD_LOGBOOK_CUMM_KMS_F.Equipment

    left outer join I_TechnicalObject         as I_TechnicalObject                 on I_Equipment.Equipment = I_TechnicalObject.Equipment

    left outer join I_EquipmentText           as I_EquipmentText                     on I_Equipment.Equipment = I_EquipmentText.Equipment

    left outer join ZI_TECHNICALOBJECT        as ZI_TECHNICALOBJECT               on I_Equipment.Equipment = ZI_TECHNICALOBJECT.Equipment

    left outer join I_EquipmentTextDEX        as I_EquipmentTextDEX               on I_Equipment.Equipment = I_EquipmentTextDEX.Equipment

    left outer join I_TechnicalObjectTypeText as I_TechnicalObjectTypeText on I_Equipment.Equipment = I_TechnicalObjectTypeText.TechnicalObjectType

    left outer join zsd_log_book_un           as zsd_log_book_un                     on  I_Equipment.Equipment = zsd_log_book_un.equip_no
                                                                                     and zsd_log_book_un.dat   = $parameters.pdate
    left outer join ZPM_LOGBOOK_LAST_ENTRY    as last_entry                   on I_Equipment.Equipment = last_entry.EquipNo

    left outer join zpm_logbook_openbal       as openbal                         on  last_entry.EquipNo = openbal.EquipNo
                                                                                 and last_entry.Dat     = openbal.Dat

{
  key zsd_log_book_un.key_field                                                          as LogID,
      @EndUserText.label: 'Maintenance Planning Plant'
      @Consumption.valueHelpDefinition: [{ entity : {element: 'Plant', name: 'ZSD_f4_Plant'  }}]
  key I_TechnicalObject.MaintenancePlanningPlant                                        as Plant,
      @Consumption.valueHelpDefinition: [{ entity : {element: 'Equipment', name: 'ZSD_F4_EQUIPMENT'}}]
      I_Equipment.Equipment,
      //      zsd_log_book_un.dat                                                             as Dat,
      @EndUserText.label: 'Equipment Description'
      I_EquipmentText.EquipmentName                                                     as EquipmentName,
      @Consumption.valueHelpDefinition: [{ entity : { name: 'ZSD_F4_FUNCLOC', element: 'Funcloc' }}]
      @EndUserText.label: 'Equipment Object Type'
      ZI_TECHNICALOBJECT.SuperiorTechnicalObjectLabel                                   as funcLoc,
      @EndUserText.label: 'Equipment Object Type Description'
      ZI_TECHNICALOBJECT.SuperiorTechnicalObjectName                                    as funcDesc,
      //      I_EquipmentTextDEX.YY1_RegisNo_IEQ                                                as RegNo,
      //      //   I_TechnicalObject.YY1_Rental_IEQ                                                   as EquipType,
      //      case I_TechnicalObject.YY1_EquipmentType_IEQ
      //      when '101' then 'OWN'
      //      when '102' then 'HIRED'
      //      when '103' then 'RENTAL'
      //      end
//      I_TechnicalObject.YY1_EquipmentType_IEQ                                           as EquipType,
 case I_TechnicalObject.YY1_EquipmentTypee_IEQ
            when '101' then 'OWN'
            when '102' then 'HIRED'
            when '103' then 'RENTAL'
            end  as EquipType,
      I_Equipment.TechnicalObjectType                                                   as ObjTyp,
      @Consumption.valueHelpDefinition: [{ entity : { name: 'ZSD_F4_OBJTYP', element: 'TechnicalObjectTypeDesc' }}]
      I_TechnicalObjectTypeText.TechnicalObjectTypeDesc                                 as EquipObj,
      ////      @Consumption.valueHelpDefinition: [{ entity : { name: 'ZSD_F4_Ownhire', element: 'YY1_ZOWN_IEQ' }}]
      ////      I_EquipmentTextDEX.YY1_ZOWN_IEQ                                                 as OwnHire,
      @Consumption.valueHelpDefinition: [{ entity : { name: 'ZSD_F4_WBS', element: 'ProjectElement' }}]
      zsd_log_book_un.wbs                                                               as Wbs,
      cast(ZSD_LOGBOOK_START_VAL_F.MeasurementReadingInEntryUoM as abap.dec( 15, 2 ))   as StartHr,
      cast(zsd_log_book_un.close_hr as abap.dec( 15, 2 ))                               as CloseHr,
      cast(zsd_log_book_un.work_hr as abap.dec( 15, 2 ))                                as WorkHr,
      zsd_log_book_un.working_hr                                                        as WorkingHr,
      zsd_log_book_un.total_hr                                                          as TotalHr,
      zsd_log_book_un.idle_hr                                                           as IdleHr,
      zsd_log_book_un.break_hr                                                          as BreakHr,
      zsd_log_book_un.fuel_typ                                                          as FuelTyp,
      zsd_log_book_un.fuel                                                              as Fuel,
      zsd_log_book_un.fuelqty                                                           as FuelQty,
      cast(ZSD_LOGBOOK_STARTKM_VAL_F.MeasurementReadingInEntryUoM as abap.dec( 15, 2 )) as StartKm,
      cast(zsd_log_book_un.close_km as abap.dec( 15, 2 ))                               as CloseKm,
      cast(zsd_log_book_un.read_km as abap.dec( 15, 2 ))                                as ReadKm,
      zsd_log_book_un.remarks                                                           as Remarks,
      ZSD_LOGBOOK_STARTKM_VAL_F.MeasuringPoint                                          as Meaptkm,
      ZSD_LOGBOOK_START_VAL_F.MeasuringPoint                                            as Meaptwh,
      substring(zsd_log_book_un.dat,1,4)                                                as FiscYear,
      substring(zsd_log_book_un.dat,5,2)                                                as FiscMnth,
      zsd_log_book_un.shift                                                             as Shift,
      zsd_log_book_un.tot_plnt_prd                                                      as TotPlntPrd,
      I_TechnicalObject.ManufacturerSerialNumber                                        as MachineNo,
      cast(zsd_log_book_un.start_hr as abap.dec( 15, 2 ))                               as ChStrHmr,
      cast(zsd_log_book_un.start_km as abap.dec( 15, 2 ))                               as ChStrKmr,
      ' '                                                                               as ChangeInd,
      '2'                                                                               as ChangeDays,
      cast(ZSD_LOGBOOK_CUMM_HRS_F.MeasurementReadingInEntryUoM as abap.dec( 15, 2 ))    as CummHrs,
      ZSD_LOGBOOK_CUMM_HRS_F.MeasuringPoint                                             as CummHrsMp,
      cast(ZSD_LOGBOOK_CUMM_KMS_F.MeasurementReadingInEntryUoM as abap.dec( 15, 2 ))    as CummKm,
      ZSD_LOGBOOK_CUMM_KMS_F.MeasuringPoint                                             as CummKmMp,

      case when zsd_log_book_un.dat = $parameters.pdate
      then 'X'
      end                                                                               as Flag,
      case when zsd_log_book_un.dat is not initial
      then zsd_log_book_un.dat
      else '18000101'
      end                                                                               as Dat,
      //      openbal.closingbal                                                        as OpeningBal,  "Commented by Poonam
      case  //Added By Poonam
        when zsd_log_book_un.dat = $parameters.pdate
        then zsd_log_book_un.openingbal
        else openbal.closingbal
      end                                                                               as OpeningBal,
      zsd_log_book_un.fuel_receipt                                                      as FuelReceipt,
      zsd_log_book_un.closingbal                                                        as ClosingBal,
      zsd_log_book_un.act_avg_kml                                                       as ActAvgKml,
      zsd_log_book_un.act_avg_lhr                                                       as ActAvgLhr,
      zsd_log_book_un.fuel_cash_purch                                                   as FuelCashPurch,
      zsd_log_book_un.fuel_theft                                                        as FuelTheft,
      zsd_log_book_un.owner_used_hmr                                                    as OwnerUsedHmr,
      zsd_log_book_un.owner_used_kmr                                                    as OwnerUsedKmr,
      zsd_log_book_un.fuel_used_owner                                                   as FuelUsedOwner,
      zsd_log_book_un.hmr_kmr                                                           as HmrKmr,
      zsd_log_book_un.wbs_elem_1                                                        as WbsElem1,
      zsd_log_book_un.hmr_kmr_1                                                         as HmrKmr1,
      zsd_log_book_un.wbs_elem_2                                                        as WbsElem2,
      zsd_log_book_un.hmr_kmr_2                                                         as HmrKmr2,
      zsd_log_book_un.wbs_elem_3                                                        as WbsElem3,
      zsd_log_book_un.hmr_kmr_3                                                         as HmrKmr3,
      zsd_log_book_un.wbs_elem_4                                                        as WbsElem4,
      zsd_log_book_un.hmr_kmr_4                                                         as HmrKmr4,
      zsd_log_book_un.breakdown_rsn                                                     as BreakDownRsn,
      last_entry.Dat                                                                    as LastLogEntry,
      zsd_log_book_un.equipcondition                                                    as EquipCondition,
      zsd_log_book_un.uom                                                               as Uom,
      //      I_TechnicalObject.YY1_ETMStartDate_IEQ                                            as Startdate,
      //      I_TechnicalObject.YY1_ETMEndDate_IEQ                                              as Enddate,
      I_TechnicalObject.TechnicalObjectCategory                                         as TechCategory,
      I_TechnicalObject.YY1_VehicleMileageKMHR_IEQ                                      as VehicleMileage //Added by Poonam
}
where
      $parameters.pdate                          <> '99991231'
  and I_TechnicalObject.MaintenancePlanningPlant <> ''
//  and ZSD_LOGBOOK_STARTKM_VAL_F.MeasuringPoint <> '000000000037'
//  and I_TechnicalObject.YY1_Logentry_IEQ         =  'YES'
