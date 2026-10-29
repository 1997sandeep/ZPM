@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchaes Order Item'
@Metadata.ignorePropagatedAnnotations: true
define view entity zern_purchagesorder_item
  as select from I_PurchaseOrderItemAPI01
{
//  key PurchaseRequisition,
  key cast( PurchaseOrder as abap.char( 10 ) ) as PURCHASEORDER,
//      ProductType                              as PURCHASEREQUISITIONTYPE,
      cast( Subcontractor as abap.char(10) )   as SUBCONTRACTOR
}
