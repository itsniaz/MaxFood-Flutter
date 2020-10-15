

import 'package:flutter/material.dart';
import 'package:max_food/utils/custom_icons_icons.dart';

class QuantityPicker extends StatefulWidget{
  int quantity;
  QuantityPicker({this.quantity});

  @override
  State<StatefulWidget> createState() {

    return _QuantityPickerState();
  }
}

class _QuantityPickerState extends State<QuantityPicker>
{

  @override
  Widget build(BuildContext context) {

      return Row(
        children: [
          widget.quantity > 1
              ? InkWell(
            onTap: () => setState(() {
              widget.quantity--;
            }),
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
              setState(() {
                widget.quantity--;
              });
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
            "${widget.quantity}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 16,
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.quantity++;
              });
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