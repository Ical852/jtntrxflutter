import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jtntrx/pages/home.dart';
import 'package:jtntrx/pages/report.dart';
import 'package:jtntrx/pages/tools.dart';
import 'package:jtntrx/pages/transaction.dart';
import 'package:jtntrx/shared/theme.dart';
import 'package:jtntrx/widgets/navitem.dart';

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var loading = false;
  var currentPage = 'HOME';

  void setloading(){
    this.setState(() {
      loading = true;
    });
    Timer(Duration(seconds: 2), () {
      this.setState(() {
        loading = false;
      });
    });
  }

  Widget header() {
    return Container(
      color: white,
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 40
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(width: 17,),
          Text(
            "APP KEUANGAN",
            style: robototext.copyWith(
              fontSize: 14,
              fontWeight: bold,
              color: primaryColor
            ),
          ),
          Container(
            height: 20,
            width: 17,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icnotif.png")
              )
            ),
          )
        ],
      )
    );
  }

  Widget topNavigator() {
    return Container(
      color: white,
      padding: EdgeInsets.only(
        top:30
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                title: "HOME",
                active: currentPage == "HOME",
                onPress: (){
                  this.setState(() {
                    currentPage = "HOME";
                  });
                },
              ),
              NavItem(
                title: "TRANSAKSI",
                active: currentPage == "TRANSAKSI",
                onPress: (){
                  this.setState(() {
                    currentPage = "TRANSAKSI";
                  });
                },
              ),
              NavItem(
                title: "LAPORAN",
                active: currentPage == "LAPORAN",
                onPress: (){
                  this.setState(() {
                    currentPage = "LAPORAN";
                  });
                },
              ),
              NavItem(
                title: "TOOLS",
                active: currentPage == "TOOLS",
                onPress: (){
                  this.setState(() {
                    currentPage = "TOOLS";
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget headContent() {
    return Column(
      children: [
        header(),
        topNavigator()
      ],
    );
  }

  Widget refreshBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(
            bottom: 6
          ),
          margin: EdgeInsets.only(
            top: 148
          ),
          width: 101,
          height: 38,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/refreshbg.png")
            ),
          ),
          child: Center(
            child: loading ?
            Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator()
            )
            : GestureDetector(
              onTap: (){
                setloading();
              },
              child: Container(
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icreload.png")
                  )
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget renderPage() {
    return currentPage == 'HOME' ? HomePage() 
    : currentPage == "TRANSAKSI" ? TransactionPage() 
    : currentPage == "LAPORAN" ? ReportPage() 
    : ToolsPage();
  }

  Widget content() {
    return Container(
      padding: EdgeInsets.only(
        top: 150
      ),
      child: renderPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: [
            headContent(),
            content(),
            refreshBtn()
          ],
        ),
      ),
    );
  }
}