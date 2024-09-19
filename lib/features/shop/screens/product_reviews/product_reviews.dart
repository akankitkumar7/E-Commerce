import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/product/ratings/rating_indicator.dart';
import 'package:e_com/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:e_com/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text(
          'Ratings and Reviews',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Rating and Reviews are verified and are from people who use same type of product that you will buy."),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// overall product rating
              const OverallProductRating(),
              const TRatingBarIndicator(rating: 3.6,),
              Text('77,565',style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),


              /// user reviews list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
