import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/utils/colors.dart';
import '../../../../../../Core/widgets/SmallWidgets/widgets.dart';
import '../../../../data/models/productmodel.dart';
import '../../../Cubits/features_product_cubit/product_features_cubit.dart';

Widget Showproduct(ProductModel model, BuildContext context) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Container(
        clipBehavior: Clip.antiAlias,
        child: Image(fit: BoxFit.fill, image: NetworkImage("${model.image}")),
        width: 373,
        height: 454,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(48),
                bottomLeft: Radius.circular(48)),
            color: Colors_App.ColorForbackscreen),
      ),
      Stack(
        children: [
          AnimatedContainer(
              duration: Duration(seconds: 1),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text: "${model.title}", Size: 22, isbold: true),
                          SizedBox(
                            height: 16,
                          ),
                          CustomText(
                            text: "Description:",
                            Size: 17,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Column(
                            children: [
                              AnimatedPadding(
                                duration: Duration(microseconds: 500),
                                curve: Curves.easeInOut,
                                padding: EdgeInsets.only(
                                    bottom: ProductFeaturesCubit.get(context)
                                            .isreadmore
                                        ? 20
                                        : 0),
                                child: Text(
                                  "${model.description}",
                                  maxLines: ProductFeaturesCubit.get(context)
                                          .isreadmore
                                      ? 20
                                      : 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white.withOpacity(0.8)),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          ProductFeaturesCubit.get(context).readMore();
                        },
                        child: Container(
                          height: 25,
                          width: double.infinity,
                          child: Text(
                              ProductFeaturesCubit.get(context).isreadmore
                                  ? "Less"
                                  : "More.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.blue,
                              )),
                        )),
                  ],
                ),
              ),
              width: 373,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(44),
                      bottomLeft: Radius.circular(44)),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Color(0xff2d2d2d), Color(0xff2b2a2a)],
                  )))
        ],
      ),
    ],
  );
}

Container OptionsOfProduct(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 14),
    height: MediaQuery.of(context).size.height - 668,
    child: Column(
      children: [
        TextLebals(),
        SizedBox(
          height: 18,
        ),
        SizeAndColorSelection()
      ],
    ),
  );
}

class SizeAndColorSelection extends StatelessWidget {
  const SizeAndColorSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductFeaturesCubit, ProductFeaturesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              4,
              (index) => index == 3
                  ? InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Row(
                                    children: [
                                      CustomText(
                                          text: "Select Color   ",
                                          Size: 17,
                                          isbold: true),
                                      Icon(Icons.color_lens)
                                    ],
                                  ),
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                        3,
                                        (indexColor) => InkWell(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      ProductFeaturesCubit.get(
                                                              context)
                                                          .SelctedProductColor(
                                                              indexColor);
                                                      Navigator.pop(context);
                                                    },
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          ProductFeaturesCubit.get(
                                                                      context)
                                                                  .SelectColorOfproduct[
                                                              indexColor]["Color"],
                                                      radius: 25,
                                                    ),
                                                  ),
                                                  Text(
                                                      "${ProductFeaturesCubit.get(context).SelectColorOfproduct[indexColor]["NameColor"]}")
                                                ],
                                              ),
                                            )),
                                  ),
                                ));
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors_App.NotActiveIconColor),
                          CircleAvatar(
                              radius: 21,
                              backgroundColor: ProductFeaturesCubit.get(context)
                                  .isSelctedProductColor),
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        ProductFeaturesCubit.get(context).ToggelSelectedSize(
                            index,
                            ProductFeaturesCubit.get(context)
                                .Sizeofproduct[index]);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          child: CustomText(
                              text: ProductFeaturesCubit.get(context)
                                  .Sizeofproduct[index],
                              Size: 25,
                              Color: Colors.white,
                              isbold: true),
                          width: 61,
                          height: 41,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: ProductFeaturesCubit.get(context)
                                              .cuindex ==
                                          index
                                      ? Colors_App.blueColorto
                                      : Colors_App.NotActiveCategoryColor),
                              borderRadius: BorderRadius.circular(7),
                              color:
                                  ProductFeaturesCubit.get(context).cuindex ==
                                          index
                                      ? Color(0x721b81b4)
                                      : Colors_App.ColorForbackscreen)),
                    )),
        );
      },
    );
  }
}

class TextLebals extends StatelessWidget {
  const TextLebals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CustomText(text: "Size  ", Size: 20, isbold: true),
      CustomText(text: "Color  ", Size: 17, isbold: true)
    ]);
  }
}

Widget sheet(ProductModel model) => Stack(
      children: [
        Container(
            width: 373,
            height: 405.14495849609375,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Color(0xff161616))),
        Stack(
          children: [
            Text("Size",
                style: TextStyle(
                  fontSize: 20,
                )),
            Text("M",
                style: TextStyle(
                  fontSize: 20,
                ))
          ],
        ),
        Image.network(
          "${model.image}",
          width: 138,
          height: 138,
        ),
        Stack(
          children: [
            Text("Name",
                style: TextStyle(
                  fontSize: 20,
                )),
            Text("kladjls",
                style: TextStyle(
                  fontSize: 20,
                ))
          ],
        ),
        Stack(
          children: [
            Text("Product Info",
                style: TextStyle(
                  fontSize: 15,
                ))
          ],
        ),
        Stack(
          children: [
            Text("Price",
                style: TextStyle(
                  fontSize: 20,
                )),
            Text("500\$",
                style: TextStyle(
                  fontSize: 20,
                ))
          ],
        ),
        Stack(
          children: [
            Stack(
              children: [
                CircleAvatar(),
                Text("Color",
                    style: TextStyle(
                      fontSize: 20,
                    ))
              ],
            )
          ],
        )
      ],
    );
