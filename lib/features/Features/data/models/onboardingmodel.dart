import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/Constant.dart';

class onboarding {
  final String image;
  final String CommitString;
  final String StringsBTn;
  final String High_Title;

  onboarding(
      {required this.image,
      required this.CommitString,
      required this.StringsBTn,
      required this.High_Title});
}

List<onboarding> Items = [
  onboarding(
      image: "${constant.commenPath}/On_boarding_Assets/1.png",
      CommitString: "Join with us",
      StringsBTn: "Continue",
      High_Title: "Hi,"),
  onboarding(
      image: "${constant.commenPath}/On_boarding_Assets/2.png",
      CommitString: "Start shpping",
      StringsBTn: "Continue",
      High_Title: "Enjoy with us"),
  onboarding(
      image: "${constant.commenPath}/On_boarding_Assets/3.png",
      CommitString: "With Souqly",
      StringsBTn: "Get started",
      High_Title: "Buy And Sell"),
];
