import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'LoaingAndShimmerEffect.dart';

Widget OverLay() {
  return Expanded(
    child: Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.6),
        ),
        LoadingShimerOverlyleItem(),
      ],
    ),
  );
}
