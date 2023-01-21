import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class GetProducts {
  Future<List<Products>> showProducts() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    } else {
      print(response.statusCode);
      throw Exception(response.statusCode);
    }
  }
}