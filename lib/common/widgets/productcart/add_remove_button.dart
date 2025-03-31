import 'package:e_com/common/widgets/icons/circular_icon.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class ProductQuantityAdderRemover extends StatelessWidget {
  const ProductQuantityAdderRemover({
    super.key, required this.quantity, this.add, this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularIcon(
              icon: Iconsax.minus,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.black,
              backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
              onPressed: remove,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              quantity.toString(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            CircularIcon(
              icon: Iconsax.add,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: TColors.white,
              backgroundColor: TColors.primary,
              onPressed: add,
            ),
          ],
        ),
      ],
    );
  }
}