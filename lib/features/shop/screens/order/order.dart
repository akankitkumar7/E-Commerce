import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/features/shop/screens/order/widgets/order_list.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// app bar
      appBar: TAppBar(
        title: Text('My Orders',style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        /// orders

        child: OrderListItems(),

      ),
    );
  }
}
