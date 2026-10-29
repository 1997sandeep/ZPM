@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'System status and User Status'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPM_ern_STATUS
  as select from I_Equipment   as a
  left outer join I_TechnicalObject as b on b.Equipment = a.Equipment
//    inner join   jest  as b on a.objnr = b.objnr
//    inner join   tj02t as c on  b.stat  = c.istat
//                            and c.spras = $session.system_language

{
  key a.Equipment,
      ''  as capacity,
      '' as unit,
      '' as stat,
      b.YY1_EquipmentStatus_IEQ      as system_status


}

//  as select from equi  as a
//    inner join   jest  as b on a.objnr = b.objnr
//    inner join   tj02t as c on  b.stat  = c.istat
//                            and c.spras = $session.system_language
//
//{
//  key a.equnr,
//      a.zzito_ecap  as capacity,
//      a.zzito_ecapu as unit,
//      b.stat,
//      c.txt04       as system_status
//
//
//}
//where
//  b.inact = ' '
