//@dart=2.9

class TrxOutletModel {
  String trxPtipeNama;
  String trxCurtipeVar;
  String trxAsalOutletNama;
  String trxDarikeOutletId;
  String trxDarikeOutletNama;
  String trxId;
  String trxTgl;
  String trxPtipe;
  String trxDateCreated;
  String trxNominal;
  String trxKet;
  String trxStatus;
  String trxIsStok;
  String trxAsalOutletId;
  String trxOutletId;

  TrxOutletModel.fromJson(Map<String, dynamic> json) {
    trxPtipeNama = json["trx_ptipe_nama"];
    trxCurtipeVar = json["trx_curtipe_var"];
    trxAsalOutletNama = json["trx_asal_outlet_nama"];
    trxDarikeOutletId = json["trx_darike_outlet_id"];
    trxDarikeOutletNama = json["trx_darike_outlet_nama"];
    trxId = json["trx_id"];
    trxTgl = json["trx_tgl"];
    trxPtipe = json["trx_ptipe"];
    trxDateCreated = json["trx_date_created"];
    trxNominal = json["trx_nominal"];
    trxKet = json["trx_ket"];
    trxStatus = json["trx_status"];
    trxIsStok = json["trx_is_stok"];
    trxAsalOutletId = json["trx_asal_outlet_id"];
    trxOutletId = json["trx_outlet_id"];
  }

  Map<String, dynamic> toJson() {
    return {
      "trx_ptipe_nama": trxPtipeNama,
      "trx_curtipe_var": trxCurtipeVar,
      "trx_asal_outlet_nama": trxAsalOutletNama,
      "trx_darike_outlet_id": trxDarikeOutletId,
      "trx_darike_outlet_nama": trxDarikeOutletNama,
      "trx_id": trxId,
      "trx_tgl": trxTgl,
      "trx_ptipe": trxPtipe,
      "trx_date_created": trxDateCreated,
      "trx_nominal": trxNominal,
      "trx_ket": trxKet,
      "trx_status": trxStatus,
      "trx_is_stok": trxIsStok,
      "trx_asal_outlet_id": trxAsalOutletId,
      "trx_outlet_id": trxOutletId,
    };
  }
}