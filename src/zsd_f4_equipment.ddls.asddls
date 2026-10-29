@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'F4 for equipment'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSD_F4_EQUIPMENT 
as select from I_Equipment        as a1
    inner join            I_TechnicalObject as a2 on a1.Equipment = a2.Equipment
    inner join            I_EquipmentText as a3 on a1.Equipment = a3.Equipment
    inner join            ZI_TECHNICALOBJECT as a4 on a1.Equipment = a4.Equipment
    left outer join            I_TechnicalObjectTypeText as a5 on a2.TechnicalObjectType = a5.TechnicalObjectType
    left outer join            I_EquipmentTextDEX as a6 on a1.Equipment = a6.Equipment
    left outer join I_TechnicalObject  as a7 on a1.Equipment = a7.Equipment
{
      @EndUserText.label: 'Maintenance Planning Plant'
      key a2.MaintenancePlanningPlant as Plant,
      @EndUserText.label: 'Equipment'
      key a1.Equipment,
      @EndUserText.label: 'Equipment Description'
      a3.EquipmentName,
      @EndUserText.label: 'Functional Location'
      a4.SuperiorTechnicalObjectLabel as funcLoc,
      @EndUserText.label: 'Functional Location Description'
      a4.SuperiorTechnicalObjectName as funcDesc,
      @EndUserText.label: 'Equipment Object Type'
      a5.TechnicalObjectType,
      @EndUserText.label: 'Equipment Object Type Description'
      a5.TechnicalObjectTypeDesc,
////      @EndUserText.label: 'Registration Number'
////      a6.YY1_RegNo_IEQ,
 '' as YY1_RegNo_IEQ,
      @EndUserText.label: 'Serial Number'
      a7.ManufacturerSerialNumber
}
