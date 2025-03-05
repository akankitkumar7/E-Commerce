import 'package:e_com/common/widgets/loaders/shimmer.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
class TListShimmer extends StatelessWidget {
  const TListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimmerEffect(width: 50, height: 50,radius: 50),
            SizedBox(width: TSizes.spaceBtwItems),
            Column(
              children: [
                TShimmerEffect(width: 100, height: 15),
                SizedBox(height: TSizes.spaceBtwItems/2),
                TShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
