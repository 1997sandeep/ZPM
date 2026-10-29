@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tyre & Battery Register Object Type F4'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TB_REG_OBJECT_TYPE_F4 as select from I_TechnicalObject as a
left outer join I_TechnicalObjectTypeText as b
 on a.TechnicalObjectType = b.TechnicalObjectType
and b.Language = 'E'
{
   key a.MaintenancePlanningPlant as project,
   key a.TechnicalObjectType      as obj_type,
   key b.TechnicalObjectTypeDesc  as description
}
group by a.MaintenancePlanningPlant,
   a.TechnicalObjectType,
   b.TechnicalObjectTypeDesc
