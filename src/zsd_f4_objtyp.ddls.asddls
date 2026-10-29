@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'F4 for Object Type'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSD_F4_OBJTYP 
as select distinct from I_Equipment        as a1
    inner join            I_TechnicalObjectTypeText as a2 on a1.TechnicalObjectType = a2.TechnicalObjectType
{
    @EndUserText.label: 'Technical Object Type'
    key a2.TechnicalObjectType,
    @EndUserText.label: 'Technical Object Type Description'
    a2.TechnicalObjectTypeDesc
}
