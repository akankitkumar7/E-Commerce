import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:e_com/data/repositories/repository_authentication/authentication_repository.dart';
import 'package:e_com/features/authentication/password_configuration/reset_password.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/helpers/network_manager.dart';
import 'package:e_com/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance =>Get.find();

  /// variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();


  /// send reset password email
  sendPasswordResetEmail() async{
    try{
      TFullScreenLoader.openLoadingDialog('Processing your request', TImages.animation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){TFullScreenLoader.stopLoading(); return;}

      // form validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // remove the loader
      TFullScreenLoader.stopLoading();

      // show success message
      TLoaders.successSnackBar(title: 'Email Sent',message: 'Email link sent to reset your password'.tr);

      // redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch(e){
      // remove the loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }

  resendPasswordResetEmail(String email)async{
    try{
      TFullScreenLoader.openLoadingDialog('Processing your request', TImages.animation);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){TFullScreenLoader.stopLoading(); return;}


      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // remove the loader
      TFullScreenLoader.stopLoading();

      // show success message
      TLoaders.successSnackBar(title: 'Email Sent',message: 'Email link sent to reset your password'.tr);

    } catch(e){
      // remove the loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
}