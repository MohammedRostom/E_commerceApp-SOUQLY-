import 'package:flutter/material.dart';
import '../../../../../Core/widgets/LoaingAndShimmerEffect.dart';
import '../../Cubits/features_product_cubit/product_features_cubit.dart';
import '../../Cubits/payment_cubit_cubit/payment_cubit_cubit.dart';
import 'widgets/widgets.dart';

class Cart extends StatelessWidget {
  Cart({Key? key});
  @override
  Widget build(BuildContext context) {
    final price = ProductFeaturesCubit.get(context).totalPrice;
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Bodyofcart(context),
          ),
          bottomNavigationBar: BottomBar(context,
              priceOrTotalPrice: "Total",
              onTap: () => CheckoutPrice(context, price),
              price: price.toStringAsFixed(2),
              textBtn: "Checkout"),
        ),
        PaymentCubitCubit.get(context).ispayment
            ? OverlayWidgetLoading()
            : Text(""),
      ],
    );
  }

  CheckoutPrice(context, price) {
    PaymentCubitCubit.get(context).PymentNow(
      Amount: price,
    );
  }
}
