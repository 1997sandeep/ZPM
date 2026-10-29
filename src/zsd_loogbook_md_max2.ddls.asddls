@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZSD_LOOGBOOK_MD_MAX2'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSD_LOOGBOOK_MD_MAX2 
  as select from    ZSD_LOOGBOOK_MD_MAX1 as a
    left outer join I_MeasurementDocument as b on  a.MeasuringPoint = b.MeasuringPoint
                                                and a.Idate          = b.MsmtRdngDate
{
  key a.MeasuringPoint,
      a.Idate,
      max(b.MsmtRdngTime) as Itime  
} where b.MsmtRdngIsReversed <> 'X'
group by
    a.MeasuringPoint,
    a.Idate
