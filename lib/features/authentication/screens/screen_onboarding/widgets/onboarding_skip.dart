import 'package:e_com/features/authentication/controllers/onboarding_controllers/onboarding_controllers.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardSkip extends StatelessWidget {
  const OnBoardSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(onPressed: () => OnBoardingController.instance.skipPage(),
            child: const Text('Skip'))
    );
  }
}