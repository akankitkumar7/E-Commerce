import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/features/personalization/controllers/update_name_controller.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/constants/text_string.dart';
import 'package:e_com/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar:  TAppBar(
        showBackArrow: true,
        title: Text('Change Name',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text('Use real name for easy verification. This name will appear on several screens.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            /// text fields and buttons
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => TValidators.validateEmptyText('FirstName', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.firstName,prefixIcon: Icon(Iconsax.user)),
                  ),

                  const SizedBox(height: TSizes.spaceBtwInputFields,),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => TValidators.validateEmptyText('LastName', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.lastName,prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections,),

            /// save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: ()=> controller.updateUserName(),child: const Text('Save'),),
            )
          ],
        ),
      ),
    );
  }
}
