@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fitted KMR for tyre entry'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_FITKMR_TYRE as select from I_MeasurementDocument
{
  key MeasuringPoint,
      MsmtRdngDate as Idate
}where MsmtRdngIsReversed <> 'X'

group by
  MeasuringPoint,
  MsmtRdngDate
