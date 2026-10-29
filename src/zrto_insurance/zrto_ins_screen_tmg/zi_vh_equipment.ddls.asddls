@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Equipment Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP         
define view entity ZI_VH_EQUIPMENT
   as select from I_Plant as P 
    left outer join I_TechnicalObject as TOBJ
      on TOBJ.MaintenancePlanningPlant  = P.Plant
     and TOBJ.TechObjIsEquipOrFuncnlLoc = 'EAMS_EQUI' 

    left outer join I_EquipmentText as EQT
      on EQT.Equipment = TOBJ.Equipment

    left outer join I_TechnicalObjectTypeText as TOTT
      on TOTT.TechnicalObjectType = TOBJ.TechnicalObjectType
{                                       
    key TOBJ.Equipment                 as Equipment,
        P.Plant                        as Plant,
        TOBJ.TechnicalObjectType       as TechnicalObjectType,
        TOTT.TechnicalObjectTypeDesc   as ObjectType,
        EQT.EquipmentName              as EquipmentDescription
}
where TOBJ.Equipment <> ''

