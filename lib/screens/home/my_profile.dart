import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/home/drawer_side.dart';

// ignore: must_be_immutable
class MyProfile extends StatefulWidget {
  UserProvider userProvider;
  MyProfile({this.userProvider});
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Widget listTile({IconData icon, String title}) {
    return Column(
      children: [
        Divider(height: 1),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.getCurrentUserData;

    return Scaffold(
      backgroundColor: primaryColor,

      /// TODO Drawer
      drawer: DrawerSide(userProvider: widget.userProvider),

      /// TODO AppBar
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      ),

      /// TODO Body
      body: Stack(
        children: [
          /// Name, Email, Edit Icon and Option's List
          Column(
            children: [
              Container(height: 100, color: primaryColor),
              Container(
                height: 545,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              /// Name and Email
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userData.userName,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(userData.userEmail),
                                ],
                              ),

                              /// Edit
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor,
                                child: CircleAvatar(
                                  radius: 12,
                                  child: Icon(Icons.edit, color: primaryColor),
                                  backgroundColor: scaffoldBackgroundColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),

                    /// My Orders
                    listTile(icon: Icons.shop_outlined, title: "My Orders"),

                    /// My Delivery Address
                    listTile(
                      icon: Icons.location_on_outlined,
                      title: "My Delivery Address",
                    ),

                    /// Refer a Friends
                    listTile(
                        icon: Icons.person_outline, title: "Refer a Friends"),

                    /// Terms & Conditions
                    listTile(
                      icon: Icons.file_copy_outlined,
                      title: "Terms & Conditions",
                    ),

                    /// Privacy Policy
                    listTile(
                        icon: Icons.policy_outlined, title: "Privacy Policy"),

                    /// About
                    listTile(icon: Icons.add_chart, title: "About"),

                    /// Log Out
                    listTile(
                      icon: Icons.exit_to_app_outlined,
                      title: "Log Out",
                    ),
                  ],
                ),
              )
            ],
          ),

          /// Profile Avatar
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                radius: 45,
                backgroundColor: scaffoldBackgroundColor,
                backgroundImage: NetworkImage(
                  userData.userImage ??
                      "https://s3.envato.com/files/328957910/vegi_thumb.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
