import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/delivery_address_model.dart';
import 'package:food_app/providers/reviewcart_provider.dart';
import 'package:food_app/screens/checkOut/deliveryDetails/single_delivery_item.dart';
import 'package:food_app/screens/checkOut/paymentSummary/my_google_pay.dart';
import 'package:food_app/screens/checkOut/paymentSummary/order_item.dart';
import 'package:provider/provider.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel deliveryAddressModel;
  PaymentSummary({this.deliveryAddressModel});

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

/// TODO Enum
enum AddressTypes { Home, OnlinePayment }

class _PaymentSummaryState extends State<PaymentSummary> {
  /// Obj of ReviewCartProvider Class
  ReviewCartProvider reviewCartProvider;

  /// TODO Variable
  // AddressType is initialized above as enumerated data type.
  var myDeliveryAddressType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.fetchReviewCartData();

    // double discount = 30;
    double shippingCharge = 5.0;
    // double discountValue;
    // double total;
    double totalPrice = reviewCartProvider.getTotalPrice();
    double total = shippingCharge + totalPrice;
    // if (totalPrice > 300) {
    //   discountValue = (totalPrice * discount) / 100;
    //   total = totalPrice - discountValue;
    // }

    return Scaffold(
      /// TODO AppBar
      appBar: AppBar(
        title: Text("Payment Summary", style: TextStyle(fontSize: 18)),
      ),

      /// TODO Body
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          // "itemCount" mean how many time we want to "call"
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                /// Title, Address, Number, AddressType
                SingleDeliveryItem(
                  address: "area, ${widget.deliveryAddressModel.area}, "
                      "street, ${widget.deliveryAddressModel.street}, "
                      "society ${widget.deliveryAddressModel.society}, "
                      "pinCode ${widget.deliveryAddressModel.pinCode}",
                  title: "${widget.deliveryAddressModel.firstName} "
                      "${widget.deliveryAddressModel.lastName}",
                  number: widget.deliveryAddressModel.mobileNo,
                  addressType: widget.deliveryAddressModel.addressType ==
                          "AddressTypes.Home"
                      ? "Home"
                      : widget.deliveryAddressModel.addressType ==
                              "AddressTypes.Other"
                          ? "Other"
                          : "Work",
                ),
                Divider(),

                /// Order Items
                ExpansionTile(
                  children:
                      reviewCartProvider.getReviewCartDataList.map((data) {
                    return OrderItem(reviewCartModel: data);
                  }).toList(),
                  title: Text(
                    "Order Items ${reviewCartProvider.getReviewCartDataList.length}",
                  ),
                ),
                Divider(),

                /// Sub Total
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Sub Total",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    // "\$${totalPrice + 5}",
                    "\$$totalPrice",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                /// Shipping Charge
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Shipping Charge",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    // "\$$discountValue",
                    "\$$shippingCharge",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                /// Coupon Discount
                // ListTile(
                //   minVerticalPadding: 5,
                //   leading: Text(
                //     "Coupon Discount",
                //     style: TextStyle(color: Colors.grey[600]),
                //   ),
                //   trailing: Text(
                //     "\$10",
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                // ),
                Divider(),
                ListTile(leading: Text("Payment Options")),
                RadioListTile(
                  value: AddressTypes.Home,
                  groupValue: myDeliveryAddressType,
                  title: Text("Home"),
                  onChanged: (AddressTypes value) {
                    setState(() {
                      myDeliveryAddressType = value;
                    });
                  },
                  secondary: Icon(Icons.work, color: primaryColor),
                ),
                RadioListTile(
                  value: AddressTypes.OnlinePayment,
                  groupValue: myDeliveryAddressType,
                  title: Text("Online Payment"),
                  onChanged: (AddressTypes value) {
                    setState(() {
                      myDeliveryAddressType = value;
                    });
                  },
                  secondary: Icon(Icons.devices_other, color: primaryColor),
                )
              ],
            );
          },
        ),
      ),

      /// TODO Bottom Navigation Bar
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\$$total",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {
              // myDeliveryAddressType == AddressTypes.OnlinePayment
              //     ? Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) => MyGooglePay(total: total),
              //         ),
              //       )
              //     : Container();
            },
            child: Text("Place Order", style: TextStyle(color: textColor)),
          ),
        ),
      ),
    );
  }
}
