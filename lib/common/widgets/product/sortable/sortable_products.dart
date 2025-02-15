import 'package:e_com/common/widgets/layout/grid_layout.dart';
import 'package:e_com/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:e_com/features/shop/controllers/product/all_products_controller.dart';
import 'package:e_com/features/shop/models/product_model.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class SortableProducts extends StatelessWidget {
  const SortableProducts({super.key, required this.products});

  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    // initialize controller for managing product sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// drop down
        DropdownButtonFormField(
          decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // sort products base on the selected options
            controller.sortProducts(value!);
          },
          items: ['Name', 'Higher Price', 'Lower Price','Newest' ,'Sale']
              .map((option) => DropdownMenuItem(value:option,child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        /// products
        Obx(
             () => HomeGridLayout(
               itemCount: controller.products.length,
              itemBuilder: (_,index) => ProductCardVertical(product: controller.products[index]),
          ),
        ),
      ],
    );
  }
}
