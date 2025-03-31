import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/features/shop/models/payment_method_model.dart';
import 'package:e_com/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController{
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(image: TImages.paypal, name: 'Paypal');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(TSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionHeading(title: 'Select Payment Method',showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwSections),
                PaymentTile(paymentMethod:PaymentMethodModel(name: 'Paypal',image: TImages.paypal)),
                const SizedBox(height: TSizes.spaceBtwItems/2,),
                PaymentTile(paymentMethod:PaymentMethodModel(name: 'Google Pay',image: TImages.googlePay)),
                const SizedBox(height: TSizes.spaceBtwItems/2,),
                PaymentTile(paymentMethod:PaymentMethodModel(name: 'Master Card',image: TImages.masterCard)),
                const SizedBox(height: TSizes.spaceBtwItems/2,),
                PaymentTile(paymentMethod:PaymentMethodModel(name: 'Credit Card',image: TImages.creditCard)),
                const SizedBox(height: TSizes.spaceBtwItems/2,),
                PaymentTile(paymentMethod:PaymentMethodModel(name: 'Visa',image: TImages.visa)),
                const SizedBox(height: TSizes.spaceBtwItems/2,),
                PaymentTile(paymentMethod:PaymentMethodModel(name: 'Apple Pay',image: TImages.applePay)),
                const SizedBox(height: TSizes.spaceBtwItems/2,),
                PaymentTile(paymentMethod:PaymentMethodModel(name: 'Paytm',image: TImages.paytm)),
                const SizedBox(height: TSizes.spaceBtwItems/2,),
                PaymentTile(paymentMethod:PaymentMethodModel(name: 'Pat Stack',image: TImages.payStack)),
                const SizedBox(height: TSizes.spaceBtwItems/2,),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
        ),
    );
  }
}