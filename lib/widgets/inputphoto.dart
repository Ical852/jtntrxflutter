import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';
import 'package:jtntrx/widgets/inputphotoitem.dart';

class InputPhotoCustomed extends StatelessWidget {
  String title;

  InputPhotoCustomed({required this.title});

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
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 33
          ),
          height: 61,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.3), blurRadius: 4, offset: Offset(0, 3))
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputPhotoItem(on: true,),
              InputPhotoItem(),
              InputPhotoItem(),
              InputPhotoItem(),
            ],
          ),
        ),
      ],
    );
  }
}