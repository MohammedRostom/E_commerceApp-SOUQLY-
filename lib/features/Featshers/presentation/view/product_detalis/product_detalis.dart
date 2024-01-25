import 'package:flutter/material.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/Cubits/features_product_cubit/product_features_cubit.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/view/product_detalis/widgets/widgets.dart';
import '../../../data/models/productmodel.dart';
import '../Cart/widgets/widgets.dart';

class product_detalis extends StatelessWidget {
  product_detalis({Key? key});

  @override
  Widget build(BuildContext context) {
    ProductModel model =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Showproduct(model, context),
            SizedBox(
              height: 20,
            ),
            OptionsOfProduct(context),
            SizedBox(
              height: 25,
            ),
          ],
        )),
        bottomNavigationBar: BottomBar(context,
            onTap: () => _AddtocartMethod(context, model),
            price: model.price.toString(),
            textBtn: "Add to Cart",
            priceOrTotalPrice: "Price"));
  }

  _AddtocartMethod(context, model) {
    ProductFeaturesCubit.get(context).AddProduct(model, context);
  }
}
