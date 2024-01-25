import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../Core/utils/Constant.dart';
import '../../../../../../Core/utils/colors.dart';
import '../../../../../../Core/widgets/CustombtnForApp.dart';
import '../../../../../../Core/widgets/CustomAppBarForScreens.dart';
import '../../../../../../Core/widgets/SmallWidgets/widgets.dart';
import '../../../../../../Core/widgets/LoaingAndShimmerEffect.dart';
import '../../../../data/models/productmodel.dart';
import '../../../Cubits/payment_cubit_cubit/payment_cubit_cubit.dart';
import '../../../Cubits/features_product_cubit/product_features_cubit.dart';
import '../../Search/searshscreen.dart';

Widget Bodyofcart(BuildContext context) {
  TextEditingController _searchController = TextEditingController();
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Container(
          child: CustomAppBarForScreens(context, "MyCart", true, true,
              DisabledbackArrow: false),
        ),
        searchwiget(
            context: context,
            searchFocus: FocusNode(),
            searchController: _searchController),
        Container(
          height: MediaQuery.of(context).size.height - 276,
          child: ProductFeaturesCubit.get(context)
                  .Alldatafromdatabases
                  .isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                        ProductFeaturesCubit.get(context)
                            .Alldatafromdatabases
                            .length,
                        (index) => Dismissible(
                            onDismissed: (direction) {
                              ProductFeaturesCubit.get(context).removeProduct(
                                  tablename: constant.CartTable,
                                  ProductFeaturesCubit.get(context)
                                      .Alldatafromdatabases[index]
                                      .id,
                                  context);
                            },
                            background: DismissBackground(context),
                            direction: DismissDirection.endToStart,
                            key: UniqueKey(),
                            child: CartItem(
                                context,
                                index,
                                ProductFeaturesCubit.get(context)
                                    .Alldatafromdatabases[index]))),
                  ),
                )
              : Center(
                  child: CustomText(
                    text: "No Prodcuts",
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

CartItem(
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
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      ProductFeaturesCubit.get(context)
                                          .Decreementquantity(index);
                                    },
                                    child: CustemCircleAvter(
                                        color: Colors_App.blueColorto,
                                        Child: Text(
                                          "--",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Size: 17),
                                  ),
                                  CustemCircleAvter(
                                      color: Colors.transparent,
                                      Child: CustomText(
                                          text: "${prouduct.Amount}",
                                          Size: 15,
                                          Color: Colors.white),
                                      Size: 16),
                                  InkWell(
                                    onTap: () {
                                      ProductFeaturesCubit.get(context)
                                          .Increementquantity(index);
                                    },
                                    child: CustemCircleAvter(
                                        color: Colors_App.blueColorto,
                                        Child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        Size: 17),
                                  ),
                                ],
                              ),
                            ),
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

Widget BottomBar(
  context, {
  required void Function()? onTap,
  required price,
  required textBtn,
  required priceOrTotalPrice,
}) {
  return BlocConsumer<ProductFeaturesCubit, ProductFeaturesState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return BottomAppBar(
          color: Colors_App.DarkColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 13, left: 12),
                      child: Container(
                        child: PaymentCubitCubit.get(context).ispayment
                            ? Container(
                                width: 24, height: 24, child: SnipLoadingApp())
                            : Shimmer.fromColors(
                                highlightColor: Colors.white.withOpacity(0.4),
                                baseColor: Colors.white.withOpacity(0.4),
                                child: Image.asset(
                                  constant.logoHomePagex,
                                ),
                              ),
                        height: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                    text: "$priceOrTotalPrice",
                                    Size: 17,
                                    Color: Colors.white.withOpacity(0.4)),
                                CustomText(
                                    text: "${price} \$",
                                    Size: 30,
                                    Color: Colors_App.blueColorto),
                              ],
                            ),
                            CustombtnForApp(
                                onTap: onTap, textInbtn: textBtn, width: 144.0),
                          ]),
                    ),
                  ],
                ),
                height: 125,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14)),
                    color: Color(0xff0f0f0f))),
          ));
    },
  );
}
