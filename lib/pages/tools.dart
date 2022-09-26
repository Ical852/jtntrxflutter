import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class ToolsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: primaryColor,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "Tools Page",
              style: robototext.copyWith(
                  fontSize: 32, fontWeight: bold, color: white),
            ),
          ),
        ),
      ),
    );
  }
}