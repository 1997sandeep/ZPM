@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'KM/HR based on date'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_LOGB_DATE_MP3 
with parameters
    p_frm : zbegda
  as select from ZPM_LOGB_DATE_MP(p_frm:$parameters.p_frm) as ZPM_LOGB_DATE_MP

{
  key Equipment,
      MeasuringPoint,
  //    MeasurementDocument,
      //    MeasurementReadingEntryUoM,
      //    MeasurementReadingInEntryUoM,
      max(IDATE) as IDATE
      //  _association_name // Make association public
}
group by
  Equipment,
  MeasuringPoint
//  MeasurementDocument
