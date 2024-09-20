import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/helpers/network_manager.dart';
import 'package:e_com/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// variables
  final hidePassword = true.obs; // observable for hiding/showing password
  final privacyPolicy = false.obs; // observable for privacy Policy acceptance
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // FORM KEY FOR VALIDATION

  /// SIGNUP

  Future<void> signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.animation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // form validation

      if (signupFormKey.currentState!.validate()) {
        return;
      }

      //privacy policy check
      if (!privacyPolicy.value){
        TLoaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message: "In order to create your account, you must have to read and accept the privacy policy and & Term of use.",
        );
        return;
      }

      // register user in the firebase authentication and save user data in the firebase

      //save authenticated user data in the firebase firestore

      //show success message

      // move to verify email
    } catch (e) {
      // show some generic error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      // remove loader
      TFullScreenLoader.stopLoading();
    }
  }
}
