import 'package:e_com/common/widgets/layout/grid_layout.dart';
import 'package:e_com/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:e_com/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/features/shop/controllers/category_controller.dart';
import 'package:e_com/features/shop/models/categories_model.dart';
import 'package:e_com/features/shop/screens/all_products/all_products.dart';
import 'package:e_com/features/shop/screens/store/widgets/category_brands.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children:[ Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// brands
            CategoryBrands(category: category),

            const SizedBox(height: TSizes.spaceBtwSections,),
            /// products
            FutureBuilder(
              future: controller.getCategoryProduct(categoryId:category.id),
              builder: (context, snapshot){
                final response = CloudHelperFunctions.checkMultiRecordStatus(snapShot: snapshot,loader: const TVerticalProductShimmer());
                if(response!=null) return response;

                // record found
                final products = snapshot.data!;
                return Column(
                  children: [
                    SectionHeading(title: 'You might like',onPressed: ()=> Get.to(()=>AllProducts(title: category.name,futureMethod:controller.getCategoryProduct(categoryId: category.id,limit: -1)))),
                    const SizedBox(height: TSizes.spaceBtwItems,),
                    HomeGridLayout(itemCount: products.length, itemBuilder: (_, index)=> ProductCardVertical(product: products[index])),
                  ],
                );
              }

            ),
          ],
        ),
      ),
    ]);
  }
}
