import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/loaders/shimmer.dart';
import 'package:e_com/common/widgets/productcart/cart_menu.dart';
import 'package:e_com/features/personalization/controllers/user_controller.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TTexts.homeAppBarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),),
            Obx(() {
              if(controller.profileLoading.value){
                return const TShimmerEffect(width:80,height: 16);
              } else {
                return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white));
              }
            }),
          ]),
      actions: [
        CartCounterIcon(onPressed: () {}, iconColor: TColors.white,counterBgColor: TColors.black,counterTextColor: TColors.white,),
      ],
    );
  }
}
