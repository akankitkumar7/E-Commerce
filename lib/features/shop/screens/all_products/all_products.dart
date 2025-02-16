import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/common/widgets/appbar/appbar.dart';
import 'package:e_com/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:e_com/common/widgets/product/sortable/sortable_products.dart';
import 'package:e_com/features/shop/controllers/product/all_products_controller.dart';
import 'package:e_com/features/shop/models/product_model.dart';
import 'package:e_com/utils/constants/sizes.dart';
import 'package:e_com/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {

    // Initialize controller for managing product fetching
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: TAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
                 future: futureMethod ?? controller.fetchProductsByQuery(query),
                 builder: (context, snapshot) {

                   // check the state of the future builder snapshot state
                   const loader = TVerticalProductShimmer();
                   final widget = CloudHelperFunctions.checkMultiRecordStatus(snapShot: snapshot, loader: loader);
                   // return appropriate widget base on snapshot state
                   if(widget != null) return widget;

                   // product found
                   final products = snapshot.data!;
                  return SortableProducts(products: products);
            }
          ),
        ),
      ),
    );
  }
}
