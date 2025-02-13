import 'package:e_com/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:e_com/common/widgets/images/circular_image.dart';
import 'package:e_com/common/widgets/product/product_price.dart';
import 'package:e_com/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:e_com/common/widgets/texts/product_title_text.dart';
import 'package:e_com/features/shop/controllers/product/product_controller.dart';
import 'package:e_com/features/shop/models/product_model.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/enums.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
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
                '$salePercentage%',
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
            if(product.productType == ProductType.single.toString() && product.salePrice>0)
              Text('\$${product.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            if(product.productType == ProductType.single.toString() && product.salePrice>0) const SizedBox(width: TSizes.spaceBtwItems,),
            ProductPriceText(price: controller.getProductPrice(product), isLarge: true,),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        /// title
        ProductTitleText(
          title: product.title,
          smallSize: true,
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        /// stock status
        Row(children: [
          const ProductTitleText(title: 'Status'),
          const SizedBox(width: TSizes.spaceBtwItems / 1.5),
          Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(width: TSizes.spaceBtwItems / 1.5),
        ]
        ),

        /// brand
         Row(
           mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircularImage(
                image: product.brand != null ? product.brand!.image: '',
              height: 32,
              width: 32,
              overlayColor: dark? TColors.white : TColors.black,
            ),
            BrandTitleTextWithVerifiedIcon(title: product.brand != null ? product.brand!.name : '',brandTextSize: TextSizes.medium,),
          ],
        ),
      ],
    );
  }
}
