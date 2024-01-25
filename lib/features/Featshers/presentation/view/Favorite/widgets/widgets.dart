import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/widgets/CustomAppBarForScreens.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/data/models/productmodel.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/Cubits/features_product_cubit/product_features_cubit.dart';
import '../../../../../../Core/utils/Constant.dart';
import '../../../../../../Core/utils/colors.dart';
import '../../../../../../Core/widgets/SmallWidgets/widgets.dart';
import '../../Search/searshscreen.dart';

BodyFavroite(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Container(
          child: CustomAppBarForScreens(context, "Favorite", true, true,
              DisabledbackArrow: true),
        ),
        searchwiget(
            context: context,
            searchFocus: FocusNode(),
            searchController: TextEditingController()),
        Container(
          height: MediaQuery.of(context).size.height - 220,
          child: ProductFeaturesCubit.get(context)
                  .AlldatafromdatabasesFaforite
                  .isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                        ProductFeaturesCubit.get(context)
                            .AlldatafromdatabasesFaforite
                            .length,
                        (index) => Dismissible(
                            onDismissed: (direction) {
                              ProductFeaturesCubit.get(context).removeProduct(
                                  tablename: constant.FavoriteTable,
                                  ProductFeaturesCubit.get(context)
                                      .AlldatafromdatabasesFaforite[index]
                                      .id,
                                  context);
                            },
                            background: DismissBackground(context),
                            direction: DismissDirection.endToStart,
                            key: UniqueKey(),
                            child: favoriteitem(
                                context,
                                index,
                                ProductFeaturesCubit.get(context)
                                    .AlldatafromdatabasesFaforite[index]))),
                  ),
                )
              : Center(
                  child: CustomText(
                    text: "No Favorite Prodcut",
                    Size: 25,
                  ),
                ),
        ),
      ],
    ),
  );
}

Container DismissBackground(BuildContext context) {
  return Container(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Icon(
          Icons.delete,
          size: 26,
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [Color(0xffb41b3f), Color(0xff0d0d0d)],
          )));
}

favoriteitem(
  context,
  index,
  ProductModel prouduct,
) {
  return BlocConsumer<ProductFeaturesCubit, ProductFeaturesState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network("${prouduct.image}"),
                    ),
                    width: 95,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white)),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 142,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: prouduct.title,
                            Size: 15,
                            Color: Colors.white),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: "${prouduct.price} \$",
                                Size: 25,
                                Color: Colors_App.blueColorto),
                            Container(
                                child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors_App.RedColorApp,
                              child: GestureDetector(
                                onTap: () async {
                                  await ProductFeaturesCubit.get(context)
                                      .removeProduct(
                                          tablename: constant.FavoriteTable,
                                          ProductFeaturesCubit.get(context)
                                              .AlldatafromdatabasesFaforite[
                                                  index]
                                              .id,
                                          context);
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
            clipBehavior: Clip.antiAlias,
            width: double.infinity,
            height: 93,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: Offset(0, 10))
                ],
                borderRadius: BorderRadius.circular(14),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xff1f1f1f),
                    Color(0xff1b1b1b),
                    Color(0xff0d0d0d)
                  ],
                ))),
      );
    },
  );
}
