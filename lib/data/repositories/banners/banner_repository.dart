import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/features/shop/models/banner_model.dart';
import 'package:e_com/utils/exceptions/firebase_exceptions.dart';
import 'package:e_com/utils/exceptions/format_exceptions.dart';
import 'package:e_com/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  ///variables
  final _db = FirebaseFirestore.instance;

  /// get all order related to current user
  Future<List<BannerModel>> fetchBanners()async{
    try{
      final result = await _db.collection('Banners').where('Active',isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();

    } on FirebaseException catch(e){
      throw TFirebaseException(e.code);
    } on FormatException catch(_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code);
    } catch (e){
      throw 'Something went wrong while fetching banners';
    }
  }


  ///upload banners to find the cloud firebase
}