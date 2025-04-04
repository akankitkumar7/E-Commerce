import 'package:e_com/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:e_com/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:e_com/features/shop/controllers/product/product_controller.dart';
import 'package:e_com/features/shop/screens/all_products/all_products.dart';
import 'package:flutter/material.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/text_string.dart';
import 'package:e_com/common/widgets/layout/grid_layout.dart';
import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_com/features/shop/screens/home/widgets/home_banner.dart';
import 'package:e_com/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_com/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_com/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// app bar
                  HomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///search bar
                  SearchContainer(text: TTexts.searchText),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// headings  (popular categories)
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(
                          showActionButton: false,
                          textColor: TColors.white,
                          title: "Popular Categories",
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        /// categories (circular items)
                        HomeCategories()
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// home banner images slider
                  const BannerSlider(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// heading
                  SectionHeading(
                    title: "Popular Products",
                    onPressed: () => Get.to(() => AllProducts(
                          title: 'Popular Products',
                          futureMethod: controller.fetchAllFeaturedProducts(),
                        )),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// popular products
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          'No Data Found',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return HomeGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => ProductCardVertical(
                            product: controller.featuredProducts[index]));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
