@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'F4 for the Technical object type'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TECH_OBJ_TYPE_F4
  as select distinct from I_TechnicalObject         as a1
    inner join            I_TechnicalObjectTypeText as a2 on a1.TechnicalObjectType = a2.TechnicalObjectType
//    inner join            zf4_equip_plant           as a3 on a1.MaintenancePlanningPlant = a3.plant
{
      @EndUserText.label: 'Technical Object Type'
  key a1.TechnicalObjectType,
      //   @EndUserText.label: 'Plant'
      //  key a3.plant as Plant,
      @EndUserText.label: 'Technical Object Type Description'
      a2.TechnicalObjectTypeDesc
//      a1.YY1_EquipmentType_IEQ
}
group by
  a1.TechnicalObjectType,
  a2.TechnicalObjectTypeDesc
//  a1.YY1_EquipmentType_IEQ
