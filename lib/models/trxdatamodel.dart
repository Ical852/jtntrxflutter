//@dart=2.9

import 'package:jtntrx/models/trxoutletmodel.dart';

class TrxDataModel {
  List<TrxOutletModel> data;

  TrxDataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'].map<TrxOutletModel>((trx) => TrxOutletModel.fromJson(trx)).toList();
  }
}