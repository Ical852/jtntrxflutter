//@dart=2.9

class CurTipeModel {
  String ctId;
  String ctNama;
  String ctLogo;
  String ctKet;

  CurTipeModel.fromJson(Map<String, dynamic> json) {
    ctId = json["ct_id"];
    ctNama = json["ct_nama"];
    ctLogo = json["ct_logo"];
    ctKet = json["ct_ket"];
  }

  Map<String, dynamic> toJson() {
    return {
      "ct_id": ctId,
        "ct_nama": ctNama,
        "ct_logo": ctLogo,
        "ct_ket": ctKet,
    };
  }
}