//@dart=2.9
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jtntrx/cubit/user_cubit.dart';
import 'package:jtntrx/models/outletdatamodel.dart';
import 'package:jtntrx/models/outletmodels/outletsubsmode.dart';
import 'package:jtntrx/services/allservice.dart';
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

class KeluarPage extends StatefulWidget {
  OutletDataModel outletDataModel;
  KeluarPage(this.outletDataModel);

  @override
  State<KeluarPage> createState() => _KeluarPageState();
}

class _KeluarPageState extends State<KeluarPage> {
  var currentOutletName = "Nama Outlet";
  var currentOutletId = "";
  var dropdownOpened = false;

  var currentDate = DateTime.now();
  TextEditingController dateController = TextEditingController(text: "");

  var moneyType = "IDR";
  var curtipe = 1;
  var moneyTypeOpen = false;
  List<String> moneynames = ["IDR", "USD","EUR","SGD"];
  TextEditingController currencyController = TextEditingController(text: "");

  TextEditingController judulController = TextEditingController(text: "");

  TextEditingController ketaranganController = TextEditingController(text: "");

  var loading = false;

  File _image = null;
  File _image2 = null;
  File _image3 = null;
  File _image4 = null;

  Future _pickImage(ImageSource source, int type) async {
    try {
      PickedFile image = await ImagePicker().getImage(
        source: source,
      );
      if (image == null) {
        showAlert("danger", "Silakan Pilih Gambar");
        return;
      }
      File img = File(image.path);
      this.setState(() {
        type == 1 ? _image = img : type == 2 ?_image2 = img : type == 3 ? _image3 = img : _image4 = img;
      }); 
      showAlert("success", img.toString());
    } on PlatformException catch (e) {
      showAlert("success", e);
    }
  }

  void showAlert(type, text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text(
        text,
        style: robototext.copyWith(
          fontSize: 14,
          color: white,
          fontWeight: bold
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: type == 'danger' ?Color(0xffBD2727) : Color(0xff27BD48),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
    ));
  }

  void addData(data) async {
    this.setState(() {
      loading = true;
    });
    var state = BlocProvider.of<UserCubit>(context).state;
    if (state is UserSuccess) {
      bool add = await AllService().addTrx(data, state.user.user_id);
      this.setState(() {
        loading = false;
      });
      showAlert("success", "Tambah Transaksi Keluar Berhasil");
      Timer(Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    }
  }

  void submit() {
    if (currentOutletId == "") {
      showAlert("danger", "Pilih Nama Outlet Terlebih Dahulu");
    } else if (dateController.text.toString() == "") {
      showAlert("danger", "Isi Start date terlebih dahulu");
    } else if (judulController.text.toString() == "") {
      showAlert("danger", "Isi Judul terlebih dahulu");
    } else if (currencyController.text.toString() == "") {
      showAlert("danger", "Isi Nominal terlebih dahulu");
    } else if (ketaranganController.text.toString() == "") {
      showAlert("danger", "Isi Keterangan terlebih dahulu");
    } else {
      var data = {
        "act": "trxAdd",
        "outlet_id": 1,
        "user_id": 1,
        "data": {
          "ptipe": 2,
          "curr_id": curtipe.toString(),
          "nominal": currencyController.text.toString(),
          "ket": "judul = " + judulController.text.toString() + ", " + "ket = " + ketaranganController.text.toString(),
          "photo": _image != null ? base64Encode(_image.readAsBytesSync()) : "",
          "photo2": _image2 != null ? base64Encode(_image2.readAsBytesSync()) : "",
          "photo3": _image3 != null ? base64Encode(_image3.readAsBytesSync()) : "",
          "photo4": _image4 != null ? base64Encode(_image4.readAsBytesSync()) : "",
          "outlet_id1": currentOutletId,
          "outlet_id2": 0,
          "tgl": dateController.text.toString()
        }
      };
      addData(data);
    }
  }

  @override
  Widget build(BuildContext context) {
  List<OutletSubsModel> outletnames = this.widget.outletDataModel.outlet_subs;

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
                DateTime newDate = await showDatePicker(
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
            InputNormal(
              controller: judulController, 
              title: "Judul", 
              hint: "masukkan judul..."
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
              onFrst: () {
                _pickImage(ImageSource.gallery, 1);
              },
              onSec: () {
                _pickImage(ImageSource.gallery, 2);
              },
              onTh: () {
                _pickImage(ImageSource.gallery, 3);
              },
              onLast: () {
                _pickImage(ImageSource.gallery, 4);
              },
              img1: _image,
              img2: _image2,
              img3: _image3,
              img4: _image4,
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

    Widget moneyDropdown() {
      return InputMoneyDropdown(
        child: Column(
          children: moneynames.map((e) => MoneyDropdownItem(
            type: e,
            onPress: () {
              this.setState(() {
                moneyTypeOpen = !moneyTypeOpen;
                moneyType = e;
                if (e == 'IDR') {
                  curtipe = 1;
                } else if (e == "USD") {
                  curtipe = 2;
                } else if (e == "SGD") {
                  curtipe = 3;
                } else {
                  curtipe = 4;
                }
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
                title: "Keluar",
                onBackPress: (){
                  Navigator.pop(context);
                },
              ),
              contentBg(),
              content(),
              Align(
                alignment: Alignment.bottomCenter,
                child: loading ? 
                  Container(margin: EdgeInsets.only(bottom: 73),child: CircularProgressIndicator()) 
                  : Container(
                  margin: EdgeInsets.only(
                    bottom: 73
                  ),
                  child: BtnSubmit(
                    onPress: (){
                      submit();
                    },
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
              moneyTypeOpen ? Container(
                margin: EdgeInsets.only(top: 277, left: 10, right: 10),
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
                      top: 325,
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