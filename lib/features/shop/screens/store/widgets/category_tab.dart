import 'package:e_com/common/widgets/brands/brand_show_case.dart';
import 'package:e_com/common/widgets/layout/grid_layout.dart';
import 'package:e_com/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children:[ Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          /// brands
          children: [
            const BrandShowcase(
              images: [
                TImages.homeProductImage1,
                TImages.homeProductImage2,
                TImages.homeProductImage3,
                TImages.homeProductImage4,
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),
            const BrandShowcase(
              images: [
                TImages.homeProductImage1,
                TImages.homeProductImage2,
                TImages.homeProductImage3,
                TImages.homeProductImage4,
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections,),
            /// products
            SectionHeading(title: 'You might like',onPressed: (){},),
            const SizedBox(height: TSizes.spaceBtwItems,),
            HomeGridLayout(itemCount: 4, itemBuilder: (_, index)=> const ProductCardVertical()),
          ],
        ),
      ),
    ]);
  }
}
