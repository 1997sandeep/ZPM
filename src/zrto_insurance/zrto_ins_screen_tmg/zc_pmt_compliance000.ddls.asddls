@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZPMT_COMPLIANCE000'
}
@AccessControl.authorizationCheck: #NOT_ALLOWED
define root view entity ZC_PMT_COMPLIANCE000
  provider contract transactional_query
  as projection on ZR_PMT_COMPLIANCE000
  association [1..1] to ZR_PMT_COMPLIANCE000 as _BaseEntity on $projection.Zequipment = _BaseEntity.Zequipment and $projection.Zcomptype = _BaseEntity.Zcomptype
{
  key Zequipment,
  key Zcomptype,
  ZcomplianceNumber,
  Zplant,
  Zreceipt,
  Zstdate,
  Zexptype,
  Zenddate,
  @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'Currency', 
      entity.name: 'I_CurrencyStdVH', 
      useForValidation: true
    } ]
  }
  Zcurrency,
  Zamount,
  Ztax,
  Ztotal,
  Zstate,
  Zowner,
  Zdms,
  Zfile,
  Zremark,
  Zinstype,
  Zinscompany,
  Zpolicyno,
  Zidv,
  Zpolicytype,
  CreatedBy,
  Createdat,
  ChangedBy,
  Changedat,
  @Semantics: {
    user.createdBy: true
  }
  Localcreatedby,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  Localcreatedat,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  Locallastchangedby,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  Locallastchangedat,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  Lastchangedat,
  _BaseEntity
}
