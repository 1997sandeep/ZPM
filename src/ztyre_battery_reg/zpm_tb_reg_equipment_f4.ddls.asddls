@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tyre & Battery Register Equipment F4'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TB_REG_EQUIPMENT_F4 as select from I_TechnicalObject as a
left outer join I_EquipmentText as b 
 on a.Equipment = b.Equipment
and b.Language  = 'E'
{
    key a.MaintenancePlanningPlant as project,
    key a.TechnicalObjectType      as obj_type,
    key a.Equipment as equipment,
    b.EquipmentName as asset_des,
    a.YY1_FuelType_IEQ as reg_no
}   
