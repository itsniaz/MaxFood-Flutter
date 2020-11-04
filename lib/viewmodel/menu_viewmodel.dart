import 'package:flutter/foundation.dart';
import 'package:max_food/network/api_provider.dart';
import 'model/menu.dart' as MenuModel;


enum ViewState{
  INITIAL,
  LOADING,
  DATA
}

class MenuViewModel extends ChangeNotifier
{

  List<MenuModel.Category> categories;
  ViewState viewState = ViewState.INITIAL;

  MenuViewModel()
  {
    getMenu();
  }

  void getMenu()
  {
    viewState = ViewState.LOADING;

    ApiProvider.getInstance().getMenu(onMenuFetched: (MenuModel.Menu menu){
      this.categories = menu.categories;
      notifyListeners();
    });
  }
}