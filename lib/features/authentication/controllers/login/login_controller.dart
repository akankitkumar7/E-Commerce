import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:e_com/data/repositories/repository_authentication/authentication_repository.dart';
import 'package:e_com/features/personalization/controllers/user_controller.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/helpers/network_manager.dart';
import 'package:e_com/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  /// variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? " ";
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? " ";
    super.onInit();
  }

  /// email and password sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog("Logging you in", TImages.animation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }


      //login user using email and password authenticate
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: 'Oh Snap.',
          message: e.toString());
    }
  }

  // google sign in authentication
  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in', TImages.animation);

    // check internet connectivity

    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // google authentication
    final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();
    
    // save user record
    await userController.saveUserRecord(userCredentials);

    // remove the loader
    TFullScreenLoader.stopLoading();


  }catch(e){
      // remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
    }
}