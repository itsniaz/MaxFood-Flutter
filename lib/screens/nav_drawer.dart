import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_food/screens/menu.dart';
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
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
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

  _landingPage() {
    return Container(
      color: Color(0xF2F3F7),
      child: ListView(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: Row(
                  children: [
                    Text(
                      "EXPLORE MENU",
                      style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "/menu");
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left : 8.0,top: 8.0,bottom: 8.0),
                        child: Text(
                          "VIEW ALL",
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                    height: 220,
                    child: Row(
                      children: [
                        Expanded(
                          child: Category(categoryNames[0],categoryImages[0])
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Category(categoryNames[1],categoryImages[1])
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Expanded(
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Category(categoryNames[2],categoryImages[2]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Category(categoryNames[3],categoryImages[3]),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Expanded(
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Category(categoryNames[4],categoryImages[4]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 12,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.0),
                child: AspectRatio(
                  aspectRatio: 8/3,
                  child: Card(
                    color: Colors.redAccent,
                    child: Center(child: Text("Banner Here",style: TextStyle(color: Colors.white,fontSize: 18),)),
                  ),
                )
              ),

              SizedBox(
                height: 12,
              ),
              Container(
                  margin: EdgeInsets.only(left : 16.0,top: 8.0,bottom: 4.0),
                  child: Text(
                    "BESTSELLERS",
                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 4.0),
                width: double.infinity,
                height: 190,
                child: ListView.separated(
                    separatorBuilder: (ctx,index) => SizedBox(width: 2,),
                    scrollDirection: Axis.horizontal,shrinkWrap: true,physics: BouncingScrollPhysics(),itemCount : 5,itemBuilder: (ctx,index){
                  return Container(
                    width: 140,
                    height: 190,
                    child: Card(
                      child: Center(
                        child: Text("Hot Item ${index+1}"),
                      ),
                    ),
                  );
                }),
              )
            ],
          )
        ],
      ),
    );

  }

  Category(String categoryName,String imageUrl){
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical : 4.0,horizontal: 2.0),
            elevation: 1.0,

            child: Container(margin: EdgeInsets.only(top : 24.0,right: 24,bottom: 8.0,left: 8.0),child: Image.network(imageUrl,width: 10,)),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(child: Text(categoryName.toUpperCase(),style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),),margin: EdgeInsets.only(top: 12.0,right: 12.0),),
        ),


      ],
    );
  }
  

}
