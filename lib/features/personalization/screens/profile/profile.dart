import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/images/circular_image.dart';
import 'package:e_com/common/widgets/loaders/shimmer.dart';
import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/features/personalization/controllers/user_controller.dart';
import 'package:e_com/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/change_name.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(title: Text("Profile"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
         child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
           child: Column(
             children: [
               ///--- profile picture
               SizedBox(
                 width: double.infinity,
                 child: Column(
                   children: [
                     Obx((){
                       final networkImage = controller.user.value.profilePicture;
                       final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                       return controller.imageUploading.value
                         ? const TShimmerEffect(width: 80, height: 80)
                        : CircularImage(image: image,height: 80,width: 80,isNetworkImage: networkImage.isNotEmpty,);
                     }),
                     TextButton(onPressed: () => controller.uploadProfilePicture(), child: const Text("Change Profile Picture")),
                   ],
                 ),
               ),


               /// details
               const SizedBox(height: TSizes.spaceBtwItems/2,),
               const Divider(),
               const SizedBox(height: TSizes.spaceBtwItems,),
               const SectionHeading(title: 'Profile Information',showActionButton: false,),
               const SizedBox(height: TSizes.spaceBtwItems,),

               ProfileMenu(onPressed: () => Get.to((const ChangeName())), title: 'Name', value: controller.user.value.fullName,),
               ProfileMenu(onPressed: () {}, title: 'Username', value: controller.user.value.username,),

               const SizedBox(height: TSizes.spaceBtwItems/2,),
               const Divider(),
               const SizedBox(height: TSizes.spaceBtwItems,),
               const SectionHeading(title: 'Personal Information',showActionButton: false,),
               ProfileMenu(onPressed: () {}, title: 'User ID', value:  controller.user.value.id,icon: Iconsax.copy,),
               ProfileMenu(onPressed: () {}, title: 'E-mail', value:  controller.user.value.email,),
               ProfileMenu(onPressed: () {}, title: 'Phone Number', value:  controller.user.value.phoneNumber,),
               ProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male',),
               ProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '12-07-2004',),
               const Divider(),
               const SizedBox(height: TSizes.spaceBtwItems,),

               Center(
                   child: TextButton(
                       onPressed: () => controller.deleteAccountWarningPopup(),
                       child:const Text("Close account",style: TextStyle(color: Colors.red),)))
             ],
           ),
         ),
      ),
    );
  }
}
