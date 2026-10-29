@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'zlogbook_tmg_CDS'
@Metadata.ignorePropagatedAnnotations: true
define view entity zlogbook_tmg_CDS as select from zlogbook_tmg_tbl
{
    key usirid,
    name
    
}
