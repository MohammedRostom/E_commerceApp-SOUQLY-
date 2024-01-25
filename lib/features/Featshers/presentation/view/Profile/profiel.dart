import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/cache/cachprefranses.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/config/routing/routing_functions.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/widgets/SmallWidgets/widgets.dart';

import '../../../../../Core/utils/colors.dart';
import '../../Cubits/Add_photo_profile_cubit/add_photo_profile_cubit_cubit.dart';
import '../../Cubits/Main_cubit/maincubit_cubit.dart';
import '../../../../../Core/widgets/CustomAppBarForScreens.dart';
import '../../../../../Core/widgets/LoaingAndShimmerEffect.dart';
import 'Widget/Widget.dart';

class profiel extends StatelessWidget {
  profiel({super.key});
  // UserModel? argumefdfdnts;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPhotoProfileCubitCubit, AddPhotoProfileCubitState>(
        listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      return Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                _HeroShowProfilePhoto(context),
                SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomAppBarForScreens(context, "Profile", false, true,
                      DisabledbackArrow: false),
                )),
                Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 12 * 4,
                        ),
                        _ProfilePhoto(context),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            CustomText(
                                text:
                                    "${PreferencesService.getUserName("Username")!.substring(0, PreferencesService.getUserName("Username")!.length - 10)}",
                                Size: 25,
                                Color: Colors.white.withOpacity(0.8)),
                            SizedBox(
                              height: 4,
                            ),
                            CustomText(
                                text:
                                    "${PreferencesService.getUserName("Username")} ",
                                Size: 13,
                                Color: Colors.white.withOpacity(0.6)),
                          ],
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            _SettingSection(context)
          ],
        ),
      );
    });
  }

  Container _SettingSection(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 500,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: " Settings",
                  Size: 20,
                  Color: Colors.white.withOpacity(0.6)),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleItemSetting(
                      width: MediaQuery.of(context).size.width - 150,
                      child: ItemBody(
                          text: "Account",
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          icon: Icons.email)),
                  InkWell(
                    onTap: () {
                      MaincubitCubit.get(context).changethem();
                    },
                    child: SingleItemSetting(
                        width: 100,
                        child: Icon(
                          Icons.dark_mode,
                          size: 30,
                          color: Colors_App.blueColorto,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SingleItemSetting(
                          width: MediaQuery.of(context).size.width - 150,
                          child: ItemBody(
                              text: "Privacy",
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              icon: Icons.privacy_tip)),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      routing.Function(context, routing.AddtoCartScreen,
                          duration: 0);
                    },
                    child: SingleItemSetting(
                        width: 100,
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 30,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleItemSetting(
                      width: MediaQuery.of(context).size.width - 150,
                      child: ItemBody(
                          text: "Help",
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          icon: Icons.help)),
                  SingleItemSetting(
                      width: 100,
                      child: Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.red.withOpacity(0.4),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _HeroShowProfilePhoto(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 445,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
                offset: Offset(0, 10))
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(130),
              bottomRight: Radius.circular(130.5)),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.centerLeft,
            colors: [Color(0xff1f1f1f), Color(0xff0d0d0d)],
          )),
    );
  }

  Stack _ProfilePhoto(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onTap: () async {
            await AddPhotoProfileCubitCubit.get(context)
                .uploadImageFrom_gallery_or_camera(context,
                    gallery_or_camera: "gallery");
          },
          child: Container(
              height: 150,
              width: 150,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors_App.NotActiveCategoryColor,
                  borderRadius: BorderRadius.circular(1000)),
              child: PreferencesService.getUserName("ProfilePhoto") == null &&
                      AddPhotoProfileCubitCubit.get(context).fristOften
                  ? Center(
                      child: CustomText(
                          text: PreferencesService.getUserName("Username")?[0]
                              .toUpperCase(),
                          Size: 70,
                          Color: Colors.white),
                    )
                  : AddPhotoProfileCubitCubit.get(context).islurlLoading
                      ? Center(
                          child: Shimmer.fromColors(
                              period: Duration(milliseconds: 700),
                              direction: ShimmerDirection.ttb,
                              child: CircleAvatar(radius: 100),
                              baseColor: Colors_App.DarkColorFrom,
                              highlightColor: Color.fromARGB(255, 64, 64, 64)))
                      : Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "${PreferencesService.getUserName("ProfilePhoto")}"),
                        )),
        ),
        // PreferencesService.getUserName("ProfilePhoto") != null ||
        //         AddPhotoProfileCubitCubit.get(context).islurlLoading
        // ? Text("")
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors_App.ColorForbackscreen,
            ),
            CustemCircleAvter(
                color: Colors_App.blueColorto,
                Child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Size: 14)
          ],
        )
      ],
    );
  }
}
