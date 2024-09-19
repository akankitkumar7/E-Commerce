import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/devices/device_utility.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class StoreTabBar extends StatelessWidget implements PreferredSizeWidget {
  const StoreTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: TSizes.sm),
        child: TabBar(
          tabs: tabs,
          isScrollable: true,
          indicatorColor: TColors.primary,
          indicatorWeight: 5,
          unselectedLabelColor: TColors.darkGrey,
          labelColor: dark ? TColors.white : TColors.primary,
          tabAlignment: TabAlignment.start,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
