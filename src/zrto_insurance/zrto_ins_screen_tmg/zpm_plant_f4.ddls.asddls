@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Plant F4'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPM_PLANT_F4 
as select from I_Plant
{
  key Plant,
      PlantName
}
