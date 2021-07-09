import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:demolistapi/services/getit.dart';
import 'package:demolistapi/services/remote_services.dart';
import 'package:get/get.dart';
import '../product.dart';

class ProductController extends GetxController {
  RxBool isLoading = true.obs;
  RxList productList = <Images>[].obs;
  RxString url = 'photos'.obs;
  RxString error = "" .obs;
  RxBool isNetWorkAvailable = true.obs;
  DioServices dioServices = locator<DioServices>();
  StreamSubscription? sub;

  @override
  Future<void> onInit() async {
    // error.value = "";
    sub = Connectivity().onConnectivityChanged.listen((result) {
      isNetWorkAvailable(result != ConnectivityResult.none);
    });

    final connectivityResult = await Connectivity().checkConnectivity();
    print(connectivityResult );
    if(connectivityResult == ConnectivityResult.none){
      print('No internet Connection');
      error.value = "No internet Connection";
      return null;
    }

    fetchProducts();
    super.onInit();
  }

  @override
    void dispose() {
    sub!.cancel();
    super.dispose();
  }

  void fetchProducts() async {
    try {
      error.value ='';
      isLoading(true);
      List products = await dioServices.getAPI(url.toString());

      if (products != null) {
       productList.value = products;
       print(products);

      }
    } catch (e) {
      error.value = e.toString();
      print(e);
    }
    finally {
      isLoading(false);
    }
  }
}