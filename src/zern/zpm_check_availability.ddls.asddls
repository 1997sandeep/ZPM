@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Check Availability'
@Metadata.ignorePropagatedAnnotations: true
//@Search.searchable: true
define view entity ZPM_CHECK_Availability
  as select from I_Equipment as _equip
  association [0..1] to I_EquipmentText as _etext    on  _equip.Equipment = _etext.Equipment
                                                     and _etext.Language  = $session.system_language
  association [0..1] to I_TechnicalObject as _edata    on  _equip.Equipment = _edata.Equipment
  association [0..1] to ZPM_ern_STATUS  as _status   on  _equip.Equipment = _status.Equipment
  association [0..1] to ZPM_ERN_USERSTS as _user_sts on  _equip.Equipment = _user_sts.Equipment
{

  key _equip.Equipment,
  key _equip.TechnicalObjectType as Object_type,
      _equip.Plant,
      _etext.EquipmentName,
      _edata.MaintenancePlanningPlant    as WorkCenterPlant,
//      ''    as WorkCenterPlant,
      _status.system_status,
      _user_sts.user_status,
      _status.capacity,
      _status.unit
      //      b.IsPrimaryLanguage,
      //      b.EquipmentHasLongText,
      //      b.LastChangeDateTime,
      //      b.ValidityStartDate,
      //      b.ValidityEndDate

}
//where
//  _edata.ValidityEndDate = '99991231'
