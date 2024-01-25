import 'package:firebase_auth/firebase_auth.dart';

import '../../data_sources/remote/firbases/firbases_sevises.dart';
import '../../models/usermodel.dart';

class rebo {
  Future<UserModel?> loginedrebo(
      {emailfromfiled, passfromFielf, context}) async {
    try {
      UserCredential? user = await firbsese_servises.Loginedfunction(
          context: context, demail: emailfromfiled, pass: passfromFielf);
      //Add user to Uermodel
      UserModel usermodel =
          UserModel(username: user!.user!.email!, password: passfromFielf);
      return await usermodel;
    } catch (e) {
      return null;
    }
  }

  Future<UserModel?> RegisterTion(
      {emailfromfiled, passfromFielf, context}) async {
    UserCredential? user = await firbsese_servises.SighnUpFnctions(
        context: context, demail: emailfromfiled, pass: passfromFielf);
    if (user != null) {
      //Add user to Uermodel
      UserModel usermodel =
          UserModel(username: user!.user!.email!, password: passfromFielf);
      //Add user doc with uid from firebses auth ++++++++++++++++++++
      dynamic result = await firbsese_servises.addUsertofireStore(
          user!.user!.email!, passfromFielf, user!.user!.uid);
      if (result == true && result != null) {
        print("User added to firestore :)");
      } else {
        print("Error to add user ouccerd try again or check your code :(");
      }
      return await usermodel;
    }
  }
}
