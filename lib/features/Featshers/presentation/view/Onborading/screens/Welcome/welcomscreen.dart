import 'package:flutter/material.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/Constant.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/config/routing/routing_functions.dart';

import '../../../../../../../Core/widgets/CustombtnForApp.dart';

class welcomescreen extends StatelessWidget {
  const welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Image(
              fit: BoxFit.fill,
              width: double.infinity,
              image: AssetImage("${constant.Login_OR_Sign}")),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      routing.Function(context, routing.Loginscreen,
                          duration: 0);
                    },
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        width: 206.61386108398438,
                        height: 50.5544548034668,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(20.881187438964844),
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [Color(0xff054759), Color(0xff1b81b4)],
                            ))),
                  ),
                  SizedBox(
                    height: 20,
                    child: Text(
                      "----- or -----",
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      routing.Function(context, routing.Signupscreen,
                          duration: 0);
                    },
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Sgin up",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                        width: 206.61386108398438,
                        height: 50.5544548034668,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(20.881187438964844),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
