
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:max_food/components/QuantityPicker.dart';
import 'package:max_food/utils/constants.dart';

class CartScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CartScreenState();
  }
}


class _CartScreenState extends State<CartScreen>
{
  var qty = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(

          title: Text("Cart"),
        ),
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal : 12.0,vertical: 4.0),
                child: Column(
                  children: [
                    ListView.builder(shrinkWrap : true,itemCount: 2,itemBuilder: (ctx,index){
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 12.0),
                        decoration: Constants.shadow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  child:  Image.asset("assets/images/food1.jpg",),
                                ),
                                SizedBox(width: 8,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Super Mega Deal",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                      SizedBox(height: 8,),
                                      Text("12 Pcs Chicken with max food's original spicy flavour",style: TextStyle(fontSize: 14,color: Colors.grey))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("350 SAR",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                QuantityPicker(quantity: 1,)
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                    SizedBox(height: 6,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 12,vertical :8.0),
                        decoration: Constants.shadow,
                        child: Row(
                          children: [
                            Icon(Icons.notes,color: Colors.grey,),
                            SizedBox(width: 16,),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(0),
                                child: Text("Add special instructions (optional)",style: TextStyle(color: Colors.grey),),

                              ),
                            ),
                          ],
                        )
                    ),
                    SizedBox(height: 6,),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal : 12.0,vertical: 12),
                        decoration: Constants.shadow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Add More",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            Icon(Icons.arrow_forward_rounded,color: Colors.red,)
                          ],
                        )
                    ),
                    SizedBox(height: 6,),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal : 12.0,vertical: 24),
                        decoration: Constants.shadow,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Sub Total",style: TextStyle(fontSize: 14,color: Colors.grey),),
                                Text("125 SAR",style: TextStyle(fontSize: 14),),
                              ],
                            ),
                            SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery",style: TextStyle(fontSize: 14,color: Colors.grey),),
                                Text("125 SAR",style: TextStyle(fontSize: 14),),
                              ],
                            ),
                            SizedBox(height: 16,),

                            Container(width: double.infinity,height: 0.5,color: Colors.grey.shade200,),
                            SizedBox(height: 18,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                                Text("125 SAR",style: TextStyle(fontSize: 14),),
                              ],
                            ),
                            SizedBox(height: 12,),
                            Text("Including 15% VAT",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w100,color: Colors.orange.shade300),),


                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 60,decoration: Constants.shadow,
            padding: EdgeInsets.symmetric(horizontal :16.0,vertical: 10.0),

            child: Row(
              children: [
                Expanded(flex: 5,child: Text("2\nITEMS",textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle1,)),
                Expanded(flex: 6,child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: FlatButton(
                    color: Colors.red,
                    splashColor: Colors.white,
                    onPressed: ()=>print("pressed"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("PLACE ORDER",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        Image.asset("assets/images/fast_forward.png",width: 24,height: 24,)

                      ],
                    ),
                  )
                ),
                )

              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}