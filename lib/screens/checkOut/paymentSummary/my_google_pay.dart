// import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';
//
// class MyGooglePay extends StatefulWidget {
//   final total;
//   MyGooglePay({this.total});
//   @override
//   _MyGooglePayState createState() => _MyGooglePayState();
// }
//
// class _MyGooglePayState extends State<MyGooglePay> {
//   // In your Stateless Widget class or State
//   void onGooglePayResult(paymentResult) {
//     print(paymentResult);
//     // Send the resulting Google Pay token to your server or PSP
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // In your Widget build() method
//     return GooglePayButton(
//       paymentConfigurationAsset: 'sample_payment_configuration.json',
//       paymentItems: [
//         PaymentItem(
//           label: 'Total',
//           amount: '${widget.total}',
//           status: PaymentItemStatus.final_price,
//         )
//       ],
//       style: GooglePayButtonStyle.black,
//       type: GooglePayButtonType.pay,
//       onPaymentResult: onGooglePayResult,
//       margin: const EdgeInsets.only(top: 15.0),
//       loadingIndicator: const Center(child: CircularProgressIndicator()),
//     );
//   }
// }
