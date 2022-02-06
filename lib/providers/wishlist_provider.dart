import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/models/product_model.dart';

class WishListProvider with ChangeNotifier {
  /// Add Wish Lis to Firebase
  void addWishListData({
    String wishListId,
    String wishListImage,
    String wishListName,
    int wishListPrice,
    int wishListQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .set(
      {
        "wishListId": wishListId,
        "wishListName": wishListName,
        "wishListImage": wishListImage,
        "wishListPrice": wishListPrice,
        "wishListQuantity": wishListQuantity,
        "wishList": true,
      },
    );
  }

  /// Fetch WishList from Firebase
  List<ProductModel> wishList = [];
  // fetch from firebase
  fetchWishListData() async {
    // we create "newList" to avoid product display double
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWishList")
        .get();
    value.docs.forEach((element) {
      ProductModel productModel = ProductModel(
        productId: element.get("wishListId"),
        productImage: element.get("wishListImage"),
        productName: element.get("wishListName"),
        productPrice: element.get("wishListPrice"),
        productQuantity: element.get("wishListQuantity"),
      );
      newList.add(productModel);
    });
    wishList = newList;
    // "notifyListeners" same mean as "setState"
    notifyListeners();
  }

  // get from list
  List<ProductModel> get getWishListDataList {
    return wishList;
  }

  /// Delete ReviewCart Data
  wishListDataDelete(wishListId) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .delete();
    // "notifyListeners" same mean as "setState"
    notifyListeners();
  }
}
