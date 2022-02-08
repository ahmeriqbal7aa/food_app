import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/check_out_provider.dart';
import 'package:food_app/screens/checkOut/googleMap/google_map.dart';
import 'package:food_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddDeliverAddress extends StatefulWidget {
  @override
  _AddDeliverAddressState createState() => _AddDeliverAddressState();
}

/// TODO Enum
enum AddressTypes { Home, Work, Other }

class _AddDeliverAddressState extends State<AddDeliverAddress> {
  /// Obj of CheckOutProvider Class
  CheckOutProvider checkOutProvider;

  /// TODO Variable
  // AddressType is initialized above as enumerated data type.
  var myDeliveryAddressType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    checkOutProvider = Provider.of<CheckOutProvider>(context);
    return Scaffold(
      /// TODO AppBar
      appBar: AppBar(
        title: Text("Add Delivery Address", style: TextStyle(fontSize: 18)),
      ),

      /// TODO Body
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
              labelText: "First Name",
              controller: checkOutProvider.firstName,
            ),
            CustomTextField(
              labelText: "Last Name",
              controller: checkOutProvider.lastName,
            ),
            CustomTextField(
              labelText: "Mobile No",
              controller: checkOutProvider.mobileNo,
              keyboardType: TextInputType.phone,
            ),
            CustomTextField(
              labelText: "Alternate Mobile No",
              controller: checkOutProvider.alternateMobileNo,
              keyboardType: TextInputType.phone,
            ),
            CustomTextField(
                labelText: "Society", controller: checkOutProvider.society),
            CustomTextField(
                labelText: "Street", controller: checkOutProvider.street),
            CustomTextField(
                labelText: "Landmark", controller: checkOutProvider.landMark),
            CustomTextField(
                labelText: "City", controller: checkOutProvider.city),
            CustomTextField(
                labelText: "Area", controller: checkOutProvider.area),
            CustomTextField(
              labelText: "Pin Code",
              controller: checkOutProvider.pinCode,
              keyboardType: TextInputType.number,
            ),

            /// TODO Set Location
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomGoogleMap()),
                );
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkOutProvider.setLocation == null
                        ? Text("Set Location")
                        : Text("Done!"),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.black),
            ListTile(title: Text("Address Type*")),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myDeliveryAddressType,
              title: Text("Home"),
              onChanged: (AddressTypes value) {
                setState(() {
                  myDeliveryAddressType = value;
                });
              },
              secondary: Icon(Icons.home, color: primaryColor),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myDeliveryAddressType,
              title: Text("Work"),
              onChanged: (AddressTypes value) {
                setState(() {
                  myDeliveryAddressType = value;
                });
              },
              secondary: Icon(Icons.work, color: primaryColor),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: myDeliveryAddressType,
              title: Text("Other"),
              onChanged: (AddressTypes value) {
                setState(() {
                  myDeliveryAddressType = value;
                });
              },
              secondary: Icon(Icons.devices_other, color: primaryColor),
            )
          ],
        ),
      ),

      /// TODO Bottom Navigation Bar
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: checkOutProvider.isLoading == false
            ? MaterialButton(
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {
                  checkOutProvider.validator(context, myDeliveryAddressType);
                },
                child: Text("Add Address", style: TextStyle(color: textColor)),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
