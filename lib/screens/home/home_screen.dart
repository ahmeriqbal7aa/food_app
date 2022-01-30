import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/home/drawer_side.dart';
import 'package:food_app/screens/home/single_product.dart';
import 'package:food_app/screens/productOverview/product_overview.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// TODO Herbs
  Widget _buildHerbsProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Herbs Seasonings'),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleProduct(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productImage:
                            "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                        productName: "Herb Basil",
                      ),
                    ),
                  );
                },
                productImage:
                    "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                productName: "Herb Basil",
              ),
              SingleProduct(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productImage:
                            "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                        productName: "Herb Mint",
                      ),
                    ),
                  );
                },
                productImage:
                    "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                productName: "Herb Mint",
              ),
              SingleProduct(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productImage:
                            "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                        productName: "Herb Rose",
                      ),
                    ),
                  );
                },
                productImage:
                    "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                productName: "Herb Rose",
              ),
            ],
          ),
        )
      ],
    );
  }

  /// TODO Fruits
  Widget _buildFreshProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Fresh Fruits'),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleProduct(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productImage:
                            "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                        productName: "Fresh Basil",
                      ),
                    ),
                  );
                },
                productImage:
                    "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                productName: "Fresh Basil",
              ),
              SingleProduct(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productImage:
                            "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                        productName: "Fresh Mint",
                      ),
                    ),
                  );
                },
                productImage:
                    "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                productName: "Fresh Mint",
              ),
              SingleProduct(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productImage:
                            "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                        productName: "Fresh Rose",
                      ),
                    ),
                  );
                },
                productImage:
                    "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                productName: "Fresh Rose",
              ),
            ],
          ),
        )
      ],
    );
  }

  /// TODO Roots
  Widget _buildRootProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Root Vegetable'),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleProduct(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productImage:
                            "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                        productName: "Root Basil",
                      ),
                    ),
                  );
                },
                productImage:
                    "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                productName: "Root Basil",
              ),
              SingleProduct(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productImage:
                            "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                        productName: "Root Mint",
                      ),
                    ),
                  );
                },
                productImage:
                    "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                productName: "Root Mint",
              ),
              SingleProduct(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverview(
                        productImage:
                            "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                        productName: "Root Rose",
                      ),
                    ),
                  );
                },
                productImage:
                    "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png",
                productName: "Root Rose",
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSide(),

      /// TODO AppBar
      appBar: AppBar(
        title: Text("Home", style: TextStyle(fontSize: 17.0, color: textColor)),
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: primaryColor,
            child: Icon(Icons.search, size: 17.0, color: textColor),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: primaryColor,
              child: Icon(Icons.shop, size: 17.0, color: textColor),
            ),
          )
        ],
      ),

      /// TODO Body
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Xg-k622Sbztlrb-L1o1CAla3zCbVc2lUw&usqp=CAU',
                  ),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          // TODO Vegi Text
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 130, bottom: 10),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color(0xffd1ad17),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Vegi',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.green,
                                        blurRadius: 10,
                                        offset: Offset(3, 3),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // TODO 30% Off
                          Text(
                            '30% Off',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.green[100],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // TODO Description
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'On all vegetables products',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            _buildHerbsProduct(context),
            _buildFreshProduct(context),
            _buildRootProduct(context),
          ],
        ),
      ),
    );
  }
}
