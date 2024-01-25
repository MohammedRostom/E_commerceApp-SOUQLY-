import 'package:flutter/material.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/colors.dart';
import '../../features/Featshers/presentation/Cubits/Main_cubit/maincubit_cubit.dart';

class Im_methods {
  static List<Color> Group_fo_NotActiveColors_Method() {
    dynamic Listcolor = List.generate(MaincubitCubit().pages.length,
        (index) => Colors_App.NotActiveIconColor);
    return Listcolor;
  }
}
