@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PM utilization report'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_UTIL_PER1 
with parameters
    p_plant : zplant,
    p_frm   : zbegda,
    p_to    : zbegda 
// p_plant : abap.char(5), //zplant,
//    p_frm   : abap.dats, //zbegda,
//    p_to    : abap.dats //zbegda
    as select from zsd_log_book_un as a1
{
    @Consumption.valueHelpDefinition: [{ entity : {element: 'Plant', name: 'ZSD_f4_Plant'  }}]
    key a1.plant as Plant,
    @Consumption.valueHelpDefinition: [{ entity : {element: 'Equipment', name: 'ZSD_F4_EQUIPMENT'}}]
    key a1.equip_no as Equipment,
    a1.equip_desc as EquipmentName,
//    a1.equip_obj as Zobjtyp,
    case a1.shift
    when  '' then 0 else
    cast( cast( a1.shift as abap.numc( 4 ) ) as abap.int2 ) end as shift,
    case a1.break_hr when '' then 0.00 else
             cast(cast( a1.break_hr as abap.numc( 16 ))  as abap.dec( 10, 3 ) ) end as break_hr,
    case a1.idle_hr when '' then 0.00 else
             cast(cast( a1.idle_hr as abap.numc( 16 ))  as abap.dec( 10, 3 ) ) end as idle_hr,
//    cast( cast( a1.break_hr as abap.numc( 10 ) ) as abap.dec( 10, 3 ) ) as break_hr,
    case when a1.tot_plnt_prd is initial
    then 0.000    
    else cast( cast( a1.tot_plnt_prd as abap.numc( 10 ) ) as abap.dec( 10, 3 ) ) end as TotPlntPrd ,
    
     case cast( a1.working_hr as  abap.dec( 16, 2 ) )
     when 0.00 
     then cast( (  a1.close_hr - a1.start_hr )  as  abap.dec( 16, 2 ) ) 
     else cast( a1.working_hr as  abap.dec( 16, 2 ) ) end as total_hr,
    a1.read_km as tot_run,
    a1.dat,
    '' as uom
}where
      a1.plant               = $parameters.p_plant
  and a1.dat                 between $parameters.p_frm and $parameters.p_to
  and a1.key_field != 'null'

