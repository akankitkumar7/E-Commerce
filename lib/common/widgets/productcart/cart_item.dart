import 'package:e_com/common/widgets/images/rounder_home_banner.dart';
import 'package:e_com/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:e_com/common/widgets/texts/product_title_text.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// images
        RoundedImage(
          fit: BoxFit.fill,
          imageUrl: TImages.productDetail3,
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),

        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        ///title price, size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleTextWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child: ProductTitleText(
                  title: 'Nike Air Jordon 1',
                  maxLines: 1,
                ),
              ),

              /// attributes
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color',style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Yellow',style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'Size',style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'UK 8',style: Theme.of(context).textTheme.bodyLarge),
                      ]))
            ],
          ),
        ),
      ],
    );
  }
}
