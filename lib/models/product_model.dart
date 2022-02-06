class ProductModel {
  String productName;
  String productImage;
  String productId;
  int productPrice;
  int productQuantity;
  List<dynamic> productUnit;
  ProductModel({
    this.productImage,
    this.productName,
    this.productId,
    this.productPrice,
    this.productQuantity,
    this.productUnit,
  });
}
