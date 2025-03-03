import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/data/services/firebase_storage_service.dart';
import 'package:e_com/features/shop/models/product_model.dart';
import 'package:e_com/utils/constants/enums.dart';
import 'package:e_com/utils/exceptions/firebase_exceptions.dart';
import 'package:e_com/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:io';
class ProductRepository extends GetxController{
  static ProductRepository get instance => Get.find();


  /// firestore instance for database interactions
  final _db = FirebaseFirestore.instance;


  /// get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async{
    try{
      final snapshot = await _db.collection('Products').where('IsFeatured',isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) =>ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
  /// get limited featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async{
    try{
      final snapshot = await _db.collection('Products').where('IsFeatured',isEqualTo: true).get();
      return snapshot.docs.map((e) =>ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
/// get products based on brands
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async{
    try{
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async{
    try{
      final querySnapshot = limit == -1
          ? await _db.collection('Products').where('Brand.Id',isEqualTo:brandId).get()
          : await _db.collection('Products').where('Brand.Id',isEqualTo:brandId).limit(limit).get();

      final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;

    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


 /// upload dummy data to the cloud firebase
 Future<void> uploadDummyData(List<ProductModel> products) async{
   try{
     // upload all the products along with their images
     final storage = Get.put(TFirebaseStorageService());


     // loop through each each products
     for(var product in products){
       // get images data link from local assets
       final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);


       // upload image and get its url
       final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());

       // assign URL to product.thumbnail attribute
       product.thumbnail = url;


       // product list of images
       if(product.images != null && product.images!.isNotEmpty){
         List<String> imageUrl = [];
         for(var image in product.images!){
           // get the data link from local assets
           final assetImage = await storage.getImageDataFromAssets(image);

           // upload image and gets its url
           final url = await storage.uploadImageData('Products/Images', assetImage, image);

           // assign URL to product.thumbnail attribute
           imageUrl.add(url);
         }
         product.images!.clear();
         product.images!.addAll(imageUrl);
       }

       // upload variation images
       if(product.productType == ProductType.variable.toString()){
         for(var variation in product.productVariations!){
           // get image data link from local assets
           final assetImage = await storage.getImageDataFromAssets(variation.image);

           // upload image and gets its url
           final url = await storage.uploadImageData('Products/Images', assetImage, variation.image);

           // assign URL to variation.image attribute
           variation.image = url;
         }
       }

       // store product in firebase
       await _db.collection('Products').doc(product.id).set(product.toJson());
     }

   } on FirebaseException catch(e){
     throw e.message!;
   } on SocketException catch (e){
     throw e.message;
   } on PlatformException catch (e){
     throw e.message!;
   } catch(e){
     throw e.toString();
   }
 }
}