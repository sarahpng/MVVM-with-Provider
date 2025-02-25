import 'package:mvvm_with_provider/data/network/base_api_services.dart';
import 'package:mvvm_with_provider/data/network/network_api_service.dart';
import 'package:mvvm_with_provider/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.loginEndPoint,
        data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.registerEndPoint,
        data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
