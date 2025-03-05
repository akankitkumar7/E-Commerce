import 'package:e_com/common/widgets/icons/circular_icon.dart';
import 'package:e_com/features/shop/controllers/product/favourite_controller.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({super.key, required this.productId});

  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(() => CircularIcon(
        icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? TColors.error : null,
      onPressed: () => controller.toggleFavouriteProduct(productId),
    )
    );
  }
}
