import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/features/shop/models/brand_model.dart';
import 'package:e_com/features/shop/models/product_attributes_model.dart';
import 'package:e_com/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.salePrice = 0.0,
    this.description,
    this.isFeatured,
    this.images,
    this.date,
    this.brand,
    this.categoryId,
    this.productAttributes,
    this.productVariations,
  });

  /// create empty function for clear code
  static ProductModel empty() => ProductModel(id: '', title: '', stock: 0,  thumbnail: '', productType: '', price: 0,);


  /// json Format
  toJson(){
    return {
      'SKU':sku,
      'Title':title,
      'Stock':stock,
      'Price':price,
      'Images':images ?? [],
      'Thumbnail':thumbnail,
      'SalePrice':salePrice,
      'IsFeatured':isFeatured,
      'CategoryId':categoryId,
      'Description':description,
      'Brand':brand!.toJson(),
      'ProductType':productType,
      'ProductAttributes':productAttributes != null ? productAttributes!.map((e) => e.toJson()).toString() : [],
      'ProductVariations':productVariations != null ? productVariations!.map((e) => e.toJson()).toString() : [],
    };
  }

  /// map Json oriented document snapshot from firebase to model
  factory ProductModel.fromSnapshot(DocumentSnapshot <Map<String, dynamic>> document){
    if(document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['SKU'],
      title: data['Title'],
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }


  /// map Json-oriented document snapshot from firebase to model
  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document){
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id:  document.id,
      sku: data['SKU'] ?? '',
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }
}
