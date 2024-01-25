import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/widgets/SmallWidgets/widgets.dart';
import '../../../../../Core/widgets/background.dart';
import '../../Cubits/Getprouducrs_cubits/get_allproducts_cubit.dart';
import 'widgets/widgets.dart';

class homepage extends StatelessWidget {
  homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // argumefdfdnts = ModalRoute.of(context)!.settings.arguments as UserModel;
    return BlocConsumer<GetAllproductsCubit, GetAllproductsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                background(context),
                SafeArea(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Column(children: [
                        //section_1
                        customAppBar(context),
                        //section_2
                        HeroSection(),
                        SizebetContaners(),
                        //section_3
                        DisplayCategory(context),
                        SizebetContaners(),
                        //section_4
                        DisplayProudcts(context),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
