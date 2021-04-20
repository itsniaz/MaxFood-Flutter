import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:max_food/network/api_provider.dart';
import 'package:max_food/utils/shared_perference_manager.dart';

import 'model/user.dart';

enum ViewState {
  INITIAL,
  LOADING,
  REGISTERED,
  LOGGED_IN,
  FAILED,
}

class UserViewModel with ChangeNotifier {
  ViewState currentState = ViewState.INITIAL;
  User _user = User();
  String signUpError = "";
  String loginError = "";
  Map<String, dynamic> formErrors;

  User get user => _user;

  void registerUser() {
    currentState = ViewState.LOADING;
    notifyListeners();

    ApiProvider.getInstance().registerUser(
        user: user,
        onRegisterSuccess: (User user) {
          user = user;
          currentState = ViewState.REGISTERED;
          SharedPrefManager.getInstance().setEmail(email: user.email);
          SharedPrefManager.getInstance().setName(name: user.name);
          SharedPrefManager.getInstance().setToken(token: user.token);
          notifyListeners();
        },
        onFromValueError: (errors) {
          currentState = ViewState.FAILED;
          formErrors = errors;
          signUpError = "";
          notifyListeners();
        },
        onRegisterFailure: (reason) {
          currentState = ViewState.FAILED;
          signUpError = reason;
          notifyListeners();
          signUpError = "";
        });
  }

  void authenticate({String email, String password}) {
    currentState = ViewState.LOADING;
    notifyListeners();
    ApiProvider.getInstance().authenticate(
        email: email,
        password: password,
        onAuthSuccess: (User user) async {
          _user = user;
          currentState = ViewState.REGISTERED;
         await SharedPrefManager.getInstance().saveUser(user);
         notifyListeners();
        },
        onAuthFailure: (String reason) {
          loginError = reason;
          currentState = ViewState.FAILED;
          notifyListeners();
          // loginError = "";
        });
  }
}
