import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';
import 'package:jtntrx/widgets/outletitemname.dart';

class OutletNameDropwdown extends StatelessWidget {
  Widget child;

  OutletNameDropwdown({required this.child});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10
          ),
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
          width: 108,
          child: child
        ),
      );
  }
}