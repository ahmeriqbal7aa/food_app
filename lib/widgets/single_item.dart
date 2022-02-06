import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/reviewcart_provider.dart';
import 'package:food_app/widgets/count.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SingleItem extends StatefulWidget {
  bool isBool = false;
  bool wishList = false;
  final String productImage;
  final String productName;
  final String productId;
  final int productQuantity;
  final int productPrice;
  var productUnit;
  Function onDelete;

  SingleItem({
    this.isBool,
    this.wishList,
    this.productImage,
    this.productName,
    this.productId,
    this.productQuantity,
    this.productPrice,
    this.productUnit,
    this.onDelete,
  });

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  /// Obj of ReviewCartProvider Class
  ReviewCartProvider reviewCartProvider;

  /// TODO Method
  int count;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  // @override
  // void initState() {
  //   getCount();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.fetchReviewCartData();
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
                  child: Center(child: Image.network(widget.productImage)),
                ),
              ),

              /// TODO Product Detail
              Expanded(
                child: Container(
                  height: 90.0,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          Text(
                            "${widget.productPrice}\$",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                      widget.isBool == false
                          ? GestureDetector(
                              onTap: () {
                                // TODO Bottom Sheet
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          ListTile(
                                            title: new Text('50 Gram'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            title: new Text('500 Gram'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            title: new Text('1 Kg'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Container(
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
                              ),
                            )
                          : Text(widget.productUnit)
                    ],
                  ),
                ),
              ),

              /// TODO Add Button
              Expanded(
                child: Container(
                  height: 100.0,
                  padding: widget.isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15.0, vertical: 32.0)
                      : EdgeInsets.only(left: 15.0, right: 15.0),
                  child: widget.isBool == false
                      ? Count(
                          productId: widget.productId,
                          productImage: widget.productImage,
                          productName: widget.productName,
                          productPrice: widget.productPrice,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: [
                              /// Delete
                              GestureDetector(
                                onTap: widget.onDelete,
                                child: Icon(
                                  Icons.delete,
                                  size: 30.0,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(height: 5.0),

                              /// Button
                              widget.wishList == false
                                  ? Container(
                                      height: 25.0,
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (count == 1) {
                                                Fluttertoast.showToast(
                                                  msg:
                                                      "You reach minimum limit",
                                                );
                                              } else {
                                                setState(() => count--);
                                                reviewCartProvider
                                                    .updateReviewCartData(
                                                  cartImage:
                                                      widget.productImage,
                                                  cartId: widget.productId,
                                                  cartName: widget.productName,
                                                  cartPrice:
                                                      widget.productPrice,
                                                  cartQuantity: count,
                                                );
                                              }
                                            },
                                            child: Icon(Icons.remove,
                                                size: 20, color: primaryColor),
                                          ),
                                          Text("$count",
                                              style: TextStyle(
                                                  color: primaryColor)),
                                          GestureDetector(
                                            onTap: () {
                                              if (count < 10) {
                                                setState(() => count++);
                                                reviewCartProvider
                                                    .updateReviewCartData(
                                                  cartImage:
                                                      widget.productImage,
                                                  cartId: widget.productId,
                                                  cartName: widget.productName,
                                                  cartPrice:
                                                      widget.productPrice,
                                                  cartQuantity: count,
                                                );
                                              } else {
                                                Fluttertoast.showToast(
                                                  msg:
                                                      "You reach maximum limit",
                                                );
                                              }
                                            },
                                            child: Icon(Icons.add,
                                                size: 15.0,
                                                color: primaryColor),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        widget.isBool == false
            ? Container()
            : Divider(height: 1, color: Colors.black45)
      ],
    );
  }
}
