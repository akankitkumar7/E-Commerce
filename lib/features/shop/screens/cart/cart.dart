import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/loaders/animation_loader.dart';
import 'package:e_com/features/shop/controllers/product/cart_controller.dart';
import 'package:e_com/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_com/features/shop/screens/checkout/checkout.dart';
import 'package:e_com/navigation_menu.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Obx(() {
        /// nothing found widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! Cart is empty.',
          animation: TImages.animation,
          showAction: true,
          actionText: 'Let\'s add something',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  /// items in the cart
                  child: TCartItems(),
                ),
          );
        }
      }),

      ///checkout button
      bottomNavigationBar: controller.cartItems.isEmpty ? const SizedBox() : Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Obx(() => Text('Checkout   \$${controller.totalCartPrice.value}')),
        ),
      ),
    );
  }
}
