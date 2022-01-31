import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';

// ignore: must_be_immutable
class SingleItem extends StatelessWidget {
  bool isBool = false;
  SingleItem({this.isBool});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              /// TODO Image
              Expanded(
                child: Container(
                  height: 100.0,
                  child: Center(
                    child: Image.network(
                        "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png"),
                  ),
                ),
              ),

              /// TODO Product Detail
              Expanded(
                child: Container(
                  height: 90.0,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "productName",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          Text(
                            "50\$",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                      isBool == false
                          ? Container(
                              margin: EdgeInsets.only(right: 15.0),
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              height: 35.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "50 Gram",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10.0),
                                    ),
                                  ),
                                  Center(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 20.0,
                                      color: primaryColor,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Text("1 kg")
                    ],
                  ),
                ),
              ),

              /// TODO Add Button
              Expanded(
                child: Container(
                  height: 100.0,
                  padding: isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15.0, vertical: 32.0)
                      : EdgeInsets.only(left: 15.0, right: 15.0),
                  child: isBool == false
                      ? Container(
                          height: 25.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 15.0, color: primaryColor),
                              Text("ADD",
                                  style: TextStyle(color: primaryColor)),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            Icon(Icons.delete,
                                size: 30.0, color: Colors.black54),
                            SizedBox(height: 5.0),
                            Container(
                              height: 25.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add,
                                      size: 15.0, color: primaryColor),
                                  Text("ADD",
                                      style: TextStyle(color: primaryColor)),
                                ],
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
        isBool == false
            ? Container()
            : Divider(height: 1, color: Colors.black45)
      ],
    );
  }
}
