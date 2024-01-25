import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/categorymodel.dart';
import '../../../data/models/productmodel.dart';
import '../../../data/repositories_impl/rebo/Api_repo.dart';
part 'get_allproducts_state.dart';

class GetAllproductsCubit extends Cubit<GetAllproductsState> {
  GetAllproductsCubit() : super(GetAllproductsInitial());
  static GetAllproductsCubit get(contexct) =>
      BlocProvider.of<GetAllproductsCubit>(contexct);
  bool isloadingg = false;
  bool productLaodng = false;
  List<ProductModel> groupOproducts = [];
  Future<List<ProductModel>> GetAllProducts() async {
    try {
      productLaodng = true;
      emit(loadingdata());
      groupOproducts = await reboApi().GetProductsfromrepo();

      productLaodng = false;
      emit(Successloadingdata());
    } on Exception catch (e) {}
    return groupOproducts;
  }

  List<ProductModel> newp1 = [];
  bool gatedorySlected = false;

  Future<List<ProductModel>> GetNameOfCategory(namcategory) async {
    GetCtegory = true;
    gatedorySlected = true;
    productLaodng = true;

    emit(Successloadingdata());
    print(namcategory);
    List<ProductModel> products = await GetAllProducts();
    newp1 = products
        .where((element) => element.category.contains("$namcategory"))
        .toList();
    GetCtegory = false;
    emit(Successloadingdata());

    emit(Successloadingdata());
    print(newp1.length);
    return await newp1;
  }

  bool GetCtegory = false;

  List<Categorymodel> groupOCategorys = [];
  Future<List<Categorymodel>> GetAllCategorys() async {
    GetCtegory = true;
    emit(loadingdata());
    groupOCategorys = await reboApi().GetCategoryfromrepo();
    groupOCategorys.insert(0, Categorymodel(CategoryName: "All"));

    try {
      GetCtegory = false;
      gatedorySlected = false;
      emit(Successloadingdata());
    } on Exception catch (e) {
      // TODO
    }
    print(groupOCategorys.length);
    return await groupOCategorys;
  }

  void CallAllMethodsMustBeCalledGetAllData() async {
    isloadingg = true;
    List<ProductModel> products = await GetAllProducts();
    emit(Successloadingdata());

    await GetAllCategorys();
    isloadingg = false;
    emit(Successloadingdata());
  }
}
