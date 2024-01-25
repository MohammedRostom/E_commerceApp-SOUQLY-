import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/Constant.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/colors.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/data/repositories_impl/rebo/Api_repo.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/config/routing/routing_functions.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/data/data_sources/remote/Api/ApiServises.dart';
import 'package:shimmer/shimmer.dart';

import '../../features/Featshers/presentation/Cubits/Main_cubit/maincubit_cubit.dart';
import 'SmallWidgets/widgets.dart';

class Shimmerscreen extends StatelessWidget {
  Shimmerscreen({super.key});

  // UserModel? argumefdfdnts;
  @override
  Widget build(BuildContext context) {
    // argumefdfdnts = ModalRoute.of(context)!.settings.arguments as UserModel;
    return BlocConsumer<MaincubitCubit, MaincubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Shimmer.fromColors(
              period: Duration(seconds: 1),
              direction: ShimmerDirection.ttb,
              highlightColor: Color.fromARGB(255, 87, 87, 87),
              baseColor: Color.fromARGB(255, 49, 49, 49),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(13),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        child: Container(
                          child: Column(children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContBox(height: 60.0, width: 150.0),
                                  ContBox(height: 60.0, width: 60.0),
                                ],
                              ),
                              height: 80,
                            ),
                          ]),
                        ),
                      ),
                      ContBox(height: 150.0, width: double.infinity),
                      SizebetContaners(),
                      Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ContBox(height: 15.0, width: 110.0),
                              SizeBetElementInContainer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                    3,
                                    (index) =>
                                        ContBox(height: 40.0, width: 100.0)),
                              ),
                            ]),
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ContBox(height: 15.0, width: 110.0),
                              SizeBetElementInContainer(),
                              SingleChildScrollView(
                                child: Container(
                                  child: GridView.builder(
                                    itemCount: 4,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0,
                                    ),
                                    itemBuilder: (context, index) {
                                      // Replace the following line with your actual data or logic to customize each card

                                      return ContBox(
                                          height: 15.0, width: 110.0);
                                    },
                                  ),
                                  height: 400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

Widget OverlayWidgetLoading() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black.withOpacity(0.6),
      ),
      Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors_App.ColorForbackscreen)),
      Center(child: LoadingShimerOverlyleItem())
    ],
  );
}

class SnipLoadingApp extends StatelessWidget {
  const SnipLoadingApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingFour(
      duration: Duration(seconds: 1),
      size: 30,
      color: Colors.white,
    );
  }
}

class LoadingShimerSingleItem extends StatelessWidget {
  const LoadingShimerSingleItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        period: Duration(milliseconds: 700),
        direction: ShimmerDirection.ttb,
        highlightColor: Color.fromARGB(255, 63, 63, 63),
        baseColor: Color.fromARGB(255, 49, 49, 49),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 21, right: 21, bottom: 21, left: 10),
          child: Center(child: Image.asset(constant.ImageLogoSplashWhite)),
        ));
  }
}

class LoadingShimerOverlyleItem extends StatelessWidget {
  const LoadingShimerOverlyleItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(130), child: SnipLoadingApp());
  }
}
