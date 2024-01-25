import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view/Onborading/screens/Onbord1.dart';
import '../../view/Onborading/screens/Onbord2.dart';
import '../../view/Onborading/screens/Onbord3.dart';
part 'Onboradingcounter_state.dart';

class onbordin_Cubit extends Cubit<onbordin_Cubit_state> {
  onbordin_Cubit() : super(onbordin_CubitInitial());

  static List<Widget> OnbotdinItems = [Onbord1(), Onbord2(), Onbord3()];
  static onbordin_Cubit get(context) =>
      BlocProvider.of<onbordin_Cubit>(context);
  int curuntindex = 0;
  swapingValue(value) {
    curuntindex = value;

    emit(onbordin_CubitChange());
    print(curuntindex);
  }
}
