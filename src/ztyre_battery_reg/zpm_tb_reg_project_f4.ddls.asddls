@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tyre & Battery Register Project F4'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TB_REG_PROJECT_F4 as select from I_Plant
{
   key Plant as project,
       PlantName as project_des
}
 group by Plant,
 PlantName
