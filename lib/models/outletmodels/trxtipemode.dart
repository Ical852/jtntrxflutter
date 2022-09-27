//@dart=2.9

class TrxTipeModel {
  String id;
  String nama;
  String trx;
  String outletId;
  String delStatus;

  TrxTipeModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nama = json["nama"];
    trx = json["trx"];
    outletId = json["outlet_id"];
    delStatus = json["del_status"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nama": nama,
      "trx": trx,
      "outlet_id": outletId,
      "del_status": delStatus,
    };
  }
}