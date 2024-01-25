import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../Core/methods/paymob_manager/paymob_manager.dart';
part 'payment_cubit_state.dart';

class PaymentCubitCubit extends Cubit<PaymentCubitState> {
  PaymentCubitCubit() : super(PaymentCubitInitial());
  static PaymentCubitCubit get(context) => BlocProvider.of(context);
  bool ispayment = false;
  Future<void> PymentNow({required double Amount}) async {
    ispayment = true;
    emit(PaymentDone());
    PaymobManager().getPaymentKey(Amount, "EGP").then((String paymentKey) {
      launchUrl(
        Uri.parse(
            "https://accept.paymob.com/api/acceptance/iframes/817850?payment_token=$paymentKey"),
      );
      ispayment = false;
      emit(PaymentDone());
    });
  }
}

// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// import '../../../../../Core/methods/paymob_manager/paymob_manager.dart';

// part 'payment_cubit_state.dart';

// class PaymentCubitCubit extends Cubit<PaymentCubitState> {
//   PaymentCubitCubit() : super(PaymentCubitInitial());

//   static PaymentCubitCubit get(context) =>
//       BlocProvider.of<PaymentCubitCubit>(context);

//   bool ispayment = false;

//   Future<void> PymentNow({required double amount, required context}) async {
//     ispayment = true;
//     emit(PaymentDone());

//     try {
//       final String paymentKey =
//           await PaymobManager().getPaymentKey(amount, "EGP");

//       showModalBottomSheet(
//         context: context,
//         builder: (context) => _buildBottomSheet(context, paymentKey),
//       );
//     } catch (error) {
//       print('Error during payment: $error');
//       // Handle the error as needed
//     } finally {
//       ispayment = false;
//       emit(PaymentDone());
//     }
//   }

//   Widget _buildBottomSheet(BuildContext context, String paymentKey) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Container(
//         height: 1800,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: WebView(
//             initialUrl:
//                 "https://accept.paymob.com/api/acceptance/iframes/817850?payment_token=$paymentKey",
//             javascriptMode: JavascriptMode.unrestricted,
//             navigationDelegate: (NavigationRequest request) {
//               // Override the navigation if needed
//               return NavigationDecision.navigate;
//             },
//             onPageFinished: (String url) {
//               // Handle page finished loading if needed
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
