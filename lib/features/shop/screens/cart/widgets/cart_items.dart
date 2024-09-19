import 'package:e_com/common/widgets/product/product_price.dart';
import 'package:e_com/common/widgets/productcart/add_remove_button.dart';
import 'package:e_com/common/widgets/productcart/cart_item.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) =>
      const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemBuilder: (_, index) =>
       Column(
        children: [
          const TCartItem(),
          if(showAddRemoveButtons)const SizedBox(height: TSizes.spaceBtwItems,),

          /// add and remove item button
          if(showAddRemoveButtons)
            const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                  ),

                  /// add remove button
                  ProductQuantityAdderRemover(),
                ],
              ),

              /// product total price
              ProductPriceText(price: '250'),
            ],
          ),
        ],
      ),
    );
  }
}

