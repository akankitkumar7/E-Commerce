import 'package:e_com/features/authentication/password_configuration/forget_password.dart';
import 'package:e_com/features/authentication/screens/login/login.dart';
import 'package:e_com/features/authentication/screens/screen_onboarding/onboarding.dart';
import 'package:e_com/features/authentication/screens/signupWidgets/signup.dart';
import 'package:e_com/features/authentication/screens/signupWidgets/verify_email.dart';
import 'package:e_com/features/personalization/screens/address/address.dart';
import 'package:e_com/features/personalization/screens/profile/profile.dart';
import 'package:e_com/features/personalization/screens/settings/settings.dart';
import 'package:e_com/features/shop/screens/cart/cart.dart';
import 'package:e_com/features/shop/screens/checkout/checkout.dart';
import 'package:e_com/features/shop/screens/home/home.dart';
import 'package:e_com/features/shop/screens/order/order.dart';
import 'package:e_com/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_com/features/shop/screens/store/store.dart';
import 'package:e_com/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_com/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes{
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}