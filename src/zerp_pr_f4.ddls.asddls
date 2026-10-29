@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PR F4'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZERP_PR_F4 as select from I_PurchaseRequisitionItemAPI01 as a
left outer join I_PurchaseOrderAPI01 as b on a.PurchasingDocument = b.PurchaseOrder
left outer join I_Supplier as c on b.Supplier = c.Supplier

{
    key a.PurchaseRequisition,
    a.PurchaseRequisitionType,
    a.PurchasingDocument,
    b.Supplier,
    c.SupplierName
    }
