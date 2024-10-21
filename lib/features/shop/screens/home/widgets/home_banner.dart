import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_com/common/widgets/custom_shapes/containers/containers.dart';
import 'package:e_com/common/widgets/images/rounder_home_banner.dart';
import 'package:e_com/common/widgets/loaders/shimmer.dart';
import 'package:e_com/features/shop/controllers/banner_controller.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        //loader
        if(controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 190);
        // no data found
        if(controller.banners.isEmpty){
          return const Center(child: Text('No Data found'),);
        } else{
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index),
                ),
                items: controller.banners
                    .map((banner) =>
                    RoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    ))
                    .toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Obx(
                    () =>
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < controller.banners.length; i++)
                          CircularContainer(
                            height: 4,
                            width: 20,
                            backgroundColor: controller.carouselCurrentIndex
                                .value == i
                                ? TColors.primary
                                : TColors.grey,
                            margin: const EdgeInsets.only(right: 10),
                          ),
                      ],
                    ),
              )
            ],
          );
        }
      }
      );
  }
}
