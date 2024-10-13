import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:e_com/data/repositories/repository_authentication/authentication_repository.dart';
import 'package:e_com/data/repositories/user/user_repository.dart';
import 'package:e_com/features/authentication/screens/login/login.dart';
import 'package:e_com/features/personalization/models/user_model.dart';
import 'package:e_com/features/personalization/screens/profile/widgets/reauthenticate_user_login_form.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/network_manager.dart';
import 'package:e_com/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart%20';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// fetch user record
  Future<void> fetchUserRecord() async{
    try{
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e){
      user(UserModel.empty());
    }
  }

  /// save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // first update Rx user and then check if user data is already stored. if not store new data
      await fetchUserRecord();

      // if no record already stored
      if(user.value.id.isEmpty) {
        if (userCredentials != null) {
          // convert name to first and last name
          final nameParts = UserModel.nameParts(
              userCredentials.user!.displayName ?? ' ');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? ' ');

          // map data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1
                ? nameParts.sublist(1).join(' ')
                : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          // save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: "Something went wrong while saving your information. You can save your data in you Profile again",
      );
    }
  }
  /// delete account warning
  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure that you want to delete your account? Deleting your account will is reversible and all of your data will be removed permanently ',
      confirm: ElevatedButton(onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: const BorderSide(color: Colors.red)),
          child: const Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.lg),child: Text("Delete"),),
          ),
      cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel'),),
    );
  }

  /// delete user account
 void deleteUserAccount() async{
    try{
      TFullScreenLoader.openLoadingDialog('Processing', TImages.animation);
      /// first re authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        // re verify your email
        if(provider == 'google.com'){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if(provider == 'password'){
          TFullScreenLoader.stopLoading();
          Get.to(()=> const ReAuthLoginForm());
        }
      }
    } catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
 }

 /// re authenticate user before deleting
 Future <void> reAuthenticateEmailAndPasswordUser() async{
    try{
      TFullScreenLoader.openLoadingDialog('Processing', TImages.animation);

      // check for internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      if(!reAuthFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(),verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Oh Snap',message: e.toString());
    }
 }

 /// upload profile image
 uploadProfilePicture() async {
    try{
      imageUploading.value = true;
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,);
      if(image != null){
        // upload image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        // update user image record
        Map<String, dynamic> json = {'ProfilePicture' : imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        TLoaders.successSnackBar(title: 'Congratulations',message: 'Your Profile Image has been updated!');
      }
    } catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap', message:'Something went wrong : $e');
    }
    finally{
      imageUploading.value = false;
    }
 }
}