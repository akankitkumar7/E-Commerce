import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:e_com/data/repositories/product/product_repository.dart';
import 'package:e_com/features/shop/models/product_model.dart';
import 'package:e_com/utils/constants/enums.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;


  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }



  void fetchFeaturedProducts() async{
    try{
      isLoading.value = true;

      // fetch products
      final products = await productRepository.getFeaturedProducts();

      //assign products
      featuredProducts.assignAll(products);

    } catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }finally{
      // remove the loader
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async{
    try{

      // fetch products
      final products = await productRepository.getFeaturedProducts();
      return products;

    } catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      return [];
    }
  }


  /// get the product price or price range for variation
  String getProductPrice(ProductModel product){
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // if no variation exist, return the simple price or sale price
    if(product.productType == ProductType.single.toString()){
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else{

      //calculate the smallest and largest prices among variations
      for(var variation in product.productVariations!){
        // determine the sale price to consider(sale price if available, otherwise regular price)
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // update smallest and largest prices
        if(priceToConsider < smallestPrice){
          smallestPrice = priceToConsider;
        }
        if(priceToConsider > largestPrice){
          largestPrice = priceToConsider;
        }
      }
      // if smallest and largest price are the same, return a single price
      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toString();
      } else{
        // otherwise return a price range
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  /// calculate discount percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice){
    if(salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <= 0) return null;
    double percentage = ((originalPrice-salePrice)/originalPrice)*100;
    return percentage.toStringAsFixed(0); // to make 12.45 = 12

  }


  /// check product stock status
  String getProductStockStatus(int stock){
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}