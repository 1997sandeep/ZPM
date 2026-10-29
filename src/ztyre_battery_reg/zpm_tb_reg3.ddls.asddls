@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tyre & Battery Register 3'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPM_TB_REG3
  as select from    I_Equipment           as a
    left outer join I_MeasuringPoint      as b on a.MaintObjectInternalID = b.MeasuringPointObjectIdentifier
  //and

    left outer join I_MeasurementDocument as c on b.MeasuringPoint = c.MeasuringPoint
{
  key a.Equipment                                                 as equipment,
      b.MeasuringPointObjectIdentifier,
      b.MeasuringPoint,
      b.MeasuringPointPositionNumber                              as mp_pos_no,
      c.MeasurementDocument,

      c.MsmtRdngDate                                              as fit_on_date,
      cast( c.MsmtRdngDate as abap.char(10) )                     as fit_on_date1,
      cast( c.MeasurementReadingInEntryUoM as abap.dec( 15, 2 ) ) as fit_at_read
}
where
       b.MeasuringPointIsInactive     <> 'X'
  and  c.MsmtRdngIsReversed           <> 'X'
  and(
       b.MeasuringPointPositionNumber =  'HMR'
    or b.MeasuringPointPositionNumber =  'KMR'
    or b.MeasuringPointPositionNumber =  'CHMR'
    or b.MeasuringPointPositionNumber =  'CKMR'
  )

group by
  a.Equipment,
  b.MeasuringPointObjectIdentifier,
  b.MeasuringPoint,
  b.MeasuringPointPositionNumber,
  c.MeasurementDocument,
  c.MsmtRdngDate,
  c.MeasurementReadingInEntryUoM
