import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_com/utils/constants/text_string.dart';
import 'package:e_com/utils/constants/colors.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({super.key,required this.dividerText});
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.grey,
            thickness: 2,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(TTexts.orSignUpWith.capitalize!,style: Theme.of(context).textTheme.labelMedium,),
         Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.grey,
            thickness: 2,
            indent: 5,
            endIndent: 60,
          ),),
      ],
    );
  }
}
