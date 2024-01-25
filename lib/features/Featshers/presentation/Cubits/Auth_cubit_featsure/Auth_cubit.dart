import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/cache/cachprefranses.dart';
import '../../../../../config/routing/routing_functions.dart';
import '../../../data/models/usermodel.dart';
import '../../../data/repositories_impl/rebo/Auth_rebo.dart';
part 'Auth_cubit_state.dart';

class Auth_cubit extends Cubit<Auth_cubit_state> {
  Auth_cubit() : super(Auth_cubit_Initial());
  static Auth_cubit get(context) => BlocProvider.of<Auth_cubit>(context);
  bool isslogined = false;

  Future<void> LoginfromCubit(email, pass, context) async {
    //start fonctions
    isslogined = true;
    emit(Loadinges());

    UserModel? userrepo = await rebo().loginedrebo(
        emailfromfiled: email, passfromFielf: pass, context: context);
    if (userrepo != null) {
      PreferencesService.setUserName("Username", userrepo.username);
      PreferencesService.setUserName("Pass", userrepo.password);
      isslogined = false;
      emit(Loadinges());
      routing.Function(
        context,
        routing.Userlayout,
        usermodel: userrepo,
      );
    }
//if null user returned;
    isslogined = false;
    emit(Loadinges());
  }

  Future<void> RegisterFromCUbit(email, pass, context) async {
    //start fonctions
    isslogined = true;
    emit(Loadinges());

    UserModel? userrepo = await rebo().RegisterTion(
        emailfromfiled: email, passfromFielf: pass, context: context);
    if (userrepo != null) {
      PreferencesService.setUserName("Username", userrepo.username);
      PreferencesService.setUserName("Pass", userrepo.password);
      isslogined = false;
      emit(Loadinges());
      routing.Function(
        context,
        routing.Loginscreen,
        usermodel: userrepo,
      );
    }
//if null user returned;
    isslogined = false;
    emit(Loadinges());
  }

  bool obscureText = true;
  Visibility() {
    obscureText = !obscureText;
    emit(ChangeValue());
  }
}
