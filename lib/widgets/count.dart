import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';

// ignore: must_be_immutable
class Count extends StatefulWidget {
  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  /// TODO Variables
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 30.0,
        width: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
        ),
        child: isTrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Remove Icon
                  InkWell(
                    onTap: () {
                      if (count == 1) {
                        setState(() {
                          // ADD Button will Display
                          isTrue = false;
                        });
                        // reviewCartProvider.reviewCartDataDelete(widget.productId);
                      } else if (count > 1) {
                        setState(() => count--);
                      }
                    },
                    child: Icon(Icons.remove, size: 15, color: primaryColor),
                  ),

                  /// Number
                  Text(
                    "$count",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// Add Icon
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: Icon(Icons.add, size: 15, color: primaryColor),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                  },
                  child: Text("ADD", style: TextStyle(color: primaryColor)),
                ),
              ),
      ),
    );
  }
}
