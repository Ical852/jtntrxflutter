import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jtntrx/cubit/trx_cubit.dart';
import 'package:jtntrx/cubit/user_cubit.dart';
import 'package:jtntrx/models/trxdatamodel.dart';
import 'package:jtntrx/models/trxoutletmodel.dart';
import 'package:jtntrx/services/allservice.dart';
import 'package:jtntrx/shared/theme.dart';
import 'package:jtntrx/widgets/outletbtn.dart';
import 'package:jtntrx/widgets/outletitemname.dart';
import 'package:jtntrx/widgets/outletnamedropdown.dart';
import 'package:jtntrx/widgets/trxitem.dart';

class TransactionPage extends StatefulWidget {
  TrxDataModel outletTrx;
  TransactionPage(this.outletTrx);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {

  var filterOpened = false;
  var currentFilter = 'In/Out';
  var filterBy = ['In/Out', 'Nominal', 'Keterangan', 'Tanggal', 'CurTipe', 'Outlet'];

  TextEditingController searchController = TextEditingController(text: "");

  TrxDataModel filtered = new TrxDataModel();

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

  @override
  void initState() {
    super.initState();
    this.setState(() {
      filtered = this.widget.outletTrx;
    });
  }

  void refresh() async {
     var state = BlocProvider.of<UserCubit>(context).state;
      if (state is UserSuccess) {
        TrxDataModel newRefresh = await AllService().getTrx(state.user.user_id);
        this.setState(() {
          filtered = newRefresh;
        });
      }
  }

  void deleteTrx(id) async {
    var data = {
      "act": "trxDel",
      "outlet_id": 1,
      "user_id": 1,
      "data": {
        "trx_id": id
      }
    };
    var state = BlocProvider.of<UserCubit>(context).state;
    if (state is UserSuccess) {
      await AllService().delTrx(data, state.user.user_id);
    }
    showAlert("success", "Hapus data transaksi berhasil");
    refresh();
  }

  void filterData() {
    if (searchController.text.toString() == "") {
     refresh();
    } else {
      if (currentFilter == 'In/Out') {
        List<TrxOutletModel> newOutletfiltered = filtered.data.where((element) => element.trxPtipeNama.toLowerCase().contains(searchController.text.toLowerCase().toString())).toList();
        this.setState(() {
          filtered.data = newOutletfiltered;
        });
      } else if (currentFilter == 'Nominal') {
        List<TrxOutletModel> newOutletfiltered = filtered.data.where((element) => element.trxNominal.toLowerCase().contains(searchController.text.toLowerCase().toString())).toList();
        this.setState(() {
          filtered.data = newOutletfiltered;
        });
      } else if (currentFilter == 'Keterangan') {
        List<TrxOutletModel> newOutletfiltered = filtered.data.where((element) => element.trxKet.toLowerCase().contains(searchController.text.toLowerCase().toString())).toList();
        this.setState(() {
          filtered.data = newOutletfiltered;
        });
      } else if (currentFilter == 'Tanggal') {
        List<TrxOutletModel> newOutletfiltered = filtered.data.where((element) => element.trxTgl.toLowerCase().contains(searchController.text.toLowerCase().toString())).toList();
        this.setState(() {
          filtered.data = newOutletfiltered;
        });
      } else if (currentFilter == 'CurTipe') {
        List<TrxOutletModel> newOutletfiltered = filtered.data.where((element) => element.trxCurtipeVar.toLowerCase().contains(searchController.text.toLowerCase().toString())).toList();
        this.setState(() {
          filtered.data = newOutletfiltered;
        });
      } else if (currentFilter == 'Outlet') {
        List<TrxOutletModel> newOutletfiltered = filtered.data.where((element) => element.trxAsalOutletNama.toLowerCase().contains(searchController.text.toLowerCase().toString())).toList();
        this.setState(() {
          filtered.data = newOutletfiltered;
        });
      }
    }
  }

  Widget dropdown() {
    return OutletNameDropwdown(
      child: Column(
        children: filterBy.map((item) => OutletItemName(
          title: item,
          onPress: () {
            this.setState(() {
              filterOpened = !filterOpened;
              currentFilter = item;
            });
          },
        ),
      ).toList()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: primaryColor,
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 16,
                      left: 24
                    ),
                    height: 45,
                    child: OutletBtn(
                      title: currentFilter, 
                      onPress: (){
                        this.setState(() {
                          filterOpened = !filterOpened;
                        });
                      },
                      opened: filterOpened,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12
                      ),
                      margin: EdgeInsets.only(
                        top: 16,
                        left: 12,
                        right: 24
                      ),
                      height: 45,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: black.withOpacity(0.3),
                            blurRadius: 4,
                            offset: Offset(0, 3))
                        ]
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: Center(
                              child: TextFormField(
                                onChanged: (text) {
                                  if (text == "") {
                                    refresh();
                                  } else {
                                    filterData();
                                  }
                                },
                                controller: searchController,
                                style: robototext.copyWith(
                                  fontSize: 14,
                                  fontWeight: light,
                                  color: primaryColor
                                ),
                                decoration: InputDecoration.collapsed(
                                  hintText: "Search Transaction...",
                                  hintStyle: robototext.copyWith(
                                    fontSize: 14,
                                    fontWeight: light,
                                    color: primaryColor
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10
                            ),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                        image: AssetImage("assets/icsearch.png")
                                      )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              filtered.data != null? Container(
                margin: EdgeInsets.only(
                  top: 80
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: filtered.data.map((trx) => 
                      TrixItems(trxdata: trx,onPress: (){
                        showDialog(
                          context: context, 
                          builder: (context) => 
                          AlertDialog(
                            title: Text(
                              "Actions",
                              style: robototext.copyWith(
                                fontSize: 14,
                                fontWeight: semiBold,
                                color: primaryColor
                              ),
                            ),
                            content: Text(
                              "Delete Transactions ?",
                              style: robototext.copyWith(
                                fontSize: 14,
                                fontWeight: regular,
                                color: grey
                              ),
                            ),
                            actions: [
                              FlatButton(
                                onPressed: (){
                                  deleteTrx(trx.trxId);
                                  Navigator.pop(context, true);
                                }, 
                                child: Text(
                                  "Yes",
                                  style: robototext.copyWith(
                                    fontSize: 14,
                                    fontWeight: semiBold,
                                    color: primaryColor
                                  ),
                                ),
                              ),
                              FlatButton(
                                onPressed: (){
                                  Navigator.pop(context, true);
                                }, 
                                child: Text(
                                  "No",
                                  style: robototext.copyWith(
                                    fontSize: 14,
                                    fontWeight: semiBold,
                                    color: primaryColor
                                  ),
                                ),
                              )
                            ],
                          )
                        );
                      },)
                    ).toList(),
                  ),
                ),
              ): CircularProgressIndicator(),
              filterOpened ? GestureDetector(
                onTap: (){
                  this.setState(() {
                    filterOpened = !filterOpened;
                  });
                },
                child: Container(
                  color: black.withOpacity(0.5),
                  width: double.infinity,
                  height: double.infinity,
                ),
              ) : SizedBox(),
              filterOpened ? FittedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 16, left: 24),
                  height: 45,
                  child: OutletBtn(
                    title: currentFilter,
                    onPress: () {
                      this.setState(() {
                        filterOpened = !filterOpened;
                      });
                    },
                    opened: filterOpened,
                  ),
                ),
              ) : Container(),
              filterOpened ? Container(
                margin: EdgeInsets.only(
                  left: 24,
                  top: 68
                ),
                child: dropdown(),
              ) : Container()
          ]),
        ),
      ),
    );
  }
}