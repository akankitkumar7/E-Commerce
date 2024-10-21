import 'package:e_com/common/widgets/loaders/loaders.dart';
import 'package:e_com/data/repositories/banners/banner_repository.dart';
import 'package:e_com/features/shop/models/banner_model.dart';
import 'package:get/get.dart';
class BannerController extends GetxController{
  // static BannerController get instance => Get.find();

  /// variables
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index){
    carouselCurrentIndex.value = index;
  }

  /// fetch banners
  Future<void> fetchBanners() async{
    try{
      // show loader while loading category
      isLoading.value = true;
      // fetch all the banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // assign banners
      this.banners.assignAll(banners);

    } catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    } finally{
      // remove loader
      isLoading.value = false;
    }
  }

}