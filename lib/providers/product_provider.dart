import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  // Obj of ProductModel Class
  ProductModel productModel;
  List<ProductModel> homeScreenSearchBarList = [];
  // Making a Function to avoid writing same code again and again
  productModelsMethod(QueryDocumentSnapshot queryDocumentSnapshot) {
    productModel = ProductModel(
      productImage: queryDocumentSnapshot.get("productImage"),
      productName: queryDocumentSnapshot.get("productName"),
      productPrice: queryDocumentSnapshot.get("productPrice"),
    );
    homeScreenSearchBarList.add(productModel);
  }

  /// ///////////////// HerbsProduct ///////////////////////////
  List<ProductModel> herbsProductList = [];
  // fetch from Firebase
  fetchHerbsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();
    value.docs.forEach(
      (val) {
        print(val.data());
        productModelsMethod(val);
        newList.add(productModel);
      },
    );
    herbsProductList = newList;
    // "notifyListeners" same mean as "setState"
    notifyListeners();
  }

  // get from list
  List<ProductModel> get getHerbsProductDataList {
    return herbsProductList;
  }

  /// ///////////////// FreshProduct ///////////////////////////
  List<ProductModel> freshProductList = [];
  // fetch from Firebase
  fetchFreshProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("FreshProduct").get();
    value.docs.forEach(
      (val) {
        print(val.data());
        productModelsMethod(val);
        newList.add(productModel);
      },
    );
    freshProductList = newList;
    // "notifyListeners" same mean as "setState"
    notifyListeners();
  }

  // get from list
  List<ProductModel> get getFreshProductDataList {
    return freshProductList;
  }

  /// ///////////////// FreshProduct ///////////////////////////
  List<ProductModel> rootProductList = [];
  // fetch from Firebase
  fetchRootProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("RootProduct").get();
    value.docs.forEach(
      (val) {
        print(val.data());
        productModelsMethod(val);
        newList.add(productModel);
      },
    );
    rootProductList = newList;
    // "notifyListeners" same mean as "setState"
    notifyListeners();
  }

  // get from list
  List<ProductModel> get getRootProductDataList {
    return rootProductList;
  }

  /// ///////////////// Search Return ///////////////////////////
  List<ProductModel> get getAllProductSearch {
    return homeScreenSearchBarList;
  }
}
