import 'package:delivery_app/data/api/api_clients.dart';
import 'package:delivery_app/utils/app_constant.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClients apiClients;

  RecommendedProductRepo({required this.apiClients});

  Future<Response> getRecommendedProductList() async {
    return await apiClients.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
