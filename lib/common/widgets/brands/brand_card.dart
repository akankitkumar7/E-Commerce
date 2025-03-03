import 'package:e_com/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:e_com/common/widgets/images/circular_image.dart';
import 'package:e_com/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:e_com/features/shop/models/brand_model.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/enums.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.showBorder,
    this.onTap, required this.brand,

  });
  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// icon
            Flexible(
              child: CircularImage(
                image: brand.image,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2,),

            /// text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BrandTitleTextWithVerifiedIcon(
                    title: brand.name,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '${brand.productCount ?? 0} products',
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
