@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'KM/HR based on date'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_LOGB_DATE_MP 
 with parameters
    p_frm : zbegda
  as select from    I_Equipment      as a
    left outer join I_MeasuringPoint as b on a.MaintObjectInternalID = b.MeasuringPointObjectIdentifier
  //                                             and b.MeasuringPointPositionNumber = 'CKM' //or b.MeasuringPointPositionNumber = 'CHR'
    left outer join ZPM_FITKMR_TYRE3 as c on b.MeasuringPoint = c.MeasuringPoint
{
  key a.Equipment,
      b.MeasuringPoint,
      c.MeasurementDocument,
//      c.MeasurementReadingEntryUoM,
//      c.MeasurementReadingInEntryUoM,
      max(c.IDATE) as IDATE

}
where
      b.MeasuringPointIsInactive <> 'X'
  and c.IDATE                    <= $parameters.p_frm
group by
  a.Equipment,
//  c.IDATE,
  b.MeasuringPoint,
  c.MeasurementDocument
//  c.MeasurementReadingEntryUoM,
//  c.MeasurementReadingInEntryUoM
