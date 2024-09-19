import 'package:e_com/features/authentication/controllers/onboarding_controllers/onboarding_controllers.dart';
import 'package:e_com/features/authentication/screens/screen_onboarding/widgets/onboarding_navigation.dart';
import 'package:e_com/features/authentication/screens/screen_onboarding/widgets/onboarding_page.dart';
import 'package:e_com/features/authentication/screens/screen_onboarding/widgets/onboarding_skip.dart';
import 'package:e_com/features/authentication/screens/screen_onboarding/widgets/onboardingnextbutton.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// horizontal scroll page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          ///skip button
          const OnBoardSkip(),

          /// smooth page indicator
         const OnBoardingDotNavigation(),

          /// circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}





