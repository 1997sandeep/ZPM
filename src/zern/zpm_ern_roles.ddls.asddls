@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ERN Role and Authorization'
@Metadata.ignorePropagatedAnnotations: true
define view entity Zpm_ERN_ROles 
  as select from zpm_ern_role
{


  key werks,
  key approval_role,
  key approval_seq_level,
  key user_id,
      level_des
}
