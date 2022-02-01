import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/models/user_model.dart';

class UserProvider with ChangeNotifier {
  /// Add User to Firebase
  void addUserData({
    User currentUser,
    String userName,
    String userEmail,
    String userImage,
  }) async {
    await FirebaseFirestore.instance
        .collection("foodAppUsersData")
        .doc(currentUser.uid)
        .set(
      {
        "userName": userName,
        "userEmail": userEmail,
        "userImage": userImage,
        "userUid": currentUser.uid,
      },
    );
  }

  /// Fetch User from Firebase
  UserModel currentUserData;
  void fetchUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection("foodAppUsersData")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
        userEmail: value.get("userEmail"),
        userImage: value.get("userImage"),
        userName: value.get("userName"),
        userUid: value.get("userUid"),
      );
      currentUserData = userModel;
      // "notifyListeners" same mean as "setState"
      notifyListeners();
    }
  }

  // Getter function of UserModel
  UserModel get getCurrentUserData {
    return currentUserData;
  }
}
