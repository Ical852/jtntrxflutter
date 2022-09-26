import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class OutletMoney extends StatelessWidget {
  String type;
  int money;

  OutletMoney({required this.type, required this.money});

  String renderIcon() {
    if (type == 'IDR') {
      return "assets/icrp.png";
    } else if (type == 'USD') {
      return "assets/icdollar.png";
    } else if (type == "EUR") {
      return "assets/iceuro.png";
    } else if (type == "SGD") {
      return "assets/icsdollar.png";
    }  else {
      return "assets/icrp.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 14
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 12,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(renderIcon())
              )
            ),
          ),
          SizedBox(width: 8,),
          Text(
            type,
            style: robototext.copyWith(
              fontSize: 10,
              fontWeight: bold,
              color: grey
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: 4,
                left: 8,
                right: 8
              ),
              color: black,
              height: 0.2,
            ),
          ),
          Text(
            formatter(money),
            style: robototext.copyWith(
              fontSize: 10,
              fontWeight: bold,
              color: primaryColor
            ),
          )
        ],
      ),
    );
  }
}