import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/images/circular_image.dart';
import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Profile"),
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
                     const CircularImage(image: TImages.user1,height: 100,width: 100,backgroundColor: TColors.grey,),
                     TextButton(onPressed: (){}, child: const Text("Change Profile Picture")),
                   ],
                 ),
               ),


               /// details
               const SizedBox(height: TSizes.spaceBtwItems/2,),
               const Divider(),
               const SizedBox(height: TSizes.spaceBtwItems,),
               const SectionHeading(title: 'Profile Information',showActionButton: false,),
               const SizedBox(height: TSizes.spaceBtwItems,),

               ProfileMenu(onPressed: () {}, title: 'Name', value: 'Ankit Kumar',),
               ProfileMenu(onPressed: () {}, title: 'Username', value: 'ak_ankitkumar7',),

               const SizedBox(height: TSizes.spaceBtwItems/2,),
               const Divider(),
               const SizedBox(height: TSizes.spaceBtwItems,),
               const SectionHeading(title: 'Personal Information',showActionButton: false,),
               ProfileMenu(onPressed: () {}, title: 'User ID', value: '123456789',icon: Iconsax.copy,),
               ProfileMenu(onPressed: () {}, title: 'E-mail', value: 'ak4752970@gmail.com',),
               ProfileMenu(onPressed: () {}, title: 'Phone Number', value: '8765136250',),
               ProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male',),
               ProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '12-07-2004',),
               const Divider(),
               const SizedBox(height: TSizes.spaceBtwItems,),

               SizedBox(width:double.infinity,child: OutlinedButton(onPressed: (){}, child:const Text("Delete your account",style: TextStyle(color: Colors.red),)))

             ],
           ),
         ),
      ),
    );
  }
}
