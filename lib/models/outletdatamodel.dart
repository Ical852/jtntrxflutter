//@dart=2.9

import 'package:jtntrx/models/outletmodels/curtipemodel.dart';
import 'package:jtntrx/models/outletmodels/outletmodel.dart';
import 'package:jtntrx/models/outletmodels/outletsubsmode.dart';
import 'package:jtntrx/models/outletmodels/paytipemodel.dart';
import 'package:jtntrx/models/outletmodels/trxtipemode.dart';

class OutletDataModel {
  OutletModel outlet;
  List<OutletSubsModel> outlet_subs;
  List<TrxTipeModel> trx_tipe;
  List<PayTipeModel> pay_tipe;
  List<CurTipeModel> cur_tipe;

  OutletDataModel.fromJson(Map<String, dynamic> json) {
    outlet = OutletModel.fromJson(json['outlet']);
    outlet_subs = json['outlet_subs'].map<OutletSubsModel>((os) => OutletSubsModel.fromJson(os)).toList();
    trx_tipe = json['trx_tipe'].map<TrxTipeModel>((trx) => TrxTipeModel.fromJson(trx)).toList();
    pay_tipe = json['pay_tipe'].map<PayTipeModel>((pt) => PayTipeModel.fromJson(pt)).toList();
    cur_tipe = json['cur_tipe'].map<CurTipeModel>((ct) => CurTipeModel.fromJson(ct)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "outlet" : outlet.toJson(),
      "outlet_subs" : outlet_subs.map((os) => os.toJson()).toList(),
      "trx_tipe" : trx_tipe.map((trx) => trx.toJson()).toList(),
      "pay_tipe" : pay_tipe.map((pt) => pt.toJson()).toList(),
      "cur_tipe": cur_tipe.map((ct) => ct.toJson()).toList(),
    };
  }
}