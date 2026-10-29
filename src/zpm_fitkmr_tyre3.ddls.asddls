@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fitted KMR for tyre entry3'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_FITKMR_TYRE3 as select from ZPM_FITKMR_TYRE2 as a
    inner join   I_MeasurementDocument as b on a.MeasurementDocument = b.MeasurementDocument
  //as select from I_MeasurementDocument as b
{
  key a.MeasurementDocument,
      a.MeasuringPoint,
      b.MeasurementReadingInEntryUoM,
      b.MeasurementReadingEntryUoM,
      max(a.Idate) as IDATE
      //      MsmtDocumentSIUnitOfMeasure
}
group by
  a.MeasurementDocument,
  a.MeasuringPoint,
  b.MeasurementReadingInEntryUoM,
  b.MeasurementReadingEntryUoM,
  a.Idate
