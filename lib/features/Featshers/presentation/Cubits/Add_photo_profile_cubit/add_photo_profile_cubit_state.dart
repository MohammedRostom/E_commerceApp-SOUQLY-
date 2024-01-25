part of 'add_photo_profile_cubit_cubit.dart';

@immutable
sealed class AddPhotoProfileCubitState {}

final class AddPhotoProfileCubitInitial extends AddPhotoProfileCubitState {}

final class Added extends AddPhotoProfileCubitState {}

final class photoloading extends AddPhotoProfileCubitState {}
