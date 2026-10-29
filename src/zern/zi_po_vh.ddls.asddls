@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO value help (UI compatible)'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_PO_VH as select from I_PurchaseOrderItemAPI01 as Item
    inner join   I_PurchaseOrderAPI01     as Hdr
      on Hdr.PurchaseOrder = Item.PurchaseOrder
{
  key Item.PurchaseOrder      as PurchasingDocument,
  key Item.PurchaseOrderItem  as PurchaseRequisitionItem,
      Item.PurchaseOrder      as PurchaseRequisition,
      Item.Plant              as Plant,
      Hdr.PurchaseOrderType   as PurchaseRequisitionType,
      Hdr.Supplier            as Supplier
}
//where Item.IsDeleted = ''
