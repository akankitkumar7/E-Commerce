import 'package:e_com/common/widgets/chips/choice_chips.dart';
import 'package:e_com/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:e_com/common/widgets/product/product_price.dart';
import 'package:e_com/common/widgets/texts/product_title_text.dart';
import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/features/shop/controllers/product/variation_controller.dart';
import 'package:e_com/features/shop/models/product_model.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
        () => Column(
          children: [
        /// Selected Attributes Pricing and Description
        /// display variation price and stock when some variation is selected
        if(controller.selectedVariation.value.id.isNotEmpty)
        RoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(children: [
            Row(
              children: [
                const SectionHeading(title: 'Variation', showActionButton: false),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    children: [
                      const ProductTitleText(
                        title: 'Price:',
                        smallSize: true,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 3,
                      ),

                      /// actual price
                      if(controller.selectedVariation.value.salePrice > 0)
                      Text(
                        '\$${controller.selectedVariation.value.price}',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),

                      /// sale price
                      ProductPriceText(price:controller.getVariationPrice()),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                    ],
                  ),

                  /// stock
                  Row(
                    children: [
                      const ProductTitleText(title: 'Stock', smallSize: true,),
                      const SizedBox(width: TSizes.spaceBtwItems / 3),
                      Text(controller.variationStockStatus.value, style: Theme.of(context).textTheme.labelMedium,)
                    ],
                  ),
                ]),
              ],
            ),
            ProductTitleText(
              title: controller.selectedVariation.value.description ?? '' ,
              maxLines: 4,
              smallSize: true,
            )
          ]),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!
              .map((attribute) => Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeading(
                        title: attribute.name ?? " ",
                        showActionButton: false,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {

                            final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                            final available = controller.getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!)
                            .contains(attributeValue);
                             return TChoiceChips(text: attributeValue, selected: isSelected, onSelected: available ? (selected){
                               if(selected && available){
                                 controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                               }
                             } : null);
                          }).toList()
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ]),
    );
  }
}
