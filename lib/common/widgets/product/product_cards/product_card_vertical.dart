import 'package:e_com/common/styles/shadows.dart';
import 'package:e_com/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:e_com/common/widgets/images/rounder_home_banner.dart';
import 'package:e_com/common/widgets/product/favourite_icon/favourite_icon.dart';
import 'package:e_com/common/widgets/product/product_price.dart';
import 'package:e_com/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:e_com/common/widgets/texts/product_title_text.dart';
import 'package:e_com/features/shop/controllers/product/product_controller.dart';
import 'package:e_com/features/shop/models/product_model.dart';
import 'package:e_com/features/shop/screens/product_details/product_details.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/enums.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {

    final controller = ProductController.instance;

    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(()=>  ProductDetail(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            boxShadow: [ShadowStyle.verticalProductShadow],
            color: dark ? TColors.darkerGrey : TColors.white),
        child: Column(
          children: [
            /// thumbnail wishlist button, discount tag
            RoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// thumbnail image
                   Center(child: RoundedImage(imageUrl: product.thumbnail,applyImageRadius: true,isNetworkImage: true,)),

                  /// sale tag
                  if(salePercentage != null)
                  Positioned(
                    top: 10,
                    child: RoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                    ),
                  ),

                  /// favorite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: FavouriteIcon(productId: product.id,),
                  ),
                ],
              ),
            ),

            ///details
            Padding(
              padding: const EdgeInsets.only(top: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 2,),
                  BrandTitleTextWithVerifiedIcon(title: product.brand!.name),

                ],
              ),
            ),
            const Spacer(),

            /// price row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// price
                Flexible(
                  child: Column(
                    children: [
                      if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(top: TSizes.sm),
                          child: Text(
                           product.price.toString(),style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          )
                        ),
                      /// price, show sale price as main price if sale exist
                      Padding(
                        padding: const EdgeInsets.only(top: TSizes.sm),
                        child: ProductPriceText(price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),

                /// add to cart button
                Container(
                    decoration: const BoxDecoration(
                        color: TColors.dark,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadius))),
                    child: const SizedBox(
                        width: TSizes.iconLg * 1.2,
                        height: TSizes.iconLg * 1.2,
                        child: Icon(
                          Iconsax.add,
                          color: TColors.white,
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
