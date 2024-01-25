import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/colors.dart';

Widget CustomText(
    {@required text,
    @required double? Size,
    @required Color,
    @required isbold}) {
  return Text(
    overflow: TextOverflow.ellipsis,
    "$text",
    maxLines: 1,
    softWrap: true,
    style: isbold == true
        ? TextStyle(
            fontSize: Size,
            fontWeight: FontWeight.bold,
            color: Color == null ? Colors.white : Color,
          )
        : TextStyle(
            fontSize: Size,
            fontWeight: FontWeight.normal,
            color: Color == null ? Colors.white : Color,
          ),
  );
}

Widget swith_Auth(
    {required Massegetext, required btnText, required Function()? onTapBtn}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CustomText(text: Massegetext, Size: 16.0, isbold: false),
      InkWell(
          child: CustomText(
              text: btnText,
              Size: 11.0,
              isbold: true,
              Color: Colors_App.blueColorto),
          onTap: onTapBtn
          // () {
          //   Navigator.pushNamed(context, routing.Loginscreen);
          // },
          ),
    ],
  );
}

Widget IconBar({
  required Widget IconDatas,
}) {
  return Stack(
    children: [
      CircleAvatar(backgroundColor: Colors.transparent, child: IconDatas),
    ],
  );
}

class SizebetContaners extends StatelessWidget {
  const SizebetContaners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 21,
    );
  }
}

class SizeBetElementInContainer extends StatelessWidget {
  const SizeBetElementInContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
    );
  }
}

ContBox({
  @required height,
  @required width,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: Color(0xff2D2D2D), borderRadius: BorderRadius.circular(15)),
  );
}

MAssegeSnakbarr(context, String content, Color? backgroundColor) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(milliseconds: 800),
      backgroundColor:
          backgroundColor == null ? Colors_App.blueColorto : backgroundColor,
      content: CustomText(text: content, Size: 12, Color: Colors.white)));
}

CircleAvatar CustemCircleAvter({
  required color,
  required Child,
  required double Size,
}) {
  return CircleAvatar(radius: Size, backgroundColor: color, child: Child);
}
