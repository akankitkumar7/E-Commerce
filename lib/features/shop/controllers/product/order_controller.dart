import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:e_com/common/widgets/success_screen/success_screen.dart';
import 'package:e_com/data/repositories/order/order_repository.dart';
import 'package:e_com/data/repositories/repository_authentication/authentication_repository.dart';
import 'package:e_com/features/personalization/controllers/address_controller.dart';
import 'package:e_com/features/shop/controllers/product/cart_controller.dart';
import 'package:e_com/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_com/features/shop/models/order_model.dart';
import 'package:e_com/navigation_menu.dart';
import 'package:e_com/utils/constants/enums.dart';
import 'package:e_com/utils/constants/image_string.dart';
import 'package:e_com/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{
  static OrderController get instance => Get.find();


  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());


  /// fetch User's order history
  Future<List<OrderModel>> fetchUserOrders()async{
    try{
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    }catch(e){
      TLoaders.warningSnackBar(title: 'Oh Snap!',message: e.toString());
      return[];
    }
  }


 /// Add methods for processing

 void processOrder(double totalAmount)async{
    try{
      // Start the loader
      TFullScreenLoader.openLoadingDialog('Processing your Order', TImages.animation);

      //Get user authentication Id
      final userId = AuthenticationRepository.instance.authUser.uid;
      if(userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
        //Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // Set Data as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      // Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      // update the cart status
      cartController.clearCart();

      // show success screen
      Get.off(() => SuccessScreen(
        image: TImages.successfulPaymentIcon,
        title: 'Payment Success',
        subTitle: 'Your items will be shipped soon',
        onPressed: () => Get.offAll(() => const NavigationMenu()),
      ));

    }catch(e){
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
 }
}