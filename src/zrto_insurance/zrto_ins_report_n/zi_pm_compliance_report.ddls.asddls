@EndUserText.label: 'PM Compliance Report'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@AbapCatalog.viewEnhancementCategory: [#NONE]

define view entity ZI_PM_COMPLIANCE_REPORT
  as select from zpmt_compliance as C

    left outer join I_Equipment as EQ
      on EQ.Equipment            = C.zequipment
     and EQ.ValidityEndDate      = '99991231'     

    left outer join I_EquipmentText as EQT            
      on EQT.Equipment           = C.zequipment
     and EQT.ValidityEndDate     = '99991231'       
     and EQT.Language            = $session.system_language

    left outer join I_TechnicalObjectTypeText as TOT        
      on TOT.TechnicalObjectType = EQ.TechnicalObjectType
     and TOT.Language            = $session.system_language

{

  key C.zequipment          as Equipment,
  key C.zcomptype           as ComplianceType,

      C.zcompliance_number  as ComplianceNumber,
      C.zplant              as Plant,
      C.zreceipt            as ReceiptNo,

      C.zstdate             as StartDate,
      C.zenddate            as EndDate,
      C.zexptype            as ExpiryType,
         
      case   
      when C.zenddate < $session.system_date
      then cast( 'Expired' as abap.char(10) )

      when C.zenddate <= dats_add_days(
                        $session.system_date,
                        30, 'UNCHANGED' )
      then cast( 'Expiring' as abap.char(10) )
        
      else       
      cast( 'Valid' as abap.char(10) )
      end as Status,


      EQT.EquipmentName     as EquipmentDescription,

      EQ.TechnicalObjectType as TechnicalObjectType,

      TOT.TechnicalObjectTypeDesc as ObjectType,

      C.zcurrency           as Currency,

      C.zamount             as Amount,

      C.ztax                as Tax,

      C.ztotal              as Total,

      C.zstate              as State,

      C.zowner              as OwnerName,

      C.zdms                as DMS,

      C.zfile               as FileNo,

      C.zremark             as Remark,

      C.zinstype            as InsuranceType,

      C.zinscompany         as InsuranceCompany,

      C.zpolicyno           as PolicyNo,

      C.zidv                as IDV,

      C.zpolicytype         as PolicyType,

      C.createdby           as CreatedBy,

      C.createdon           as CreatedAt,

      C.changedby           as ChangedBy,

      C.changedon           as ChangedAt,
      C.zdrivelicanceno as zdrivelicanceno,
      C.zdriveradhar as zdriveradhar,
      C.zdrivername as zdrivername,
      C.zdriverfromdate as zdriverfromdate,
      C.zdrivertodate as zdrivertodate

}
