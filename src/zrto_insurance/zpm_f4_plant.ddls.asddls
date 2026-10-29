@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'F4 plant'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_F4_Plant 
  as select distinct from I_TechnicalObject as a2
    inner join            I_PlantStdVH      as a5 on a2.MaintenancePlanningPlant = a5.Plant
{

  @EndUserText.label: 'Maintenance Planning Plant'
  key a2.MaintenancePlanningPlant as Plant,
      @EndUserText.label: 'Maintenance Planning Plant Name'
      a5.PlantName                as PlantName
} group by a2.MaintenancePlanningPlant,
a5.PlantName
