part of 'payment_cubit_cubit.dart';

@immutable
sealed class PaymentCubitState {}

final class PaymentCubitInitial extends PaymentCubitState {}

final class PaymentDone extends PaymentCubitState {}

final class PaymentError extends PaymentCubitState {}
