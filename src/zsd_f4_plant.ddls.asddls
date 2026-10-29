@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'F4 for PLANT'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSD_f4_Plant 
as select distinct from I_TechnicalObject as a1
    inner join            I_PlantStdVH as a2 on a1.MaintenancePlanningPlant = a2.Plant
{
      @EndUserText.label: 'Maintenance Planning Plant'
      key a1.MaintenancePlanningPlant as Plant,
      @EndUserText.label: 'Maintenance Planning Plant Name'
      a2.PlantName as PlantName
      
}

                                  
