import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/Constant.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/firebase_options.dart';
import 'Core/cache/cachprefranses.dart';
import 'Core/utils/colors.dart';
import 'config/routing/routing_functions.dart';
import 'features/Featshers/presentation/Cubits/Add_photo_profile_cubit/add_photo_profile_cubit_cubit.dart';
import 'features/Featshers/presentation/Cubits/Auth_cubit_featsure/Auth_cubit.dart';
import 'features/Featshers/presentation/Cubits/Getprouducrs_cubits/get_allproducts_cubit.dart';
import 'features/Featshers/presentation/Cubits/Main_cubit/maincubit_cubit.dart';
import 'features/Featshers/presentation/Cubits/Onborading_cubit/Onboradingcounter_cubit.dart';
import 'features/Featshers/presentation/Cubits/payment_cubit_cubit/payment_cubit_cubit.dart';
import 'features/Featshers/presentation/Cubits/features_product_cubit/product_features_cubit.dart';
import 'features/Featshers/presentation/Cubits/searsh_cubit/searsh_cubit_cubit.dart';
import 'Core/widgets/startManger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await PreferencesService.init();
  var email = PreferencesService.getUserName("Username");
  var Boolmode = PreferencesService.getbool("bool");
  var profile = PreferencesService.getUserName("ProfilePhoto");
  print(Boolmode);
  print(profile);
  ProductFeaturesCubit()
    ..ShowAllData(tableName: constant.CartTable)
    ..ShowAllData(tableName: constant.FavoriteTable);
  print(email);
  runApp(MyApp(
    email: email,
    boolmode: Boolmode,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.email, this.boolmode});
  final email, boolmode;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MaincubitCubit()
              ..CallAllMethodsMustBeCalledM()
              ..changethem(change: boolmode)),
        BlocProvider(
          create: (context) => Auth_cubit(),
        ),
        BlocProvider(
          create: (context) =>
              GetAllproductsCubit()..CallAllMethodsMustBeCalledGetAllData(),
        ),
        BlocProvider(
          create: (context) => SearshCubitCubit(),
        ),
        BlocProvider(
            create: (context) =>
                ProductFeaturesCubit()..CallAllMethodsMustBeCalledP()),
        BlocProvider(
          create: (context) => AddPhotoProfileCubitCubit(),
        ),
        BlocProvider(
          create: (context) => PaymentCubitCubit(),
        ),
        BlocProvider(
          create: (context) => onbordin_Cubit(),
        ),
      ],
      child: BlocBuilder<MaincubitCubit, MaincubitState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: Colors_App.ColorForbackscreen),
            routes: routing.MapOfAppRoutes,
            home: StartManger(context, email),
          );
        },
      ),
    );
  }
}
