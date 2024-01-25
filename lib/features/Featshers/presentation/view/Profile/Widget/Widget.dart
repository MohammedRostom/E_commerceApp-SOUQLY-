import 'package:flutter/material.dart';

import '../../../../../../Core/utils/colors.dart';

Row ItemBody({required mainAxisAlignment, required text, required icon}) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: [
      Icon(
        icon,
        size: 30,
        color: Colors_App.blueColorto.withOpacity(0.6),
      ),
      Text(
        "${text}",
        style: TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.6)),
      ),
      SizedBox(
        width: 20,
      )
    ],
  );
}

Container SingleItemSetting({required double width, required Widget child}) {
  return Container(
      alignment: Alignment.center,
      child: child,
      width: width,
      height: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [Color(0xff1f1f1f), Color(0xff1b1b1b), Color(0xff0d0d0d)],
          )));
}
