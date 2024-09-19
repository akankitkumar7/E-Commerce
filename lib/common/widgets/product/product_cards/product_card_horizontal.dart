import 'package:e_com/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:e_com/common/widgets/icons/circular_icon.dart';
import 'package:e_com/common/widgets/images/rounder_home_banner.dart';
import 'package:e_com/common/widgets/product/product_price.dart';
import 'package:e_com/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:e_com/common/widgets/texts/product_title_text.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 400,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.softGrey),
      child: Row(
        children: [
          /// thumbnail

          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.productImageRadius),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                const SizedBox(
                    width: 120,
                    height: 120,
                    child: RoundedImage(
                  imageUrl: TImages.homeProductImage3,
                  applyImageRadius: true,
                ),
                ),

                Positioned(
                  top: 10,
                  child: RoundedContainer(
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
                ),

                /// favorite Icon Button
                const Positioned(
                  top: 5,
                  right: 0,
                  child: CircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          
          /// details
          SizedBox(
           width: 208,
           child:  Padding(
             padding: const EdgeInsets.only(top: TSizes.sm,left: TSizes.sm),
             child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(
                        maxLines: 3,
                          title: ' Trending Jersy of famous footballer Messi in  blue and white patterns',
                        smallSize: true,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems/2,),
                      BrandTitleTextWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// pricing
                      const ProductPriceText(price: ' 234'),
                      /// add to cart
                      Container(
                          decoration: const BoxDecoration(
                              color: TColors.dark,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(TSizes.cardRadiusMd),
                                  bottomRight:
                                  Radius.circular(TSizes.productImageRadius),
                              ),
                          ),
                          child: const SizedBox(
                              width: TSizes.iconLg * 1.2,
                              height: TSizes.iconLg * 1.2,
                              child: Icon(
                                Iconsax.add,
                                color: TColors.white,
                              ),
                          ),
                      ),
                    ],
                  )
                ],
              ),
           ),
         )
        ],
      ),
    );
  }
}
