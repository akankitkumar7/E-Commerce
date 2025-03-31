import 'package:e_com/features/shop/controllers/product/cart_controller.dart';
import 'package:e_com/features/shop/controllers/product/images_controller.dart';
import 'package:e_com/features/shop/models/product_model.dart';
import 'package:e_com/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController{
  static VariationController get instances => Get.find();



  /// variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  /// select attributes and variation
  void onAttributeSelected(ProductModel product, attributeName, attributeValue){
    // when attributes is selected we will first add that attributes to the selectedAttributes
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere((variation) => _isSameAttributeValues(variation.attributeValues,selectedAttributes),orElse: () => ProductVariationModel.empty());

    // show the selected variation image as a main image
    if(selectedVariation.image.isNotEmpty){
      ImagesController.instance.selectedProductImage.value = selectedVariation.image;
    }


    // show selected variation quantity already in the cart
    if(selectedVariation.id.isNotEmpty){
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    // assign selected variation
    this.selectedVariation.value = selectedVariation;

    // update selected the product variation status

    getProductVariationStockStatus();
  }

  /// check if selected attributes matches any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes){
    // if selected attributes contains 3 attributes and the current variation contains two the return.
    if(variationAttributes.length != selectedAttributes.length) return false;

    // if any of the attributes is different then return. e.g. [green large] x [green small]
    for(final key in variationAttributes.keys){
      // attributes[key] = value which could be [green,small,cotton] etc.
      if(variationAttributes[key] != selectedAttributes[key]) return false;

    }
    return true;
  }

  /// check attribute availability / stock in variation
  Set getAttributesAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName){
    // pass the variation to check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variations.where((variation) =>
        // check empty / out of the stock attributes
      variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0)
    // fetch all non-empty attributes of variation
      .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

  String getVariationPrice(){
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }


 /// check the product variation stock status
 void getProductVariationStockStatus(){
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock': 'Out of Stock';

 }


 /// reset selected attributes when switching products
 void resetSelectedAttributes(){
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
 }
}