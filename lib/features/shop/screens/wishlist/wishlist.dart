import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/icons/circular_icon.dart';
import 'package:e_com/common/widgets/layout/grid_layout.dart';
import 'package:e_com/common/widgets/loaders/animation_loader.dart';
import 'package:e_com/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:e_com/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:e_com/features/shop/controllers/product/favourite_controller.dart';
import 'package:e_com/features/shop/screens/home/home.dart';
import 'package:e_com/navigation_menu.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Scaffold(
      appBar: TAppBar(
        title: Text("WishList",style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          CircularIcon(icon: Iconsax.add,onPressed: ()=>Get.to(()=> const HomeScreen()),)
          ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding:const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            ()=> FutureBuilder(
              future: controller.favouriteProduct(),
                builder: (context, snapshot){
                /// nothing found widget
                  final emptyWidget = TAnimationLoaderWidget(
                      text: 'Whoops! WishList is empty...',
                      animation: TImages.animation,
                      showAction: true,
                      actionText: 'Let\'s add something',
                      onActionPressed: () => Get.off(() => const NavigationMenu()),
                  );
                const loader = TVerticalProductShimmer(itemCount: 6);
                final widget = CloudHelperFunctions.checkMultiRecordStatus(snapShot: snapshot,loader: loader,nothingFound: emptyWidget);
                if(widget!=null) return widget;

                final products = snapshot.data!;
                 return HomeGridLayout(
                 itemCount: products.length,
                 itemBuilder: (_,index) => ProductCardVertical(product: products[index]));
                },
                    ),
          ),
      ),
      ));
  }
}

