import 'package:flutter/material.dart';
import 'package:food_app/models/reviewcart_model.dart';

class OrderItem extends StatelessWidget {
  final ReviewCartModel reviewCartModel;
  OrderItem({this.reviewCartModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(reviewCartModel.cartImage, width: 60),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            reviewCartModel.cartName,
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            reviewCartModel.cartUnit,
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text("\$${reviewCartModel.cartPrice}"),
        ],
      ),
      subtitle: Text(reviewCartModel.cartQuantity.toString()),
    );
  }
}
