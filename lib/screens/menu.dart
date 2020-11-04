import 'dart:collection';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:badges/badges.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:max_food/network/api_provider.dart';
import 'package:max_food/utils/constants.dart';
import 'package:max_food/utils/custom_icons_icons.dart';
import 'package:max_food/utils/shared_perference_manager.dart';
import 'package:max_food/viewmodel/menu_viewmodel.dart';
import 'package:max_food/viewmodel/model/menu.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuScreenState();
  }
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  List<Category> categories;

  int chosenIndex = 0;

  @override
  void initState() {
    super.initState();

  }

  Widget build(BuildContext context) {

      return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text("Explore"),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () => print("Pressed Search"))
              ],
            ),
            body: MenuScreenBody(),
          );
    }
}

class MenuScreenBody extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return  _MenuScreenBodyState();
  }

}

class _MenuScreenBodyState extends State<MenuScreenBody> with TickerProviderStateMixin
{

  TabController _tabController;
  MenuViewModel _menuViewModel;
  List<Category> categories;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    _menuViewModel = Provider.of<MenuViewModel>(context,listen: false);
    categories = _menuViewModel.categories;
    _tabController = TabController(length: categories.length, vsync: this);

    if(_menuViewModel.chosenCategoryIndex != -1)
      {
        _tabController.animateTo(_menuViewModel.chosenCategoryIndex);
        _menuViewModel.chosenCategoryIndex = -1;
      }

    if(_menuViewModel.viewState == ViewState.LOADING)
      {
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }


      return Column(
            children: [
              Container(
                color: Colors.red,
                height: 4.0,
              ),
              Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TabBar(
                    isScrollable: true,
                    indicator: new BubbleTabIndicator(
                      indicatorHeight: 28.0,
                      indicatorColor: Colors.white,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    ),
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.white,
                    controller: _tabController,
                    tabs: categories
                        .map((e) => Tab(
                      child: Text(e.name),
                    ))
                        .toList()),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 0.0),
                  child: TabBarView(
                    controller: _tabController,
                    children:
                    categories.asMap().entries.map((category) => DishItemWidget(index: category.key,)).toList(),
                  ),
                ),
              ),
              CartNavigator()
            ],
          );
    }

}


class DishItemWidget extends StatelessWidget{

  DishItemWidget({this.index});
  final int index;


  @override
  Widget build(BuildContext context) {

    final MenuViewModel _menuViewModel =  Provider.of<MenuViewModel>(context);

    Category category = _menuViewModel.categories[index];

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: category.items.length,
              itemBuilder: (ctx, index) {

                Dish dish =  category.items[index];
                var filteredDish = _menuViewModel.favCategory.items.firstWhere((Dish favDish) => favDish.id == dish.id,orElse: ()=>null);
                dish.isFav = filteredDish != null;

                return Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(8.0),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              placeholder: (ctx,url)=>Image.asset("assets/images/loading.gif"),
                              imageUrl: dish.image,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 12.0, bottom: 12.0, right: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        dish.name,
                                        style: GoogleFonts.lato(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (dish.isFav) {
                                          _menuViewModel.unFavourite(dish);

                                        }
                                        else
                                        {
                                          _menuViewModel.makeFavourite(dish);
                                        }
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        child: dish.isFav ? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite_border) ,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(dish.description),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  height: 40,
                                  child: Row(
                                    children: [
                                      Text(
                                        "SAR ${dish.price}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Expanded(child: Container()),
                                      _menuViewModel.cart.containsKey(dish.id)
                                          ? QuantityWidget(dishId: dish.id ,quantity: _menuViewModel.cart[dish.id],)
                                          : RaisedButton.icon(
                                        onPressed: () {
                                          _menuViewModel.addToCart(dish.id);
                                          // Navigator.pushNamed(
                                          //     context, "/option");
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        label: Text(
                                          "ADD",
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        color: Colors.red,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ));
              }),
        ),
      ],
    );
  }
}

class QuantityWidget extends StatelessWidget{

  QuantityWidget({@required this.dishId,@required this.quantity});

  final int quantity;
  final int dishId;



  @override
  Widget build(BuildContext context) {

    MenuViewModel _menuViewModel =  Provider.of<MenuViewModel>(context);

    return Row(
      children: [
        quantity > 1
            ? InkWell(
          onTap: (){
            _menuViewModel.reduceFromCart(dishId);
          },
          child: Container(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              CustomIcons.minus_1,
              color: Colors.grey,
              size: 20,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade100),
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
          ),
        )
            : InkWell(
          onTap: () {
            _menuViewModel.removeFromCart(dishId);
          },
          child: Container(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.delete_outlined,
              color: Colors.blueGrey,
              size: 20,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade100),
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          "$quantity",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 16,
        ),
        InkWell(
          onTap: () {
            _menuViewModel.addToCart(dishId);

          },
          child: Container(
            padding: EdgeInsets.all(2),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 24,
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
          ),
        )
      ],
    );
  }

}

class CartNavigator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/cart");
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(0, -2), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  child: Center(
                    child: AvatarGlow(
                      endRadius: 60,
                      glowColor: Colors.red,
                      child: Badge(
                        animationDuration: Duration(milliseconds: 500),
                        animationType: BadgeAnimationType.scale,
                        badgeColor: Colors.red,
                        child: Icon(
                          CustomIcons.cart,
                          color: Colors.red,
                        ),
                        badgeContent: Text(
                          "${Provider.of<MenuViewModel>(context).cart.length}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "VIEW CART",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "350 SAR",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

}

