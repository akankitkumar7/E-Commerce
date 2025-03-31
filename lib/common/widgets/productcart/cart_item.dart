import 'package:e_com/common/widgets/images/rounder_home_banner.dart';
import 'package:e_com/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:e_com/common/widgets/texts/product_title_text.dart';
import 'package:e_com/features/shop/models/cart_item_model.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// images
        RoundedImage(
          fit: BoxFit.fill,
          isNetworkImage: true,
          imageUrl: cartItem.image ?? '',
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
              BrandTitleTextWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                child: ProductTitleText(
                  title: cartItem.title,
                  maxLines: 1,
                ),
              ),

              /// attributes
              Text.rich(TextSpan(
                  children: (cartItem.selectedVariation ?? {}).entries.map(
                          (e) => TextSpan(
                            children: [
                              TextSpan(text: ' ${e.key} ',style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(text: '${e.value} ',style: Theme.of(context).textTheme.bodyLarge),
                            ]
                          )
                  ).toList(),
              )
              )
            ],
          ),
        ),
      ],
    );
  }
}
