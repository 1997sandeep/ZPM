@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'F4 for WBS'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_F4_WBS
  as select from ZPM_F4_WBS1
{
  key ProjectElement,
      WBSElementInternalID,
      ProjectElementDescription,
      Plant,
//      wbs_p,
      case wbs_i
      when 'I.CON' then 'I'
      else 'P'
      end as wbs_p
}
//where
  //   wbs_p = 'P'
  //or wbs_i = 'I.CON'
