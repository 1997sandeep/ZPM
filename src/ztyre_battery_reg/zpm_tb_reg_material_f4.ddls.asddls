@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material F4 for Tyre & Battery Register'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TB_REG_MATERIAL_F4 as select from C_BOMMaterialVH

{
    key ProductType as product_type,
    key ProductGroup as product_group,
    key Material as material,
    MaterialDescription as material_des
} where ProductType = 'ZTTF' or
        ProductType = 'ZBAT'
group by ProductType,
         ProductGroup,
         Material,
         MaterialDescription
