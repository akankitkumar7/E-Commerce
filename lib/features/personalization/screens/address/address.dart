import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/features/personalization/screens/address/add_new_address.dart';
import 'package:e_com/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: TColors.primary,
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Addresses'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(selectedAddress: false),
              SizedBox(height: TSizes.spaceBtwItems,),
              SingleAddress(selectedAddress: true),
            ],
          ),
        ),
      ),
    );
  }
}
