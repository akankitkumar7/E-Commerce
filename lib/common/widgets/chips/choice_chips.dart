import 'package:e_com/common/widgets/custom_shapes/containers/containers.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TChoiceChips extends StatelessWidget {
  const TChoiceChips({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected:onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        selectedColor: Colors.green,
        avatar: isColor ? CircularContainer(
          height: 50,
          width: 50,
          backgroundColor: THelperFunctions.getColor(text)!)
            : null,
        labelPadding:isColor ? const EdgeInsets.all(0) : null,
        padding:isColor ? const EdgeInsets.all(0) : null,
        shape:isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? THelperFunctions.getColor(text)! :null,

        ),
    );
  }
}
