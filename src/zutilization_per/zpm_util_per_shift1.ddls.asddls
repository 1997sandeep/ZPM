@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Utilization & Performance Report Shift Hours'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_UTIL_PER_SHIFT1
    with parameters
p_frm   : zbegda,
p_to    : zbegda
 as select distinct from zsd_log_book_un
{
    key plant,
    key equip_no,
    case shift
    when  '' then 0 else
    cast( cast( shift as abap.numc( 4 ) ) as abap.int2 )
    end as shift
} 

where dat between $parameters.p_frm and $parameters.p_to
