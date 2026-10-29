@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fitted KMR for tyre entry2'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_FITKMR_TYRE2 as select from ZPM_FITKMR_TYRE1 as A
   left outer join I_MeasurementDocument as b on  A.MeasuringPoint = b.MeasuringPoint
                                               and A.Idate          = b.MsmtRdngDate
//                                               and a.Itime          = b.MsmtRdngTime


{
   key  A.MeasuringPoint,
  key  A.Idate, 
 // key  a.Itime,
       max(b.MeasurementDocument) as MeasurementDocument

} where b.MsmtRdngIsReversed <> 'X'
group by
  A.MeasuringPoint,
  A.Idate
//  a.Itime
