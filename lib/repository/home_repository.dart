import 'package:mvvm_with_provider/data/network/base_api_services.dart';
import 'package:mvvm_with_provider/data/network/network_api_service.dart';
import 'package:mvvm_with_provider/model/movies_model.dart';
import 'package:mvvm_with_provider/res/app_url.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<MoviesModel> fetchMoviesList() async {
    try {
      dynamic response = await _apiServices.getResponse(
        AppUrl.moviesListEndPoint,
      );
      return response = MoviesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
