import 'package:flutter/foundation.dart';
import 'package:max_food/network/api_provider.dart';
import 'package:max_food/utils/constants.dart';
import 'package:max_food/utils/shared_perference_manager.dart';
import 'model/menu.dart' as MenuModel;
import 'model/menu.dart';


enum ViewState{
  INITIAL,
  LOADING,
  DATA
}

class MenuViewModel extends ChangeNotifier
{

  List<MenuModel.Category> categories;
  MenuModel.Category favCategory;
  ViewState viewState = ViewState.INITIAL;
  Map<int,int> cart = Map();
  int chosenCategoryIndex = -1;



  MenuViewModel()
  {
    getMenu();
  }

  void getMenu()
  {
    viewState = ViewState.LOADING;
    categories = List();

    ApiProvider.getInstance().getMenu(onMenuFetched: (MenuModel.Menu menu){
      viewState = ViewState.DATA;
      this.categories = menu.categories;
      this.favCategory = Constants.favouriteCategory;
      categories.add(favCategory);
      notifyListeners();
    });
  }

  Future<void> makeFavourite(Dish dish)
  async {
    await SharedPrefManager.getInstance().addToFavourites(dish);
    categories.removeLast();
    favCategory = Constants.favouriteCategory;
    categories.add(favCategory);
    notifyListeners();
  }

  Future<void> unFavourite(Dish dish)
  async {
    await SharedPrefManager.getInstance().removeFromFavourites(dish);
    categories.removeLast();
    favCategory = Constants.favouriteCategory;
    categories.add(favCategory);
    notifyListeners();
  }

  void addToCart(int dishId)
  {
    cart.update(dishId, (value)=> value+1,ifAbsent: ()=>1);
    notifyListeners();
  }

  void reduceFromCart(int dishId)
  {
    cart.update(dishId, (value)=> value-1,ifAbsent: ()=>0);
    notifyListeners();
  }

  void removeFromCart(int dishId)
  {
    cart.remove(dishId);
    notifyListeners();
  }

}