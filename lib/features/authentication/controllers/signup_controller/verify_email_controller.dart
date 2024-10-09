import 'dart:async';
import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:e_com/common/widgets/success_screen/success_screen.dart';
import 'package:e_com/data/repositories/repository_authentication/authentication_repository.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/text_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();


  /// send email whenever screen appears and set timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }


  /// send email verification
  sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email sent',message: 'Please check your inbox and verify your email.');
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }



  /// timer to automatically redirect on email verification
  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer)async{
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(SuccessScreen(
            image: TImages.verifyEmail1,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
        );
      }
    });
  }



 /// manually check if email is verified
 checkEmailVerificationStatus()async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(SuccessScreen(
        image: TImages.verifyEmail1,
        title: TTexts.yourAccountCreatedTitle,
        subTitle: TTexts.yourAccountCreatedSubTitle,
        onPressed: () => AuthenticationRepository.instance.screenRedirect(),
      )
      );
    }
 }
}