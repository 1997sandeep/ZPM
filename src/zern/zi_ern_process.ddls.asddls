@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data Defination For ERN Process'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_ERN_PROCESS
  as select from zern_process
  //composition of target_data_source_name as _association_name
{
  key werks      as Werks,
  key req_no     as Req_No,
  key sl_no      as sl_no,
      req_status as Req_Status,
      val_from   as val_from,
      val_to     as val_to,
      c_date     as C_Date,
      c_by       as C_By,
      last_cdate as Last_Cdate,
      last_cby   as Last_Cby,
      equicat      as Eqart,
      evtype      as Eartx,
      capacity   as Capacity,
      qty        as Qty,
      form_dt    as Form_Dt,
      to_dt      as To_Dt,
      req_type   as Req_Type,
      sts_by_pm  as Sts_By_Pm,
      sts_by_bgt as Sts_By_Bgt,
      equnr      as Equnr,
      s_pant     as S_Pant,
      status     as Status,
      banfn      as Banfn,
      doctype      as Bsart,
      ebeln      as Ebeln,
      lifnr      as Lifnr,
      s_date     as S_Date,
      s_by       as S_By,
      remark     as Remark,
      flag       as Flag,
      meins      as meins,
      dehire_dt  as dehire_dt,
      dehire_remark as dehire_remark ,
      budget as  Budget
       //    _association_name // Make association public
}
