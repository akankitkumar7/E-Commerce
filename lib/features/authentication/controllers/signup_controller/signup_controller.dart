import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:e_com/data/repositories/repository_authentication/authentication_repository.dart';
import 'package:e_com/data/repositories/user/user_repository.dart';
import 'package:e_com/features/authentication/screens/signupWidgets/verify_email.dart';
import 'package:e_com/features/personalization/models/user_model.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/helpers/network_manager.dart';
import 'package:e_com/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// variables
  final hidePassword = true.obs; // observable for hiding/showing password
  final privacyPolicy = true.obs; // observable for privacy Policy acceptance
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // FORM KEY FOR VALIDATION

  /// SIGNUP

  void signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('We are processing your information', TImages.animation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // form validation

      if (!signupFormKey.currentState!.validate()) return;

      //privacy policy check
      if (!privacyPolicy.value){
        TLoaders.warningSnackBar(
            title: "Accept the Privacy Policy",
            message: "In order to create your account, you must have to read and agree with the the privacy policy and & Term of use.",
        );
        return;
      }

      // register user in the firebase authentication and save user data in the firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      //save authenticated user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName:firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber:phoneNumber.text.trim(),
        profilePicture : "",
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);



      //show success message

      TLoaders.successSnackBar(title: 'Congratulations',message: "Your account hase been created! Verify email to continue.");

      // move to verify email
      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));


    } catch (e) {

      // remove loader
      TFullScreenLoader.stopLoading();


      // show some generic error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
