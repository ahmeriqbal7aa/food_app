import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/widgets/single_item.dart';

class Search extends StatefulWidget {
  final List<ProductModel> list;
  Search({this.list});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  /// TODO Search Item Method
  String query = "";
  searchItem(String query) {
    List<ProductModel> searchFood = widget.list.where((data) {
      return data.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    /// for suggestion, if we didn't write then it will not give suggestion
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      /// TODO AppBar
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
          ),
        ],
      ),

      /// TODO Body
      body: ListView(
        children: [
          ListTile(title: Text("Items")),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                // print(value);
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: "Search for items in the store",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: _searchItem.map((data) {
              return SingleItem(
                isBool: false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
