import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/Constant.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/colors.dart';
import '../../features/Featshers/presentation/view/Login/Login_view.dart';

StartManger(BuildContext context, email) {
  return Stack(
    children: [
      AnimatedSplashScreen(
          curve: Curves.slowMiddle,
          splashTransition: SplashTransition.fadeTransition,
          duration: 3000,
          backgroundColor: Colors_App.ColorForbackscreen,
          splash: Container(
            child: Image(fit: BoxFit.fill, image: AssetImage(constant.iconapp)),
          ),
          // nextScreen: email == null ? Onbording_layout() : UserLayout(),
          // nextScreen: SighnUpscrean()
          nextScreen: LoginScreen()),
    ],
  );
}
