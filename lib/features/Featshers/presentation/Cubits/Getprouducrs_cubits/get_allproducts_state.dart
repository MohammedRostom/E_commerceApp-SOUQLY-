part of 'get_allproducts_cubit.dart';

@immutable
sealed class GetAllproductsState {}

final class GetAllproductsInitial extends GetAllproductsState {}

final class loadingdata extends GetAllproductsState {}

final class Errorloadingdata extends GetAllproductsState {}

final class Successloadingdata extends GetAllproductsState {}

final class Mydata extends GetAllproductsState {}
