@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Logbook - Cummulative hours Value'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSD_LOGBOOK_CUMM_HRS 
  as select from    I_Equipment         as a
    left outer join I_MeasuringPoint    as b on  a.MaintObjectInternalID        = b.MeasuringPointObjectIdentifier
                                             and b.MeasuringPointPositionNumber = 'CHR'
    left outer join ZSD_LOOGBOOK_MD_MAX as c on b.MeasuringPoint = c.MeasuringPoint
//left outer join ZPM_LOGB_DATE_MP2( p_frm: $parameters.pdate ) as c on  a.Equipment = c.Equipment
//                                                                       and b.MeasuringPoint = c.MeasuringPoint
{
  key a.Equipment, 
      b.MeasuringPoint,
      c.MeasurementDocument,
      c.MeasurementReadingEntryUoM,
      c.MeasurementReadingInEntryUoM

}
where
  b.MeasuringPointIsInactive <> 'X'
