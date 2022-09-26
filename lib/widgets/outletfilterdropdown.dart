import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class OutletFilterDropDown extends StatelessWidget {
  Widget child;
  
  OutletFilterDropDown({required this.child});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Container(
          height: 221,
          width: MediaQuery.of(context).size.width - 20,
          padding: EdgeInsets.only(
            top: 13, left: 41, right: 41, bottom: 28
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
          child: child
        )
      );
  }
}