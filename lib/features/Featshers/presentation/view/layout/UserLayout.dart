import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/routing/routing_functions.dart';
import '../../Cubits/Getprouducrs_cubits/get_allproducts_cubit.dart';
import '../../Cubits/Main_cubit/maincubit_cubit.dart';
import '../../../../../Core/widgets/LoaingAndShimmerEffect.dart';
import '../../Cubits/payment_cubit_cubit/payment_cubit_cubit.dart';
import 'widgets/WidgetLayouts.dart';

class UserLayout extends StatelessWidget {
  const UserLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaincubitCubit, MaincubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: GetAllproductsCubit.get(context).isloadingg
            ? null
            : FloutingActionBottonCart(
                context,
                onPressed: () {
                  routing.Function(context, routing.AddtoCartScreen);
                },
              ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GetAllproductsCubit.get(context).isloadingg
                ? Shimmerscreen()
                : MaincubitCubit.get(context)
                    .pages[MaincubitCubit.get(context).selected],
            GetAllproductsCubit.get(context).isloadingg
                ? Text("")
                : BottonBar(
                    context,
                  ),
          ],
        ),
      ),
    );
  }
}
