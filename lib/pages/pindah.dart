import 'package:flutter/material.dart';
import 'package:jtntrx/models/outletdatamodel.dart';
import 'package:jtntrx/models/outletmodels/outletsubsmode.dart';
import 'package:jtntrx/shared/theme.dart';
import 'package:jtntrx/widgets/btnsubmit.dart';
import 'package:jtntrx/widgets/header.dart';
import 'package:jtntrx/widgets/inputcurrency.dart';
import 'package:jtntrx/widgets/inputcustomed.dart';
import 'package:jtntrx/widgets/inputmoneydropdown.dart';
import 'package:jtntrx/widgets/inputnormal.dart';
import 'package:jtntrx/widgets/inputphoto.dart';
import 'package:jtntrx/widgets/moneydropdownitem.dart';
import 'package:jtntrx/widgets/outletbtn.dart';
import 'package:jtntrx/widgets/outletitemname.dart';
import 'package:jtntrx/widgets/outletnamedropdown.dart';

class PindahPage extends StatefulWidget {
  OutletDataModel outletDataModel;
  PindahPage(this.outletDataModel);

  @override
  State<PindahPage> createState() => _PindahPageState();
}

class _PindahPageState extends State<PindahPage> {
  var currentOutletName = "Nama Outlet";
  var currentOutletId = "";
  var dropdownOpened = false;

  var currentOutletName2 = "Nama Outlet";
  var currentOutletId2 = "";
  var dropdownOpened2 = false;

  var currentDate = DateTime.now();
  TextEditingController dateController = TextEditingController(text: "");

  var moneyType = "IDR";
  var moneyTypeOpen = false;
  List<String> moneynames = ["IDR", "USD","EUR","SGD"];
  TextEditingController currencyController = TextEditingController(text: "");

  TextEditingController ketaranganController = TextEditingController(text: "");
  
  @override
  Widget build(BuildContext context) {
    List<OutletSubsModel> outletnames = this.widget.outletDataModel.outlet_subs;
    List<OutletSubsModel> outletnames2 = this.widget.outletDataModel.outlet_subs;

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
            InputDateCustomed(
              title: "Start Date",
              hint: "masukkan start date...",
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                  context: context, 
                  initialDate: currentDate, 
                  firstDate: DateTime(1900), 
                  lastDate: DateTime(2100)
                );
                if (newDate == null) {
                  return;
                } else {
                  this.setState(() {
                    currentDate = newDate;
                  });
                  dateController.text = newDate.toString();
                }
              },
              controller: dateController,
            ),
            SizedBox(height: 13,),
            InputCurrencyCustomed(
              onTap: (){
                this.setState(() {
                  moneyTypeOpen = !moneyTypeOpen;
                });
              }, 
              controller: currencyController, 
              title: "Input", 
              hint: 0.toString(),
              moneyType: moneyType,
            ),
            SizedBox(height: 13,),
            InputPhotoCustomed(
              title: "Photo",
            ),
            SizedBox(height: 13,),
            InputNormal(
              controller: ketaranganController, 
              title: "Keterangan", 
              hint: "masukkan keterangan..."
            )
          ],
        ),
      );
    }

    Widget dropdown() {
      return OutletNameDropwdown(
        child: Column(
          children: outletnames.map((item) => OutletItemName(
            title: item.outletName,
            onPress: () {
              this.setState(() {
                dropdownOpened = !dropdownOpened;
                currentOutletName = item.outletName;
                currentOutletId = item.id;
              });
            },
          ),
        ).toList()
        ),
      );
    }

    Widget dropdown2() {
      return OutletNameDropwdown(
        child: Column(
          children: outletnames.map((item) => OutletItemName(
            title: item.outletName,
            onPress: () {
              this.setState(() {
                dropdownOpened2 = !dropdownOpened2;
                currentOutletName2 = item.outletName;
                currentOutletId2 = item.id;
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

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Header(
                title: "Pindah",
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
              dropdownOpened2 ? GestureDetector(
                onTap: (){
                  this.setState(() {
                    dropdownOpened2 = !dropdownOpened2;
                  });
                },
                child: Container(
                  color: black.withOpacity(0.5),
                ),
              ) : SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 73, left: 41), 
                    child: Column(
                      children: [
                        Text(
                          "Dari",
                          style: robototext.copyWith(
                              fontSize: 8,
                              fontWeight: bold,
                              color: primaryColor),
                        ),
                        SizedBox(height: 3,),
                        OutletBtn(
                          title: currentOutletName,
                          opened: dropdownOpened,
                          onPress: (){
                            this.setState(() {
                              dropdownOpened = !dropdownOpened;
                            });
                          },
                        ),
                      ],
                    )
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 73, right: 41), 
                    child: Column(
                      children: [
                        Text(
                          "Ke",
                          style: robototext.copyWith(
                              fontSize: 8,
                              fontWeight: bold,
                              color: primaryColor),
                        ),
                        SizedBox(height: 3,),
                        OutletBtn(
                          title: currentOutletName2,
                          opened: dropdownOpened2,
                          onPress: (){
                            this.setState(() {
                              dropdownOpened2 = !dropdownOpened2;
                            });
                          },
                        ),
                      ],
                    )
                  ),
                ],
              ),
              dropdownOpened ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 125,
                      left: 41
                    ),
                    child: dropdown()
                  ),
                ], 
              ) : Container(),
              dropdownOpened2 ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 125,
                      right: 41
                    ),
                    child: dropdown2()
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
              moneyTypeOpen ? Container(
                margin: EdgeInsets.only(top: 220, left: 10, right: 10),
                child: InputCurrencyCustomed(
                  onTap: () {
                    this.setState(() {
                      moneyTypeOpen = !moneyTypeOpen;
                    });
                  },
                  controller: currencyController,
                  title: "Input",
                  hint: 0.toString(),
                  moneyType: moneyType,
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
            ],
          ),
        ),
      ),
    );
  }
}