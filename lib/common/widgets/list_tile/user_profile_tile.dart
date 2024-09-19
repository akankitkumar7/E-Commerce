import 'package:e_com/common/widgets/images/circular_image.dart';
import 'package:e_com/features/personalization/screens/profile/profile.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircularImage(
        height: 50,
        width: 50,
        padding:0,
        image: TImages.user1,
      ),
      title: Text('Ankit Kumar',style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text('ak4752970@gmail.com',style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: ()=>Get.to(()=>const ProfileScreen()), icon: const Icon(Iconsax.edit,color: TColors.white,)),
      onTap: onPressed,
    );
  }
}
