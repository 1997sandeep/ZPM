@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Utilization & Performance Report Shift Hours'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_UTIL_PER_SHIFT
with parameters 
p_frm   : zbegda,
p_to    : zbegda
 as select distinct from ZPM_UTIL_PER_SHIFT1( p_frm: $parameters.p_frm, p_to: $parameters.p_to )
{
    key plant,
    key equip_no,
    sum(shift) as shift
} group by plant,
equip_no
