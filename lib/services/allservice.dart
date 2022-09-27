//@dart=2.9

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jtntrx/models/outletdatamodel.dart';
import 'package:jtntrx/models/trxdatamodel.dart';
import 'package:jtntrx/models/usermodel.dart';

class AllService {
  String token;
  String tokencsrf;

  Future<UserModel> login() async {
    var url = "http://test-tech.api.jtisrv.com/md/public/API/Auth";
    var body = 
      {
        "act": "LOGIN", 
        "un": "admin@admin.com", 
        "up": "admin"
      };

    var response = await http.post(
      url,
      body: body
    );

    var data = jsonDecode(response.body)['data']['user'];
    var cookie = response.headers['set-cookie'];
    var cookietoken = cookie.split(';');
    token = cookietoken[0];

    var user = UserModel.fromJson(data);
    user.user_id = token;
    return user;
  }

  Future<OutletDataModel> initData() async {
    var url = "http://test-tech.api.jtisrv.com/md/public/API/Auth/initData";
    var body = 
      {
        "act": "initData", "outlet_id": "1"
      };
    var response = await http.post(url, body: body);
    var data = jsonDecode(response.body)['data'];
    var outlet = OutletDataModel.fromJson(data);

    return outlet;
  }

  Future<TrxDataModel> getTrx(tokencookie) async {
    var url = "http://test-tech.api.jtisrv.com/md/public/API/Trx/Get";
    var body = {
      "act": "trxGet",
      "outlet_id": 1,
      "user_id": 1,
      "data": {
          "trx_id": 0,
          "status": 1,
          "date_start": "",
          "date_end": ""
      }
    };

    var header = {
      "cookie" : tokencookie.toString(),
      "Content-Type": "application/json",
    };
    
    var response = await http.post(url, body: jsonEncode(body), headers: header);
    var data = jsonDecode(response.body);

    TrxDataModel outletData = TrxDataModel.fromJson(data);

    return outletData;
  }
}