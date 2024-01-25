import 'package:flutter/material.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/data/models/categorymodel.dart';

class Productscreeens extends StatelessWidget {
  const Productscreeens({super.key});

  @override
  Widget build(BuildContext context) {
    Categorymodel Model =
        ModalRoute.of(context)!.settings.arguments as Categorymodel;
    return Scaffold(
      body: Center(child: Text("${Model.CategoryName}")),
    );
  }
}
