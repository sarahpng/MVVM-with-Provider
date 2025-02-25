import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/repository/auth_repository.dart';
import 'package:mvvm_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_with_provider/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  final myRepo = AuthRepository();

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    myRepo.loginApi(data).then((value) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushbarErrorMessages('Login Successfully', context);
        Navigator.pushNamed(context, RoutesName.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushbarErrorMessages(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    myRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      if (kDebugMode) {
        Utils.flushbarErrorMessages('Sign up Successfully', context);
        Navigator.pushNamed(context, RoutesName.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if (kDebugMode) {
        Utils.flushbarErrorMessages(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
