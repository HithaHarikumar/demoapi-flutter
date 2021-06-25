

import 'package:demolistapi/remote_services.dart';
import 'package:get/get.dart';

import '../product.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Images>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiCall.fetchImages();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}