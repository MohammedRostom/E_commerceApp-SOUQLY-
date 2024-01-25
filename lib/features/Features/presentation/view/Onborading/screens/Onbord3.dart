import 'package:flutter/material.dart';

import '../../../../data/models/onboardingmodel.dart';

class Onbord3 extends StatelessWidget {
  const Onbord3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          child:
              Image(fit: BoxFit.fill, image: AssetImage("${Items[2].image}"))),
    );
  }
}
