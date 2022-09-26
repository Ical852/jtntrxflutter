import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class InputMoneyDropdown extends StatelessWidget {
  Widget child;
  
  InputMoneyDropdown({required this.child});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Container(
          padding: EdgeInsets.only(
            top: 13, left: 18, right: 18
          ),
          width: 84,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.3),
                blurRadius: 3,
                offset: Offset(0, 3))
            ]
          ),
          child: child
        )
      );
  }
}