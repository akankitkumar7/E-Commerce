import 'package:e_com/common/widgets/brands/brand_show_case.dart';
import 'package:e_com/common/widgets/loaders/boxes_shimmers.dart';
import 'package:e_com/common/widgets/loaders/list_tile_shimmer.dart';
import 'package:e_com/features/shop/controllers/brand_controller.dart';
import 'package:e_com/features/shop/models/categories_model.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot){
        /// handle loader, no record or error messages
        const loader = Column(
          children: [
            TListShimmer(),
            SizedBox(height: TSizes.spaceBtwItems,),
            TBoxesShimmer(),
            SizedBox(height: TSizes.spaceBtwItems,),

          ],
        );

        final widget = CloudHelperFunctions.checkMultiRecordStatus(snapShot: snapshot,loader: loader);
        if(widget !=null) return widget;

        /// record found!
        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index){
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id,limit: 3),
              builder: (context, snapshot){
                /// handle loader, no record or error messages
                final widget = CloudHelperFunctions.checkMultiRecordStatus(snapShot: snapshot,loader: loader);
                if(widget != null) return widget;


                /// record found
                final products = snapshot.data!;
                return BrandShowcase(brand: brand,images: products.map((e) => e.thumbnail).toList());
              },
            );
            }
        );

      },
    );
  }
}
