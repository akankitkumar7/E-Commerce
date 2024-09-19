import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/custom_shapes/curved_edges/curves_edges_widget.dart';
import 'package:e_com/common/widgets/icons/circular_icon.dart';
import 'package:e_com/common/widgets/images/rounder_home_banner.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key,});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return CurveEdgesWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// main large product image
            const SizedBox(
              child: Center(
                child: Image(
                  image: AssetImage(
                    TImages.productDetail1,
                  ),
                ),
              ),
            ),

            /// image slider
            Positioned(
              right: 0,
              left: TSizes.defaultSpace,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => RoundedImage(
                    width: 80,
                    imageUrl: TImages.productDetail3,
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    border: Border.all(color: TColors.primary),
                    padding: const EdgeInsets.all(TSizes.sm),
                  ),
                ),
              ),
            ),
            const TAppBar(
              showBackArrow: true,
              actions:[
                CircularIcon(icon: Iconsax.heart5,color: Colors.red,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
