@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RTO & INSURANCE VALIDITY REPORT'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZPM_RTO_INSURANCE_VALID 
as select from ZPM_RTO_INSURANCE_VALID1
{
//@Consumption.valueHelpDefinition: [{
//  entity: {
//    name: 'ZPM_F4_PLANT',
//    element: 'Plant'
//  }
//}]
    key plant,
//@Consumption.valueHelpDefinition: [{
//  entity: {
//    name: 'ZPM_F4_Equpiment',
//    element: 'Equipment'
//  }
//}]
    key equipment_no,
    equipment_des,
    machine_make,
    machine_model,
    machine_serial_no,
//    reg_no,
    insurance,
    insurance_valid_upto
}
