import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/features/personalization/controllers/user_controller.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/constants/text_string.dart';
import 'package:e_com/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
        appBar: const TAppBar(
          title: Text('Re-Authenticate User'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Form(
                key: controller.reAuthFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// email
                    TextFormField(
                      controller: controller.verifyEmail,
                      validator: TValidators.validateEmail,
                      decoration:const  InputDecoration(prefixIcon: Icon(Iconsax.direct_right),labelText: TTexts.email),

                    ),

                    const SizedBox(height: TSizes.spaceBtwInputFields,),

                    /// password
                    Obx(
                      () => TextFormField(
                        obscureText: controller.hidePassword.value,
                        controller: controller.verifyPassword,
                        validator: (value) => TValidators.validateEmptyText('Password', value),
                        decoration:  InputDecoration(
                            labelText: TTexts.password,
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: IconButton(onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye),))
                        ),
                      ),
                    const SizedBox(height: TSizes.spaceBtwSections,),

                    /// login button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify')),
                    )
                  ],
                )),
          ),
        ));
  }
}
