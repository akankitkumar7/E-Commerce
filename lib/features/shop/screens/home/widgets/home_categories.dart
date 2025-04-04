import 'package:e_com/common/widgets/image_text_vertical/vertical_image_text.dart';
import 'package:e_com/common/widgets/loaders/category_shimmer.dart';
import 'package:e_com/features/shop/controllers/category_controller.dart';
import 'package:e_com/features/shop/screens/sub_category/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
        if(categoryController.isLoading.value) return const TCategoryShimmer();
        if(categoryController.featuredCategories.isEmpty){
          return Center(child: Text('No data Found!',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: categoryController.featuredCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categoryController.featuredCategories[index];
                return VerticalImageText(
                  image: category.image,
                  title: category.name,
                  onTap: () => Get.to(() => SubCategoriesScreen(category:category)),
                );
              }),
        );
      }
    );
  }
}
