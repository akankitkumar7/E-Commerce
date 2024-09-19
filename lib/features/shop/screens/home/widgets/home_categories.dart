import 'package:e_com/common/widgets/image_text_vertical/vertical_image_text.dart';
import 'package:e_com/features/shop/screens/sub_category/sub_category.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return VerticalImageText(
              image: TImages.google,
              title: 'Google',
              onTap: () => Get.to(() => const SubCategoriesScreen()),
            );
          }),
    );
  }
}
