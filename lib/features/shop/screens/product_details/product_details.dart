import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/features/shop/screens/product_details/widgets/product_add_to_cart.dart';
import 'package:e_com/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_com/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:e_com/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_com/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:e_com/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// product image slider
            const ProductImageSlider(),

            ///product details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  ///rating and share button
                  const RatingAndShare(),

                  ///price title, stock and brand
                  const ProductMetaData(),

                  ///attributes sizes and colors
                  const ProductAttributes(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///checkout button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Checkout"))),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///description
                  const SectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    "Inspired by the original that debuted in 1985, the Air Jordan 1 Low"
                    " offers a clean, classic look that's familiar yet always fresh. "
                    "With an iconic design that pairs perfectly with any 'fit, these kicks ensure"
                    " you'll always be on point.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'less',
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,),
                    lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,),
                  ),

                  ///Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionHeading(title: 'Reviews(345)',onPressed: (){},showActionButton: false,),
                      IconButton(onPressed: ()=> Get.to(()=>const ProductReviewsScreen()) ,icon: const Icon(Iconsax.arrow_right_3))
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
