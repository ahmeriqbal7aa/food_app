import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/reviewcart_model.dart';
import 'package:food_app/providers/reviewcart_provider.dart';
import 'package:food_app/widgets/single_item.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ReviewCart extends StatelessWidget {
  // Obj of ReviewCartProvider Class
  ReviewCartProvider reviewCartProvider;

  /// TODO Alert Dialogue
  showAlertDialog(BuildContext context, ReviewCartModel delete) {
    /// set up the buttons
    // ignore: deprecated_member_use
    Widget cancelButton = FlatButton(
      color: primaryColor,
      child: Text("No"),
      onPressed: () => Navigator.of(context).pop(),
    );
    // ignore: deprecated_member_use
    Widget continueButton = FlatButton(
      color: primaryColor,
      child: Text("Yes"),
      onPressed: () {
        reviewCartProvider.reviewCartDataDelete(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    /// set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("Are you delete on cartProduct?"),
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
    reviewCartProvider = Provider.of(context);
    reviewCartProvider.fetchReviewCartData();
    return Scaffold(
      /// TODO AppBar
      appBar: AppBar(
        title: Text(
          "Review Cart",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),

      /// TODO Body
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Center(child: Text("NO DATA"))
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(height: 10),
                    SingleItem(
                      isBool: true,
                      productImage: data.cartImage,
                      productName: data.cartName,
                      productPrice: data.cartPrice,
                      productId: data.cartId,
                      productQuantity: data.cartQuantity,
                      onDelete: () => showAlertDialog(context, data),
                    ),
                  ],
                );
              }),

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
