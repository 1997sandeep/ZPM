@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'F4 Equipment'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_F4_Equpiment   as select from I_Equipment        as a1
    inner join   I_TechnicalObject  as a2 on a1.Equipment = a2.Equipment
    inner join   I_EquipmentText    as a3 on a1.Equipment = a3.Equipment
    inner join   I_EquipmentTextDEX as a4 on a1.Equipment = a4.Equipment
    inner join   I_PlantStdVH       as a5 on a2.MaintenancePlanningPlant = a5.Plant
{
      @EndUserText.label: 'Maintenance Planning Plant'
  key a2.MaintenancePlanningPlant as Plant,
      @EndUserText.label: 'Equipment'
  key a1.Equipment,
      @EndUserText.label: 'Maintenance Planning Plant Name'
      a5.PlantName                as PlantName
//      @EndUserText.label: 'Equipment Description'
//      a3.EquipmentName
//      @EndUserText.label: 'Registration Number'
//      a4.YY1_RegNo_IEQ   as ZregNo,
//      @EndUserText.label: 'Chassis Number'
//      a4.YY1_ChassisNo_IEQ        as ZchassisNo,
//      @EndUserText.label: 'Engine Number'
//      a4.YY1_SerialNo_IEQ         as ZengineNo
}
