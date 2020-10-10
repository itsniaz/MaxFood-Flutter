import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MenuRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuRouteState();
  }
}

class _MenuRouteState extends State<MenuRoute> with TickerProviderStateMixin {

  var _tabController;
  AnimationController _animationController;
  int favIndex = -1;


  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 5, vsync: this);
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
        body: Column(
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
                  // indicator: BoxDecoration(
                  //     borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(10),
                  //         topRight: Radius.circular(10)),
                  //     color: Colors.white),
                  // labelColor: Colors.red,
                  indicator: new BubbleTabIndicator(
                    indicatorHeight: 28.0,
                    indicatorColor: Colors.white,
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  ),
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.white,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text("DEALS"),
                    ),
                    Tab(
                      child: Text("SANDWICH"),
                    ),
                    Tab(
                      child: Text("BURGER"),
                    ),
                    Tab(
                      child: Text("MEAT SANDWICH"),
                    ),
                    Tab(
                      child: Text("SWEET"),
                    ),
                  ]),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 0.0),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    CategoryItems(),
                    CategoryItems(),
                    CategoryItems(),
                    CategoryItems(),
                    CategoryItems(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  CategoryItems() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) {
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
                      child: Image.asset("assets/images/food1.jpg"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 12.0, bottom: 12.0, right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Super Mega Deal ${index+1}",
                                style: GoogleFonts.lato(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              InkWell(
                                onTap: (){
                                  if(favIndex == index)
                                    {
                                      favIndex = -1;
                                      _animationController.reverse();
                                    }
                                  else
                                    {
                                      favIndex=index;
                                      _animationController.forward();
                                    }
                                },
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    child: Lottie.asset('assets/lottie_files/favourite.json',
                                        controller: _animationController,
                                        onLoaded: (composition) {
                                          // Configure the AnimationController with the duration of the
                                          // Lottie file and start the animation.
                                          _animationController
                                            ..duration = Duration(milliseconds: 1000);
                                        },
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                              "The fried chicken that put MAX Food on the map. As its name indicates, this is the ....."),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text("35 SAR",style: TextStyle(fontSize: 16),),
                              Expanded(child: Container()),
                              RaisedButton.icon(onPressed: ()=>print("pressed"), icon: Icon(Icons.add,color: Colors.white,), label: Text("ADD",style: TextStyle(color: Colors.white),),color: Colors.red,)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ));
        });
  }
}
