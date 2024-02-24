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
