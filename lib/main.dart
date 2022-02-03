import 'package:flutter/material.dart';
import 'package:food_app/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/product_provider.dart';
import 'package:food_app/providers/reviewcart_provider.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// Product Provider
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),

        /// User Provider
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),

        /// ReviewCart Provider
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) => ReviewCartProvider(),
        ),

        /// WishList Provider
        ChangeNotifierProvider<WishListProvider>(
          create: (context) => WishListProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
        ),
        home: SignIn(),
      ),
    );
  }
}
