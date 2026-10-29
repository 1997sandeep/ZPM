@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Grp F4-Tyre & Battery Register'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TB_REG_PRODUCT_GRP_F4 as select from C_BOMMaterialVH

{
    key ProductType as product_type,
    key ProductGroup as product_group
} where ProductType = 'ZTTF' or
        ProductType = 'ZBAT'
group by ProductType,
         ProductGroup
