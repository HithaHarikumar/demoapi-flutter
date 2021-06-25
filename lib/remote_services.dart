import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'product.dart';

// class RemoteServices {
//   static var client = http.Client();
//
//
//
//   static Future<List<Product>> fetchProducts() async {
//     var response = await client.get(Uri.parse(
//         'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
//     if (response.statusCode == 200) {
//       var jsonString = response.body;
//       return productFromJson(jsonString);
//     } else {
//       //show error message
//       return null;
//     }
//   }
// }




class ApiCall{
  static  ApiCall apiRequest = new ApiCall();
  static Future <List<Images>?> fetchImages () async {
    try {
      final _dioInstance = Dio();
      _dioInstance.options.headers['Authorization'] = 'Client-ID L4slwGIywDElb1btpBrikJZpozksvydCo-B0OsjFYEU';
      var response = await _dioInstance.get('https://api.unsplash.com/photos');
      if (response.statusCode == 200) {
        var jsonString = response.data;
        print(jsonString);
        return imageFromJson(jsonString);
      } else {
        //show error message
        return null;
      }
      print(response);
    } catch (e) {
      print(e);
    }
  }


}