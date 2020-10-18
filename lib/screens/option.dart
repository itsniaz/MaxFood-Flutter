
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:max_food/components/QuantityPicker.dart';
import 'package:max_food/utils/constants.dart';

class OptionScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _OptionState();
  }

}

class _OptionState extends State<OptionScreen>
{

  var drinks = ["Coke","Pepsi","7up","Fanta","Mountain Dew"];
  var addons = ["Capsicum","Lettuce","Petty","Extra Mayo"];
  int selectedDrinkGroupValue = 0;
  var checklist = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    // print(checklist);
    return Scaffold(
      appBar: AppBar(title: Text("Customize"),),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container(
              margin: EdgeInsets.symmetric(vertical : 16.0,horizontal: 16),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Super Deal 1",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text("SAR 35")
                      ],
                    ),
                    SizedBox(height: 4,),
                    Text("Made with cheese,pizza sauce,chicken ball,capsicum,onion"),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey.shade300,
                      margin: EdgeInsets.symmetric(vertical: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cold Drinks",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Container(
                          padding: EdgeInsets.all(4.0),
                          color: Colors.red,
                          child: Text("1 Required",style: TextStyle(color: Colors.white,fontSize: 12),),
                        )
                      ],
                    ),

                    ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap : true,itemCount : drinks.length,itemBuilder: (ctx,index){
                      return InkWell(
                        onTap: ()
                        {
                          setState(() {
                            selectedDrinkGroupValue = index;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Radio(value: index, groupValue: selectedDrinkGroupValue, onChanged: (val){
                              setState(() {
                                selectedDrinkGroupValue = val;
                              });
                            }),
                            SizedBox(width: 4,),
                            Text(drinks[index])
                          ],
                        ),
                      );
                    }),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add On",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Container(
                          padding: EdgeInsets.all(4.0),
                          color: Colors.grey,
                          child: Text("Optional",style: TextStyle(color: Colors.white,fontSize: 12),),
                        )
                      ],
                    ),
                    ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap : true,itemCount : checklist.length,itemBuilder: (ctx,index){
                      return InkWell(
                        onTap: ()
                        {
                          setState(() {
                            checklist[index] = !checklist[index];
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Checkbox(value: checklist[index], onChanged: (val){
                                  setState(() {
                                    checklist[index] = !checklist[index];
                                  });
                                }),
                                SizedBox(width: 4,),
                                Text("${addons[index]}"),

                              ],
                            ),
                            Row(
                              children: [
                                Text("+ SAR 5")
                              ],
                            )
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            )),
            Container(
              height: 60,
              width: double.infinity,
              decoration: Constants.shadow,
              padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
              child: Row(
                children: [
                  QuantityPicker(quantity: 2,),
                  SizedBox(width: 16.0,),
                  Expanded(
                    child: RaisedButton(
                      onPressed: ()=> print("A"),
                      color: Colors.red,
                      child: Text("ADD TO CART",style: TextStyle(color: Colors.white),),
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