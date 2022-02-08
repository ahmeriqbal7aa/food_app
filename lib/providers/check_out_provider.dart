import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/models/delivery_address_model.dart';
import 'package:food_app/models/reviewcart_model.dart';
import 'package:location/location.dart';

class CheckOutProvider with ChangeNotifier {
  LocationData setLocation;
  bool isLoading = false;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController alternateMobileNo = TextEditingController();
  TextEditingController society = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController landMark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController pinCode = TextEditingController();

  /// validator
  void validator(context, myDeliveryAddressType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "firstName is empty");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "lastName is empty");
    } else if (mobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "mobileNo is empty");
    } else if (alternateMobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "alternateMobileNo is empty");
    } else if (society.text.isEmpty) {
      Fluttertoast.showToast(msg: "society is empty");
    } else if (street.text.isEmpty) {
      Fluttertoast.showToast(msg: "street is empty");
    } else if (landMark.text.isEmpty) {
      Fluttertoast.showToast(msg: "landMark is empty");
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "city is empty");
    } else if (area.text.isEmpty) {
      Fluttertoast.showToast(msg: "area is empty");
    } else if (pinCode.text.isEmpty) {
      Fluttertoast.showToast(msg: "pinCode is empty");
    } else if (setLocation == null) {
      Fluttertoast.showToast(msg: "setLocation is empty");
    } else {
      isLoading = true;
      // "notifyListeners" same mean as "setState"
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("FoodDeliveryAddress")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .set({
        "firstName": firstName.text,
        "lastName": lastName.text,
        "mobileNo": mobileNo.text,
        "alternateMobileNo": alternateMobileNo.text,
        "society": society.text,
        "street": street.text,
        "landMark": landMark.text,
        "city": city.text,
        "area": area.text,
        "pinCode": pinCode.text,
        "addressType": myDeliveryAddressType.toString(),
        "longitude": setLocation.longitude,
        "latitude": setLocation.latitude,
      }).then((value) async {
        isLoading = false;
        // "notifyListeners" same mean as "setState"
        notifyListeners();
        await Fluttertoast.showToast(msg: "Add your delivery address");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

  /// Fetch DeliveryAddress from Firebase
  List<DeliveryAddressModel> deliveryAddressList = [];
  // fetch from Firebase
  fetchDeliveryAddressData() async {
    // we create "newList" to avoid product display double
    List<DeliveryAddressModel> newList = [];

    DeliveryAddressModel deliveryAddressModel;
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection("FoodDeliveryAddress")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    if (documentSnapshot.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        firstName: documentSnapshot.get("firstName"),
        lastName: documentSnapshot.get("lastName"),
        addressType: documentSnapshot.get("addressType"),
        area: documentSnapshot.get("area"),
        alternateMobileNo: documentSnapshot.get("alternateMobileNo"),
        city: documentSnapshot.get("city"),
        landMark: documentSnapshot.get("landMark"),
        mobileNo: documentSnapshot.get("mobileNo"),
        pinCode: documentSnapshot.get("pinCode"),
        society: documentSnapshot.get("society"),
        street: documentSnapshot.get("street"),
      );
      newList.add(deliveryAddressModel);
      notifyListeners();
    }

    deliveryAddressList = newList;
    // "notifyListeners" same mean as "setState"
    notifyListeners();
  }

  // get from list
  List<DeliveryAddressModel> get getDeliveryAddressListData {
    return deliveryAddressList;
  }

  /// Add Place Order Data to Firebase
  addPlaceOderData({
    List<ReviewCartModel> oderItemList,
    var subTotal,
    var address,
    var shipping,
  }) async {
    FirebaseFirestore.instance
        .collection("PlaceFoodOrder")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("MyOrders")
        .doc()
        .set(
      {
        "subTotal": "1234",
        "Shipping Charge": "",
        "Discount": "10",
        "orderItems": oderItemList
            .map((data) => {
                  "orderTime": DateTime.now(),
                  "orderImage": data.cartImage,
                  "orderName": data.cartName,
                  "orderUnit": data.cartUnit,
                  "orderPrice": data.cartPrice,
                  "orderQuantity": data.cartQuantity
                })
            .toList(),
        // "address": address
        //     .map((e) => {
        //           "orderTime": DateTime.now(),
        //           "orderImage": e.cartImage,
        //           "orderName": e.cartName,
        //           "orderUnit": e.cartUnit,
        //           "orderPrice": e.cartPrice,
        //           "orderQuantity": e.cartQuantity
        //         })
        //     .toList(),
      },
    );
  }
}
