import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/features/personalization/controllers/address_controller.dart';
import 'package:e_com/features/personalization/screens/address/add_new_address.dart';
import 'package:e_com/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              // use key to trigger refresh
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddresses(),
              builder: (context,snapshot){
                /// handle loader, no record, or no data
                final response = CloudHelperFunctions.checkMultiRecordStatus(snapShot: snapshot);
                if(response!=null) return response;

                final addresses = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (_,index) => SingleAddress(address: addresses[index],
                    onTap:() => controller.selectAddress(addresses[index]),
                  ),
                );
              }
              ),
          ),
        ),
      ),
    );
  }
}
