import 'package:http/http.dart';

import '../model/product_model.dart';

class Network {
  Future<List<ProductModel>> getData() async {
    const String url = 'https://api.escuelajs.co/api/v1/products';
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception('Failed to load request');
    }
  }
}
