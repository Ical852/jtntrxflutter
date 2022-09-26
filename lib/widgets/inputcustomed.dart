import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class InputDateCustomed extends StatelessWidget {
  Function() onTap;
  TextEditingController controller;
  String title, hint;

  InputDateCustomed({required this.onTap, required this.controller, required this.title, required this.hint});

  @override
  Widget build(BuildContext context) {
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
          height: 30,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              controller: controller,
              onTap: onTap,
              textAlign: TextAlign.center,
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
        ),
      ],
    );
  }
}