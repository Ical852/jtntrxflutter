import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class OutletMoneyTotal extends StatelessWidget {
  String title;
  int total;

  OutletMoneyTotal({required this.title, required this.total});

  String renderMoney() {
    if (title == 'IDR') {
      return "Rp. ";
    } else if (title == 'USD') {
      return '\$ ';
    } else if (title == "EUR") {
      return "€ ";
    } else if (title == "SGD") {
      return "S\$ ";
    } else {
      return "Rp. ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 4
      ),
      child: Row(
        children: [
          Text(
            "Total " + title,
            style:
                robototext.copyWith(fontSize: 8, fontWeight: regular, color: primaryColor),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 4, left: 8, right: 8),
              color: blue,
              height: 0.4,
            ),
          ),
          Text(
            renderMoney() + formatter(total),
            style:
                robototext.copyWith(fontSize: 8, fontWeight: regular, color: primaryColor),
          ),
        ],
      ),
    );
  }
}
