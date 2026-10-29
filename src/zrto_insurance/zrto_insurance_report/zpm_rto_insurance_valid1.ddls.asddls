@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RTO & INSURANCE VALIDITY REPORT'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPM_RTO_INSURANCE_VALID1 
as select from zpmequip as a
inner join I_TechnicalObject as b
on a.zequipment_id = b.Equipment

{
    key b.MaintenancePlanningPlant as plant,
    key a.zequipment_id as equipment_no,
    a.zequipment_desc as equipment_des,
    b.AssetManufacturerName as machine_make,
    b.ManufacturerPartTypeName as machine_model,
    b.ManufacturerSerialNumber as machine_serial_no,
//    b.YY1_RegisNo_IEQ as reg_no,
    a.zinsurance as insurance,
    a.zinval as insurance_valid_upto
    
}
