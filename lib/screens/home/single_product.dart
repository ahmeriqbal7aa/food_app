import 'package:flutter/material.dart';

class SingleProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final Function onTap;
  SingleProduct({this.productImage, this.productName, this.onTap});
  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 250,
            width: 160,
            decoration: BoxDecoration(
              color: Color(0xffd9dad9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fresh Basil",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("50\$/50 Grams",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 5.0),
                                height: 30.0,
                                width: 50.0,
                                // ignore: deprecated_member_use
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "50 Gram",
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20.0,
                                        color: Colors.yellow,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 5.0),
                                height: 30.0,
                                width: 50.0,
                                // ignore: deprecated_member_use
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.remove,
                                      size: 15.0,
                                      color: Color(0xffd0b84c),
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        color: Color(0xffd0b84c),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add,
                                      size: 15.0,
                                      color: Color(0xffd0b84c),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
