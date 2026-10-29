@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'F4 for WBS1'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_F4_WBS1 
as select from I_EnterpriseProjectElement_2
{
    key ProjectElement,
    WBSElementInternalID,
    ProjectElementDescription,
    Plant,
    substring(         ProjectElement, 8, 1         ) as wbs_p,
    substring(         ProjectElement, 8, 5         ) as wbs_i
}
