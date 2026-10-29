@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ERN Report Header  Item Interface'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MIXED
}
define  root view entity ZI_ERN_REPORT
  as select from zpmt_ern as hdr
  inner join   zpmt_ernitm as itm
    on hdr.ern_no = itm.ern_no
{
// --- Header fields (ZPMT_ERN) ---
  key hdr.ern_no          as RequisitionNo,
  key itm.slno            as ItemNo,
      hdr.werks           as RequisitionerPlant,
      hdr.werks_txt       as PlantName,
      hdr.ern_status      as RequisitionStatus,
      hdr.ern_from        as ValidFrom,
      hdr.ern_to          as ValidTo,
      hdr.erdat           as CreatedDate,
      hdr.ernam           as CreatedBy,
      hdr.aedat           as LastChangeDate,
      hdr.aenam           as LastChangeBy,

// --- Item fields (ZPMT_ERNITM) ---
      itm.eqart           as EquipmentObjectType,
      itm.eqart_txt       as ObjectTypeDescription,
      itm.zcapacity       as Capacity,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      itm.menge           as Qty,
      itm.meins           as UnitOfMeasure,
      itm.itm_from        as ItemFromDate,
      itm.itm_to          as ItemToDate,
      itm.itm_status      as ItemStatus,
      itm.equnr           as AllottedEquipmentNo,
      itm.send_werks      as SenderPlant,
      itm.dehire_date     as DehireDate,
      itm.dehire_reason   as DehireReason,
      itm.dehire_status   as DehireStatus
}
