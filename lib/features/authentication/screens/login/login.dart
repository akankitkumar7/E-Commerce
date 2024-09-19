import 'package:e_com/common/styles/spacing_styles.dart';
import 'package:e_com/common/styles/widgetsloginsignup/form_divider.dart';
import 'package:e_com/common/styles/widgetsloginsignup/social_login_buttons.dart';
import 'package:e_com/features/authentication/screens/login/widgets/login_header.dart';
import 'package:e_com/features/authentication/screens/login/widgets/longin_form.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///LOGO, TITLE AND SUBTITLE
              const LoginHeader(),

              /// FORM
              const LoginForm(),

              /// divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections,),
              /// footer
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
