import 'package:flutter/material.dart';

import '../../../../data/models/onboardingmodel.dart';

class Onbord2 extends StatelessWidget {
  const Onbord2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          child:
              Image(fit: BoxFit.fill, image: AssetImage("${Items[1].image}"))),
    );
  }
}
