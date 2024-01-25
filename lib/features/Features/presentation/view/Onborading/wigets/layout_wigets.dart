import 'package:flutter/material.dart';

import '../../../Cubits/Onborading_cubit/Onboradingcounter_cubit.dart';
import '../../../../data/models/onboardingmodel.dart';
import '../screens/Welcome/welcomscreen.dart';

Widget images(context, newdCont) {
  return PageView.builder(
    onPageChanged: (value) {
      onbordin_Cubit.get(context).swapingValue(value);
    },
    controller: newdCont,
    itemCount: Items.length,
    itemBuilder: (context, index) => Container(
        width: double.infinity,
        height: double.infinity,
        child: onbordin_Cubit.OnbotdinItems[index]),
  );
}

Widget bodyOfContect(BuildContext context, PageController newdCont) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: Text(
              key: ValueKey<onboarding>(
                  Items[onbordin_Cubit.get(context).curuntindex]),
              "${onbordin_Cubit.get(context).curuntindex == 0 ? Items[0].High_Title : onbordin_Cubit.get(context).curuntindex == 1 ? Items[1].High_Title : onbordin_Cubit.get(context).curuntindex == 2 ? Items[2].High_Title : ""}",
              style: TextStyle(
                  fontSize:
                      onbordin_Cubit.get(context).curuntindex == 0 ? 40 : 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "MyFONNN"),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Your order is Here",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 60,
      ),
      Contnet(context, newdCont),
    ],
  );
}

class Dots extends StatelessWidget {
  const Dots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        Items.length,
        (index) => AnimatedContainer(
          margin: EdgeInsets.symmetric(horizontal: 5),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: onbordin_Cubit.get(context).curuntindex == index ? 35 : 10,
          height: 10,
          decoration: BoxDecoration(
              color: onbordin_Cubit.get(context).curuntindex == index
                  ? Colors.white
                  : Colors.grey,
              borderRadius: BorderRadius.circular(500)),
        ),
      ),
    );
  }
}

Widget Contnet(BuildContext context, PageController newdCont) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        height: 171,
        color: const Color.fromARGB(0, 244, 67, 54),
        child: Column(
          children: [
            Container(
              child: Dots(),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "${onbordin_Cubit.get(context).curuntindex == 0 ? Items[0].CommitString : onbordin_Cubit.get(context).curuntindex == 1 ? Items[1].CommitString : onbordin_Cubit.get(context).curuntindex == 2 ? Items[2].CommitString : null}",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                if (onbordin_Cubit.get(context).curuntindex == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => welcomescreen()),
                  );
                } else {
                  newdCont.nextPage(
                      duration: Duration(milliseconds: 700),
                      curve: Curves.easeIn);
                }
              },
              child: Btn(context),
            )
          ],
        ),
      ),
    ],
  );
}

Widget Btn(BuildContext context) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 800),
    child: Container(
        alignment: Alignment.center,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeInOut,
          child: Text(
            key: ValueKey<onboarding>(
                Items[onbordin_Cubit.get(context).curuntindex]),
            "${onbordin_Cubit.get(context).curuntindex == 0 ? Items[0].StringsBTn : onbordin_Cubit.get(context).curuntindex == 1 ? Items[1].StringsBTn : onbordin_Cubit.get(context).curuntindex == 2 ? Items[2].StringsBTn : null}",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
        width: 206.61386108398438,
        height: 50.5544548034668,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.881187438964844),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                onbordin_Cubit.get(context).curuntindex == 2
                    ? Color(0xff1b81b4)
                    : Color(0xFF054759),
                Color(0xff1b81b4)
              ],
            ))),
  );
}
