import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'SmallWidgets/widgets.dart';

Widget CustombtnForApp(
    {required void Function()? onTap,
    required textInbtn,
    required double width,
    @required height}) {
  return InkWell(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          child: CustomText(
            text: "$textInbtn",
            Size: 20,
            Color: Colors.white,
          ),
          width: width,
          height: height == null ? 58 : height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xff054759), Color(0xff1b81b4)],
              ))));
}
