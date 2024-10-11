import 'package:e_com/features/authentication/controllers/login/login_controller.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey,),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () =>controller.googleSignIn,
              icon: const Image(
                  width: TSizes.iconMd,
                  height: TSizes.iconMd,
                  image: AssetImage(TImages.google))),
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey,),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(onPressed: (){},
              icon: const Image(
                  width: TSizes.iconMd,
                  height: TSizes.iconMd,
                  image: AssetImage(TImages.facebook,))),
        ),
      ],
    );
  }
}
