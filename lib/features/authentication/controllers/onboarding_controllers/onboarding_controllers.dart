import 'package:flutter/material.dart ';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../screens/login/login.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();


  /// variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
 /// update current index when page scroll


 void updatePageIndicator(index) => currentPageIndex.value = index;


  /// jum to the specific dot selected page
   void dotNavigationClick(index){
     currentPageIndex.value = index;
     pageController.jumpTo(index);
   }


  /// Update current index and jum to next page

  void nextPage(){
     if(currentPageIndex.value == 2){

       final storage = GetStorage();
       storage.write("isFirstTime", false);
       Get.offAll(const LoginScreen());
     }else{
       int page = currentPageIndex.value+1;
       pageController.jumpToPage(page);
     }
  }


  /// update current index and jump to last page


  void skipPage(){

    /// when you click on skip it "isFirstTime become false and next time you will not see any onboarding screens "
    final storage = GetStorage();
    storage.write("isFirstTime", false);
    Get.offAll(const LoginScreen());
  }
}