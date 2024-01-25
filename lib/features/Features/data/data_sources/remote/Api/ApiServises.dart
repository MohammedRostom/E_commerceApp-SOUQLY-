import 'package:useCubitToKeebUserloginedAnddarkmode/Core/Api_helper/api.dart';

class GetDataFromApi {
  Future<List<dynamic>> GetCategorys() async {
    List<dynamic> response = await ApiHelper().get(
      url: "https://fakestoreapi.com/products/categories",
    );
    print(response);
    return response;
  }

  Future<dynamic> Getproducts() async {
    var response = await ApiHelper().get(
      url: "https://fakestoreapi.com/products",
    );
    print(response);
    return response;
  }
}
