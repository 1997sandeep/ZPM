@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ERN User Status'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPM_ERN_USERSTS
  as select from I_Equipment  as a
    left outer join I_TechnicalObject as b on b.Equipment = a.Equipment
//    inner join   jest  as b on a.objnr = b.objnr
//    inner join   tj30t as c on  b.stat  = c.estat
//                            and c.spras = $session.system_language

{
  key a.Equipment,
      ''  as capacity,
      '' as unit,
      '' as stat,
      b.YY1_EquipmentStatus_IEQ     as user_status
}

//where
//  c.stsma = 'EQU_APCO' and
//  b.inact = ' '
//  as select from equi  as a
//    inner join   jest  as b on a.objnr = b.objnr
//    inner join   tj30t as c on  b.stat  = c.estat
//                            and c.spras = $session.system_language
//
//{
//  key a.equnr,
//      a.zzito_ecap  as capacity,
//      a.zzito_ecapu as unit,
//      b.stat,
//      c.txt30       as user_status
//}
//
//where
//  c.stsma = 'EQU_APCO' and
//  b.inact = ' '
