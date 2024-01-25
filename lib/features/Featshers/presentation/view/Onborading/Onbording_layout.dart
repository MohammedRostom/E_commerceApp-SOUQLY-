import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubits/Onborading_cubit/Onboradingcounter_cubit.dart';
import 'wigets/layout_wigets.dart';

class Onbording_layout extends StatelessWidget {
  const Onbording_layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<onbordin_Cubit, onbordin_Cubit_state>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        PageController newdCont = PageController();
        return Scaffold(
          body: Stack(
            children: [
              images(context, newdCont),
              bodyOfContect(context, newdCont)
            ],
          ),
        );
      },
    );
  }
}
