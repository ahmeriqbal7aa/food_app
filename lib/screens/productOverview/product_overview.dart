import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/wishlist_provider.dart';
import 'package:food_app/screens/reviewCart/review_cart.dart';
import 'package:food_app/widgets/count.dart';
import 'package:provider/provider.dart';

enum SingInCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productId;
  final int productPrice;
  ProductOverview({
    this.productImage,
    this.productName,
    this.productId,
    this.productPrice,
  });
  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SingInCharacter _character = SingInCharacter.fill;

  /// TODO Bottom Navigation Bar
  Widget bottomNavigatorBar({
    Color iconColor,
    Color backgroundColor,
    Color color,
    String title,
    IconData iconData,
    Function onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: 20, color: iconColor),
              SizedBox(width: 5),
              Text(title, style: TextStyle(color: color)),
            ],
          ),
        ),
      ),
    );
  }

  /// Obj of WishListProvider Class
  WishListProvider wishListProvider;
  bool wishListBool = false;

  /// TODO Method
  getWishListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWishList")
        .doc(widget.productId)
        .get()
        .then((value) => {
              // due to "this.mounted" we will
              // use "setState" inside "then" function
              // to avoid debugging error
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        wishListBool = value.get("wishList");
                      }),
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of<WishListProvider>(context);
    getWishListBool();
    return Scaffold(
      /// TODO AppBar
      appBar: AppBar(
        title: Text("Product Overview", style: TextStyle(color: textColor)),
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
      ),

      /// TODO Body
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  /// Name and Price
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: Text("\$${widget.productPrice}"),
                  ),

                  /// Image
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(40),
                    child: Image.network(widget.productImage ?? ""),
                  ),

                  /// Available Options
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Available Options",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  /// Radio Button, Price and Add Button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              value: SingInCharacter.fill,
                              groupValue: _character,
                              activeColor: Colors.green[700],
                              onChanged: (value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(width: 95.0),
                        Text("\$${widget.productPrice}"),
                        SizedBox(width: 95.0),
                        Count(
                          productId: widget.productId,
                          productImage: widget.productImage,
                          productName: widget.productName,
                          productPrice: widget.productPrice,
                          productUnit: '50 Gram',
                        ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 30, vertical: 10),
                        //   decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.grey),
                        //     borderRadius: BorderRadius.circular(30),
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Icon(Icons.add, size: 17, color: primaryColor),
                        //       Text("ADD", style: TextStyle(color: primaryColor))
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          /// About and Description
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: ListView(
                children: [
                  /// About
                  Text(
                    "About This Product",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20),

                  /// Description
                  Text(
                    "In marketing, a product is an object or system made "
                    "available for consumer use; it is anything that can be "
                    "offered to a market to satisfy the desire or need of a customer.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, color: textColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      /// TODO BottomNavigationBar
      bottomNavigationBar: Row(
        children: [
          /// Add to WishList
          bottomNavigatorBar(
            color: Colors.white70,
            backgroundColor: textColor,
            iconColor: Colors.grey,
            title: "Add to WishList",
            iconData:
                wishListBool == false ? Icons.favorite_outline : Icons.favorite,
            onTap: () {
              setState(() {
                wishListBool = !wishListBool;
              });
              if (wishListBool == true) {
                /// add
                wishListProvider.addWishListData(
                  wishListId: widget.productId,
                  wishListName: widget.productName,
                  wishListImage: widget.productImage,
                  wishListPrice: widget.productPrice,
                  wishListQuantity: 1,
                );
              } else {
                /// delete
                wishListProvider.wishListDataDelete(widget.productId);
              }
            },
          ),

          /// Go to Cart
          bottomNavigatorBar(
            color: textColor,
            backgroundColor: primaryColor,
            iconColor: Colors.white70,
            title: "Go To Cart",
            iconData: Icons.shop_outlined,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReviewCart()));
            },
          )
        ],
      ),
    );
  }
}
