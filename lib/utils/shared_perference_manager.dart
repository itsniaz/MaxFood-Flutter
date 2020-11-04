
import 'dart:convert';
import 'package:max_food/utils/constants.dart';
import 'package:max_food/viewmodel/model/menu.dart';
import 'package:max_food/viewmodel/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as JSON;

class PrefKeys
{
  static const String NAME = "name";
  static const String EMAIL = "email";
  static const String TOKEN = "token";
  static const String PHONE = "phone";
  static const String FAV_DISHES = "fav_dishes";
}

class SharedPrefManager{

  static SharedPrefManager _sharedPrefManager;

  static SharedPrefManager getInstance() {
    if (_sharedPrefManager == null) {
      _sharedPrefManager = SharedPrefManager();
    }
    return _sharedPrefManager;
  }


  void setName({String name}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PrefKeys.NAME, name);
  }


  Future<String> getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(PrefKeys.NAME);
  }

  void setEmail({String email}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PrefKeys.EMAIL, email);
  }


  Future<String> getEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(PrefKeys.EMAIL);
  }

  void setToken({String token}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PrefKeys.TOKEN, token);
  }


  Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(PrefKeys.TOKEN);
  }

  void setPhone({String phone}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PrefKeys.PHONE, phone);
  }


  Future<String> getPhone() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(PrefKeys.PHONE);
  }

  void saveUser(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PrefKeys.NAME, user.name);
    pref.setString(PrefKeys.EMAIL, user.email);
    pref.setString(PrefKeys.PHONE, user.phone);
    pref.setString(PrefKeys.TOKEN, user.token);
  }

  void _saveFavourites(String dishMap) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PrefKeys.FAV_DISHES, dishMap);
  }



  Future<Category> getFavouriteDishes() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String dishMap = pref.getString(PrefKeys.FAV_DISHES);
      Category category = Category.fromJson(JSON.jsonDecode(dishMap));
      return category;
    } catch (e) {

      return Category(
        id : -1,
        name: "Favourites",
        items: List()
      );

    }
  }

  Future<bool> addToFavourites(Dish dishItem) async{

    Category favCategory = await getFavouriteDishes();

    if(favCategory==null)
      {

        List<Dish> dishes = List();
        dishes.add(dishItem);

        Category category = Category()
        ..name = "Favourites"
        ..id = -1
        ..items = dishes;

        _saveFavourites(JSON.jsonEncode(category));
      }
    else
      {
        favCategory.items.add(dishItem);
        _saveFavourites(JSON.jsonEncode(favCategory));

      }
    Constants.favouriteCategory = favCategory;
    return true;
  }

  Future<bool> removeFromFavourites(Dish dishItem) async{

    Category favCategory = await getFavouriteDishes();

    if(favCategory!=null)
    {

      favCategory.items.removeWhere((dish){
        return dish.id == dishItem.id;
      });
      _saveFavourites(JSON.jsonEncode(favCategory));
    }

    Constants.favouriteCategory = favCategory;
    return true;
  }

}