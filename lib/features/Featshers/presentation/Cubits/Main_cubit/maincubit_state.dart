part of 'maincubit_cubit.dart';

@immutable
sealed class MaincubitState {}

final class MaincubitInitial extends MaincubitState {}

final class ChangeThems extends MaincubitState {}

final class ChangePhoto extends MaincubitState {}

final class ChangeValue extends MaincubitState {}
