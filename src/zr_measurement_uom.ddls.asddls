@AccessControl.authorizationCheck: #NOT_ALLOWED
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZMEASUREMENT_UOM'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_MEASUREMENT_UOM
  as select from zmeasurement_uom
{
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  key uom as UOM,
  key uom_des as UomDes,
  uom_dimension as UomDimension,
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}
