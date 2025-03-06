import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/data/services/firebase_storage_service.dart';
import 'package:e_com/features/shop/models/categories_model.dart';
import 'package:e_com/utils/exceptions/firebase_exceptions.dart';
import 'package:e_com/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();
  
  
  /// variables
  final _db = FirebaseFirestore.instance;
  
  
  /// get all categories
  Future<List<CategoryModel>> getAllCategories() async{
    try{
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
  
  /// get sub categories
   Future<List<CategoryModel>> getSubCategories(String categoryId) async{
      try{
        final snapshot = await _db.collection("Categories").where('ParentId',isEqualTo: categoryId).get();
        final result = snapshot.docs.map((e)=> CategoryModel.fromSnapshot(e)).toList();
        return result;

      } on FirebaseException catch(e){
        throw TFirebaseException(e.code).message;
      } on PlatformException catch(e){
        throw TPlatformException(e.code).message;
      } catch (e){
        throw "Something went wrong. Please try again.";
      }
    }

  /// upload categories to cloud firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async{
    try{
      // upload all categories along with their image
      final storage = Get.put(TFirebaseStorageService());

      // loop through each category
      for(var category in categories){
        // get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // upload image and get its URL
        final url = await storage.uploadImageData('Categories',file,category.name);

        // assign URL to category.image attribute
        category.image = url;


        // store category in firestore
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw "Something went wrong. Please try again.";
    }
  }

}