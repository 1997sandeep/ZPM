@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'F4 for plant'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZERP_PLANT_F4 as select from I_Plant
{
    key Plant,
    PlantName
}
