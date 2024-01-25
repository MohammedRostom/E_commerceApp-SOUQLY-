part of 'searsh_cubit_cubit.dart';

@immutable
sealed class SearshCubitState {}

final class SearshCubitInitial extends SearshCubitState {}

final class Loadingproducts extends SearshCubitState {}

final class productsAppered extends SearshCubitState {}
