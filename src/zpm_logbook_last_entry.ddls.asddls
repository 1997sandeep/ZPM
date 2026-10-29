@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS for logbook last entry date'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_LOGBOOK_LAST_ENTRY
  as select from zsd_log_book_un

{

//  key plant     as Plant,
//  key key_field as KeyField,
  key equip_no  as EquipNo,
      max(dat)  as Dat


}
group by
//  plant,
//  key_field,
  equip_no
