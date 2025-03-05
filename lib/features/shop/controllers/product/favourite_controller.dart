import 'dart:convert';
import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:e_com/data/repositories/product/product_repository.dart';
import 'package:e_com/features/shop/models/product_model.dart';
import 'package:e_com/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController{
  static FavouriteController get instance => Get.find();


  /// variables
  final favourites = <String, bool>{}.obs;
  @override
  void onInit() {
    super.onInit();
    initFavourites();

  }


  // method to initialize favourites by reading from storage

  void initFavourites(){
    final json = TLocalStorage.instance().readData('favourites');
    if(json!=null){
      final storedFavourites = jsonDecode(json) as Map<String,dynamic>;
      favourites.assignAll(storedFavourites.map((key,value) => MapEntry(key, value as bool)));
    }
  }


  bool isFavourite(String productId){
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId){
    if(favourites.containsKey(productId)){
      favourites[productId] = true;
      saveFavouritesToStorage();
      TLoaders.customToast(message: 'Product has been added to the wishlist.');
    }else{
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      TLoaders.customToast(message: 'Product has been removed from Wishlist.');
    }
  }


  void saveFavouritesToStorage(){
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData('favourites', encodedFavourites);
  }


  Future<List<ProductModel>> favouriteProduct()async{
    return await ProductRepository.instance.getFavouriteProduct(favourites.keys.toList());
  }

}