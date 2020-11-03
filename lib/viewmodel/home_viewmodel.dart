

import 'package:flutter/cupertino.dart';
import 'package:max_food/network/api_provider.dart';
import 'package:max_food/viewmodel/model/home.dart';

enum ViewState{
  INITIAL,
  LOADING,
  DATA,
  FAILED
}

class HomeViewModel extends ChangeNotifier{

  Home _home;
  Home get home => _home;
  ViewState viewState = ViewState.INITIAL;
  String error;

  HomeViewModel()
  {
    getHomeInfo();
  }

  void getHomeInfo()
  {
    viewState = ViewState.LOADING;
    notifyListeners();

    ApiProvider.getInstance().getHomeInfo(onHomeDataFetched: (Home home){
      _home = home;
      notifyListeners();
    },
    onFailure: (reason) {
      error = reason;
      viewState = ViewState.FAILED;
    }
    );
  }
}