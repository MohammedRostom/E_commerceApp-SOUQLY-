import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/Constant.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/widgets/SmallWidgets/widgets.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/config/routing/routing_functions.dart';

import '../../features/Featshers/presentation/Cubits/features_product_cubit/product_features_cubit.dart';

Widget CustomAppBarForScreens(
    BuildContext context, Titlescreen, bool ShowData, bool ApperArrow,
    {required DisabledbackArrow}) {
  return Container(
    child: ApperArrow
        ? Row(
            children: [
              IconButton(
                  onPressed: DisabledbackArrow!
                      ? null
                      : () {
                          if (ShowData == true) {
                            ProductFeaturesCubit.get(context)
                                .ShowAllData(tableName: constant.CartTable);
                            ProductFeaturesCubit.get(context)
                                .ShowAllData(tableName: constant.FavoriteTable);

                            Navigator.pop(context);
                          } else {
                            Navigator.pop(context);
                          }
                        },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white.withOpacity(0.5),
                  )),
              Container(
                alignment: Alignment.center,
                child: CustomText(
                  text: "${Titlescreen}",
                  Size: 22,
                ),
              )
            ],
          )
        : Container(
            alignment: Alignment.center,
            child: CustomText(
              text: "${Titlescreen}",
              Size: 22,
            ),
          ),
  );
}
