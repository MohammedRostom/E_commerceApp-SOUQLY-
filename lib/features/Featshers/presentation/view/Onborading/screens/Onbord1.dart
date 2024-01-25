import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../data/models/onboardingmodel.dart';

class Onbord1 extends StatelessWidget {
  const Onbord1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              child: Image(
                  fit: BoxFit.fill, image: AssetImage("${Items[0].image}"))),
        ],
      ),
    );
  }
}
