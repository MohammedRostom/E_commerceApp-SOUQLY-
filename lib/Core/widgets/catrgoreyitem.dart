import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/colors.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/Cubits/Getprouducrs_cubits/get_allproducts_cubit.dart';

import '../../features/Featshers/presentation/Cubits/Main_cubit/maincubit_cubit.dart';

CategoryItem(
    {@required index, required context, required String NameCategory}) {
  return BlocConsumer<MaincubitCubit, MaincubitState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Card(
            color: Color(0xff2C2B2B),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
              width: 90,
              height: 40,
            ),
          ),
          GestureDetector(
            onTap: () {
              print(index);
              print(NameCategory);
              MaincubitCubit.get(context).ChangeIndexCtegory(index: index);
              if (NameCategory != "All") {
                GetAllproductsCubit.get(context)
                    .GetNameOfCategory(NameCategory);
              } else {
                GetAllproductsCubit.get(context).GetAllCategorys();
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    MaincubitCubit.get(context).indexFoCategory == index
                        ? Colors_App.blueColorfrom
                        : Colors_App.DarkColorFrom,
                    MaincubitCubit.get(context).indexFoCategory == index
                        ? Colors_App.blueColorto
                        : Colors_App.DarkColorto
                  ],
                ),
              ),
              width: 70,
              height: 30,
              child: Text(
                overflow: TextOverflow.ellipsis,
                "${NameCategory == "" ? GetAllproductsCubit.get(context).groupOCategorys[index].CategoryName : NameCategory}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );
    },
  );
}
