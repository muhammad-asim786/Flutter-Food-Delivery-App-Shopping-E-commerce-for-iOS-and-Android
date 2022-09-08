import 'package:delivery_app/data/api/api_clients.dart';
import 'package:delivery_app/utils/app_constant.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClients apiClients;

  PopularProductRepo({required this.apiClients});

  Future<Response> getPopularProductList() async {
    return await apiClients.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
