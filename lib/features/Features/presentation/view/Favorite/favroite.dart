import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Cubits/features_product_cubit/product_features_cubit.dart';
import 'widgets/widgets.dart';

class Favroite extends StatelessWidget {
  Favroite({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // bottomNavigationBar: _BottomBar(context),
        body: BlocConsumer<ProductFeaturesCubit, ProductFeaturesState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SafeArea(
              child: BodyFavroite(context),
            );
          },
        ));
  }
}
