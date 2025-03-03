import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModel(
      {required this.id, required this.image, required this.name, this.isFeatured, this.productCount});

  /// empty helper function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '',);

  /// convert model to Json structure so that you can store data in firebase
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductCount': productCount,
      'IsFeatured': isFeatured
    };
  }


  /// map Json oriented document snapshot from firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document){
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productCount: int.parse((data['ProductsCount'] ?? 0).toString()),
    );
  }

  /// map Json oriented document snapshot from firebase to UserModel
  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BrandModel(
        id: data['Id'] ?? '',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        productCount: data['ProductsCount'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,

      );
    } else {
      return BrandModel.empty();
    }
  }
}