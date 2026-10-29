@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZPM_C_EQUIP_UNMANAGE'
define root view entity ZPM_C_EQUIP_UNMANAGE as select from  zpm_equipments
//composition[1..*] of ZPM_C_EQUIP_ATTACH
association [1..1] to I_Equipment
    on $projection.ZequipmentId  = I_Equipment.Equipment

association [1..1] to I_EquipmentText as _Equiptxt
    on $projection.ZequipmentId  = _Equiptxt.Equipment
    
association [1..*] to I_TechnicalObject
   on $projection.ZequipmentId = I_TechnicalObject.Equipment    
   
association [1..1] to  I_EquipmentTextDEX as _Equipchar
  on $projection.ZequipmentId  = _Equipchar.Equipment    
 
    {
    @Consumption.valueHelpDefinition: [{entity : {name: 'ZPM_F4_Equpiment', element: 'Equipment'} }]
    @EndUserText.label: 'Equipment ID'
     key zequipment_id as ZequipmentId,
////    @Consumption.valueHelpDefinition: [{entity : {name: 'I_EquipmentText', element: 'ZequipmentDesc'},
////     additionalBinding: [{ localElement: 'ZequipmentId', element: 'Equipment'}] }]
    @EndUserText.label: 'Equipment Description'
    _Equiptxt.EquipmentName as ZequipmentDesc,
//    zequipment_desc as ZequipmentDesc,
    @EndUserText.label: 'Registration Number'
    zreg_no as ZregNo,
//    _Equipchar.YY1_RegistrationNo_IEQ as ZregNo,
//    @EndUserText.label: 'Chassis Number'
////    zchassis_no as ZchassisNo,
//    _Equipchar.YY1_ChassisNo_IEQ as ZchassisNo,
//    @EndUserText.label: 'Engine Number'
////    zengine_no as ZengineNo,
//    _Equipchar.YY1_EngineNo_IEQ as ZengineNo,
    @EndUserText.label: 'Vehicle Registration Date'
    zregdate  as Zregdate,
    @EndUserText.label: 'Registration End Date'
    zregedate  as Zregedate,
    @EndUserText.label: 'Fitness Start'
    zfitnesssdate  as Zfitnesssdate,
    @EndUserText.label: 'Fitness End'
    zfitnessedate  as Zfitnessedate,
    @EndUserText.label: 'Vehicle Tax Amount'
    //@Semantics.amount.currencyCode: 'Zcurrkey'
    cast(zvehtaxamt as abap.char(23)) as Zvehtaxamt,
    @EndUserText.label: 'Vehicle Tax From'
    zvehtaxsdate  as Zvehtaxsdate,
    @EndUserText.label: 'Vehicle Tax To'
    zvehtaxedate  as Zvehtaxedate,
    @EndUserText.label: 'Vehicle Tax Paid Date'
    zvehtaxdate  as Zvehtaxdate,
    @EndUserText.label: 'Environment Tax Amount'
    //@Semantics.amount.currencyCode: 'Zcurrkey'
    cast(zentaxamt as abap.char(23)) as Zentaxamt,
    @EndUserText.label: 'Environment Tax From'
    zentaxsdate  as Zentaxsdate,
    @EndUserText.label: 'Environment Tax To'
    zentaxedate  as Zentaxedate,
    @EndUserText.label: 'Environment Tax Paid Date'
    zentaxdate  as Zentaxdate,
    @EndUserText.label: 'Permit Start'
    zpermitsdate  as Zpermitsdate,
    @EndUserText.label: 'Permit End'
    zpermitedate  as Zpermitedate,
    @EndUserText.label: 'PUC No.'
    zpucno as Zpucno,
    @EndUserText.label: 'PUC Start'
    zpucsdate  as Zpucsdate,
    @EndUserText.label: 'PUC End'
    zpucedate  as Zpucedate,
    @EndUserText.label: 'Insurance Company'
    zinsuco as Zinsuco,
    @EndUserText.label: 'Policy No.'
    zpolicyno as Zpolicyno,
    @EndUserText.label: 'Policy Issue Date'
    zpolicydate  as Zpolicydate,
    @EndUserText.label: 'Policy Premium'
    //@Semantics.amount.currencyCode: 'Zcurrkey'
    cast(zpolicyprem as abap.char(23)) as Zpolicyprem,   
 //   _Equipments.zcurrkey as Zcurrkey,    
    @EndUserText.label: 'IDV Rs'
    //@Semantics.amount.currencyCode: 'Zcurrkey'
    cast(zidv as abap.char(23)) as Zidv,
    @EndUserText.label: 'Insurance TP From'
    zinstpsdate  as Zinstpsdate,
    @EndUserText.label: 'Insurance TP To'
    zinstpedate  as Zinstpedate,
    @EndUserText.label: 'Insurance OD From'
    zinsodsdate  as Zinsodsdate,
    @EndUserText.label: 'Insurance OD To'
    zinsodedate  as Zinsodedate,
    @EndUserText.label: 'Claim Bonus'
    //@Semantics.amount.currencyCode: 'Zcurrkey'
    cast(zclaim as abap.char(23)) as Zclaim,
    @EndUserText.label: 'Insurance Place'
    zinsplace as Zinsplace,
    @Consumption.valueHelpDefinition: [{ entity:  { name: 'ZPM_F4_Plant', element: 'Plant' }}]
    @EndUserText.label: 'Plant'
//    zplant as Zplant,
    I_TechnicalObject.MaintenancePlanningPlant as Zplant,
    @Consumption.valueHelpDefinition: [{ entity:  { name: 'ZPM_F4_ObjectType', element: 'TechnicalObjectType' }}]
    @EndUserText.label: 'Object Type'
    //zobjtyp as Zobjtyp,
    I_Equipment.TechnicalObjectType as Zobjtyp,
    @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_Currency', 
      element: 'Currency'
    }
    } ]
    cast('INR' as abap.cuky) as zcurrkey,
    previous as Previous,
    present as Present,
    fieldname as Fieldname,
    @EndUserText.label: 'Remarks'
    remarks as Remarks,
    @EndUserText.label: 'Remarks'
    remarksi as RemarksIns,
    @EndUserText.label: 'Created By'
    @Semantics.user.createdBy: true
    local_created_by as LocalCreatedBy,
    @EndUserText.label: 'Local Created At'
//    @Semantics.systemDateTime.createdAt: true
    cast(local_created_at as abap.char( 200 )) as LocalCreatedAt,
    @EndUserText.label: 'Last Changed By'
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    @EndUserText.label: 'Local Last Changed At'
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    cast(local_last_changed_at as abap.char( 200 )) as LocalLastChangedAt,
    @EndUserText.label: 'Last Changed At'
//    @Semantics.systemDateTime.lastChangedAt: true
    cast(last_changed_at as abap.char( 200 )) as LastChangedAt,
    
    cast(zregdate1 as abap.char(10)) as Zregdate1,
    cast(zregedate1 as abap.char(10)) as Zregedate1,
    cast(zfitnesssdate1 as abap.char(10)) as Zfitnesssdate1,
    cast(zfitnessedate1 as abap.char(10)) as Zfitnessedate1,
    cast(zvehtaxsdate1 as abap.char(10)) as Zvehtaxsdate1,
    cast(zvehtaxedate1 as abap.char(10)) as Zvehtaxedate1,
    cast(zvehtaxdate1 as abap.char(10)) as Zvehtaxdate1,
    cast(zentaxsdate1 as abap.char(10)) as Zentaxsdate1,
    cast(zentaxedate1 as abap.char(10)) as Zentaxedate1,
    cast(zentaxdate1 as abap.char(10)) as Zentaxdate1,
    cast(zpermitsdate1 as abap.char(10)) as Zpermitsdate1,
    cast(zpermitedate1 as abap.char(10)) as Zpermitedate1,
    cast(zpucsdate1 as abap.char(10)) as Zpucsdate1,
    cast(zpucedate1 as abap.char(10)) as Zpucedate1,
    cast(zpolicydate1 as abap.char(10)) as Zpolicydate1,
    cast(zinstpsdate1 as abap.char(10)) as Zinstpsdate1,
    cast(zinstpedate1 as abap.char(10)) as Zinstpedate1,
    cast(zinsodsdate1 as abap.char(10)) as Zinsodsdate1,
    cast(zinsodedate1 as abap.char(10)) as Zinsodedate1
}

//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'RTO insurance'
//@Metadata.ignorePropagatedAnnotations: true
//
//define root view entity ZPM_C_EQUIP_UNMANAGE as select from  zpm_equipments
////composition[1..*] of ZPM_C_EQUIP_ATTACH
//association [1..1] to I_Equipment
//    on $projection.ZequipmentId  = I_Equipment.Equipment
//
////////association [1..1] to I_EquipmentText as _Equiptxt
////////    on $projection.ZequipmentId  = _Equiptxt.Equipment
//    
//association [1..*] to I_TechnicalObject 
//   on $projection.ZequipmentId = I_TechnicalObject.Equipment    
////   
////////association [1..1] to  I_EquipmentTextDEX as _Equipchar
////////  on $projection.ZequipmentId  = _Equipchar.Equipment    
// 
//    {
//    @Consumption.valueHelpDefinition: [{entity : {name: 'ZPM_F4_Equpiment', element: 'Equipment'} }]
//    @EndUserText.label: 'Equipment ID'
//     key zpm_equipments.zequipment_id as ZequipmentId,
////////    @Consumption.valueHelpDefinition: [{entity : {name: 'I_EquipmentText', element: 'ZequipmentDesc'},
////////     additionalBinding: [{ localElement: 'ZequipmentId', element: 'Equipment'}] }]
////    @EndUserText.label: 'Equipment Description'
////    _Equiptxt.EquipmentName as ZequipmentDesc,
////    @EndUserText.label: 'Registration Number'
////    _Equipchar.YY1_RegNo_IEQ as ZregNo,
////    @EndUserText.label: 'Chassis Number'
////    _Equipchar.YY1_ChassisNo_IEQ as ZchassisNo,
//    @EndUserText.label: 'Engine Number'
//    zengine_no as ZengineNo,
//    @EndUserText.label: 'Vehicle Registration Date'
//    zregdate  as Zregdate,
//    @EndUserText.label: 'Registration End Date'
//    zregedate  as Zregedate,
//    @EndUserText.label: 'Fitness Start'
//    zfitnesssdate  as Zfitnesssdate,
//    @EndUserText.label: 'Fitness End'
//    zfitnessedate  as Zfitnessedate,
//    @EndUserText.label: 'Vehicle Tax Amount'
//    //@Semantics.amount.currencyCode: 'Zcurrkey'
//    cast(zvehtaxamt as abap.char(23)) as Zvehtaxamt,
//    @EndUserText.label: 'Vehicle Tax From'
//    zvehtaxsdate  as Zvehtaxsdate,
//    @EndUserText.label: 'Vehicle Tax To'
//    zvehtaxedate  as Zvehtaxedate,
//    @EndUserText.label: 'Vehicle Tax Paid Date'
//    zvehtaxdate  as Zvehtaxdate,
//    @EndUserText.label: 'Environment Tax Amount'
//    //@Semantics.amount.currencyCode: 'Zcurrkey'
//    cast(zentaxamt as abap.char(23)) as Zentaxamt,
//    @EndUserText.label: 'Environment Tax From'
//    zentaxsdate  as Zentaxsdate,
//    @EndUserText.label: 'Environment Tax To'
//    zentaxedate  as Zentaxedate,
//    @EndUserText.label: 'Environment Tax Paid Date'
//    zentaxdate  as Zentaxdate,
//    @EndUserText.label: 'Permit Start'
//    zpermitsdate  as Zpermitsdate,
//    @EndUserText.label: 'Permit End'
//    zpermitedate  as Zpermitedate,
//    @EndUserText.label: 'PUC No.'
//    zpucno as Zpucno,
//    @EndUserText.label: 'PUC Start'
//    zpucsdate  as Zpucsdate,
//    @EndUserText.label: 'PUC End'
//    zpucedate  as Zpucedate,
//    @EndUserText.label: 'Insurance Company'
//    zinsuco as Zinsuco,
//    @EndUserText.label: 'Policy No.'
//    zpolicyno as Zpolicyno,
//    @EndUserText.label: 'Policy Issue Date'
//    zpolicydate  as Zpolicydate,
//    @EndUserText.label: 'Policy Premium'
//    //@Semantics.amount.currencyCode: 'Zcurrkey'
//    cast(zpolicyprem as abap.char(23)) as Zpolicyprem,   
// //   _Equipments.zcurrkey as Zcurrkey,    
//    @EndUserText.label: 'IDV Rs'
//    //@Semantics.amount.currencyCode: 'Zcurrkey'
//    cast(zidv as abap.char(23)) as Zidv,
//    @EndUserText.label: 'Insurance TP From'
//    zinstpsdate  as Zinstpsdate,
//    @EndUserText.label: 'Insurance TP To'
//    zinstpedate  as Zinstpedate,
//    @EndUserText.label: 'Insurance OD From'
//    zinsodsdate  as Zinsodsdate,
//    @EndUserText.label: 'Insurance OD To'
//    zinsodedate  as Zinsodedate,
//    @EndUserText.label: 'Claim Bonus'
//
//    cast(zclaim as abap.char(23)) as Zclaim,
//    @EndUserText.label: 'Insurance Place'
//    zinsplace as Zinsplace,
//////    @Consumption.valueHelpDefinition: [{ entity:  { name: 'ZPM_F4_Plant', element: 'Plant' }}]
//    @EndUserText.label: 'Plant'
////    zplant as Zplant,
//    I_TechnicalObject.MaintenancePlanningPlant as Zplant,
////    @Consumption.valueHelpDefinition: [{ entity:  { name: 'ZPM_F4_ObjectType', element: 'TechnicalObjectType' }}]
//    @EndUserText.label: 'Object Type'
////    zobjtyp as Zobjtyp,
//    I_Equipment.TechnicalObjectType as Zobjtyp,
//    @Consumption.valueHelpDefinition: [ {
//    entity: {
//      name: 'I_Currency', 
//      element: 'Currency'
//    }
//    } ]
//    cast('INR' as abap.cuky) as zcurrkey,
//    previous as Previous,
//    present as Present,
//    fieldname as Fieldname,
//    @EndUserText.label: 'Remarks'
//    remarks as Remarks,
//    @EndUserText.label: 'Remarks'
//    remarksi as RemarksIns,
//    @EndUserText.label: 'Created By'
//    @Semantics.user.createdBy: true
//    local_created_by as LocalCreatedBy,
//    @EndUserText.label: 'Local Created At'
////    @Semantics.systemDateTime.createdAt: true
//    cast(local_created_at as abap.char( 200 )) as LocalCreatedAt,
//    @EndUserText.label: 'Last Changed By'
//    @Semantics.user.lastChangedBy: true
//    local_last_changed_by as LocalLastChangedBy,
//    @EndUserText.label: 'Local Last Changed At'
//    @Semantics.systemDateTime.localInstanceLastChangedAt: true
//    cast(local_last_changed_at as abap.char( 200 )) as LocalLastChangedAt,
//    @EndUserText.label: 'Last Changed At'
////   @Semantics.systemDateTime.lastChangedAt: true
//    cast(last_changed_at as abap.char( 200 )) as LastChangedAt,
//    
//    cast(zregdate1 as abap.char(10)) as Zregdate1,
//    cast(zregedate1 as abap.char(10)) as Zregedate1,
//    cast(zfitnesssdate1 as abap.char(10)) as Zfitnesssdate1,
//    cast(zfitnessedate1 as abap.char(10)) as Zfitnessedate1,
//    cast(zvehtaxsdate1 as abap.char(10)) as Zvehtaxsdate1,
//    cast(zvehtaxedate1 as abap.char(10)) as Zvehtaxedate1,
//    cast(zvehtaxdate1 as abap.char(10)) as Zvehtaxdate1,
//    cast(zentaxsdate1 as abap.char(10)) as Zentaxsdate1,
//    cast(zentaxedate1 as abap.char(10)) as Zentaxedate1,
//    cast(zentaxdate1 as abap.char(10)) as Zentaxdate1,
//    cast(zpermitsdate1 as abap.char(10)) as Zpermitsdate1,
//    cast(zpermitedate1 as abap.char(10)) as Zpermitedate1,
//    cast(zpucsdate1 as abap.char(10)) as Zpucsdate1,
//    cast(zpucedate1 as abap.char(10)) as Zpucedate1,
//    cast(zpolicydate1 as abap.char(10)) as Zpolicydate1,
//    cast(zinstpsdate1 as abap.char(10)) as Zinstpsdate1,
//    cast(zinstpedate1 as abap.char(10)) as Zinstpedate1,
//    cast(zinsodsdate1 as abap.char(10)) as Zinsodsdate1,
//    cast(zinsodedate1 as abap.char(10)) as Zinsodedate1
//}
