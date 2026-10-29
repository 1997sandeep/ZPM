@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PM Compliance Projection'

define root view entity ZC_PM_COMPLIANCE
  provider contract transactional_query
  as projection on ZI_PM_COMPLIANCE
{                                          
      @Consumption.valueHelpDefinition: [{
    entity: {  
        name    : 'ZI_VH_EQUIPMENT',
        element : 'Equipment'
    },    
    additionalBinding: [{
        localElement : 'Plant',
        element      : 'Plant',
        usage        : #FILTER
    }],                              
    useForValidation: true
      }]                                     
  key Equipment,
  key ComplianceType,
                                                          
                              
  @Consumption.valueHelpDefinition: [{
    entity: {
        name    : 'ZI_VH_PLANT',
        element : 'Plant'
    },
    useForValidation: true
}]                                                                         
  Plant,
  EquipmentDescription,
  ObjectType,
  ComplianceNumber,
  ReceiptNo,                                    
  StartDate,
  ExpiryType,
  EndDate,
              
  Currency,
  Amount,
  Tax,
  Total,
           
  State,
  OwnerName,
  DMS,
  FileNo,
  MimeType,
  FileName,
  Remark,
                              
  InsuranceType,
  InsuranceCompany,
  PolicyNo,
  IDV,
  PolicyType,
  FlagCU,
  Flag
}
