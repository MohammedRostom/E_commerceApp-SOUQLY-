import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/productmodel.dart';
import '../Getprouducrs_cubits/get_allproducts_cubit.dart';

part 'searsh_cubit_state.dart';

class SearshCubitCubit extends Cubit<SearshCubitState> {
  SearshCubitCubit() : super(SearshCubitInitial());

  static SearshCubitCubit get(context) =>
      BlocProvider.of<SearshCubitCubit>(context);

  bool isStartedSearch = false;
  List<ProductModel> GroupFoResultsfromSearched = [];

  Future<List<ProductModel>> SearchProducts({@required value}) async {
    isStartedSearch = true;
    emit(Loadingproducts());
    List<ProductModel> products = await GetAllproductsCubit().GetAllProducts();
    print(products.length);
    GroupFoResultsfromSearched = products
        .where((element) => element.title.contains("${value}"))
        .toList();

    isStartedSearch = false;
    print(GroupFoResultsfromSearched.length);
    emit(productsAppered());
    return GroupFoResultsfromSearched;
  }
}
