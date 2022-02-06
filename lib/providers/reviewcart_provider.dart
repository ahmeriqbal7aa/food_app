import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/models/reviewcart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  /// Add Review Cart to Firebase
  void addReviewCartData({
    String cartId,
    String cartImage,
    String cartName,
    int cartPrice,
    int cartQuantity,
    var cartUnit,
  }) async {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .set(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "cartUnit": cartUnit,
        "isAdd": true,
      },
    );
  }

  /// Update Review Cart in Firebase
  void updateReviewCartData({
    String cartId,
    String cartName,
    String cartImage,
    int cartPrice,
    int cartQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .update(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdd": true,
      },
    );
  }

  /// Fetch ReviewCart from Firebase
  List<ReviewCartModel> reviewCartList = [];
  // fetch from firebase
  fetchReviewCartData() async {
    // we create "newList" to avoid product display double
    List<ReviewCartModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourReviewCart")
        .get();
    value.docs.forEach((element) {
      // print(element.data());
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartId: element.get("cartId"),
        cartImage: element.get("cartImage"),
        cartName: element.get("cartName"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),
        cartUnit: element.get("cartUnit"),
      );
      newList.add(reviewCartModel);
    });
    reviewCartList = newList;
    // "notifyListeners" same mean as "setState"
    notifyListeners();
  }

  // get from list
  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartList;
  }

  /// TotalPrice
  getTotalPrice() {
    double total = 0.0;
    getReviewCartDataList.forEach((element) {
      // print("Price: ${element.cartPrice}");
      // print("Price: ${element.cartQuantity}");
      total += element.cartPrice * element.cartQuantity;
      // print("Total: $total");
    });
    return total;
  }

  /// Delete ReviewCart Data
  reviewCartDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
    // "notifyListeners" same mean as "setState"
    notifyListeners();
  }
}
