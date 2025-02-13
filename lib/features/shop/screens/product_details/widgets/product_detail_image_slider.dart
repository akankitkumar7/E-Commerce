import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/custom_shapes/curved_edges/curves_edges_widget.dart';
import 'package:e_com/common/widgets/icons/circular_icon.dart';
import 'package:e_com/common/widgets/images/rounder_home_banner.dart';
import 'package:e_com/features/shop/controllers/product/images_controller.dart';
import 'package:e_com/features/shop/models/product_model.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key, required this.product,});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return CurveEdgesWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// main large product image
          SizedBox(
            height: 400,
            child: Padding(
            padding: const EdgeInsets.all(TSizes.productImageRadius*2),
            child: Center(child: Obx((){
              final image = controller.selectedProductImage.value;
              return  GestureDetector(
                onTap: () => controller.showEnlargeImage(image),
                child: CachedNetworkImage(
                  imageUrl: image,
                  progressIndicatorBuilder: (_,__, downloadProgress) =>
                    CircularProgressIndicator(
                  value: downloadProgress.progress,color: TColors.primary,
                ),),
              );
            })),
                ),
              ),

            /// image slider
            Positioned(right: 0, left: TSizes.defaultSpace,bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => Obx(
                    (){
                      final imageSelected = controller.selectedProductImage.value == images[index];
                      return RoundedImage(
                        width: 80,
                        isNetworkImage: true,
                        imageUrl: images[index],
                        padding: const EdgeInsets.all(TSizes.sm),
                        backgroundColor: dark ? TColors.dark : TColors.light,
                        onPressed: () => controller.selectedProductImage.value = images[index],
                        border: Border.all(color: imageSelected ? TColors.primary : Colors.transparent),
                      );
                    }
                  ),
                ),
              ),
            ),
            const TAppBar(
              showBackArrow: true,
              actions:[
                CircularIcon(icon: Iconsax.heart5,color: Colors.red,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
