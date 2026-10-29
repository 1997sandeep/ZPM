@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZEQUIP_CHANGELOG_C'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZEQUIP_CHANGELOG_C   as select from zequip_changelog
{
  key id                    as ID,
  key zequipment_id         as ZequipmentId,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      previous              as Previous,
      fieldname             as Fieldname,
      present               as Present
}
