import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';
import 'package:jtntrx/widgets/btnsubmit.dart';
import 'package:jtntrx/widgets/header.dart';
import 'package:jtntrx/widgets/inputcurrency.dart';
import 'package:jtntrx/widgets/inputmoneydropdown.dart';
import 'package:jtntrx/widgets/moneydropdownitem.dart';
import 'package:jtntrx/widgets/outletbtn.dart';
import 'package:jtntrx/widgets/outletitemname.dart';
import 'package:jtntrx/widgets/outletnamedropdown.dart';

class KursPage extends StatefulWidget {

  @override
  State<KursPage> createState() => _KursPageState();
}

class _KursPageState extends State<KursPage> {
  var currentOutletName = "Nama Outlet";
  var dropdownOpened = false;
  List<String> outletnames = ["Nama Outlet", "Nama Outlet 1", "Nama Outlet 2","Nama Outlet 3","Nama Outlet 4"];

  var moneyType = "IDR";
  var moneyTypeOpen = false;
  List<String> moneynames = ["IDR", "USD","EUR","SGD"];
  TextEditingController currencyController = TextEditingController(text: "");

  var moneyType2 = "IDR";
  var moneyTypeOpen2 = false;
  List<String> moneynames2 = ["IDR", "USD", "EUR", "SGD"];
  TextEditingController currencyController2 = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Widget contentBg() {
      return Container(
        margin: EdgeInsets.only(
          top: 148
        ),
        height: double.infinity,
        color: primaryColor,
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
          top: 163,
          left: 10,
          right: 10
        ),
        child: Column(
          children: [
            InputCurrencyCustomed(
              onTap: () {
                this.setState(() {
                  moneyTypeOpen2 = !moneyTypeOpen2;
                });
              },
              controller: currencyController2,
              title: "Dari",
              hint: 0.toString(),
              moneyType: moneyType2,
            ),
            SizedBox(height: 13,),
            InputCurrencyCustomed(
              onTap: (){
                this.setState(() {
                  moneyTypeOpen = !moneyTypeOpen;
                });
              }, 
              controller: currencyController, 
              title: "Ke", 
              hint: 0.toString(),
              moneyType: moneyType,
            ),
          ],
        ),
      );
    }

    Widget dropdown() {
      return OutletNameDropwdown(
        child: Column(
          children: outletnames.map((item) => OutletItemName(
            title: item,
            onPress: () {
              this.setState(() {
                dropdownOpened = !dropdownOpened;
                currentOutletName = item;
              });
            },
          ),
        ).toList()
        ),
      );
    }

    Widget moneyDropdown() {
      return InputMoneyDropdown(
        child: Column(
          children: moneynames.map((e) => MoneyDropdownItem(
            type: e,
            onPress: () {
              this.setState(() {
                moneyTypeOpen = !moneyTypeOpen;
                moneyType = e;
              });
            },
          ))
          .toList(),
        ),
      );
    }

    Widget moneyDropdown2() {
      return InputMoneyDropdown(
        child: Column(
          children: moneynames.map((e) => MoneyDropdownItem(
            type: e,
            onPress: () {
              this.setState(() {
                moneyTypeOpen = !moneyTypeOpen;
                moneyType = e;
              });
            },
          ))
          .toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Header(
                title: "Pindah Kurs",
                onBackPress: (){
                  Navigator.pop(context);
                },
              ),
              contentBg(),
              content(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 73
                  ),
                  child: BtnSubmit(
                    onPress: (){},
                  )
                )
              ),
              dropdownOpened ? GestureDetector(
                onTap: (){
                  this.setState(() {
                    dropdownOpened = !dropdownOpened;
                  });
                },
                child: Container(
                  color: black.withOpacity(0.5),
                ),
              ) : SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 85), 
                    child: OutletBtn(
                      title: currentOutletName,
                      opened: dropdownOpened,
                      onPress: (){
                        this.setState(() {
                          dropdownOpened = !dropdownOpened;
                        });
                      },
                    )
                  ),
                ],
              ),
              dropdownOpened ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 125
                    ),
                    child: dropdown()
                  ),
                ], 
              ) : Container(),
              moneyTypeOpen ? GestureDetector(
                onTap: (){
                  this.setState(() {
                    moneyTypeOpen = !moneyTypeOpen;
                  });
                },
                child: Container(
                  color: black.withOpacity(0.5),
                ),
              ) : SizedBox(),
              moneyTypeOpen2 ? GestureDetector(
                onTap: (){
                  this.setState(() {
                    moneyTypeOpen2 = !moneyTypeOpen2;
                  });
                },
                child: Container(
                  color: black.withOpacity(0.5),
                ),
              ) : SizedBox(),
              moneyTypeOpen ? Container(
                margin: EdgeInsets.only(top: 220, left: 10, right: 10),
                child: InputCurrencyCustomed(
                  onTap: () {
                    this.setState(() {
                      moneyTypeOpen = !moneyTypeOpen;
                    });
                  },
                  controller: currencyController,
                  title: "Ke",
                  hint: 0.toString(),
                  moneyType: moneyType,
                ),
              ) : Container(),
              moneyTypeOpen2 ? Container(
                margin: EdgeInsets.only(top: 163, left: 10, right: 10),
                child: InputCurrencyCustomed(
                  onTap: () {
                    this.setState(() {
                      moneyTypeOpen2 = !moneyTypeOpen2;
                    });
                  },
                  controller: currencyController2,
                  title: "Dari",
                  hint: 0.toString(),
                  moneyType: moneyType2,
                ),
              ) : Container(),
              moneyTypeOpen ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 268,
                      right: 11
                    ),
                    child: moneyDropdown(),
                  ),
                ],
              ) : Container(),
              moneyTypeOpen2 ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 211,
                      right: 11
                    ),
                    child: moneyDropdown2(),
                  ),
                ],
              ) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}