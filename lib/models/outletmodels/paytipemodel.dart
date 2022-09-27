//@dart=2.9

class PayTipeModel {
  String byrId;
  String byrNama;
  String byrDesc;
  String byrQrisData;
  String byrQrisImage;
  String byrHttp;
  String outletId;
  String delStatus;

  PayTipeModel.fromJson(Map<String, dynamic> json) {
    byrId = json["byr_id"];
    byrNama = json["byr_nama"];
    byrDesc = json["byr_desc"];
    byrQrisData = json["byr_qris_data"];
    byrQrisImage = json["byr_qris_image"];
    byrHttp = json["byr_http"];
    outletId = json["outlet_id"];
    delStatus = json["del_status"];
  }

  Map<String, dynamic> toJson() {
    return {
      "byr_id": byrId,
      "byr_nama": byrNama,
      "byr_desc": byrDesc,
      "byr_qris_data": byrQrisData,
      "byr_qris_image": byrQrisImage,
      "byr_http": byrHttp,
      "outlet_id": outletId,
      "del_status": delStatus,
    };
  }
}