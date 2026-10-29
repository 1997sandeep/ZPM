@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'KM/HR based on date'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_LOGB_DATE_MP1 
  with parameters
    p_frm : zbegda
  as select from ZPM_LOGB_DATE_MP3(p_frm:$parameters.p_frm) as A1
 inner join   I_MeasurementDocument                     as A2 on  A1.MeasuringPoint      = A2.MeasuringPoint
                                                                and A1.IDATE = A2.MsmtRdngDate
                                                                and A2.MsmtRdngIsReversed <> 'X'
{
  key A1.Equipment,
      A1.MeasuringPoint,
 //     A1.IDATE,
      max(A2.MeasurementDocument) as MeasurementDocument
      //    MeasurementReadingEntryUoM,
      //    MeasurementReadingInEntryUoM,

      //  _association_name // Make association public
}
group by
  A1.Equipment,
  A1.MeasuringPoint
//  A1.IDATE
