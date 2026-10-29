@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZPM_F4_ObjectType'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_F4_ObjectType 
  as select distinct from I_TechnicalObject         as a1
    inner join            I_TechnicalObjectTypeText as a2 on a1.TechnicalObjectType = a2.TechnicalObjectType
{
      @EndUserText.label: 'Technical Object Type'
  key a1.TechnicalObjectType,
   @EndUserText.label: 'Plant'
  key a1.MaintenancePlanningPlant as Plant,
      @EndUserText.label: 'Technical Object Type Description'
      a2.TechnicalObjectTypeDesc
}

