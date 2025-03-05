import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/data/response/api_response.dart';
import 'package:mvvm_with_provider/model/movies_model.dart';
import 'package:mvvm_with_provider/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final _repo = HomeRepository();
  ApiResponse<MoviesModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());
    _repo.fetchMoviesList().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(
        ApiResponse.error(
          error.toString(),
        ),
      );
    });
  }
}
