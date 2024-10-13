import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:e_com/data/repositories/user/user_repository.dart';
import 'package:e_com/features/personalization/controllers/user_controller.dart';
import 'package:e_com/features/personalization/screens/profile/profile.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/helpers/network_manager.dart';
import 'package:e_com/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();



  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();


  /// init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// fetch user record
  Future<void> initializeNames() async{
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }


  Future<void> updateUserName() async{
    try{
      // start loading
      TFullScreenLoader.openLoadingDialog('We are updating your information ', TImages.animation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if(!updateUserNameFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      // update user's first and last name in the firebase firestore
      Map<String, dynamic> name = {'FirstName':firstName.text.trim(), 'LastName':lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // update the Rx user name
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // remove the loader
      TFullScreenLoader.stopLoading();

      // show success message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your Name has been updated');

      // move the previous screen
      Get.off(()=> const ProfileScreen());
    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}