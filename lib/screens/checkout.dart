import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:max_food/utils/constants.dart';
import 'package:max_food/utils/custom_icons_icons.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CheckoutState();
  }
}

class _CheckoutState extends State<CheckoutScreen> {
  int deliveryMethod = 1;
  int paymentMethod = 0;
  double iconSize = 14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Column(
        children: [
          Expanded(child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 90,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            deliveryMethod = 1;
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: deliveryMethod == 1
                                ? BorderSide(color: Colors.redAccent, width: 2)
                                : BorderSide(color: Colors.white, width: 0),
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          margin:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                          child: Center(
                            child: Text(
                              "Delivery",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 90,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            deliveryMethod = 2;
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: deliveryMethod == 2
                                ? BorderSide(color: Colors.redAccent, width: 2)
                                : BorderSide(color: Colors.white, width: 0),
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          margin:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                          child: Container(
                              child: Center(
                                child: Text(
                                  "Pickup",
                                  style: TextStyle(fontSize: 14),
                                ),
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              customerInfo(),
              SizedBox(height: 16,),
              paymentInfo(),
            ],
          )),
          Container(
            height: 50,
            color: paymentMethod == 0 ? Colors.grey : Colors.redAccent,
            child: FlatButton(
              onPressed: ()=>print("A"),
              splashColor: Colors.grey,
              child: Stack(
                children: [
                  Align(alignment: Alignment.center,child: Text("PLACE ORDER",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                  Align(alignment: Alignment.centerRight,child: Container(margin: EdgeInsets.only(right: 24.0),child: Image.asset("assets/images/fast_forward.png",width: 24,height: 24,)))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }



  customerInfo()
  {
    return       Container(
      decoration: Constants.shadow,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Customer Information",style: TextStyle(fontSize: 14,color: Colors.grey),),
          SizedBox(height: 16,),
          TextFormField(
            decoration: InputDecoration(icon : Icon(CustomIcons.user,size: iconSize,),border: InputBorder.none,hintText: "Name"),
          ),
          Container(height: 1,color: Colors.grey.shade100,margin: EdgeInsets.symmetric(vertical: 8),),
          TextFormField(
            decoration: InputDecoration(icon : Icon(CustomIcons.phone_handset,size: iconSize,),border: InputBorder.none,hintText: 'Contact No'),
          ),

          AnimatedSwitcher(duration: Duration(milliseconds: 200),
            child: deliveryMethod == 1 ? Column(
              children: [
                Container(height: 1,color: Colors.grey.shade100,margin: EdgeInsets.symmetric(vertical: 8),),
                TextFormField(
                  decoration: InputDecoration(icon : Icon(CustomIcons.building,size: iconSize,),border: InputBorder.none,hintText: 'Address'),
                ),
              ],
            ) : Container()
          )
        ],
      ),
    );
  }

  paymentInfo()
  {
    return       Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.all(24.0),
      decoration: Constants.shadow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Payment Method",style: TextStyle(fontSize: 14,color: Colors.grey),),
          SizedBox(height: 16,),
          FlatButton(
            onPressed: (){
              setState(() {
                paymentMethod = 1;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(backgroundColor: Colors.redAccent,child: Icon(Icons.account_balance_wallet_rounded,color: Colors.white,)),
                    SizedBox(width: 16,),
                    Text("Cash On Delivery"),
                    Spacer(),
                    paymentMethod == 1 ? Container(
                      child: Icon(Icons.check,color: Colors.white,size: 16,),
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(1000)
                      ),
                    ):Container()
                  ],
                )
            ),
          ),
          SizedBox(height: 8,),
          FlatButton(
            onPressed: (){
              setState(() {
                paymentMethod = 2;
              });
            },

            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(backgroundColor: Colors.redAccent,child: Icon(Icons.credit_card,color: Colors.white,)),
                    SizedBox(width: 16,),
                    Text("Credit or Debit Card"),
                    Spacer(),
                    paymentMethod == 2 ? Container(
                      child: Icon(Icons.check,color: Colors.white,size: 16,),
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(1000)
                      ),
                    ):Container()
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}
