@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RTO insurance'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_RTPINS   as select from I_Equipment

  association [1..1] to I_TechnicalObject                on $projection.Equipment = I_TechnicalObject.Equipment

  association [1..1] to I_EquipmentText                  on $projection.Equipment = I_EquipmentText.Equipment
  association [1..1] to I_EquipmentTextDEX as _Equipchar on $projection.Equipment = _Equipchar.Equipment
  association [1..1] to zpmequip                         on $projection.Equipment = zpmequip.zequipment_id

{
      @EndUserText.label: 'Maintenance Planning Plant'
      @Consumption.valueHelpDefinition: [{ entity : {element: 'Plant', name: 'ZSD_f4_Plant'  }}]
  key I_TechnicalObject.MaintenancePlanningPlant as Plant,
      @Consumption.valueHelpDefinition: [{ entity : {element: 'Equipment', name: 'ZSD_F4_EQUIPMENT'}}]
      I_Equipment.Equipment,
      @EndUserText.label: 'Equipment Description'
      I_EquipmentText.EquipmentName              as EquipmentName,
      @Consumption.valueHelpDefinition: [{ entity:  { name: 'ZPM_F4_ObjectType', element: 'TechnicalObjectType' }}]
      @EndUserText.label: 'Object Type'
      //zobjtyp as Zobjtyp,
      I_Equipment.TechnicalObjectType            as Zobjtyp,
      @EndUserText.label: 'Mfg. Year'
      I_TechnicalObject.ConstructionYear,
      @EndUserText.label: 'Machine Serial No'
      I_TechnicalObject.ManufacturerSerialNumber     as ManufacturerSerialNumber,
      //      I_TechnicalObject.ManufacturerSerialNumber,
      @EndUserText.label: 'Machine Make'
      I_TechnicalObject.AssetManufacturerName    as YY1_EngineMake_IEQ,
      //      _Equipchar.YY1_EngineMake_IEQ,
      @EndUserText.label: 'Machine Model'
      I_TechnicalObject.ManufacturerPartTypeName as YY1_EngineModel_IEQ,
      //      _Equipchar.YY1_EngineModel_IEQ,
//////      @EndUserText.label: 'Registration No'
//////      _Equipchar.YY1_RegNo_IEQ,
//I_TechnicalObject.YY1_RegisNo_IEQ as YY1_RegNo_IEQ,

//      @EndUserText.label: 'Age of Asset'
//      _Equipchar.YY1_AgeofAsset_IEQ,
      @EndUserText.label: 'Insurance'
      zpmequip.zinsurance                        as Zinsurance,
      @EndUserText.label: 'Insurance Valid Upto'
      zpmequip.zinval                            as Zinval,
      @EndUserText.label: 'Registration Certificate '
      zpmequip.zregcer                           as Zregcer,
      @EndUserText.label: '(RC) Valid Upto'
      zpmequip.zregcrval                         as Zregcrval,
      @EndUserText.label: 'Hypothecated by '
      zpmequip.zhypo                             as Zhypo,
      @EndUserText.label: 'Road Tax '
      zpmequip.zroadtax                          as Zroadtax,
      @EndUserText.label: 'ROAD TAX VALID UPTO '
      zpmequip.zroadval                          as Zroadval,
      @EndUserText.label: 'Green Tax '
      zpmequip.zgrtax                            as Zgrtax,
      @EndUserText.label: 'Green Tax Valid Upto'
      zpmequip.zgrtaxval                         as Zgrtaxval,
      @EndUserText.label: 'Road Permit'
      zpmequip.zroadper                          as Zroadper,
      @EndUserText.label: 'Road Permit Valid Upto'
      zpmequip.zroadperval                       as Zroadperval,
      @EndUserText.label: 'Pollution(PUC)'
      zpmequip.zpuc                              as Zpuc,
      @EndUserText.label: 'Pollution(PUC)Valid Upto '
      zpmequip.zpucval                           as Zpucval,
      @EndUserText.label: 'Fitness '
      zpmequip.zfitness                          as Zfitness,
      @EndUserText.label: 'Fitness Valid Upto'
      zpmequip.zfitval                           as Zfitval,
      @EndUserText.label: 'NOC'
      zpmequip.znoc                              as Znoc,
      @EndUserText.label: 'NOC Upto'
      zpmequip.znocval                           as Znocval,
      @EndUserText.label: 'P&M Calibration'
      zpmequip.zpmcal                            as Zpmcal,
      zpmequip.zcalval                           as zcalval,
      @EndUserText.label: 'P&M Warranties'
      zpmequip.zpmwar                            as Zpmwar,
      zpmequip.zwarval                           as Zwarval,
      zpmequip.zind                              as zind,
      zpmequip.zremarks                          as zremarks,
      @EndUserText.label: 'Insurance Company'
      zpmequip.zins_comp                         as zins_comp,
      @EndUserText.label: 'Insurance Number'
      zpmequip.zins_num                          as zins_num,
      @EndUserText.label: 'Invoice Number'
      zpmequip.zinv_num                          as zinv_num,
      //      case when zpmequip.zind = ' ' then 'A' else 'X 'end as zind
      
  zpmequip.zins_str_date  ,
  zpmequip.zins_iss_sate  ,
  zpmequip.zrc_str_date     ,
  zpmequip.zrc_iss_sate      ,
  zpmequip.zhypo_fin         ,
  zpmequip.zhypo_fin_date    ,
  zpmequip.zroad_tax_date    ,
  zpmequip.zroad_iss_state   ,
  zpmequip.zgreen_tax_date   ,
  zpmequip.zgreen_tax_state  ,
  zpmequip.znat_str_date     ,
  zpmequip.znat_str_state    ,
  zpmequip.zroad_per_date    ,
  zpmequip.zroad_per_sate    ,
  zpmequip.zpuc_date         ,
  zpmequip.zpuc_sate         ,
  zpmequip.zfit_date         ,
  zpmequip.zfit_sate         ,
  zpmequip.znoc_date         ,
  zpmequip.znoc_sate,
  
  
  zpmequip.zins_inv_no       ,  
  zpmequip.zins_inv_date      ,  
  zpmequip.zins_sum_ass        ,
  zpmequip.zins_type           ,
  zpmequip.zins_doc_type        ,
  zpmequip.zins_doc_remarks     ,
  zpmequip.zroad_tax_certf_no   ,
  zpmequip.zroad_tax_certf_date ,
  zpmequip.zroad_tax_status     ,
  zpmequip.zroad_tax_amount     ,
  zpmequip.zroad_tax_remarks    ,
  zpmequip.zgreen_rec_no        ,
  zpmequip.zgreen_tax_result    ,
  zpmequip.zgreen_tax_amount    ,
  zpmequip.zgreen_tax_remarks   ,
  zpmequip.znati_perm,
  zpmequip.znati_perm_iss       ,
  zpmequip.znati_perm_no        ,
  zpmequip.znati_perm_date      ,
  zpmequip.znati_perm_val,
  zpmequip.znati_perm_place     ,
  zpmequip.znati_doc_type       ,
  zpmequip.znati_perm_amt       ,
  zpmequip.znati_doc_remarks    ,
  zpmequip.zroad_perm_iss       ,
  zpmequip.zroad_perm_no        ,
  zpmequip.zroad_perm_date      ,
  zpmequip.zroad_doc_type       ,
  zpmequip.zroad_perm_amt       ,
  zpmequip.zroad_doc_remarks    ,
  zpmequip.zpuc_cert_no ,
  zpmequip.zpuc_comp ,
  zpmequip.zpuc_issuby, 
  zpmequip.zpuc_result ,
  zpmequip.zpuc_amt ,
  zpmequip.zpuc_remarks, 
  zpmequip.zfit_comp_name, 
  zpmequip.zfit_cert_no ,
   zpmequip.zfit_cert_date, 
   zpmequip.zfit_result ,
  zpmequip.zfit_amt ,
  zpmequip.zfit_remarks, 
  zpmequip.zbank_name ,
  zpmequip.zbank_noc_date, 
  zpmequip.zbank_loan_no ,
  zpmequip.zbank_noc_status, 
  zpmequip.zbank_remarks ,
  zpmequip.zemmision_norms

}
// where zpmequip.zind = ' '
