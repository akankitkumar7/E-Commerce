import 'package:e_com/common/widgets/layout/grid_layout_store_screen.dart';
import 'package:e_com/common/widgets/loaders/shimmer.dart';
import 'package:flutter/material.dart';


class BrandShimmer extends StatelessWidget {
  const BrandShimmer({super.key, this.itemCount = 4});


  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return StoreGridLayout(
        mainAxisExtent: 80,
        itemCount: itemCount,
        itemBuilder: (_,__) => const TShimmerEffect(width: 300, height: 80),
    );
  }
}
