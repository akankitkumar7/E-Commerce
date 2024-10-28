import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/icons/circular_icon.dart';
import 'package:e_com/common/widgets/layout/grid_layout.dart';
import 'package:e_com/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:e_com/features/shop/models/product_model.dart';
import 'package:e_com/features/shop/screens/home/home.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("WishList",style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          CircularIcon(icon: Iconsax.add,onPressed: ()=>Get.to(()=> const HomeScreen()),)
          ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding:const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              HomeGridLayout(itemCount: 6, itemBuilder: (_,index) => ProductCardVertical(product: ProductModel.empty()))
            ],
          ),

        ),
      ),
    );
  }
}

