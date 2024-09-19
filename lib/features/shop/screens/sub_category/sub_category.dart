import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/images/rounder_home_banner.dart';
import 'package:e_com/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Sports'),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///  sub category banner
              const RoundedImage(width:double.infinity,applyImageRadius: true,imageUrl: TImages.subcategories2),
              const SizedBox(height: TSizes.spaceBtwSections,),


              /// sub category
              Column(
                children: [
                  /// heading
                  SectionHeading(title: 'Sports Shirts',onPressed: (){},),
                  const SizedBox(height: TSizes.spaceBtwItems/2,),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: (context,index) => const SizedBox(width: TSizes.spaceBtwItems,),
                      itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder : (context,index) => const ProductCardHorizontal()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
