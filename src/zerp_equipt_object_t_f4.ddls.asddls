@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Equipment Object Type F4'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZERP_EQUIPT_OBJECT_T_F4 as select from I_TechnicalObjectTypeText
{
    key TechnicalObjectType,
    TechnicalObjectTypeDesc
}
