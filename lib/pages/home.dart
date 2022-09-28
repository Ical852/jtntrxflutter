import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jtntrx/cubit/user_cubit.dart';
import 'package:jtntrx/models/outletdatamodel.dart';
import 'package:jtntrx/models/outletmoneymodel.dart';
import 'package:jtntrx/models/trxdatamodel.dart';
import 'package:jtntrx/services/allservice.dart';
import 'package:jtntrx/shared/theme.dart';
import 'package:jtntrx/widgets/outletitem.dart';

class HomePage extends StatefulWidget {
  OutletDataModel outletDataModel;
  TrxDataModel trxDataModel;
  HomePage(this.outletDataModel, this.trxDataModel);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<OutletMoneyModel> moneys  = [];
  var open = false;

  var idrTotal = 0;
  var usdTotal = 0;
  var eurTotal = 0;
  var sgdTotal = 0;

  var idrkeluar = 0;
  var usdkeluar = 0;
  var eurkeluar = 0;
  var sgdkeluar = 0;

  var jumlahBarang = 0;

  TrxDataModel outletTrx = new TrxDataModel();
  
  @override
  void initState() {
    super.initState();
    if (this.widget.trxDataModel.data != null) {
      this.setState(() {
        outletTrx = this.widget.trxDataModel;
      });
    }
    initdata();
  }
  
  void initdata() async {
    if (outletTrx.data != null) {
      this.setState(() {
        jumlahBarang = outletTrx.data.length;
      });
      if (outletTrx.data.length > 0) {
        for (var i = 0; i < outletTrx.data.length; i++) {
          if (outletTrx.data[i].trxCurtipeVar == "Rp") {
            if (outletTrx.data[i].trxPtipeNama == "Masuk") {
              this.setState(() {
                idrTotal = idrTotal + int.parse(outletTrx.data[i].trxNominal);
              });
            } else {
              this.setState(() {
                idrkeluar = idrkeluar + int.parse(outletTrx.data[i].trxNominal);
              });
            }
          } else if (outletTrx.data[i].trxCurtipeVar == "\$") {
            if (outletTrx.data[i].trxPtipeNama == "Masuk") {
              this.setState(() {
                usdTotal = usdTotal + int.parse(outletTrx.data[i].trxNominal);
              });
            } else {
              this.setState(() {
                usdkeluar = usdkeluar + int.parse(outletTrx.data[i].trxNominal);
              });
            }
          } else if (outletTrx.data[i].trxCurtipeVar == "S\$") {
            if (outletTrx.data[i].trxPtipeNama == "Masuk") {
              this.setState(() {
                sgdTotal = sgdTotal + int.parse(outletTrx.data[i].trxNominal);
              });
            } else {
              this.setState(() {
                sgdkeluar = sgdkeluar + int.parse(outletTrx.data[i].trxNominal);
              });
            }
          } else {
            if (outletTrx.data[i].trxPtipeNama == "Masuk") {
              this.setState(() {
                eurTotal = eurTotal + int.parse(outletTrx.data[i].trxNominal);
              });
            } else {
              this.setState(() {
                eurkeluar = eurkeluar + int.parse(outletTrx.data[i].trxNominal);
              });
            }
            
          }
        }
      }
    }

    for (var i = 0; i < 4; i++) {
      moneys.add(OutletMoneyModel.make(
        i == 0 ? "IDR" : i == 1 ? "USD" : i == 2 ? "EUR" : "SGD", 
        i == 0 ? idrTotal - idrkeluar : i == 1 ? usdTotal - usdkeluar : i == 2 ? eurTotal - eurkeluar : sgdTotal - sgdkeluar
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 45
      ),
      height: double.infinity,
      width: double.infinity,
      color: primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
             outletTrx.data != null && this.widget.outletDataModel.outlet != null ? OutletItem(
              outletDataModel: this.widget.outletDataModel,
              title: this.widget.outletDataModel.outlet.outletName,
              prices: moneys,
              open: open,
              onPress: (){
                this.setState(() {
                  open = !open;
                });
              },
              jumlahbarang: jumlahBarang,
            ) : CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}