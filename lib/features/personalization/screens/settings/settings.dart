import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_com/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:e_com/common/widgets/list_tile/user_profile_tile.dart';
import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/features/personalization/screens/address/address.dart';
import 'package:e_com/features/personalization/screens/profile/profile.dart';
import 'package:e_com/features/shop/screens/order/order.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///---Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      "Settings",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// user profile visit
                  UserProfileTile(onPressed: ()=>Get.to(()=>const ProfileScreen()),),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            ///---Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///---Account Settings
                  const SectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  SettingsMenuTile(
                    title: "My Address",
                    subTitle: "Set the Delivery Address for better experience and fastest delivery to your doorsteps",
                    icon: Iconsax.safe_home,
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  SettingsMenuTile(
                    title: "My Cart",
                    subTitle: "Add, remove products and move to checkout",
                    icon: Iconsax.shopping_cart,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: "My Orders",
                    subTitle: "In-progress or Completed Orders",
                    icon: Iconsax.safe_home,
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  SettingsMenuTile(
                    title: " My Bank Accounts",
                    subTitle: "Withdraw Balance to registered BnaK Account",
                    icon: Iconsax.bank,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: "Share Our App",
                    subTitle: "Share our app to your friends and family to get extra discount",
                    icon: Iconsax.share ,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: "Notifications",
                    subTitle: "Set any kind of notification messages",
                    icon: Iconsax.notification,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: "Account Privacy",
                    subTitle: "Manage data usage and connected accounts",
                    icon: Iconsax.security_card,
                    onTap: () {},
                  ),

                  /// app settings
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const SectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SettingsMenuTile(
                    title: "Geolocation",
                    subTitle: "Turn on your location for better and fast delivery",
                    icon: Iconsax.location,
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingsMenuTile(
                    title: "Safe Mode",
                    subTitle: "Turn on Safe Mode to for better experience of your children",
                    icon: Iconsax.security_user,
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  SettingsMenuTile(
                    title: "HD Image Quality",
                    subTitle: "Turn on to see that highest quality of images and videos of the products",
                    icon: Iconsax.image,
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),

                  ///--- logout button
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: (){}, child: const Text("Logout",style: TextStyle(color: Colors.red),)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
