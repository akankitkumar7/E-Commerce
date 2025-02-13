import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/features/shop/models/product_model.dart';
import 'package:e_com/features/shop/screens/product_details/widgets/product_add_to_cart.dart';
import 'package:e_com/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_com/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:e_com/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_com/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:e_com/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_com/utils/constants/enums.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// product image slider
            ProductImageSlider(product:product),

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
                  ProductMetaData(product: product),

                  ///attributes sizes and colors
                  if(product.productType == ProductType.variable.toString()) ProductAttributes(product: product,),
                  if(product.productType == ProductType.variable.toString()) const SizedBox(height: TSizes.spaceBtwSections,),

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
                  ReadMoreText(
                    product.description ?? " ",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'less',
                    moreStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,),
                    lessStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,),
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
