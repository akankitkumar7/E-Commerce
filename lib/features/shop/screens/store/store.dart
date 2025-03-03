import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/appbar/tabbar.dart';
import 'package:e_com/common/widgets/brands/brand_card.dart';
import 'package:e_com/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_com/common/widgets/layout/grid_layout_store_screen.dart';
import 'package:e_com/common/widgets/loaders/brand_shimmer.dart';
import 'package:e_com/common/widgets/productcart/cart_menu.dart';
import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/features/shop/controllers/brand_controller.dart';
import 'package:e_com/features/shop/controllers/category_controller.dart';
import 'package:e_com/features/shop/screens/brand/all_brands.dart';
import 'package:e_com/features/shop/screens/brand/brand_products.dart';
import 'package:e_com/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/constants/text_string.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CartCounterIcon(
              onPressed: () {},
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ///Search bar
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      const SearchContainer(
                        text: TTexts.searchText,
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// brands
                      SectionHeading(
                        title: 'Features Brands',
                        onPressed: () => Get.to(() => const AllBrandsScreen()) ,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),
                      Obx(
                        (){
                          if(brandController.isLoading.value) return const BrandShimmer();
                          if(brandController.featuredBrands.isEmpty){
                            return Center(
                              child: Text('No data found',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
                            );
                          }
                          return StoreGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand = brandController.featuredBrands[index];
                              return BrandCard(
                                  brand:brand,
                                  showBorder: true,
                                  onTap: ()=> Get.to(() => BrandProducts(brand: brand)),
                              );
                            },
                          );
                        }
                      ),
                    ],
                  ),
                ),

                /// tabs
                bottom: StoreTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
              children:categories.map((category) => CategoryTab(category:category)).toList(),
          ),
        ),
      ),
    );
  }
}
