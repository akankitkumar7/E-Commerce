import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/brands/brand_card.dart';
import 'package:e_com/common/widgets/product/sortable/sortable_products.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Nike'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// brand details
              BrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections,),
              SortableProducts(products: []),

            ],
          ),
        ),
      ),
    );
  }
}
