import 'package:flutter/material.dart';
import 'package:jtntrx/models/outletmoneymodel.dart';
import 'package:jtntrx/shared/theme.dart';
import 'package:jtntrx/widgets/outletitem.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<OutletMoneyModel> moneys  = [];
  var open = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i = 0; i < 4; i++) {
      moneys.add(OutletMoneyModel.make(
        i == 0 ? "IDR" : i == 1 ? "USD" : i == 2 ? "EUR" : "SGD", 
        i == 0 ? 50000 : i == 1 ? 0 : i == 2 ? 20000 : 6000
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
            OutletItem(
              title: "Nama Outlet",
              prices: moneys,
              open: open,
              onPress: (){
                this.setState(() {
                  open = !open;
                });
              },
              jumlahbarang: 16,
            )
          ],
        ),
      ),
    );
  }
}