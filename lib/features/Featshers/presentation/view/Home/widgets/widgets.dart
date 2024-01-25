import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/utils/Constant.dart';
import '../../../../../../Core/utils/colors.dart';
import '../../../../../../Core/widgets/ProductItem.dart';
import '../../../../../../Core/widgets/SmallWidgets/widgets.dart';
import '../../../../../../Core/widgets/catrgoreyitem.dart';
import '../../../../../../config/routing/routing_functions.dart';
import '../../../Cubits/Getprouducrs_cubits/get_allproducts_cubit.dart';
import '../../../Cubits/Main_cubit/maincubit_cubit.dart';

Widget DisplayCategory(BuildContext context) {
  return Container(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomText(text: "Category", Size: 21.0),
      SizeBetElementInContainer(),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            GetAllproductsCubit.get(context).groupOCategorys.length,
            (index) => CategoryItem(
                NameCategory: GetAllproductsCubit.get(context)
                    .groupOCategorys[index]
                    .CategoryName,
                context: context,
                index: index),
          ),
        ),
      ),
    ]),
    height: 90,
    width: MediaQuery.of(context).size.width,
  );
}

Widget HeroSection() {
  return BlocConsumer<MaincubitCubit, MaincubitState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return Container(
        clipBehavior: Clip.antiAlias,
        width: MediaQuery.of(context).size.width,
        height: 175,
        child: Image(
            fit: BoxFit.cover,
            image: AssetImage(constant
                .photoGroup[MaincubitCubit.get(context).currentPhotoIndex])),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(12)),
      );
    },
  );
}

Widget customAppBar(BuildContext context) {
  return Container(
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 17, bottom: 17, right: 17),
                child: Image(
                    image: AssetImage(
                  constant.logoHomePagex,
                )),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors_App.NotActiveCategoryColor,
                    ),
                    child: IconButton(
                        onPressed: () {
                          showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(100, 100, 0, 0),
                            items: [
                              PopupMenuItem(
                                child: Text('Option 1'),
                                value: 'Option 1',
                              ),
                              PopupMenuItem(
                                child: Text('Option 2'),
                                value: 'Option 2',
                              ),
                              PopupMenuItem(
                                child: Text('Option 3'),
                                value: 'Option 3',
                              ),
                            ],
                          );
                        },
                        icon: Icon(
                          Icons.notifications_rounded,
                          size: 26,
                        )),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors_App.NotActiveCategoryColor,
                    ),
                    child: IconButton(
                        onPressed: () {
                          routing.Function(context, routing.Searchscreen,
                              duration: 0);
                        },
                        icon: Icon(
                          Icons.search,
                          size: 26,
                        )),
                  ),
                ],
              ),
            ],
          ),
          height: 80,
        ),
      ]),
    ),
  );
}

Widget DisplayProudcts(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: "Products", Size: 21),
        SizeBetElementInContainer(),
        Container(
          child: GridView.builder(
            itemCount: GetAllproductsCubit.get(context).gatedorySlected
                ? GetAllproductsCubit.get(context).newp1.length
                : GetAllproductsCubit.get(context).groupOproducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemBuilder: (context, index) {
              // Replace the following line with your actual data or logic to customize each card

              return GestureDetector(
                  onTap: () {
                    print(index);

                    routing.Function(context, routing.ProductDetalisScreen,
                        usermodel:
                            GetAllproductsCubit.get(context).gatedorySlected
                                ? GetAllproductsCubit.get(context).newp1[index]
                                : GetAllproductsCubit.get(context)
                                    .groupOproducts[index],
                        duration: 0);
                  },
                  child: ProductItem(
                    model: GetAllproductsCubit.get(context).gatedorySlected
                        ? GetAllproductsCubit.get(context).newp1[index]
                        : GetAllproductsCubit.get(context)
                            .groupOproducts[index],
                    context,
                    index,
                  ));
            },
          ),
          height: 700,
        ),
      ],
    ),
  );
}
