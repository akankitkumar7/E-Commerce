import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/images/rounder_home_banner.dart';
import 'package:e_com/common/widgets/loaders/horizontal_product_shimmer.dart';
import 'package:e_com/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/features/shop/controllers/category_controller.dart';
import 'package:e_com/features/shop/models/categories_model.dart';
import 'package:e_com/features/shop/screens/all_products/all_products.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(category.name),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///  sub category banner
              const RoundedImage(width:double.infinity,applyImageRadius: true,imageUrl: TImages.subcategories2),
              const SizedBox(height: TSizes.spaceBtwSections,),


              /// sub category
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context,snapshot){

                  /// handle loader, no record, or error messages
                  const loader = HorizontalProductShimmer();
                  final widget = CloudHelperFunctions.checkMultiRecordStatus(snapShot: snapshot,loader: loader);
                  if(widget!=null) return widget;

                  /// record found
                  final subCategories = snapshot.data!;

                  return ListView.builder(
                      shrinkWrap:true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_,index){
                        final subCategory = subCategories[index];
                        return FutureBuilder(
                          future: controller.getCategoryProduct(categoryId: subCategory.id),
                          builder: (context,snapshot){
                            /// handle loader, no record, or error messages
                            final widget = CloudHelperFunctions.checkMultiRecordStatus(snapShot: snapshot,loader: loader);
                            if(widget!=null) return widget;

                            /// congratulations record found

                            final products = snapshot.data!;
                            return Column(
                              children: [
                                /// heading
                                SectionHeading(title: subCategory.name,onPressed: () => Get.to(
                                        () => AllProducts(title: subCategory.name,
                                      futureMethod: controller.getCategoryProduct(categoryId: subCategory.id,limit: -1),
                                    )
                                ),),
                                const SizedBox(height: TSizes.spaceBtwItems/2,),

                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                    separatorBuilder: (context,index) => const SizedBox(width: TSizes.spaceBtwItems,),
                                    itemCount: products.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder : (context,index) => ProductCardHorizontal(product:products[index]),
                                  ),
                                ),
                                const SizedBox(height: TSizes.spaceBtwSections),
                              ],
                            );
                          },

                        );
                      },
                  );

                }

              )
            ],
          ),
        ),
      ),
    );
  }
}
