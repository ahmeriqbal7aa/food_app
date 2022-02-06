import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/widgets/count.dart';
import 'package:food_app/widgets/product_unit.dart';

class SingleProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final String productId;
  final int productPrice;
  final Function onTap;
  final ProductModel productUnit;
  SingleProduct({
    this.productImage,
    this.productName,
    this.productId,
    this.onTap,
    this.productPrice,
    this.productUnit,
  });
  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  // TODO Variables
  var unitData;
  var firstValue;

  @override
  Widget build(BuildContext context) {
    /// this widget, by default, will display first index value of productUnit
    widget.productUnit.productUnit.firstWhere((firstIndexElement) {
      setState(() {
        firstValue = firstIndexElement;
      });
      return true;
    });
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
                /// TODO Image
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(widget.productImage),
                  ),
                ),

                /// TODO Name, Price, Dropdown and Add Button
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Name
                        Text(
                          widget.productName,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        /// Price
                        Text(
                            "${widget.productPrice}\$/${unitData == null ? firstValue : unitData}",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 5),

                        /// Dropdown and Add Button
                        Row(
                          children: [
                            Expanded(
                              child: ProductUnit(
                                onTap: () {
                                  // TODO Bottom Sheet
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: widget
                                              .productUnit.productUnit
                                              .map<Widget>((data) {
                                            return Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 10,
                                                    horizontal: 10,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      setState(() {
                                                        unitData = data;
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      data,
                                                      style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }).toList(),
                                          // children: <Widget>[
                                          //   ListTile(
                                          //     title: new Text('50 Gram'),
                                          //     onTap: () {
                                          //       Navigator.pop(context);
                                          //     },
                                          //   ),
                                          //   ListTile(
                                          //     title: new Text('500 Gram'),
                                          //     onTap: () {
                                          //       Navigator.pop(context);
                                          //     },
                                          //   ),
                                          //   ListTile(
                                          //     title: new Text('1 Kg'),
                                          //     onTap: () {
                                          //       Navigator.pop(context);
                                          //     },
                                          //   ),
                                          // ],
                                        );
                                      });
                                },
                                title: unitData == null ? firstValue : unitData,
                              ),
                            ),
                            SizedBox(width: 5),
                            Count(
                              productId: widget.productId,
                              productImage: widget.productImage,
                              productName: widget.productName,
                              productPrice: widget.productPrice,
                              productUnit:
                                  unitData == null ? firstValue : unitData,
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
