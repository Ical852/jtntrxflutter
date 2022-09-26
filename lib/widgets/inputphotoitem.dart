import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class InputPhotoItem extends StatelessWidget {
  bool on;

  InputPhotoItem({this.on = false});

  Widget itemOff() {
    return Container(
      width: 63,
      height: 43,
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.25),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget itemOn() {
    return Container(
      width: 63,
      height: 43,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.3), blurRadius: 4, offset: Offset(0, 3))
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 19,
            height: 16,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icphoto.png")
              )
            ),
          ),
          SizedBox(height: 1.5,),
          Text(
            "Tambahkan\nFoto",
            textAlign: TextAlign.center,
            style: robototext.copyWith(
              fontSize: 8,
              fontWeight: bold,
              color: primaryColor
            ),
          )
        ],
      ),
    );
  }

  Widget renderItem() {
    return on ? itemOn() : itemOff();
  }

  @override
  Widget build(BuildContext context) {
    return renderItem();
  }
}