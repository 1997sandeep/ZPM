@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'zpm_equip_maxdate'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zpm_equip_maxdate
as select from zsd_log_book_un
{
    
key equip_no,
max(dat) as Dats
}
group by
    equip_no
