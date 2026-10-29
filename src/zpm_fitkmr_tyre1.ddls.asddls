@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fitted KMR for tyre entry1'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPM_FITKMR_TYRE1 as select from ZPM_FITKMR_TYRE

{
    key MeasuringPoint,
    Idate
}
