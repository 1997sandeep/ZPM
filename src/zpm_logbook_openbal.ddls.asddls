@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Opening balance value cds'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zpm_logbook_openbal
  as select from ZPM_LOGBOOK_LAST_ENTRY as a
  left outer join zsd_log_book_un as b on a.EquipNo = b.equip_no
                                        and a.Dat = b.dat

{

  key a.EquipNo as EquipNo,
      a.Dat      as Dat,
      b.closingbal as closingbal, 
      b.openingbal as openingbal,   
      b.fuelqty  as Fuelqty

}
