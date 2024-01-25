import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/widgets/LoaingAndShimmerEffect.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Features/data/models/productmodel.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Features/presentation/Cubits/Getprouducrs_cubits/get_allproducts_cubit.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Features/presentation/Cubits/features_product_cubit/product_features_cubit.dart';

import '../utils/colors.dart';
import 'SmallWidgets/widgets.dart';

Container ProductItem(BuildContext context, int index,
    {required ProductModel model}) {
  return Container(
    height: 120,
    decoration: BoxDecoration(
        color: Colors_App.DarkColorFrom,
        borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: GetAllproductsCubit.get(context).GetCtegory
          ? Center(child: LoadingShimerSingleItem())
          : Stack(
              children: [
                Container(
                  height: 200,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Image.network("${model.image}"
                              // "${GetAllproductsCubit.get(context).gatedorySlected ? GetAllproductsCubit.get(context).newp1[index].image : GetAllproductsCubit.get(context).groupOproducts[index].image}"

                              ),
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 90,
                                  child: CustomText(
                                      text: model.title,
                                      // "${GetAllproductsCubit.get(context).gatedorySlected ? GetAllproductsCubit.get(context).newp1[index].title : GetAllproductsCubit.get(context).groupOproducts[index].title}",
                                      Size: 15,
                                      Color: Colors.white),
                                ),
                                Container(
                                  width: 90,
                                  child: CustomText(
                                      text: "${model.price}",

                                      // "${GetAllproductsCubit.get(context).gatedorySlected ? GetAllproductsCubit.get(context).newp1[index].price : GetAllproductsCubit.get(context).groupOproducts[index].price}\$",
                                      Size: 12,
                                      Color: Colors_App.blueColorto),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                ProductFeaturesCubit.get(context).toggelcart(
                                  model,
                                  context,
                                );
                                ProductFeaturesCubit.get(context)
                                    .sumofpricemodel();
                              },
                              child: BlocConsumer<ProductFeaturesCubit,
                                  ProductFeaturesState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                },
                                builder: (context, state) {
                                  return CustemCircleAvter(
                                      Size: 15,
                                      color: ProductFeaturesCubit.get(context)
                                              .isCard(model, context)
                                          ? Colors.green
                                          : Colors_App.blueColorto,
                                      Child: Icon(
                                        ProductFeaturesCubit.get(context)
                                                .isCard(model, context)
                                            ? Icons.done
                                            : Icons.add,
                                        color: Colors.white,
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
                FavoriteBtn(context, model),
              ],
            ),
    ),
  );
}

Widget FavoriteBtn(BuildContext context, ProductModel model) {
  return InkWell(
    onTap: () {
      ProductFeaturesCubit.get(context).toggleFavorite(
        model,
        context,
      );
      ProductFeaturesCubit.get(context).sumofpricemodel();
    },
    child: BlocConsumer<ProductFeaturesCubit, ProductFeaturesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return CustemCircleAvter(
            Size: 15,
            color: Colors.transparent,
            Child: Icon(
              ProductFeaturesCubit.get(context).isFavorite(model, context)
                  ? Icons.favorite
                  : Icons.favorite_border,
              size: 26,
              color:
                  ProductFeaturesCubit.get(context).isFavorite(model, context)
                      ? Colors_App.RedColorApp
                      : Colors_App.NotActiveIconColor,
            ));
      },
    ),
  );
}
