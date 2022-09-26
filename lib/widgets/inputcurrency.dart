import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class InputCurrencyCustomed extends StatelessWidget {
  Function() onTap;
  TextEditingController controller;
  String title, hint, moneyType;

  InputCurrencyCustomed({required this.onTap, required this.controller, required this.title, required this.hint, required this.moneyType});

  @override
  Widget build(BuildContext context) {

    String renderIcon() {
      if (moneyType == 'IDR') {
        return "assets/icrp.png";
      } else if (moneyType == 'USD') {
        return "assets/icdollar.png";
      } else if (moneyType == "EUR") {
        return "assets/iceuro.png";
      } else if (moneyType == "SGD") {
        return "assets/icsdollar.png";
      } else {
        return "assets/icrp.png";
      }
    }

    return Column(
      children: [
        Text(
          title,
          style: robototext.copyWith(
            fontSize: 8,
            fontWeight: bold,
            color: white
          ),
        ),
        SizedBox(height:5 ,),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12
          ),
          height: 30,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [
              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller,
                  onTap: onTap,
                  textAlign: TextAlign.right,
                  style: robototext.copyWith(
                    fontSize: 12,
                    color: primaryColor,
                    fontWeight: bold
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: hint,
                    hintStyle: robototext.copyWith(
                      fontSize: 12,
                      color: primaryColor,
                      fontWeight: light
                    ),
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 9
                ),
                width: 1,
                height: 17,
                decoration: BoxDecoration(
                  color: primaryColor
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 9
                      ),
                      width: 20,
                      height: 12,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(renderIcon())
                        )
                      ),
                    ),
                    SizedBox(width: 6,),
                    Text(
                      moneyType,
                      style: robototext.copyWith(
                        fontSize: 12,
                        fontWeight: bold,
                        color: primaryColor
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 8
                      ),
                      width: 8,
                      height: 5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icdrop.png")
                        )
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}