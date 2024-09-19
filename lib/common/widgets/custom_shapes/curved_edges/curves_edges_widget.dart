import 'package:e_com/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';
class CurveEdgesWidget extends StatelessWidget {
  const CurveEdgesWidget({super.key, this.child,});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvesEdges(),
      child: child,
    );
  }
}
