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
        body: bodyofscreen(context),
      );
    });
  }
}
