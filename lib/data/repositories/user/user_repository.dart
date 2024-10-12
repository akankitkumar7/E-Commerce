import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/data/repositories/repository_authentication/authentication_repository.dart';
import 'package:e_com/features/personalization/models/user_model.dart';
import 'package:e_com/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_com/utils/exceptions/format_exceptions.dart';
import 'package:e_com/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();


  final FirebaseFirestore _db = FirebaseFirestore.instance;


/// function to save user data to user repository
  Future<void> saveUserRecord(UserModel user) async {
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_){
      throw const TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "Something went wrong. Please try again";
    }
  }

  ///function to fetch user data based on user ID
  Future<UserModel> fetchUserDetails() async {
    try{
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      } else{
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_){
      throw const TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "Something went wrong. Please try again";
    }
  }


///function to update user data in firestore

  Future<void> updateUserDetails(UserModel updateUser) async {
    try{
      await _db.collection("Users").doc(updateUser.id).update(updateUser.toJson());
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_){
      throw const TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "Something went wrong. Please try again";
    }
  }
  ///update any field in specific user collection
  Future<void> updateSingleField(Map<String,dynamic> json) async {
    try{
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_){
      throw const TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "Something went wrong. Please try again";
    }
  }
  ///function to remove user data from firestore
  Future<void> removeUserRecord(String userID) async {
    try{
      await _db.collection("Users").doc(userID).delete();
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_){
      throw const TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch (e){
      throw "Something went wrong. Please try again";
    }
  }
}