import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/utils/Constant.dart';
import '../../../../../../Core/utils/colors.dart';
import '../../../../../../Core/widgets/CustombtnForApp.dart';
import '../../../../../../Core/widgets/CustomAppBarForScreens.dart';
import '../../../../../../Core/widgets/SmallWidgets/widgets.dart';
import '../../../Cubits/features_product_cubit/product_features_cubit.dart';
import '../../../Cubits/payment_cubit_cubit/payment_cubit_cubit.dart';
import '../../Cart/AddtocartScreen.dart';

Widget SlideHeroSection(BuildContext context) {
  return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - 165,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(58),
              bottomRight: Radius.circular(58)),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [Color(0xff0b0b0b), Color(0xff2b2a2a)],
          )));
}

class bodyOfPaumentInfo extends StatelessWidget {
  const bodyOfPaumentInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<PaymentCubitCubit, PaymentCubitState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: CustomAppBarForScreens(
                          context, "Payment", true, true,
                          DisabledbackArrow: true),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.help,
                          size: 27,
                        ))
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    CustomText(text: "45000.22\$", Size: 50, isbold: true),
                    SizedBox(
                      height: 7,
                    ),
                    CustomText(
                        text: "Available Balance",
                        Size: 20,
                        isbold: false,
                        Color: Colors.white.withOpacity(0.8)),
                  ],
                ),
                SizedBox(
                  height: 31,
                ),
                Container(
                  height: 231,
                  width: 231,
                  child: Image.asset("${constant.PaymentImg}"),
                ),
                SizedBox(
                  height: 31,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustombtnForApp(
                          onTap: () => Cart().CheckoutPrice(context,
                              ProductFeaturesCubit.get(context).totalPrice),
                          textInbtn: "Go to pay",
                          width: 144.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomText(
                              text: "Total Price",
                              Size: 17,
                              Color: Colors.white.withOpacity(0.4)),
                          CustomText(
                              text:
                                  "${ProductFeaturesCubit.get(context).totalPrice.toStringAsFixed(2)} \$",
                              Size: 30,
                              Color: Colors_App.blueColorto),
                        ],
                      ),
                    ]),
              ],
            ),
          );
        },
      ),
    );
  }
}
