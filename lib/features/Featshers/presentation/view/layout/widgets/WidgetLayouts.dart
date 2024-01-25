import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/Constant.dart';
import '../../../../../../Core/utils/colors.dart';
import '../../../../../../config/routing/routing_functions.dart';
import '../../../Cubits/Main_cubit/maincubit_cubit.dart';
import '../../../Cubits/features_product_cubit/product_features_cubit.dart';
import '../../../../../../Core/widgets/SmallWidgets/widgets.dart';

Padding FloutingActionBottonCart(context,
    {required void Function()? onPressed}) {
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 70),
      child: FloatingActionButton(
        child: Stack(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(constant.CartIcon),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xff0A536B), Color(0xff1B81B4)],
                ),
              ),
            ),
            ProductFeaturesCubit.get(context).ProductAdded ||
                    ProductFeaturesCubit.get(context)
                        .Alldatafromdatabases
                        .isNotEmpty
                ? CircleAvatar(
                    child: Center(
                      child: Text(
                        "${ProductFeaturesCubit.get(context).Alldatafromdatabases.length}",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                    radius: 8, // Adjust the radius as needed
                    backgroundColor:
                        Colors_App.RedColorApp, // Set a background color
                  )
                : Text("")
          ],
        ),
        onPressed: onPressed,
      ));
}

BottonBar(
  BuildContext context,
) {
  return Padding(
    padding: const EdgeInsets.all(14),
    child: Container(
        child: Row(
          children: [
            Container(
              width: 250,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      MaincubitCubit.get(context).listIconBar(context).length,
                      (index) {
                    return BlocConsumer<MaincubitCubit, MaincubitState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return GestureDetector(
                            onTap: () {
                              print(index);

                              // MaincubitCubit.get(context).changeValue(index);
                              MaincubitCubit.get(context)
                                  .changeValue(index: index);
                            },
                            child: MaincubitCubit.get(context)
                                .listIconBar(context)[index]);
                      },
                    );
                  })),
            ),
            SizedBox(
              width: 17,
            ),
            InkWell(
              onTap: () =>
                  routing.Function(context, routing.Profilescreen, duration: 0),
              child: IconBar(
                IconDatas: Icon(
                  Icons.person,
                  color: Colors_App.NotActiveIconColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.9),
                blurRadius: 12.0, // Adjust the blur radius
                offset: Offset(0.0, 3.0), // Adjust the offset
              ),
            ],
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Color(0xff212221), Color(0xff0c0c0c)],
            ))),
  );
}
