import 'package:flutter/material.dart';
import 'package:jtntrx/models/outletdatamodel.dart';
import 'package:jtntrx/models/outletmodels/outletsubsmode.dart';
import 'package:jtntrx/models/outletmodels/trxtipemode.dart';
import 'package:jtntrx/shared/theme.dart';
import 'package:jtntrx/widgets/btnsubmit.dart';
import 'package:jtntrx/widgets/header.dart';
import 'package:jtntrx/widgets/inputcurrency.dart';
import 'package:jtntrx/widgets/inputmoneydropdown.dart';
import 'package:jtntrx/widgets/miniinputdate.dart';
import 'package:jtntrx/widgets/moneydropdownitem.dart';
import 'package:jtntrx/widgets/outletbtn.dart';
import 'package:jtntrx/widgets/outletbtnjenislaporan.dart';
import 'package:jtntrx/widgets/outletfilterdropdown.dart';
import 'package:jtntrx/widgets/outletitemname.dart';
import 'package:jtntrx/widgets/outletnamedropdown.dart';

class MutasiPage extends StatefulWidget {
  OutletDataModel outletDataModel;
  MutasiPage(this.outletDataModel);

  @override
  State<MutasiPage> createState() => _MutasiPageState();
}

class _MutasiPageState extends State<MutasiPage> {
  var currentOutletName = "Nama Outlet";
  var currentOutletId = "";
  var dropdownOpened = false;

  var dropdownJL = false;
  var date1 = DateTime.now();

  var currentJenisLaporan = "Jenis Laporan";
  var currentJenisLaporanId = "";
  var openJenisLaporan = false;

  var moneyType = "IDR";
  var moneyTypeOpen = false;
  List<String> moneynames = ["IDR", "USD","EUR","SGD"];
  TextEditingController currencyController = TextEditingController(text: "");

  var moneyType2 = "IDR";
  var moneyTypeOpen2 = false;
  List<String> moneynames2 = ["IDR", "USD", "EUR", "SGD"];
  TextEditingController currencyController2 = TextEditingController(text: "");

  var currentDate1 = DateTime.now();
  TextEditingController dateController1 = TextEditingController(text: "");

  var currentDate2 = DateTime.now();
  TextEditingController dateController2 = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    List<OutletSubsModel> outletnames = this.widget.outletDataModel.outlet_subs;
    List<TrxTipeModel> Jlames = this.widget.outletDataModel.trx_tipe;

    Widget contentBg() {
      return Container(
        margin: EdgeInsets.only(
          top: 194
        ),
        height: double.infinity,
        color: primaryColor,
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
          top: 209,
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

    Widget jlitemDropDown() {
      return OutletNameDropwdown(
        child: Column(
          children: Jlames.map((item) => OutletItemName(
            title: item.nama,
            onPress: () {
              this.setState(() {
                openJenisLaporan = !openJenisLaporan;
                currentJenisLaporan = item.nama;
                currentJenisLaporanId = item.id;
              });
            },
          ),
        ).toList()
        ),
      );
    }

    Widget dropdownjl() {
      return OutletFilterDropDown(
        child: Column(
          children: [
            Text(
              "Filter",
              style: robototext.copyWith(
                fontSize: 12,
                fontWeight: bold,
                color: primaryColor
              ),
            ),
            SizedBox(height: 18,),
            FittedBox(
              child: OutletBtn(
                title: currentJenisLaporan, 
                onPress: (){
                  this.setState(() {
                    openJenisLaporan = !openJenisLaporan;
                  });
                },
                secondary: true,
                opened: openJenisLaporan,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15
              ),
              child: Row(
                children: [
                  Flexible(
                    child: MiniInputDate(
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: currentDate1,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        if (newDate == null) {
                          return;
                        } else {
                          this.setState(() {
                            currentDate1 = newDate;
                          });
                          dateController1.text = newDate.day.toString()+"/"+newDate.month.toString()+"/"+newDate.year.toString();
                        }
                      },
                      controller: dateController1, 
                      title: "Start Date", 
                      hint: currentDate1.day.toString()+"/"+currentDate1.month.toString()+"/"+currentDate1.year.toString()
                    ),
                  ),
                  Container(
                    width: 42,
                  ),
                  Flexible(
                    child: MiniInputDate(
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: currentDate2,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        if (newDate == null) {
                          return;
                        } else {
                          this.setState(() {
                            currentDate2 = newDate;
                          });
                          dateController2.text = newDate.day.toString()+"/"+newDate.month.toString()+"/"+newDate.year.toString();
                        }
                      },
                      controller: dateController2, 
                      title: "To Date", 
                      hint: currentDate2.day.toString()+"/"+currentDate2.month.toString()+"/"+currentDate2.year.toString()
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 27,),
            BtnSubmit(
              onPress: (){},
              secondary: true,
            )
          ]
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
                title: "Mutasi",
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
              dropdownJL ? GestureDetector(
                onTap: (){
                  this.setState(() {
                    dropdownJL = !dropdownJL;
                    openJenisLaporan = false;
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
                    margin: EdgeInsets.only(top: 133), 
                    child: Opacity(
                      opacity: dropdownOpened ? 0.5 : 1,
                      child: OutletBtnJenisLaporan(
                        title: currentJenisLaporan,
                        date1: currentDate1.day.toString()+"/"+currentDate1.month.toString()+"/"+currentDate1.year.toString(),
                        date2: currentDate2.day.toString()+"/"+currentDate2.month.toString()+"/"+currentDate2.year.toString(),
                        opened: dropdownJL,
                        onPress: (){
                          if (dropdownOpened) {
                            this.setState(() {
                              dropdownOpened = false;
                            });
                          } else {
                            this.setState(() {
                              dropdownJL = !dropdownJL;
                            });
                          }
                          openJenisLaporan = false;
                        },
                      ),
                    )
                  ),
                ],
              ),
              dropdownJL ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 173
                    ),
                    child: dropdownjl(),
                  ),
                ], 
              ) : Container(),
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
                margin: EdgeInsets.only(top: 266, left: 10, right: 10),
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
                margin: EdgeInsets.only(top: 209, left: 10, right: 10),
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
                      top: 314,
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
                      top: 257,
                      right: 11
                    ),
                    child: moneyDropdown2(),
                  ),
                ],
              ) : Container(),
              openJenisLaporan ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 260
                    ),
                    child: jlitemDropDown()
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