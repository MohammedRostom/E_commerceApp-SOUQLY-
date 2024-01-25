import 'package:flutter/material.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/colors.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/Cubits/Main_cubit/maincubit_cubit.dart';

import '../methods/Methods.dart';

class constant {
  static final commenPath = "lib/assets";
  static final usercollectionName = "users";
  static final CartTable = "cartTable";
  static final FavoriteTable = "favoriteTable";
//images
  static final ImagePath = "$commenPath/flutter_logo_470e9f7491.png";
  static final herosectionAuthLogin = "$commenPath/herosectionAuthLogin.png";
  static final herosectionAuthSighn = "$commenPath/signubscreenimage.png";
  static final ImageLogoSplashblue = "$commenPath/ImageLogoSplashblue.png";
  static final ImageLogoSplashWhite = "$commenPath/ImageLogoSplashWhite.png";
  static final ImagePathblueSouqly = "$commenPath/logoSouqly.png";
  static final PaymentImg = "$commenPath/PaymentImg.png";
  static final ImagePathlogoSouqlyWhite = "$commenPath/logoSouqlyWhite.png";
  static final logoHomePagex = "$commenPath/logo.png";
  static final lBackground = "$commenPath/background.png";
  static final iconapp = "$commenPath/iconapp.png";
  static final CartIcon = "$commenPath/Icons/cart.png";

// onbording images
  static final Onprding1 = "$commenPath/On_boarding_Assets/1.png";
  static final Onprding2 = "$commenPath/On_boarding_Assets/2.png";
  static final Onprding3 = "$commenPath/On_boarding_Assets/3.png";
  static final Login_OR_Sign = "$commenPath/On_boarding_Assets/LORS.png";

// listofPhotos HeroSection
  static List<String> photoGroup = [
    '$commenPath/sliderImages/1.png',
    '$commenPath/sliderImages/2.png',
    '$commenPath/sliderImages/3.png',
    '$commenPath/sliderImages/4.png',
    '$commenPath/sliderImages/5.png',
    '$commenPath/sliderImages/5.png',
  ];

  static List<Map<String, dynamic>> SelectColorOfproduct = [
    {"Color": Colors.red, "NameColor": "red"},
    {"Color": Colors.green, "NameColor": "green"},
    {"Color": Colors.blue, "NameColor": "blue"},
  ];
  static final apiKey =
      "";
  static final cardPaymentMethodIntegrationId = 0;
}
