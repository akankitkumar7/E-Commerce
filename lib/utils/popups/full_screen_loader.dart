import 'package:e_com/common/widgets/loaders/animation_loader.dart';
import 'package:e_com/utils/constants/colors.dart';
import 'package:e_com/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TFullScreenLoader{
  static void openLoadingDialog(String text, String animation){
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
          canPop: false,
            child: Container(
              color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TAnimationLoaderWidget(text: text,animation: animation),
                  ],
                ),
              ),
            ),
        ),
    );
  }
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop(); // close the dialog using the navigator
  }
}