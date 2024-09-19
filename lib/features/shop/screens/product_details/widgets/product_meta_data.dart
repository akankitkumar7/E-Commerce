import 'package:e_com/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:e_com/common/widgets/images/circular_image.dart';
import 'package:e_com/common/widgets/product/product_price.dart';
import 'package:e_com/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:e_com/common/widgets/texts/product_title_text.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/enums.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// price and sale price
        Row(
          children: [
            /// sale tag
            RoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '35%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),

            /// price
            Text(
              "\$250",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            const ProductPriceText(
              price: '175',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        /// title
        const ProductTitleText(
          title: 'Air Jordan 1 Low',
          smallSize: true,
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        /// stock status
        Row(children: [
          const ProductTitleText(title: 'Status'),
          const SizedBox(width: TSizes.spaceBtwItems / 1.5),
          Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(width: TSizes.spaceBtwItems / 1.5),
        ]
        ),

        /// brand
         Row(
           mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircularImage(
                image: TImages.brandImage3,
              height: 32,
              width: 32,
              overlayColor: dark? TColors.white : TColors.black,
            ),
            const BrandTitleTextWithVerifiedIcon(title: 'Nike',brandTextSize: TextSizes.medium,),
          ],
        ),
      ],
    );
  }
}
