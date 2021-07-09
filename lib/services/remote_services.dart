import 'dart:convert';
import 'package:demolistapi/exception/httpexception.dart';
import 'package:dio/dio.dart';
import '../product.dart';


class DioServices {
  BaseOptions _options = BaseOptions(
    baseUrl: 'https://api.unsplash.com/',
    followRedirects: false,validateStatus: (status) => true,
  );

  Future getAPI(String url) async {
    try {
      final _dioInstance = Dio(_options);
      _dioInstance.options.headers['Authorization'] =
      'Client-ID L4slwGIywDElb1btpBrikJZpozksvydCo-B0OsjFYEU';
      final response = await _dioInstance
          .request(url, options: Options(method: 'GET'))
          .catchError((error) {
      //     // debugPrint(error.toString());
        throw httpexception(500, msg: "Server Error");
      });
      print(response.statusCode);

      if (response.statusCode! < 200 || response.statusCode! > 200) {
        throw httpexception(response.statusCode!);
      } else {
        List<dynamic> jsonString = response.data;
        String jsondata = json.encode(jsonString);
        print(jsonString);
        return imageFromJson(jsondata);
      }
    }
    catch (e) {
      throw e;
    }
  }

  Future<dynamic> postAPI() async {
    final _dioInstance = Dio(_options);
    final response = await _dioInstance.request(
      '/api',
      options: Options(method: 'POST'),
    );
  }
}
