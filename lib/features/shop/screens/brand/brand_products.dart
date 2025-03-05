import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/brands/brand_card.dart';
import 'package:e_com/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:e_com/common/widgets/product/sortable/sortable_products.dart';
import 'package:e_com/features/shop/controllers/brand_controller.dart';
import 'package:e_com/features/shop/models/brand_model.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});


  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// brand details
              BrandCard(showBorder: true,brand: brand),
              const SizedBox(height: TSizes.spaceBtwSections,),
              FutureBuilder(
                future: controller.getBrandProducts(brandId:brand.id),
                  builder: (context, snapshot){

                  /// handle loader, no record or error messages
                  const loader = TVerticalProductShimmer();
                  final widget = CloudHelperFunctions.checkMultiRecordStatus(snapShot: snapshot,loader: loader);
                  if(widget != null) return widget;

                  ///--record found
                  final brandProducts = snapshot.data!;

                  return SortableProducts(products: brandProducts);
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
