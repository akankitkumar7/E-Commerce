class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String,dynamic> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.salePrice = 0.0,
    this.price = 0.0,
    this.stock = 0,
    required this.attributeValues,
});


  /// create a empty function for clean code
  static ProductVariationModel empty()=> ProductVariationModel(id: '', attributeValues: {});


  ///Json Format
  toJson(){
    return {
      'Id':id,
      'Image':image,
      'Description':description,
      'Price':price,
      'SalePrice':salePrice,
      'SKU':sku,
      'Stock':stock,
      'AttributeValues':attributeValues,
    };
  }

  /// map Json oriented document snapshot from firebase to model
  factory ProductVariationModel.fromJson(Map<String, dynamic> document){
    final data = document;
    if(data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['Id'] ?? '',
      image: data['Image'] ?? '',
      description: data['Description'] ?? '',
      price: double.parse((data['SalePrice'] ?? 0.0).toString()),
      salePrice:double.parse((data['Price'] ?? 0.0).toString()),
      sku: data['SKU'] ?? '',
      stock: data['Stock'] ?? 0,
      attributeValues: Map<String, String>.from(data['AttributeValues'])
    );
  }
}