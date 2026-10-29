@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fetching start HRs & KMs value'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSD_LOGBOOK_START_VAL 
  as select from    I_Equipment                                   as a
    left outer join I_MeasuringPoint                              as b on  a.MaintObjectInternalID        = b.MeasuringPointObjectIdentifier
                                                                       and b.MeasuringPointPositionNumber = 'WH'
    left outer join ZSD_LOOGBOOK_MD_MAX as c on b.MeasuringPoint = c.MeasuringPoint

{
  key a.Equipment,
      b.MeasuringPoint,
      c.MeasurementDocument,
      c.MeasurementReadingEntryUoM,
      cast(
    round(
        cast(c.MeasurementReadingInEntryUoM as abap.dec(17,7)), 2
    ) as abap.dec(15,2)
) as MeasurementReadingInEntryUoM

        
 //      c.MeasurementReadingInEntryUoM

}
where
  b.MeasuringPointIsInactive <> 'X'
