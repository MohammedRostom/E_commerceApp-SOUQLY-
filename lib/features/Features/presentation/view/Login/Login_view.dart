import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/Constant.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/colors.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/widgets/SmallWidgets/widgets.dart';

import '../../../../../Core/widgets/CustomTextFelidforAuth.dart';
import '../../../../../Core/widgets/CustombtnForApp.dart';
import '../../../../../Core/widgets/OverLay.dart';
import '../../../../../Core/widgets/background.dart';
import '../../../../../config/routing/routing_functions.dart';
import '../../Cubits/Auth_cubit_featsure/Auth_cubit.dart';
import '../../Cubits/Main_cubit/maincubit_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key});
  TextEditingController emailconteroller = TextEditingController();
  TextEditingController Passcontroller = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<Auth_cubit, Auth_cubit_state>(
        builder: (context, state) => Stack(
          children: [
            background(context),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset("${constant.herosectionAuthLogin}"),
                  ),
                  _inputsSection(context),
                  _Auth_Section(context),
                ],
              ),
            ),
            Auth_cubit.get(context).isslogined ? OverLay() : Text("")
          ],
        ),
      ),
    );
  }

  Widget _inputsSection(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 39),
      child: Container(
        alignment: Alignment.center,
        height: 210,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Form(
                autovalidateMode: AutovalidateMode.always,
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "LOGIN ", Size: 32, isbold: true),
                    CustemTextfield(
                        suffixIcon: Icon(
                          Icons.person,
                          size: 27,
                          color: Colors_App.NotActiveIconColor,
                        ),
                        obscureText: false,
                        Label: "Email",
                        SavedValue: emailconteroller.text,
                        controller: emailconteroller,
                        messagevalidator: "Please enter UserName"),
                    SizedBox(height: 15.0),
                    CustemTextfield(
                        suffixIcon: InkWell(
                          onTap: () => Auth_cubit.get(context).Visibility(),
                          child: Icon(
                            Auth_cubit.get(context).obscureText
                                ? Icons.remove_red_eye_outlined
                                : Icons.remove_red_eye_rounded,
                            size: 27,
                            color: Auth_cubit.get(context).obscureText
                                ? Colors_App.NotActiveIconColor
                                : Colors_App.blueColorto,
                          ),
                        ),
                        obscureText: Auth_cubit.get(context).obscureText,
                        SavedValue: Passcontroller.text,
                        Label: "Password",
                        messagevalidator: "Please enter a password",
                        controller: Passcontroller),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(
                                text: "Forgrt Password ?",
                                Size: 11,
                                isbold: true,
                                Color: Colors_App.blueColorto),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Auth_Section(context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 15,
        ),
        CustombtnForApp(
            onTap: () async {
              if (_key.currentState!.validate()) {
                _key.currentState!.save();
                await Auth_cubit.get(context).LoginfromCubit(
                    emailconteroller.text, Passcontroller.text, context);
              }
            },
            width: 210.0,
            textInbtn: "Login",
            height: 50.0),
        SizedBox(
          height: 14,
        ),
        swith_Auth(
          Massegetext: "Create Account",
          btnText: "  Sign Up Now?",
          onTapBtn: () => Navigator.pushNamed(context, routing.Signupscreen),
        ),
        SizedBox(
          height: 22,
        ),
      ]),
    );
  }
}
