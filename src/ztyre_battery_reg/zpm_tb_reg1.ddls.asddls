@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PM Tyre & Battery Register'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TB_REG1 as select from I_TechnicalObject as a
left outer join C_BOMMaterialVH as b
 on b.ProductType = 'ZTTF'
 or b.ProductType = 'ZBAT'

{
    key a.MaintenancePlanningPlant as project,
    key a.TechnicalObjectType      as obj_type,
    key a.Equipment as equipment,
//    a.YY1_RegisNo_IEQ as reg_no,
    b.ProductType,
    b.ProductGroup,
    b.Material as material,
    b.MaterialDescription
    
}
