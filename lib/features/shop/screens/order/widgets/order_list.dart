import 'package:e_com/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:e_com/common/widgets/loaders/animation_loader.dart';
import 'package:e_com/features/shop/controllers/product/order_controller.dart';
import 'package:e_com/navigation_menu.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/cloud_helper_functions.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = THelperFunctions.isDarkMode(context);
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_,snapshot){
        /// Nothing found widget
        final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! No Order Yet!',
            animation: TImages.animation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        /// Helper functions: Handle err, nor record or error messages
        final response = CloudHelperFunctions.checkMultiRecordStatus(snapShot: snapshot,nothingFound: emptyWidget);
        if(response != null) return response;


        /// congratulations
        final orders = snapshot.data!;
        return ListView.separated(
          itemCount: orders.length,
          shrinkWrap: true,
          separatorBuilder: (_,__) => const SizedBox(height: TSizes.spaceBtwItems,),
          itemBuilder: (_,index) {
            final order = orders[index];
            return RoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Top Row
                  Row(
                    children: [
                      /// 1 - Image
                      const Icon(Iconsax.ship),
                      const SizedBox(width: TSizes.spaceBtwItems/2,),

                      /// 2 - status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(order.orderStatusText,style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary,fontWeightDelta: 1),),
                            Text(order.formatedOrderDate,style: Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34,size: TSizes.iconSm,))
                    ],
                  ) ,
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  /// row 2
                  Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(width: TSizes.spaceBtwItems/2,),
                      /// status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order',style: Theme.of(context).textTheme.labelLarge),
                            Text(order.id,maxLines: 1,style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.calendar),
                            const SizedBox(width: TSizes.spaceBtwItems/2,),

                            /// status and date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Shipping Date',style: Theme.of(context).textTheme.labelLarge),
                                  Text(order.formatDeliveryDate,maxLines: 1,style: Theme.of(context).textTheme.titleMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },

    );
  }
}
