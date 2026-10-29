@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Utilization & Perf Cons KM HR'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_UTIL_PER5 as select from I_TechnicalObject
{
  key  Equipment
//    YY1_FuelConsKm_IEQ as stdfuelconkm,
//    YY1_FuelConsHr_IEQ  as stdfuelconhr
}
