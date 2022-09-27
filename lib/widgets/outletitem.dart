import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jtntrx/models/outletdatamodel.dart';
import 'package:jtntrx/models/outletmoneymodel.dart';
import 'package:jtntrx/pages/keluar.dart';
import 'package:jtntrx/pages/kurs.dart';
import 'package:jtntrx/pages/masuk.dart';
import 'package:jtntrx/pages/mutasi.dart';
import 'package:jtntrx/pages/pindah.dart';
import 'package:jtntrx/shared/theme.dart';
import 'package:jtntrx/widgets/outletfuncitem.dart';
import 'package:jtntrx/widgets/outletmoney.dart';
import 'package:jtntrx/widgets/outletmoneytotal.dart';

class OutletItem extends StatelessWidget {
  String title;
  List<OutletMoneyModel> prices;
  bool open;
  Function() onPress;
  int jumlahbarang;
  OutletDataModel outletDataModel;

  OutletItem({
    required this.title, 
    required this.prices, 
    this.open = false, 
    required this.onPress,
    required this.jumlahbarang,
    required this.outletDataModel,
  });

  @override
  Widget build(BuildContext context) {

    String renderIcon() {
      return open ? "assets/icbtnclose.png" : "assets/icplusbtn.png";
    }

    Widget controlClosed() {
      return Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 19,
                height: 61,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/slide.png"))),
              ),
              Container(
                width: 15,
                height: 158,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(open ? 0 : 15),
                    topRight: Radius.circular(open ? 0 : 15))),
              ),
            ],
          ),
          GestureDetector(
            onTap: onPress,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 18,
                height: 18,
                margin:
                    EdgeInsets.only(right: open ? 0 : 8, left: open ? 7 : 0),
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(renderIcon()))),
              ),
            ),
          )
        ],
      );
    }

    Widget controlOpened() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          controlClosed(),
          Container(
            padding: EdgeInsets.only(
              top: 14,
              bottom: 14,
              right: 14
            ),
            width: (MediaQuery.of(context).size.width - 20) * 0.8,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutletFuncItem(title: "MASUK", onPress: (){
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => MasukPage(outletDataModel)
                          )
                        );
                      },),
                      OutletFuncItem(title: "KELUAR", onPress: (){
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => KeluarPage(outletDataModel)
                          )
                        );
                      },),
                      OutletFuncItem(title: "PINDAH", onPress: (){
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => PindahPage(outletDataModel)
                          )
                        );
                      },),
                      OutletFuncItem(title: "MUTASI", onPress: (){
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => MutasiPage(outletDataModel)
                          )
                        );
                      },),
                      OutletFuncItem(title: "KURS", onPress: (){
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => KursPage(outletDataModel)
                          )
                        );
                      },),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8
                  ),
                  height: 78,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: black.withOpacity(0.2),
                        blurRadius: 2,
                        offset: Offset(0, 2))
                    ]
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Jumlah Barang",
                            style: robototext.copyWith(
                              fontSize: 8,
                              fontWeight: bold,
                              color: grey
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: 4, left: 8, right: 8),
                              color: blue,
                              height: 0.4,
                            ),
                          ),
                          Text(
                            jumlahbarang.toString(),
                            style: robototext.copyWith(
                              fontSize: 8,
                              fontWeight: bold,
                              color: grey
                            ),
                          ),
                        ],
                      ),
                      OutletMoneyTotal(
                        title: "IDR",
                        total: prices[0].money,
                      ),
                      OutletMoneyTotal(
                        title: "USD",
                        total: prices[1].money,
                      ),
                      OutletMoneyTotal(
                        title: "EUR",
                        total: prices[2].money,
                      ),
                      OutletMoneyTotal(
                        title: "SGD",
                        total: prices[3].money,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );
    }


    Widget control() {
      return open ? controlOpened() : controlClosed();
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10
      ),
      height: 158,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.3), blurRadius: 4, offset: Offset(0, 3))
        ],
        color: white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Stack(
        children: [
          Opacity(
            opacity: open ? 0.5 : 1,
            child: Container(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                bottom: 16,
                right: 50
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: robototext.copyWith(
                      fontSize: 12,
                      fontWeight: bold,
                      color: primaryColor
                    ),
                  ),
                  Column(
                    children: prices.map((e) => OutletMoney(type: e.key, money: e.money)).toList(),
                  )
                ],
              ),
            ),
          ),
          control()
        ],
      ),
    );
  }
}