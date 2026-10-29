@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ERN Report Consumption Projection'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define root view entity ZC_ERN_REPORT
  as select from ZI_ERN_REPORT
{
      @Search.defaultSearchElement: true
  key RequisitionNo,
  key ItemNo,

      @Consumption.filter: { selectionType: #RANGE, multipleSelections: true }
      RequisitionerPlant,
      PlantName,

      @Consumption.filter: { selectionType: #SINGLE }
      RequisitionStatus,

      @Consumption.filter: { selectionType: #RANGE }
      ValidFrom,
      @Consumption.filter: { selectionType: #RANGE }
      ValidTo,

      CreatedDate,
      CreatedBy,
      LastChangeDate,
      LastChangeBy,
      EquipmentObjectType,
      ObjectTypeDescription,
      Capacity,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Qty,
      UnitOfMeasure,

      @Consumption.filter: { selectionType: #RANGE }
      ItemFromDate,
      @Consumption.filter: { selectionType: #RANGE }
      ItemToDate,

      ItemStatus,
      AllottedEquipmentNo,
      SenderPlant,
      DehireDate,
      DehireReason,
      DehireStatus
}
