import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';
import 'package:jtntrx/widgets/inputphotoitem.dart';

class InputPhotoCustomed extends StatelessWidget {
  String title;
  Function() onFrst, onSec, onTh, onLast;
  File img1, img2, img3, img4;

  InputPhotoCustomed({
    required this.title,
    required this.onFrst,
    required this.onSec,
    required this.onTh,
    required this.onLast,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.img4,
  });

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
              InputPhotoItem(
                on: img1 == null || img1 != null,
                img: img1,
                onPress: onFrst,
              ),
              InputPhotoItem(
                on: img1 != null && img2 == null || img1 != null && img2 != null,
                img: img2,
                onPress: onSec,
              ),
              InputPhotoItem(
                on: img1 != null && img2 != null && img3 == null || img1 != null && img2 != null && img3 != null,
                img: img3,
                onPress: onTh,
              ),
              InputPhotoItem(
                on: img1 != null && img2 != null && img3 != null && img4 == null || img1 != null && img2 != null && img3 != null && img4 != null,
                img: img4,
                onPress: onLast,
              ),
            ],
          ),
        ),
      ],
    );
  }
}