@AccessControl.authorizationCheck: #NOT_ALLOWED
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZPMT_COMPLIANCE000'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_PMT_COMPLIANCE000
  as select from zpmt_compliance
{
  key zequipment as Zequipment,
  key zcomptype as Zcomptype,
  zcompliance_number as ZcomplianceNumber,
  zplant as Zplant,
  zreceipt as Zreceipt,
  zstdate as Zstdate,
  zexptype as Zexptype,
  zenddate as Zenddate,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  zcurrency as Zcurrency,
  zamount as Zamount,
  ztax as Ztax,
  ztotal as Ztotal,
  zstate as Zstate,
  zowner as Zowner,
  zdms as Zdms,
  zfile as Zfile,
  zremark as Zremark,
  zinstype as Zinstype,
  zinscompany as Zinscompany,
  zpolicyno as Zpolicyno,
  zidv as Zidv,
  zpolicytype as Zpolicytype,
  zflagcu as Zflagcu,
  zflag  as Zflag,
  zmimetype as Zmimetype,
  zfilename as Zfilename,
  createdby as CreatedBy,
  createdon as Createdon,
  changedby as ChangedBy,
  changedon as Changedon,
  createdat as Createdat,
  changedat as Changedat,
  @Semantics.user.createdBy: true
  localcreatedby as Localcreatedby,
  @Semantics.systemDateTime.createdAt: true
  localcreatedat as Localcreatedat,
  @Semantics.user.localInstanceLastChangedBy: true
  locallastchangedby as Locallastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  locallastchangedat as Locallastchangedat,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchangedat as Lastchangedat
}
