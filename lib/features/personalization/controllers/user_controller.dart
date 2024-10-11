import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:e_com/data/repositories/user/user_repository.dart';
import 'package:e_com/features/personalization/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserCredential get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  /// save user record from any registration provider

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
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
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // save user data

        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: "Something went wrong while saving your information. You can save your data in you Profile again",
      );
    }
  }
}