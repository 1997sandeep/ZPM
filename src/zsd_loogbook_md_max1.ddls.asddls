@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Maximum measurement doc no'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSD_LOOGBOOK_MD_MAX1 
  as select from I_MeasurementDocument
{
  key MeasuringPoint,
      max(MsmtRdngDate) as Idate
}where MsmtRdngIsReversed <> 'X'

group by
  MeasuringPoint
 