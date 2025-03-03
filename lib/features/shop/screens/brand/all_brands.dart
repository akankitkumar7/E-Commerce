import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/brands/brand_card.dart';
import 'package:e_com/common/widgets/layout/grid_layout_store_screen.dart';
import 'package:e_com/common/widgets/loaders/brand_shimmer.dart';
import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/features/shop/controllers/brand_controller.dart';
import 'package:e_com/features/shop/screens/brand/brand_products.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brands'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// heading
              const SectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///brands
              Obx(
                    (){
                    if(brandController.isLoading.value) return const BrandShimmer();
                    if(brandController.allBrands.isEmpty){
                      return Center(
                        child: Text('No data found',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
                      );
                    }
                    return StoreGridLayout(
                      itemCount: brandController.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brand = brandController.allBrands[index];
                        return BrandCard(
                            brand:brand,
                            showBorder: true,
                            onTap: () =>Get.to(()=> BrandProducts(brand: brand,)),
                        );
                      },
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
