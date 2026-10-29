@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PM Compliance Interface View'
@Metadata.ignorePropagatedAnnotations: true
                                                                         
define root view entity ZI_PM_COMPLIANCE
  as select from I_TechnicalObject as TOBJ

    inner join I_Equipment as EQ
      on EQ.Equipment       = TOBJ.Equipment
     and EQ.ValidityEndDate = '99991231'

    left outer join zpmt_compliance as A
      on A.zequipment = EQ.Equipment

    left outer join I_EquipmentText as EQT
      on EQT.Equipment       = EQ.Equipment
     and EQT.ValidityEndDate = '99991231'
     and EQT.Language        = $session.system_language
     
    left outer join I_TechnicalObjectTypeText as TOTT
      on TOTT.TechnicalObjectType = TOBJ.TechnicalObjectType  

{
      key EQ.Equipment                    as Equipment,
      key A.zcomptype                     as ComplianceType,

          TOBJ.MaintenancePlanningPlant   as Plant,
          EQT.EquipmentName               as EquipmentDescription,
          TOTT.TechnicalObjectTypeDesc    as ObjectType,

          A.zcompliance_number            as ComplianceNumber,
          A.zreceipt                      as ReceiptNo,
          A.zstdate                       as StartDate,
          A.zexptype                      as ExpiryType,
          A.zenddate                      as EndDate,

          A.zcurrency                     as Currency,
          A.zamount                       as Amount,
          A.ztax                          as Tax,
          A.ztotal                        as Total,

          A.zstate                        as State,
          A.zowner                        as OwnerName,
          A.zdms                          as DMS,
          A.zfile                         as FileNo,
          A.zmimetype                     as MimeType,
          A.zfilename                     as FileName,
          A.zremark                       as Remark,
          A.zinstype                      as InsuranceType,
          A.zinscompany                   as InsuranceCompany,
          A.zpolicyno                     as PolicyNo,
          A.zidv                          as IDV,
          A.zpolicytype                   as PolicyType,
          A.zfuncationllocation           as FunctionalLocation,
          A.zflagcu                       as FlagCU,
          A.zflag                         as Flag,
         A.zdrivername     as Zdrivername    ,
         A.zdriveradhar    as Zdriveradhar   ,
         A.zdrivelicanceno as Zdrivelicanceno,
         A.zdriverfromdate as Zdriverfromdate,
         A.zdrivertodate   as Zdrivertodate  ,
          A.createdby,
          A.createdon,
          A.changedby,
          A.changedon,
          
          @Semantics.systemDateTime.localInstanceLastChangedAt: true
          A.locallastchangedat            as LocalLastChangedAt,
          
          @Semantics.systemDateTime.lastChangedAt: true
          A.lastchangedat

}
where TOBJ.MaintenancePlanningPlant is not null;

//as select from zpmt_compliance as A
//
//    left outer join I_Equipment as EQ
//      on EQ.Equipment = A.zequipment
//     and EQ.ValidityEndDate = '99991231'
//
//    left outer join I_TechnicalObject as TOBJ
//      on TOBJ.Equipment = EQ.Equipment
//
//    left outer join I_EquipmentText as EQT
//      on EQT.Equipment = EQ.Equipment
//     and EQT.ValidityEndDate = '99991231'
//     and EQT.Language = $session.system_language
//
//{
//      key EQ.Equipment                    as Equipment,
//      key A.zcomptype                     as ComplianceType,
//
//          TOBJ.MaintenancePlanningPlant   as Plant,
//          EQT.EquipmentName               as EquipmentDescription,
//          EQ.TechnicalObjectType          as ObjectType,
//
//          A.zcompliance_number            as ComplianceNumber,
//          A.zreceipt                      as ReceiptNo,
//          A.zstdate                       as StartDate,
//          A.zexptype                      as ExpiryType,
//          A.zenddate                      as EndDate,
//
//          A.zcurrency                     as Currency,
//          A.zamount                       as Amount,
//          A.ztax                          as Tax,
//          A.ztotal                        as Total,
//
//          A.zstate                        as State,
//          A.zowner                        as OwnerName,
//          A.zdms                          as DMS,
//          A.zfile                         as FileNo,
//          A.zmimetype                     as MimeType,
//          A.zfilename                     as FileName,
//          A.zremark                       as Remark,
//          A.zinstype                      as InsuranceType,
//          A.zinscompany                   as InsuranceCompany,
//          A.zpolicyno                     as PolicyNo,
//          A.zidv                          as IDV,
//          A.zpolicytype                   as PolicyType,
//          A.zflagcu                       as FlagCU,
//          A.zflag                         as Flag,
//
//          A.created_by,
//          A.created_at,
//          A.changed_by,
//          A.changed_at,
//
//          @Semantics.systemDateTime.localInstanceLastChangedAt: true
//          A.locallastchangedat            as LocalLastChangedAt,
//
//          @Semantics.systemDateTime.lastChangedAt: true
//          A.lastchangedat
//
//}
//where TOBJ.MaintenancePlanningPlant is not null;
