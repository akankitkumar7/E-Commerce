import 'package:e_com/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:e_com/common/widgets/product/ratings/rating_indicator.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(backgroundImage: AssetImage(TImages.user1),),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text('Ankit Kumar', style: Theme.of(context).textTheme.bodyMedium,),
            ],
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
        ],

      ),
      const SizedBox(height: TSizes.spaceBtwItems,),
      /// review text
      Row(
        children: [
          const TRatingBarIndicator(rating: 3.8),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Text('10 September 2024', style: Theme.of(context).textTheme.bodyMedium,)
        ],
      ),
      const SizedBox(height: TSizes.spaceBtwItems,),
      const ReadMoreText(
        trimLines: 2,
        trimExpandedText: 'show less',
        trimCollapsedText: 'show more',
        moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
        lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
        trimMode: TrimMode.Line,
        'A simple yet fully customizable ratingbar for flutter which also include a rating bar indicator, supporting any fraction of rating.'
      ),
      const SizedBox(height: TSizes.spaceBtwItems,),
      RoundedContainer(
        backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child:Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('E-COM Company', style: Theme.of(context).textTheme.titleMedium,),
                  Text('17 September 2024', style: Theme.of(context).textTheme.bodyMedium,),

                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const ReadMoreText(
                  trimLines: 2,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                  trimMode: TrimMode.Line,
                  'A simple yet fully customizable ratingbar for flutter which also include a rating bar indicator, supporting any fraction of rating.'
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: TSizes.spaceBtwItems,),

    ]
    );
  }
}
