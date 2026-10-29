@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Plant Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP

define view entity ZI_VH_PLANT
//  as select from I_Plant
//{
//  key Plant,
//      PlantName
//}
as select from I_Plant as P
    inner join I_FunctionalLocation as FL
      on FL.MaintenancePlanningPlant = P.Plant
{
//      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Plant', element: 'Plant' } }]
  key P.Plant                         as Plant,

  key cast( FL.FunctionalLocation as abap.char(40) ) as FunctionalLocation,

      FL.MaintenancePlanningPlant
}
