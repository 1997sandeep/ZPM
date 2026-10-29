@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZSD_LOOGBOOK_MD_MAX3'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSD_LOOGBOOK_MD_MAX3
  as select from    ZSD_LOOGBOOK_MD_MAX2  as a
    left outer join I_MeasurementDocument as b on  a.MeasuringPoint = b.MeasuringPoint
                                               and a.Idate          = b.MsmtRdngDate
                                               and a.Itime          = b.MsmtRdngTime
{

  key  a.MeasuringPoint,
  key  a.Idate,
  key  a.Itime,
       max(b.MeasurementDocument) as MeasurementDocument

}
where
  b.MsmtRdngIsReversed <> 'X'
group by
  a.MeasuringPoint,
  a.Idate,
  a.Itime
