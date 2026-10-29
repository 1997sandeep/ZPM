@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'F4 for functional location'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSD_F4_FUNCLOC
  as select distinct from ZI_TECHNICALOBJECT as a1
{

  key    a1.SuperiorTechnicalObjectLabel as Funcloc,
         a1.SuperiorTechnicalObjectName  as FuncName
}
