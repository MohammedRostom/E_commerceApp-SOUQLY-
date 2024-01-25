import 'package:flutter/material.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/view/layout/UserLayout.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/view/Cart/AddtocartScreen.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/view/Home/homepage.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/view/Search/searshscreen.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/view/SignUp/SighnUpscrean.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/view/Favorite/favroite.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/view/Login/Login_view.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/view/Products/productsscreens.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/view/Profile/profiel.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/widgets/LoaingAndShimmerEffect.dart';

import '../../features/Featshers/presentation/view/Payment/Payment.dart';
import '../../features/Featshers/presentation/view/product_detalis/product_detalis.dart';

class routing {
  static Function(context, routeOfPage,
      {@required usermodel, @required int? duration}) {
    Future.delayed(Duration(seconds: duration == null ? 0 : duration), () {
      Navigator.pushNamed(context, routeOfPage, arguments: usermodel);
    });
  }

  static final homescreen = "homepage";
  static final Loginscreen = "Login";
  static final Signupscreen = "Signup";
  static final Profilescreen = "profile";
  static final Searchscreen = "Search";
  static final Userlayout = "UserLayout";
  static final ShimmerEffectscreen = "Shimmer";
  static final ProductScreeen = "Product";
  static final Paymentscreen = "Payment";
  static final Favroitescreen = "Favroite";
  static final AddtoCartScreen = "Cart";
  static final ProductDetalisScreen = "singleProduct";

  static Map<String, Widget Function(BuildContext)> MapOfAppRoutes = {
    homescreen: (context) => homepage(),
    Loginscreen: (context) => LoginScreen(),
    Signupscreen: (context) => SighnUpscrean(),
    Profilescreen: (context) => profiel(),
    Searchscreen: (context) => SearchScreen(),
    Userlayout: (context) => UserLayout(),
    ShimmerEffectscreen: (context) => Shimmerscreen(),
    ProductScreeen: (context) => Productscreeens(),
    Paymentscreen: (context) => payment(),
    Favroitescreen: (context) => Favroite(),
    AddtoCartScreen: (context) => Cart(),
    ProductDetalisScreen: (context) => product_detalis(),
  };
}
