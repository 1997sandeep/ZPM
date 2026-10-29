@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZSD_LOOGBOOK_MD_MAX'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSD_LOOGBOOK_MD_MAX 
  as select from ZSD_LOOGBOOK_MD_MAX3  as a
    inner join   I_MeasurementDocument as b on a.MeasurementDocument = b.MeasurementDocument
  //as select from I_MeasurementDocument as b
{
  key a.MeasurementDocument,
      a.MeasuringPoint,
      b.MeasurementReadingInEntryUoM,
      b.MeasurementReadingEntryUoM
      //      MsmtDocumentSIUnitOfMeasure
}
group by
  a.MeasurementDocument,
  a.MeasuringPoint,
  b.MeasurementReadingInEntryUoM,
  b.MeasurementReadingEntryUoM
//  MsmtDocumentSIUnitOfMeasure
