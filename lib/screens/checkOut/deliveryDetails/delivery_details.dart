import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/delivery_address_model.dart';
import 'package:food_app/providers/check_out_provider.dart';
import 'package:food_app/screens/checkOut/deliveryDetails/add_delivery_address.dart';
import 'package:food_app/screens/checkOut/deliveryDetails/single_delivery_item.dart';
import 'package:food_app/screens/checkOut/paymentSummary/payment_summary.dart';
import 'package:provider/provider.dart';

class DeliveryDetails extends StatefulWidget {
  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  /// Obj of DeliveryAddress Model Class
  DeliveryAddressModel value;

  /// Obj of CheckoutProvider Class
  CheckOutProvider checkOutProvider;

  @override
  Widget build(BuildContext context) {
    checkOutProvider = Provider.of<CheckOutProvider>(context);
    checkOutProvider.fetchDeliveryAddressData();
    return Scaffold(
      /// TODO AppBar
      appBar: AppBar(title: Text("Delivery Details")),

      /// TODO Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddDeliverAddress()));
        },
      ),

      /// TODO Body
      body: ListView(
        children: [
          ListTile(
            title: Text("Deliver To..."),
            leading: Icon(Icons.location_on),
          ),
          Divider(height: 1),
          checkOutProvider.getDeliveryAddressListData.isEmpty
              ? Center(
                  child: Container(child: Center(child: Text("No Data"))),
                )
              : Column(
                  children: checkOutProvider.getDeliveryAddressListData
                      .map<Widget>((data) {
                    setState(() {
                      value = data;
                    });
                    return SingleDeliveryItem(
                      address: "Area: ${data.area}, Street: ${data.street}, "
                          "Society: ${data.society}, Pin Code: ${data.pinCode}",
                      title: "${data.firstName} ${data.lastName}",
                      number: data.mobileNo,
                      addressType: data.addressType == "AddressTypes.Home"
                          ? "Home"
                          : data.addressType == "AddressTypes.Other"
                              ? "Other"
                              : "Work",
                    );
                  }).toList(),
                )
        ],
      ),

      /// TODO Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: checkOutProvider.getDeliveryAddressListData.isEmpty
              ? Text("Add new Address")
              : Text("Payment Summary"),
          onPressed: () {
            checkOutProvider.getDeliveryAddressListData.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddDeliverAddress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          PaymentSummary(deliveryAddressModel: value),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
