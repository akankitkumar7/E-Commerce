import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/features/shop/models/brand_model.dart';
import 'package:e_com/utils/exceptions/firebase_exceptions.dart';
import 'package:e_com/utils/exceptions/format_exceptions.dart';
import 'package:e_com/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class BrandRepository extends GetxController{
  static BrandRepository get instance => Get.find();

  ///--variables
  final _db = FirebaseFirestore.instance;


  ///--Get all categories
  Future<List<BrandModel>> getAllBrands()async{
    try{
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code);
    } on FormatException catch(_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code);
    } catch (e){
      throw 'Something went wrong while fetching the data';
    }
  }

  ///-- Get Brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId)async{
    try{
     // query to get all documents where category matches hte provided categoryId
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('CategoryId',isEqualTo: categoryId).get();
      
      // extract brandIds from the document
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();
      
      // query to get all document where the brandIds is in the list of brandIds, fieldPath.documentId to query document in collection
      final brandQuery = await _db.collection('Brands').where(FieldPath.documentId,whereIn: brandIds).limit(2).get();

      // extract brand names or other relevant data from the document
      List<BrandModel> brands = brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code);
    } on FormatException catch(_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code);
    } catch (e){
      throw 'Something went wrong while fetching the data';
    }
  }
}