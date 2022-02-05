import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/providers/wishlist_provider.dart';
import 'package:food_app/widgets/single_item.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  // Obj of WishListProvider Class
  WishListProvider wishListProvider;

  showAlertDialog(BuildContext context, ProductModel delete) {
    /// set up the buttons
    // ignore: deprecated_member_use
    Widget cancelButton = FlatButton(
      color: primaryColor,
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // ignore: deprecated_member_use
    Widget continueButton = FlatButton(
      color: primaryColor,
      child: Text("Yes"),
      onPressed: () {
        wishListProvider.wishListDataDelete(delete.productId);
        Navigator.of(context).pop();
      },
    );

    /// set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("WishList Product"),
      content: Text("Are you delete on wishList Product?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    /// show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of<WishListProvider>(context);
    wishListProvider.fetchWishListData();
    return Scaffold(
      /// TODO AppBar
      appBar: AppBar(
        title: Text(
          "WishList",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),

      /// TODO Body
      body: ListView.builder(
        itemCount: wishListProvider.getWishListDataList.length,
        itemBuilder: (context, index) {
          ProductModel data = wishListProvider.getWishListDataList[index];
          return Column(
            children: [
              SizedBox(height: 10),
              SingleItem(
                isBool: true,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                productQuantity: data.productQuantity,
                onDelete: () => showAlertDialog(context, data),
              ),
            ],
          );
        },
      ),
    );
  }
}
