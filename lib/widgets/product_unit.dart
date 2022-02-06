import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';

class ProductUnit extends StatelessWidget {
  final Function onTap;
  final String title;
  ProductUnit({this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 5.0),
        height: 25.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text('$title', style: TextStyle(fontSize: 10.0)),
            ),
            Center(
              child: Icon(Icons.arrow_drop_down, size: 20, color: primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
