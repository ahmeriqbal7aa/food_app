import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/home/home_screen.dart';

class DrawerSide extends StatefulWidget {
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
    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43.0,
                      backgroundColor: Colors.white54,
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.yellow,
                        backgroundImage: NetworkImage(
                          "https://s3.envato.com/files/328957910/vegi_thumb.png",
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("User Name"),
                        SizedBox(height: 7.0),
                        Container(
                          height: 30.0,
                          // ignore: deprecated_member_use
                          child: OutlineButton(
                            child: Text("Login"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            borderSide: BorderSide(width: 2),
                            onPressed: () {},
                          ),
                        )
                        // Text(
                        //   "User Email",
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(
              iconData: Icons.home_outlined,
              title: "Home",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.shop_outlined,
              title: "Review Cart",
              onTap: () {},
            ),
            listTile(
              iconData: Icons.person_outlined,
              title: "My Profile",
              onTap: () {},
            ),
            listTile(
                iconData: Icons.notifications_outlined, title: "Notificatio"),
            listTile(iconData: Icons.star_outline, title: "Rating & Review"),
            listTile(
                iconData: Icons.favorite_outline,
                title: "Wishlist",
                onTap: () {}),
            listTile(iconData: Icons.copy_outlined, title: "Raise a Complaint"),
            listTile(iconData: Icons.format_quote_outlined, title: "FAQs"),
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
                      Text("+923352580282"),
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
                          "assarbaloch5@gmail.com",
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
