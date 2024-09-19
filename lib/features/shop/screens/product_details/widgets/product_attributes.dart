import 'package:e_com/common/widgets/chips/choice_chips.dart';
import 'package:e_com/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:e_com/common/widgets/product/product_price.dart';
import 'package:e_com/common/widgets/texts/product_title_text.dart';
import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attributes Pricing and Description
        RoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(children: [
            Row(
              children: [
                const SectionHeading(
                    title: 'Variation', showActionButton: false),
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
                      Text(
                        '\$25',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),

                      /// sale price
                      const ProductPriceText(price: '20'),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                    ],
                  ),

                  /// stock
                  Row(
                    children: [
                      const ProductTitleText(
                        title: 'Stock',
                        smallSize: true,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 3,
                      ),
                      Text(
                        "In Stock",
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                ]),
              ],
            ),
            const ProductTitleText(
              title:
                  "This is the Description of the product and it can go up to maximum 4 lines ",
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
          children: [
            const SectionHeading(title: 'Choose the Color',showActionButton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItems/2,
            ),
            Wrap(
              spacing: 7,
              children: [
                TChoiceChips(text: 'Green',selected: true, onSelected: (value){},),
                TChoiceChips(text: 'Blue',selected: false, onSelected: (value){},),
                TChoiceChips(text: 'Yellow',selected: false, onSelected: (value){},),
                TChoiceChips(text: 'Pink',selected: false, onSelected: (value){},),
                TChoiceChips(text: 'Indigo',selected: false, onSelected: (value){},),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Select the Size',showActionButton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItems/2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChips(text: '6',selected: true, onSelected: (value){},),
                TChoiceChips(text: '7',selected: false, onSelected: (value){},),
                TChoiceChips(text: '8',selected: true, onSelected: (value){},),
                TChoiceChips(text: '9',selected: false, onSelected: (value){},),
                TChoiceChips(text: '10',selected: true, onSelected: (value){},),
              ],
            )
          ],
        )
      ],
    );
  }
}
