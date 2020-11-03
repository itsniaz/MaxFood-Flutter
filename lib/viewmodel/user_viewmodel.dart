import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:max_food/network/api_provider.dart';
import 'package:max_food/utils/shared_perference_manager.dart';

import 'model/user.dart';


enum ViewState{
  INITIAL,
  LOADING,
  REGISTERED,
  FAILED,
}

class SignUpViewModel with ChangeNotifier
{
    ViewState currentState = ViewState.INITIAL;
    User _user = User();
    String error = "";
    Map<String,dynamic> formErrors;

    User get user => _user;

    void registerUser()
    {


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
          onFromValueError: (errors){
            currentState = ViewState.FAILED;
            formErrors = errors;
            error= "";
            notifyListeners();

          },
          onRegisterFailure: (reason) {
            currentState = ViewState.FAILED;
            error = reason;
            notifyListeners();

          });
    }

    void authenticate()
    {

    }
}