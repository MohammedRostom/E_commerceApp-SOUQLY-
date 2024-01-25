import 'package:flutter/material.dart';
import '../utils/Constant.dart';

Widget background(context) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    child: ColorFiltered(
      colorFilter: ColorFilter.mode(
        Color.fromARGB(39, 255, 255, 255)
            .withOpacity(0.08), // Set the opacity value (0.0 to 1.0)
        BlendMode.srcIn,
      ),
      child:
          Image(fit: BoxFit.fitWidth, image: AssetImage(constant.lBackground)),
    ),
  );
}
