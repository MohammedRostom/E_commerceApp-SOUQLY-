import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/data/models/categorymodel.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/data/models/productmodel.dart';
import 'package:useCubitToKeebUserloginedAnddarkmode/features/Featshers/data/data_sources/remote/Api/ApiServises.dart';

class reboApi {
  List<Categorymodel> newgroupOfCtegory = [];

  Future<dynamic> GetCategoryfromrepo() async {
    List<dynamic> Categorys = await GetDataFromApi().GetCategorys();
    try {
      Categorys.forEach((element) {
        print(" $element \n");

        Categorymodel categorymodel = Categorymodel(CategoryName: element);
        newgroupOfCtegory.add(categorymodel);
      });
      print("==========> ${newgroupOfCtegory.length} \n");
      return await newgroupOfCtegory;
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  List<ProductModel> newgroupOfProducts = [];
  Future<dynamic> GetProductsfromrepo() async {
    List<dynamic> products = await GetDataFromApi().Getproducts();

    try {
      products.forEach((element) {
        print("==========> $element \n");
        ProductModel productmodel = ProductModel.fromJson(element);
        newgroupOfProducts.add(productmodel);
      });
      print("==========> ${newgroupOfProducts.length} \n");
      return await newgroupOfProducts;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
