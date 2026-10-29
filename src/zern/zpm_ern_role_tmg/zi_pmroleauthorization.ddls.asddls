@EndUserText.label: 'PM Role Authorization For ERN Process'
@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
define view entity ZI_PmRoleAuthorization
  as select from zpm_ern_role
  association to parent ZI_PmRoleAuthorization_S as _PmRoleAuthorizatAll on $projection.SingletonID = _PmRoleAuthorizatAll.SingletonID
{
  key werks as Werks,
  key approval_seq_level as ApprovalSeqLevel,
   approval_role as ApprovalRole,
   user_id as UserId,
  level_des as LevelDes,
  @Consumption.hidden: true
  1 as SingletonID,
  _PmRoleAuthorizatAll
}
  
   
