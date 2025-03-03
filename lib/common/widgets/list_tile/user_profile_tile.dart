import 'package:e_com/common/widgets/images/circular_image.dart';
import 'package:e_com/common/widgets/loaders/shimmer.dart';
import 'package:e_com/features/personalization/controllers/user_controller.dart';
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
    final controller = UserController.instance;
    return ListTile(
      leading: Obx((){
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : TImages.user;
        return controller.imageUploading.value
            ? const TShimmerEffect(width: 50, height: 50)
            : CircularImage(image: image,height: 50,width: 50,isNetworkImage: networkImage.isNotEmpty,);
      }),
      title: Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit,color: TColors.white,)),
      onTap: onPressed,
    );
  }
}
