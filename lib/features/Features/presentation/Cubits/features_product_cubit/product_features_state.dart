part of 'product_features_cubit.dart';

@immutable
sealed class ProductFeaturesState {}

final class ProductFeaturesInitial extends ProductFeaturesState {}

final class Laoding extends ProductFeaturesState {}

final class Addedproduct extends ProductFeaturesState {}

final class Change_Valuefrom_Action extends ProductFeaturesState {}

final class ErrorHappend extends ProductFeaturesState {}
