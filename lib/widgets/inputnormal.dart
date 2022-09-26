import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class InputNormal extends StatelessWidget {
  String title, hint;
  TextEditingController controller;

  InputNormal({required this.controller, required this.title, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style:
              robototext.copyWith(fontSize: 8, fontWeight: bold, color: white),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          height: 30,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: black.withOpacity(0.3),
                    blurRadius: 4,
                    offset: Offset(0, 3))
              ]),
          child: Row(
            children: [
              Flexible(
                child: TextFormField(
                    controller: controller,
                    textAlign: TextAlign.center,
                    style: robototext.copyWith(
                        fontSize: 12, color: primaryColor, fontWeight: bold),
                    decoration: InputDecoration.collapsed(
                      hintText: hint,
                      hintStyle: robototext.copyWith(
                          fontSize: 12, color: primaryColor, fontWeight: light),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}