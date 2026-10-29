@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO and subcontractor (UI compatible)'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_PO_SUBCON as select from I_PurchaseOrderItemAPI01 as Item
    inner join   I_PurchaseOrderAPI01     as Hdr
      on Hdr.PurchaseOrder = Item.PurchaseOrder
{
  key Item.PurchaseOrder      as PURCHASEORDER,
  key Item.PurchaseOrderItem  as PurchaseOrderItem,
      Item.PurchaseOrder      as PurchaseRequisition,
      Hdr.Supplier            as SUBCONTRACTOR
}
