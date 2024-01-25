import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/Constant.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/colors.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/presentation/Cubits/features_product_cubit/product_features_cubit.dart';
import '../../../../../Core/cache/cachprefranses.dart';
import '../../view/Favorite/favroite.dart';
import '../../view/Home/homepage.dart';
import '../../view/Payment/Payment.dart';
import '../../../../../Core/widgets/SmallWidgets/widgets.dart';

part 'maincubit_state.dart';

class MaincubitCubit extends Cubit<MaincubitState> {
  MaincubitCubit() : super(MaincubitInitial());
  static MaincubitCubit get(context) =>
      BlocProvider.of<MaincubitCubit>(context);
  bool Changethems = true;
  bool changethem({bool? change}) {
    if (change != null) {
      Changethems = change;
    } else {
      Changethems = !Changethems;
    }
    emit(ChangeThems());
    print(" from Emit : $Changethems");
    PreferencesService.setUserName("bool", Changethems);
    emit(ChangeThems());
    return Changethems;
  }

  int currentPhotoIndex = 0;
  void startTimer() {
    Duration duration = Duration(seconds: 3);
    Future.delayed(duration, () {
      // Update the list of photos after the delay
      changePhotoGroup();
      // Restart the timer
      startTimer();
    });
    emit(ChangePhoto());
  }

  void changePhotoGroup() {
    currentPhotoIndex = (currentPhotoIndex + 1) % constant.photoGroup.length;
    emit(ChangePhoto());
  }

  int indexFoCategory = 0;
  ChangeIndexCtegory({required int index}) {
    indexFoCategory = index;
    emit(ChangeValue());
  }

  List<Widget> pages = [homepage(), Favroite(), payment()];

  int _selected = 0;
  int get selected => _selected;
  void changeValue({@required int? index}) {
    if (index != null) {
      ChangeIndexCtegory(index: index);

      _selected = index;

      Colors_App.iconNotActiveColors = List.generate(
        Colors_App.iconNotActiveColors.length,
        (i) => i == _selected
            ? Colors_App.blueColorto
            : Colors_App.NotActiveIconColor,
      );
      emit(ChangeValue());

      print("page in UserLayout: $_selected");
    } else {}
  }

  List<dynamic> listIconBar(context) {
    List<dynamic> iconBottonBar = [
      IconBar(
        IconDatas: Icon(Icons.home_filled,
            color: Colors_App.iconNotActiveColors[0], size: 30),
      ),
      IconBar(
        IconDatas: Stack(
          alignment: Alignment.topLeft,
          children: [
            Icon(Icons.favorite,
                color: Colors_App.iconNotActiveColors[1], size: 30),
            BlocProvider.of<ProductFeaturesCubit>(context)
                    .AlldatafromdatabasesFaforite
                    .isNotEmpty
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors_App.DarkColorto,
                      ),
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors_App.RedColorApp,
                      ),
                    ],
                  )
                : Text("")
          ],
        ),
      ),
      IconBar(
        IconDatas: Icon(Icons.payment_outlined,
            color: Colors_App.iconNotActiveColors[2], size: 30),
      ),
    ];
    return iconBottonBar;
  }

  CallAllMethodsMustBeCalledM() {
    startTimer();
    changeValue(index: 0);
    ChangeIndexCtegory(index: 0);
  }
}
