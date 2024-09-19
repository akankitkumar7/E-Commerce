import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';


class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: THelperFunctions.screenWidth()*0.8,
            height: THelperFunctions.screenHeight()*0.6,
            image:AssetImage(image),
          ),
          Text(title,style:const TextStyle(color: Colors.black,fontSize: 32),textAlign: TextAlign.center,),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Text(subTitle,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}