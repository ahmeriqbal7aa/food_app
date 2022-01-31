import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/widgets/single_item.dart';

class ReviewCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// TODO AppBar
      appBar: AppBar(
        title: Text(
          "Review Cart",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),

      /// TODO Body
      body: ListView(
        children: [
          SizedBox(height: 10),
          SingleItem(isBool: true),
          SingleItem(isBool: true),
        ],
      ),

      /// TODO Bottom Navigation Bar
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle:
            Text("50\$/50 Gram", style: TextStyle(color: Colors.green[900])),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            color: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Text("Submit"),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
