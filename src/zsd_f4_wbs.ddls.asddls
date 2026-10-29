@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'F4 for WBS & PLANT'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSD_F4_WBS 
as select distinct from I_TechnicalObject as a2
    inner join            I_EnterpriseProjectElement as a3 on a2.MaintenancePlanningPlant = a3.Plant
{
      @EndUserText.label: 'Maintenance Planning Plant'
      key a2.MaintenancePlanningPlant as Plant,
//      @EndUserText.label: 'WBS'
      key a3.ProjectElement as ProjectElement,
  //    @EndUserText.label: 'WBS Description'
      a3.ProjectElementDescription as ProjectElementDescription
      
}group by
a2.MaintenancePlanningPlant,
a3.ProjectElement,
a3.ProjectElementDescription
