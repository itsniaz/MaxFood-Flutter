import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
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
  var sliderImages = [
    "https://images.squarespace-cdn.com/content/v1/592685ab29687fab3ebeff92/1533368741587-8MBGTUYJXG3MNF8LL7RJ/ke17ZwdGBToddI8pDm48kG_snw8yobEeaHLIoZns0exZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVEt60I7kc8EkBvoHY05Rw25urmTwdEDhcWqdwnS4U2Evbo1HGIJwq5eue472vjsDh0/promotion_banner_alldaybreakfast-phase2-v001.jpg",
    "https://i.pinimg.com/originals/3b/7c/93/3b7c9391b0dba6a892abd4c244e4f8c6.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRNDTDGYzItTG8ffxR7oY-fIU4AfZ3vnpKpRA&usqp=CAU",
    "https://cdn.andnowuknow.com/mainStoryImage/7-22-16-mcdonalds-banner-v2_0.jpg?OE.raaGZKOiXc4lVGWgFlfXxzaf4vNEc"
  ];

  var categoryImages = [
    "https://public.touch2success.com/static/02cc6a0ee7233054fa8b7708668a3abe/img/phpXNbNxI.png",
    "https://i.pinimg.com/originals/d4/50/aa/d450aa83e974012cc2444cd25cb96ca1.png",
    "https://www.pngitem.com/pimgs/m/235-2359009_pastrami-sandwich-png-firehouse-subs-roast-beef-transparent.png",
    "https://i2.wp.com/freepngimages.com/wp-content/uploads/2016/11/bacon-burger.png?w=1000",
    "https://i.dlpng.com/static/png/7385963_preview.png",
    "https://www.seekpng.com/png/small/88-882514_a-healthy-kids-meal-delivery-service-healthy-meal.png",
    "https://www.potatostory.com.my/source/upload/food/1595491309_PS_Side-Order_Hash-Brown.png",
    "https://img2.pngio.com/beverages-png-4-png-image-beverages-png-500_476.png"
  ];

  var categoryNames = [
    "Deals",
    "Sandwich",
    "Meat Sandwich",
    "Burger",
    "Sweet",
    "Kid Meals",
    "Side Order",
    "Beverages"
  ];

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
          child: _landingPage(),
    ));
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

  _landingPage()
  {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 8,
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 16 / 7,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: sliderImages.length,
          itemBuilder: (BuildContext context, int itemIndex) => AspectRatio(
              aspectRatio: 16 / 7,
              child: Card(
                  child: Image.network(
                    sliderImages[itemIndex],
                    fit: BoxFit.cover,
                  ))),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                color: Colors.white70,
                child: Column(
                  children: [
                    Image.network(
                      categoryImages[0],
                      height: 120,
                      width: 120,
                    ),
                    Text(categoryNames[0])
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                color: Colors.white70,
                child: Column(
                  children: [
                    Image.network(
                      categoryImages[1],
                      height: 120,
                      width: 120,
                    ),
                    Text(categoryNames[1])
                  ],
                ),
              ),
            ),
          ],
        ),
        GridView.count(
            shrinkWrap: true,
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 3,
            // Generate 100 widgets that display their index in the List.
            physics: NeverScrollableScrollPhysics(),
            children: [
              for (int x = 2; x < categoryNames.length; x++)
                Column(
                  children: [
                    Container(
                      color: Colors.white70,
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(8.0),
                      child: AspectRatio(
                        aspectRatio: 3 / 2,
                        child: FadeInImage(
                          placeholder: NetworkImage(categoryImages[x]),
                          image: NetworkImage(categoryImages[x]),
                        ),
                      ),
                    ),
                    Text(categoryNames[x])
                  ],
                )
            ]),
        SizedBox(
          height: 16,
        ),
        AspectRatio(
            aspectRatio: 16 / 5,
            child: Card(
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQEvPOoCxMvFaV0-U1V_gnM268IPy7RzyJ36g&usqp=CAU",
                  fit: BoxFit.cover,
                ))),
      ],
    );
  }
}
