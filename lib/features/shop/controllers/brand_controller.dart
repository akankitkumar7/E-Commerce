import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:e_com/data/repositories/brands/brands_repository.dart';
import 'package:e_com/data/repositories/product/product_repository.dart';
import 'package:e_com/features/shop/models/brand_model.dart';
import 'package:e_com/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  ///-- LOAD BRANDS
  Future<void>getFeaturedBrands()async{
    try{
      // show loaders while loading brands
      isLoading.value = true;
      final brands = await  brandRepository.getAllBrands();
      allBrands.assignAll(brands);

      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));

    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh snap!',message: e.toString());
    }finally{
      isLoading.value = false;
    }

  }
  ///-- Get brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId)async{
    try{
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh snap!',message: e.toString());
      return [];
    }

  }
  ///-- Get Brands specific product from your data sources

  Future<List<ProductModel>> getBrandProducts({ required String brandId, int limit = -1}) async{
    try {
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId,limit: limit);
      return products;
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh snap!',message: e.toString());
      return [];
    }
  }
}