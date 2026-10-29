@EndUserText.label: 'LOG BOOK USER TABLE'
@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
define view entity ZI_LogBookUserTable
  as select from ZLOGBOOK_TMG_TBL
  association to parent ZI_LogBookUserTable_S as _LogBookUserTableAll on $projection.SingletonID = _LogBookUserTableAll.SingletonID
{
  key USIRID as Usirid,
  NAME as Name,
  @Consumption.hidden: true
  1 as SingletonID,
  _LogBookUserTableAll
}
