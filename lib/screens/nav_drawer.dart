import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:max_food/utils/custom_icons_icons.dart';

class MainNavDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainNavDrawerBody();
  }
}

class MainNavDrawerBody extends State<MainNavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
          child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: Material(
                        // with Material
                        child: Image.network(
                            "https://avatars1.githubusercontent.com/u/25644101?s=460&u=b4499013c5fe038fcab816722756f8e3e8cb1485&v=4"),
                        elevation: 18.0,
                        shape: CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Niaz Ahmed",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        Text(
                          "itsniaz@gmail.com",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: AssetImage("assets/images/bg_landing.jpg")),
              ),
            ),
            ListTile(
              leading: _menuCircle(CustomIcons.th_thumb_empty),
              title: _menuText("My Orders"),
            ),
            ListTile(
              leading: _menuCircle(CustomIcons.tag),
              title: _menuText("Offer"),
            ),
            ListTile(
              leading: _menuCircle(CustomIcons.chat),
              title: _menuText("Support"),
            ),
            ListTile(
              leading: _menuCircle(CustomIcons.wrench_outline),
              title: _menuText("Settings"),
            ),
          ],
        ),
      )),
      appBar: AppBar(
        title: Text("Menu"),
        centerTitle: true,
        actions: [_shoppingCartBadge()],
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  height: 110,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/hamburger.png",
                              height: 46,
                              width: 46,
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 24.0, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "BURGER",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Price Range : 1\$ - 10\$",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade700),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RatingBar(
                                itemSize: 8,
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(height: 8,),
                              Center(
                                child: Text(
                                  "212 ratings",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade500),
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget _shoppingCartBadge() {
    return Badge(
      position: BadgePosition.topRight(top: 4, right: 10),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeColor: Colors.white,
      badgeContent: Text(
        "5",
        style: TextStyle(color: Colors.red),
      ),
      child: IconButton(icon: Icon(CustomIcons.cart), onPressed: () {}),
    );
  }

  _menuText(var title) {
    return Text(title,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black54));
  }

  _menuCircle(IconData icon) {
    return Container(
      height: 80,
      width: 80,
      child: Card(
        // w// ith Card
        child: Icon(
          icon,
          size: 22,
          color: Colors.redAccent,
        ),
        elevation: 2.0,
        shape: CircleBorder(),
        clipBehavior: Clip.antiAlias,
      ),
    );
  }
}
