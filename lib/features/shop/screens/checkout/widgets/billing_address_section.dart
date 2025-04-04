import 'package:e_com/common/widgets/texts/section_heading.dart';
import 'package:e_com/features/personalization/controllers/address_controller.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(title: 'Shipping Address', buttonTitle: "Change",onPressed:() => addressController.selectNewAddressPopup(context),),
        addressController.selectedAddress.value.id.isNotEmpty ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ankit Kumar',style: Theme.of(context).textTheme.bodyLarge,),
            const SizedBox(width: TSizes.spaceBtwItems/2,),
            Row(
              children: [
                const Icon(Icons.phone,color: Colors.grey,size: 16,),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text("8765136250",style: Theme.of(context).textTheme.bodyMedium,)
              ],
            ),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Row(
              children: [
                const Icon(Icons.location_history,color: Colors.grey,size: 16,),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text("NeelKanth Boys Hostel NIT Hamirpur",style: Theme.of(context).textTheme.bodyMedium,)
              ],
            ),
          ],
        ) : Text('Select Address',style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
