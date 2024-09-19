import 'package:e_com/common/widgets/layout/grid_layout.dart';
import 'package:e_com/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// drop down
        DropdownButtonFormField(
          decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
              .map((option) => DropdownMenuItem(value:option,child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        /// products
        HomeGridLayout(
            itemCount: 12,
            itemBuilder: (_,index) => const ProductCardVertical()
        ),
      ],
    );
  }
}
