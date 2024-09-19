import 'package:e_com/common/styles/widgetsloginsignup/form_divider.dart';
import 'package:e_com/common/styles/widgetsloginsignup/social_login_buttons.dart';
import 'package:e_com/features/authentication/screens/signupWidgets/signupform.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///title
              Text(
                TTexts.signUpTitle.capitalize!,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///sign up form
              const SignUpForm(),
              const SizedBox(height: TSizes.spaceBtwSections,),
              
              ///divider
              const TFormDivider(dividerText: TTexts.orSignUpWith),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// social buttons
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

