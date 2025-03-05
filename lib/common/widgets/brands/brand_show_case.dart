import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_com/common/widgets/brands/brand_card.dart';
import 'package:e_com/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:e_com/common/widgets/loaders/shimmer.dart';
import 'package:e_com/features/shop/models/brand_model.dart';
import 'package:e_com/features/shop/screens/brand/brand_products.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BrandShowcase extends StatelessWidget {
  const BrandShowcase({super.key, required this.images, required this.brand});

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Get.to(() => BrandProducts(brand: brand)),
      child: RoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.md),
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            /// brands with product count
            BrandCard(
              showBorder: false,
              brand: brand,
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),

            /// brand top 3 product images
            Row(
                children: images.map((image) => brandTopProductImageWidget(image, context)).toList())
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
        child: RoundedContainer(
          height: 100,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
          margin: const EdgeInsets.only(right: TSizes.sm),
          padding: const EdgeInsets.all(TSizes.md),
          child: CachedNetworkImage(
              fit: BoxFit.contain,
            imageUrl: image,
            progressIndicatorBuilder: (context,url,downloadProgress)=> const TShimmerEffect(width: 100, height: 100),
            errorWidget:(context,url,downloadProgress) => const Icon(Icons.error),
          ),
        ),
    );
  }
}
