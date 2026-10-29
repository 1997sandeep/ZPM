@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Compliance - Existing Record Check'
define view entity ZI_PM_COMPLIANCE_CHK
  as select from zpmt_compliance
{
  key zequipment  as Equipment,
  key zcomptype   as ComplianceType,
      zflag       as Flag
}
