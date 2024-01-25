import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/Constant.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/Core/utils/colors.dart';
import '../../../data/data_sources/local/databses/DataBases helper.dart';
import '../../../data/models/productmodel.dart';
import '../../../../../Core/widgets/SmallWidgets/widgets.dart';
part 'product_features_state.dart';

class ProductFeaturesCubit extends Cubit<ProductFeaturesState> {
  ProductFeaturesCubit() : super(ProductFeaturesInitial());
  var databasesHelper = DataBasesHelper.db;
  static ProductFeaturesCubit get(context) =>
      BlocProvider.of<ProductFeaturesCubit>(context);

  List<ProductModel> Alldatafromdatabases = [];
  List<ProductModel> AlldatafromdatabasesFaforite = [];

// Show data Method
  Future<List<ProductModel>> ShowAllData({@required tableName}) async {
    emit(Laoding());
    if (tableName != constant.CartTable) {
      AlldatafromdatabasesFaforite =
          await databasesHelper?.GetDataAllfromDatabasesFromFav()
              as List<ProductModel>;
      print(
          "========================>Databases Faforite:${AlldatafromdatabasesFaforite.length}");
      emit(Laoding());
      return AlldatafromdatabasesFaforite;
    } else {
      Alldatafromdatabases = await databasesHelper?.GetDataAllfromDatabases()
          as List<ProductModel>;
      print(
          "========================>Databases:${Alldatafromdatabases.length}");
      emit(Laoding());

      return Alldatafromdatabases;
    }
  }

// Insert Methods
  bool ProductAdded = false;
  bool ProductAddedtoFavorite = false;
  Future<void> AddProduct(ProductModel product, context,
      {@required tablename}) async {
    ProductAdded = true;
    emit(Laoding());

    bool productExists =
        Alldatafromdatabases.any((element) => element.id == product.id);
    bool productExistsFaforite =
        AlldatafromdatabasesFaforite.any((element) => element.id == product.id);

    if (tablename != constant.CartTable) {
      if (productExistsFaforite) {
        MAssegeSnakbarr(
            context, "Product already added Before ?", Colors_App.DarkColorto);
      } else {
        MAssegeSnakbarr(
            context,
            "${AlldatafromdatabasesFaforite.length + 1} in Favorite",
            Colors_App.blueColorto);

        databasesHelper?.insertDataInUserModelFromFav(product);
        await ShowAllData(tableName: constant.FavoriteTable);
        if (productExistsFaforite) {
          MAssegeSnakbarr(context, "Product already added Before ?",
              Colors_App.DarkColorto);
        }
      }
    } else {
      if (productExists) {
        MAssegeSnakbarr(
            context, "Product already added Before ?", Colors_App.DarkColorto);
      } else {
        MAssegeSnakbarr(context, "${Alldatafromdatabases.length + 1} in Cart",
            Colors_App.blueColorto);

        databasesHelper?.insertDataInUserModel(product);
        await ShowAllData(tableName: constant.CartTable);
      }
    }
    ProductAdded = false;
    emit(Laoding());
  }

// Delete Methods
  bool removeSelected = false;
  Future<bool> removeProduct(Id, context, {required tablename}) async {
    var databasesHelper = DataBasesHelper.db;
    if (tablename != constant.CartTable) {
      await databasesHelper?.DeleteDataOnlyOneRowFromFav(Id);

      await ShowAllData(tableName: constant.FavoriteTable);

      emit(Laoding());
    } else {
      await databasesHelper?.DeleteDataOnlyOneRow(Id);
      sumofpricemodel();
    }
    MAssegeSnakbarr(context, " Delete is done", Colors_App.blueColorto);
    emit(Laoding());
    return true;
  }

  bool isFavorite(ProductModel product, context) =>
      AlldatafromdatabasesFaforite.any((element) => element.id == product.id);
  void toggleFavorite(ProductModel item, context) async {
    if (!isFavorite(item, context)) {
      AddProduct(item, context, tablename: constant.FavoriteTable);
    } else {
      removeProduct(item.id, context, tablename: constant.FavoriteTable);
    }
  }

  bool isCard(ProductModel product, context) =>
      Alldatafromdatabases.any((element) => element.id == product.id);
  void toggelcart(ProductModel item, context) async {
    ProductAdded == true;
    emit(Addedproduct());
    if (!isCard(item, context)) {
      AddProduct(item, context, tablename: constant.CartTable);
      ProductAdded == false;
      emit(Addedproduct());
    } else {
      removeProduct(item.id, context, tablename: constant.CartTable);
    }
  }

  double totalPrice = 0.0;
  sumofpricemodel() async {
    List<ProductModel> lidst = await ShowAllData(tableName: constant.CartTable);
    totalPrice = lidst.fold(
        0,
        (previousValue, element) =>
            previousValue + double.parse(element.price));
    for (var i = 0; i < Alldatafromdatabases.length; i++) {
      totalPrice += await (double.parse(Alldatafromdatabases[i].price!) *
          Alldatafromdatabases[i].Amount!);
    }
    print(totalPrice);
    emit(Laoding());
  }

  Increementquantity(index) {
    var newAmount;
    newAmount = Alldatafromdatabases[index].Amount++;
    print(newAmount);
    totalPrice += double.parse(Alldatafromdatabases[index].price);
    print(totalPrice);
    emit(Change_Valuefrom_Action());
  }

  Decreementquantity(index) {
    var newAmount = Alldatafromdatabases[index].Amount--;
    print(Alldatafromdatabases[index].Amount);
    totalPrice -= double.parse(Alldatafromdatabases[index].price);

    print(totalPrice);
    emit(Change_Valuefrom_Action());
    sumofpricemodel();
  }

  int cuindex = 0;
  List<String> Sizeofproduct = ["S", "M", "L"];
  String SelectedSize = "S";
  ToggelSelectedSize(index, size) {
    cuindex = index;
    SelectedSize = size;
    emit(Change_Valuefrom_Action());
  }

  List<Map<String, dynamic>> SelectColorOfproduct = [
    {"Color": Colors.red, "NameColor": "red"},
    {"Color": Colors.green, "NameColor": "green"},
    {"Color": Colors.blue, "NameColor": "blue"},
  ];
  Color isSelctedProductColor = Colors.red;
  SelctedProductColor(IndexSelectedColor) {
    print(IndexSelectedColor);
    isSelctedProductColor = SelectColorOfproduct[IndexSelectedColor]["Color"];
    emit(Change_Valuefrom_Action());
  }

  bool isreadmore = false;
  readMore() {
    isreadmore = !isreadmore;
    emit(Change_Valuefrom_Action());
  }

  void CallAllMethodsMustBeCalledP() {
    ShowAllData(tableName: constant.CartTable);
    ShowAllData(tableName: constant.FavoriteTable);
    sumofpricemodel();
  }
}
