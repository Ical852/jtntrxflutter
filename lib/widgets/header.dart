import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class Header extends StatelessWidget {
  String title;
  Function() onBackPress;

  Header({required this.title, required this.onBackPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
        left: 24,
        right: 24
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBackPress,
            child: Container(
              width: 10,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icback.png")
                )
              ),
            ),
          ),
          Text(
            title,
            style: robototext.copyWith(
              fontSize: 14,
              fontWeight: bold,
              color: primaryColor
            ),
          ),
          Container(
            width: 10,
            height: 16,
          ),
        ],
      ),
    );
  }
}