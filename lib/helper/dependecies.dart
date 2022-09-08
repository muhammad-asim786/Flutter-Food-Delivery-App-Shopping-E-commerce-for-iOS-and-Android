import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/controllers/popular_product_cotroller.dart';
import 'package:delivery_app/data/api/api_clients.dart';
import 'package:delivery_app/data/repository/cart_repo.dart';
import 'package:delivery_app/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/recommended_product_conroller.dart';
import '../data/repository/recommended_product_repo.dart';
import '../utils/app_constant.dart';

Future<void> init() async {
  final sharedPreference = await  SharedPreferences.getInstance();
  Get.lazyPut(()=> sharedPreference);
  //api Clients*********
  Get.lazyPut(() => ApiClients(appBaseUrl: AppConstants.BASE_URL));

  // Repos**********
  Get.lazyPut(() => PopularProductRepo(apiClients: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClients: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //Controlle *********
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find(),));
  Get.lazyPut(() => CartController(cartRepo:  Get.find()));
}
