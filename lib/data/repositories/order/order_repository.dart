import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/data/repositories/repository_authentication/authentication_repository.dart';
import 'package:e_com/features/shop/models/order_model.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController{
  static OrderRepository get instance => Get.find();


  /// variables
  final _db = FirebaseFirestore.instance;

  /// get all order related to current user
  Future<List<OrderModel>> fetchUserOrders()async{
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) throw 'Unable to find the user information. Try again Later';

      final result = await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs.map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot)).toList();
    }catch(e){
      throw "Something went wrong while fetching order Information. Try again Later";
    }
  }


  /// Store new user
  Future<void> saveOrder(OrderModel order, String userId) async{
    try{
      await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
    }catch(e){
      throw "Something went wrong while saving order Information. Try again Later";
    }
  }
}