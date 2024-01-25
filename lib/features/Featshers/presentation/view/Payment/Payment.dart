import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/colors.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/Cubits/features_product_cubit/product_features_cubit.dart';
import '../../../../../Core/widgets/LoaingAndShimmerEffect.dart';
import '../../Cubits/payment_cubit_cubit/payment_cubit_cubit.dart';
import 'widgets/widgets_payment.dart';

class payment extends StatelessWidget {
  const payment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubitCubit, PaymentCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var ispay = PaymentCubitCubit.get(context).ispayment;
        print(ispay);
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 150,
                child: Stack(
                  children: [
                    SlideHeroSection(context),
                    bodyOfPaumentInfo(),
                  ],
                ),
              ),
              ispay
                  ? Container(
                      height: double.infinity, child: OverlayWidgetLoading())
                  : Text("")
              // : Text(""),
            ],
          ),
        );
      },
    );
  }
}
