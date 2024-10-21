import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:e_com/features/shop/models/categories_model.dart';
import 'package:get/get.dart';
import 'package:e_com/data/repositories/category/category_repsoitory.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  ///-- load category data
  Future<void> fetchCategories() async{
    try{
      // show loader while loading category
      isLoading.value = true;

      //  fetch categories from data sources(firestore, api, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // update the categories list
      allCategories.assignAll(categories);

      // filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8));
    } catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    } finally{
      // remove loader
      isLoading.value = false;
    }
  }

  ///-- load selected category

  ///-- get category or sub-category Product
}