import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/reviewcart_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Count extends StatefulWidget {
  String productName;
  String productImage;
  String productId;
  int productPrice;
  var productUnit;
  Count({
    this.productName,
    this.productImage,
    this.productId,
    this.productPrice,
    this.productUnit,
  });
  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  // Obj of ReviewCartProvider Class
  ReviewCartProvider reviewCartProvider;

  /// TODO Variables
  int count = 1;
  bool isTrue = false;

  /// TODO Method
  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then(
          (value) => {
            // due to "this.mounted" we will
            // use "setState" inside "then" function
            // to avoid debugging error
            if (this.mounted)
              {
                if (value.exists)
                  {
                    setState(() {
                      count = value.get("cartQuantity");
                      isTrue = value.get("isAdd");
                    })
                  }
              }
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    return Expanded(
      child: Container(
        height: 30.0,
        width: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
        ),
        child: isTrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// TODO Remove Icon
                  GestureDetector(
                    onTap: () {
                      if (count == 1) {
                        setState(() {
                          // ADD Button will Display
                          isTrue = false;
                        });

                        /// delete
                        reviewCartProvider
                            .reviewCartDataDelete(widget.productId);
                      } else if (count > 1) {
                        setState(() {
                          count--;
                        });

                        /// update
                        reviewCartProvider.updateReviewCartData(
                          cartId: widget.productId,
                          cartImage: widget.productImage,
                          cartName: widget.productName,
                          cartPrice: widget.productPrice,
                          cartQuantity: count,
                        );
                      }
                    },
                    child: Icon(Icons.remove, size: 15, color: primaryColor),
                  ),

                  /// TODO Number
                  Text(
                    "$count",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// TODO Add Icon
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        count++;
                      });

                      /// update
                      reviewCartProvider.updateReviewCartData(
                        cartId: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantity: count,
                      );
                    },
                    child: Icon(Icons.add, size: 15, color: primaryColor),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });

                    /// add
                    reviewCartProvider.addReviewCartData(
                      cartId: widget.productId,
                      cartImage: widget.productImage,
                      cartName: widget.productName,
                      cartPrice: widget.productPrice,
                      cartQuantity: count,
                    );
                  },
                  child: Text("ADD", style: TextStyle(color: primaryColor)),
                ),
              ),
      ),
    );
  }
}
