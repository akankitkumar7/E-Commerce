import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///rating
        Row(
          children: [
            const Icon(Iconsax.star5,color: Colors.amber,size: 24,),
            const SizedBox(width: TSizes.spaceBtwItems/2,),
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: "4.2",style: Theme.of(context).textTheme.bodyLarge),
                      const TextSpan(text: '  (234 ratings)'),
                    ]
                )
            )
          ],
        ),
        /// share button
        IconButton(onPressed: (){}, icon: const Icon(Icons.share,size: TSizes.iconMd,))
      ],
    );
  }
}
