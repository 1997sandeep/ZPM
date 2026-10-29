@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZMEASUREMENT_UOM'
}
@AccessControl.authorizationCheck: #NOT_ALLOWED
define root view entity ZC_MEASUREMENT_UOM
  provider contract transactional_query
  as projection on ZR_MEASUREMENT_UOM
  association [1..1] to ZR_MEASUREMENT_UOM as _BaseEntity on $projection.UOM = _BaseEntity.UOM and $projection.UomDes = _BaseEntity.UomDes
{
  @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'UnitOfMeasure', 
      entity.name: 'I_UnitOfMeasureStdVH', 
      useForValidation: true
    } ]
  }
  key UOM,  
  key UomDes,
  UomDimension,
  @Semantics: {
    user.createdBy: true
  }
  LocalCreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  LocalCreatedAt,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  LocalLastChangedBy,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChangedAt,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LastChangedAt,
  _BaseEntity
}
