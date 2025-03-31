import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController{
  static NetworkManager get instance => Get.find();
  
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;
  
  
  /// initialize the network manager and set up a stream to continually check the connection status

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      if (results.isNotEmpty) {
        _updateConnectionStatus(results.first); // Pick the first connectivity result
      }
    });
  }


  /// update the connection status based on changes in connectivity and show a relevant popup for no internet connection
  Future<void> _updateConnectionStatus(ConnectivityResult result) async{
    _connectionStatus.value = result;
    if(_connectionStatus.value == ConnectivityResult.none){
      TLoaders.customToast(message : "No Internet Connection");
    }
  }

  /// check the internet connection status
 /// returns 'true' if connected 'false' otherwise
 Future<bool> isConnected() async{
    try{
      final result = await _connectivity.checkConnectivity();
      if(result == ConnectivityResult.none){
        return false;
      }else{
        return true;
      }
    } on PlatformException {
      return false;
    }
 }
 
 @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }

}