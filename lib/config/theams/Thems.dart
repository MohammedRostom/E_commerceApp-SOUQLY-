// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../core/constant/current_local.dart';
// import '../colors/app_colors.dart';

// class Style {
//   static final ThemeData lightTheme = ThemeData(
//     scaffoldBackgroundColor: const Color(AppColors.kScaffoldBackGroundColor),
//     colorScheme: ThemeData().colorScheme.copyWith(
//           primary: const Color(AppColors.kPrimaryColor),
//           onPrimary: const Color(AppColors.kPrimaryColor),
//           onSurface: Colors.black,
//         ),
//     appBarTheme: AppBarTheme(
//       backgroundColor: const Color(AppColors.kScaffoldBackGroundColor),
//       elevation: 0,
//       titleTextStyle: GoogleFonts.aBeeZee(
//         color: Colors.black,
//         fontSize: 16.sp,
//       ),
//       systemOverlayStyle: const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarBrightness: Brightness.light,
//       ),
//       iconTheme: const IconThemeData(
//         color: Colors.black,
//       ),
//     ),
//     textTheme: TextTheme(
//       bodyLarge: isArabic()
//           ? GoogleFonts.elMessiri(
//               color: Colors.black,
//             )
//           : GoogleFonts.aBeeZee(
//               color: Colors.black,
//             ),
//       bodyMedium: isArabic()
//           ? GoogleFonts.elMessiri(
//               color: Colors.black,
//             )
//           : GoogleFonts.aBeeZee(
//               color: Colors.black,
//             ),
//       bodySmall: isArabic()
//           ? GoogleFonts.elMessiri(
//               color: Colors.black,
//             )
//           : GoogleFonts.aBeeZee(
//               color: Colors.black,
//             ),
//       titleLarge: isArabic()
//           ? GoogleFonts.elMessiri(
//               color: Colors.black,
//             )
//           : GoogleFonts.aBeeZee(
//               color: Colors.black,
//             ),
//       titleMedium: isArabic()
//           ? GoogleFonts.elMessiri(
//               color: Colors.black,
//             )
//           : GoogleFonts.aBeeZee(
//               color: Colors.black,
//             ),
//       titleSmall: isArabic()
//           ? GoogleFonts.elMessiri(
//               color: Colors.black,
//             )
//           : GoogleFonts.aBeeZee(
//               color: Colors.black,
//             ),
//     ),
//     iconTheme: const IconThemeData(
//       color: Colors.black,
//     ),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: Color(AppColors.kPrimaryColor),
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       backgroundColor: Color(AppColors.kScaffoldBackGroundColor),
//       selectedItemColor: Color(AppColors.kPrimaryColor),
//       unselectedItemColor: Colors.grey,
//       type: BottomNavigationBarType.fixed,
//     ),
//     textButtonTheme: TextButtonThemeData(
//       style: ButtonStyle(
//         textStyle: MaterialStateProperty.all(
//           isArabic()
//               ? GoogleFonts.elMessiri(
//                   color: const Color(
//                     AppColors.kPrimaryColor,
//                   ),
//                 )
//               : GoogleFonts.aBeeZee(
//                   color: const Color(
//                     AppColors.kPrimaryColor,
//                   ),
//                 ),
//         ),
//       ),
//     ),
//     datePickerTheme: DatePickerThemeData(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       headerBackgroundColor: const Color(AppColors.kPrimaryColor),
//       todayBackgroundColor: MaterialStateProperty.all(
//         const Color(AppColors.kPrimaryColor),
//       ),
//     ),
//   );

//   static final ThemeData darkTheme = ThemeData(
//     // scaffoldBackgroundColor: const Color(AppColors.kDarkThemColor),
//     colorScheme: ThemeData().colorScheme.copyWith(
//           primary: const Color(AppColors.kPrimaryColor),
//           onPrimary: const Color(AppColors.kPrimaryColor),
//           onSurface: Colors.white, // body text color
//           brightness: Brightness.dark,
//         ),
//     appBarTheme: AppBarTheme(
//       // backgroundColor: const Color(AppColors.kDarkThemColor),
//       elevation: 0,
//       backgroundColor: const Color(AppColors.appBarColor),
//       titleTextStyle: GoogleFonts.aBeeZee(
//         color: Colors.white,
//         fontSize: 18.sp,
//       ),
//       systemOverlayStyle: const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarBrightness: Brightness.dark,
//       ),
//       iconTheme: const IconThemeData(
//         color: Colors.white,
//       ),
//       actionsIconTheme: const IconThemeData(
//         color: Colors.white,
//       ),
//     ),
//     textTheme: TextTheme(
//       bodyLarge: isArabic()
//           ? GoogleFonts.elMessiri(
//               color: Colors.black,
//             )
//           : GoogleFonts.aBeeZee(
//               color: Colors.black,
//             ),
//       bodyMedium: isArabic()
//           ? GoogleFonts.elMessiri(
//               color: Colors.black,
//             )
//           : GoogleFonts.aBeeZee(
//               color: Colors.black,
//             ),
//       bodySmall: isArabic()
//           ? GoogleFonts.elMessiri(
//               color: Colors.black,
//             )
//           : GoogleFonts.aBeeZee(
//               color: Colors.black,
//             ),
//       titleLarge: isArabic()
//           ? GoogleFonts.elMessiri(
//               color: Colors.black,
//             )
//           : GoogleFonts.aBeeZee(
//               color: Colors.black,
//             ),
//       titleMedium: isArabic()
//           ? GoogleFonts.elMessiri(
//               color: Colors.black,
//             )
//           : GoogleFonts.aBeeZee(
//               color: Colors.black,
//             ),
//       titleSmall: isArabic()
//           ? GoogleFonts.elMessiri(
//               color: Colors.black,
//             )
//           : GoogleFonts.aBeeZee(
//               color: Colors.black,
//             ),
//     ),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: Color(AppColors.kPrimaryColor),
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       selectedItemColor: Color(AppColors.kPrimaryColor),
//       unselectedItemColor: Colors.white,
//       type: BottomNavigationBarType.fixed,
//     ),
//     buttonTheme: const ButtonThemeData(
//       buttonColor: Color(AppColors.kDarkThemColor),
//     ),
//     listTileTheme: const ListTileThemeData(
//       iconColor: Colors.white,
//     ),
//     textButtonTheme: TextButtonThemeData(
//       style: ButtonStyle(
//         textStyle: MaterialStateProperty.all(
//           GoogleFonts.aBeeZee(
//             color: Colors.white,
//           ),
//         ),
//       ),
//     ),
//     datePickerTheme: DatePickerThemeData(
//       backgroundColor: const Color(AppColors.kDarkThemColor),
//       headerHeadlineStyle: GoogleFonts.aBeeZee(color: Colors.white),
//       headerHelpStyle: GoogleFonts.aBeeZee(color: Colors.white),
//       dayStyle: GoogleFonts.aBeeZee(color: Colors.white),
//       rangePickerHeaderHeadlineStyle: GoogleFonts.aBeeZee(color: Colors.white),
//       rangePickerHeaderHelpStyle: GoogleFonts.aBeeZee(color: Colors.white),
//       yearStyle: GoogleFonts.aBeeZee(color: Colors.white),
//       weekdayStyle: GoogleFonts.aBeeZee(color: Colors.white),
//       surfaceTintColor: Colors.white,
//     ),
//     timePickerTheme: const TimePickerThemeData(
//       backgroundColor: Color(AppColors.kDarkThemColor),
//     ),
//     iconTheme: const IconThemeData(
//       color: Colors.white,
//     ),
//   );
// }