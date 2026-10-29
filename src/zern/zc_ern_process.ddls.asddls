@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection For ERN Process'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true

define root view entity ZC_ERN_PROCESS
  provider contract transactional_query
  as projection on ZI_ERN_PROCESS
{
  key Werks,
  key Req_No,
  key sl_no,
      Req_Status,
      val_from,
      val_to,
      C_Date,
      C_By,
      Last_Cdate,
      Last_Cby,
      Eqart,
      Eartx,
      Capacity,
      Qty,
      Form_Dt,
      To_Dt,
      Req_Type,
      Sts_By_Pm,
      Sts_By_Bgt,
      Equnr,
      S_Pant,
      Status,
      Banfn,
      Bsart,
      Ebeln,
      Lifnr,
      S_Date,
      S_By,
      Remark,
      Flag,
      meins,
      dehire_dt,
      dehire_remark,
      Budget
//      _association_name // Make association public
}
