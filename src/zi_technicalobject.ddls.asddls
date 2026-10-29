@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZI_TECHNICALOBJECT'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_TECHNICALOBJECT 
as select from I_TechnicalObject
{
    key Equipment,
    key TechnicalObject,
    key TechObjIsEquipOrFuncnlLoc,
    SuperiorTechnicalObjectName,
    cast(SuperiorTechnicalObjectLabel as abap.char( 30 )) as SuperiorTechnicalObjectLabel,
    cast(MaintenancePlanningPlant as abap.char(4)) as MaintenancePlanningPlant
}
