import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:e_com/common/widgets/productcart/coupon_widget.dart';
import 'package:e_com/common/widgets/success_screen/success_screen.dart';
import 'package:e_com/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_com/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_com/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_com/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_com/navigation_menu.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(showBackArrow: true,title: Text('Order Summary',style: Theme.of(context).textTheme.headlineSmall,),),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),

          child: Column(
            children: [
              /// items in the cart
              const TCartItems(showAddRemoveButtons: false,),
              const SizedBox(height: TSizes.spaceBtwSections,),


              /// coupon text field
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// billing section
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    /// pricing
                    BillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    /// divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    /// payment methods
                    BillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    /// address
                    BillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      ///checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: "Payment Successful",
                subTitle: "Your item will shipped soon!!",
                onPressed: () => Get.offAll(()=>const NavigationMenu()),
            ),
            ),
            child: const Text('Place Order   \$256.0')),
      ),
    );
  }
}
