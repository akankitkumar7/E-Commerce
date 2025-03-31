import 'package:e_com/common/widgets/product/product_price.dart';
import 'package:e_com/common/widgets/productcart/add_remove_button.dart';
import 'package:e_com/common/widgets/productcart/cart_item.dart';
import 'package:e_com/features/shop/controllers/product/cart_controller.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
            return Column(
              children: [
                TCartItem(cartItem: item),
                if(showAddRemoveButtons)const SizedBox(height: TSizes.spaceBtwItems,),

                /// add and remove item button
                if(showAddRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 70,
                          ),

                          /// add remove button
                          ProductQuantityAdderRemover(quantity: item.quantity,
                            add: () => cartController.addOneToCart(item),
                            remove: () => cartController.removeOneFromCart(item),
                          ),
                        ],
                      ),

                      /// product total price
                      ProductPriceText(price: (item.price*item.quantity).toStringAsFixed(1)),
                    ],
                  ),
              ],
            );
          }
        ),
      ),
    );
  }
}

