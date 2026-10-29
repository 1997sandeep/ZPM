@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'KM/HR based on date'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_LOGB_DATE_MP2 
 with parameters
    p_frm : zbegda
  as select from ZPM_LOGB_DATE_MP1(p_frm:$parameters.p_frm) as A1
    inner join   I_MeasurementDocument                     as A2 on  A1.MeasuringPoint      = A2.MeasuringPoint
                                                                 and A1.MeasurementDocument = A2.MeasurementDocument

{
  key A1.Equipment,
  key A1.MeasuringPoint,
      A1.MeasurementDocument,
      A2.MeasurementReadingEntryUoM,
//      A2.MeasurementReadingInEntryUoM
      cast(
    round(
        cast(A2.MeasurementReadingInEntryUoM as abap.dec(17,7)), 2
    ) as abap.dec(15,2)
) as MeasurementReadingInEntryUoM
  //    A1.IDATE
      //  _association_name // Make association public
}
group by
  A1.Equipment,
  A1.MeasuringPoint,
  A1.MeasurementDocument,
  A2.MeasurementReadingEntryUoM,
  A2.MeasurementReadingInEntryUoM
//  A1.IDATE
