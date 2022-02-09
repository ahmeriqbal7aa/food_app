import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:food_app/screens/home/my_profile.dart';
import 'package:food_app/screens/reviewCart/review_cart.dart';
import 'package:food_app/screens/wishList/wish_list.dart';

// ignore: must_be_immutable
class DrawerSide extends StatefulWidget {
  UserProvider userProvider;
  DrawerSide({this.userProvider});
  @override
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget listTile({String title, IconData iconData, Function onTap}) {
    return Container(
      height: 50,
      child: ListTile(
        onTap: onTap,
        leading: Icon(iconData, size: 28),
        title: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.getCurrentUserData;
    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          children: [
            /// Header
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43.0,
                      backgroundColor: scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: primaryColor,
                        backgroundImage: NetworkImage(
                          userData.userImage ??
                              "https://s3.envato.com/files/328957910/vegi_thumb.png",
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(userData.userName),
                            Text(
                              userData.userEmail,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            /// Home
            listTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              iconData: Icons.home_outlined,
              title: "Home",
            ),

            /// Review Cart
            listTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ReviewCart()),
                );
              },
              iconData: Icons.shop_outlined,
              title: "Review Cart",
            ),

            /// My Profile
            listTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        MyProfile(userProvider: widget.userProvider),
                  ),
                );
              },
              iconData: Icons.person_outlined,
              title: "My Profile",
            ),

            /// Notification
            listTile(
                iconData: Icons.notifications_outlined, title: "Notification"),

            /// Rating & Review
            listTile(iconData: Icons.star_outline, title: "Rating & Review"),

            /// WishList
            listTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WishList()),
                );
              },
              iconData: Icons.favorite_outline,
              title: "WishList",
            ),

            /// Raise a Complaint
            listTile(iconData: Icons.copy_outlined, title: "Raise a Complaint"),

            /// FAQs
            listTile(iconData: Icons.format_quote_outlined, title: "FAQs"),

            /// Contact Support
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Call us:"),
                      SizedBox(width: 10),
                      Text("+92-309-1234567"),
                    ],
                  ),
                  SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail us:"),
                        SizedBox(width: 10),
                        Text(
                          "example@gmail.com",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
