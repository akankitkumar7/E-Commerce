import 'package:e_com/features/authentication/screens/login/login.dart';
import 'package:e_com/features/authentication/screens/screen_onboarding/onboarding.dart';
import 'package:e_com/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_com/utils/exceptions/format_exceptions.dart';
import 'package:e_com/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  /// variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;


  /// called from main.dart an app lunch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }



  /// function to show relevant screen
  screenRedirect() async {
    // local storage
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnBoardingScreen());
  }

  /*--------------------- Email and Password sign-in -------------------*/


  // email authentication


  // registering user to firebase

  Future<UserCredential> registerWithEmailAndPassword(String email, String password)async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  /// email verification


  Future<void> sendEmailVerification() async{
    try{
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
}