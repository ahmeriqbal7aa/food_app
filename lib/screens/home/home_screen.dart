import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/product_provider.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/home/drawer_side.dart';
import 'package:food_app/screens/home/single_product.dart';
import 'package:food_app/screens/productOverview/product_overview.dart';
import 'package:food_app/screens/search/search.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Obj of ProductProvider Class
  ProductProvider productProvider;
  // Obj of UserProvider Class
  UserProvider userProvider;

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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Search(list: productProvider.getHerbsProductDataList),
                    ),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getHerbsProductDataList.map(
              (herbsProductData) {
                return SingleProduct(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productImage: herbsProductData.productImage,
                          productName: herbsProductData.productName,
                          productPrice: herbsProductData.productPrice,
                        ),
                      ),
                    );
                  },
                  productImage: herbsProductData.productImage,
                  productName: herbsProductData.productName,
                  productPrice: herbsProductData.productPrice,
                );
              },
            ).toList(),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Search(list: productProvider.getFreshProductDataList),
                    ),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getFreshProductDataList.map(
              (freshProductData) {
                return SingleProduct(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productImage: freshProductData.productImage,
                          productName: freshProductData.productName,
                          productPrice: freshProductData.productPrice,
                        ),
                      ),
                    );
                  },
                  productImage: freshProductData.productImage,
                  productName: freshProductData.productName,
                  productPrice: freshProductData.productPrice,
                );
              },
            ).toList(),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Search(list: productProvider.getRootProductDataList),
                    ),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getRootProductDataList.map(
              (rootProductData) {
                return SingleProduct(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productImage: rootProductData.productImage,
                          productName: rootProductData.productName,
                          productPrice: rootProductData.productPrice,
                        ),
                      ),
                    );
                  },
                  productImage: rootProductData.productImage,
                  productName: rootProductData.productName,
                  productPrice: rootProductData.productPrice,
                );
              },
            ).toList(),
          ),
        )
      ],
    );
  }

  /// TODO Product Provider
  @override
  void initState() {
    /// we write "listen: false" to avoid running "initState()" method only one time
    /// when we "false" then "initState()" will run 2 or more times
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchHerbsProductData();
    productProvider.fetchFreshProductData();
    productProvider.fetchRootProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// TODO Providers
    productProvider = Provider.of(context);
    userProvider = Provider.of(context);
    userProvider.fetchUserData();
    return Scaffold(
      drawer: DrawerSide(userProvider: userProvider),

      /// TODO AppBar
      appBar: AppBar(
        title: Text("Home", style: TextStyle(fontSize: 17.0, color: textColor)),
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffd6d382),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Search(list: productProvider.getAllProductSearch),
                  ),
                );
              },
              child: Icon(Icons.search, size: 17.0, color: textColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Color(0xffd6d382),
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
