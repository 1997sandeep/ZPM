@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PM utilization report'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_UTIL_PER2 
with parameters

    p_frm   : zbegda,
    p_to    : zbegda  

as select from I_MaintOrderComponentDEX as d
inner join ZPM_UTIL_PER2_1( p_frm: $parameters.p_frm, p_to: $parameters.p_to ) as B 
on B.Reservation = d.Reservation
{
 key d.Equipment,
 B.MaterialBaseUnit as BaseUnit,  //b.BaseUnit,
 @Semantics.quantity.unitOfMeasure: 'BaseUnit'
 sum(B.qty) as qty 
// cast(sum(B.qty) as abap.dec(20,2)) as qty 
}
where 
d.MaterialGroup = '120167' and
d.MaintenanceOrderType = 'YA04'
group by
    d.Equipment,
   B.MaterialBaseUnit
