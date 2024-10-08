import 'package:e_com/data/repositories/repository_authentication/authentication_repository.dart';
import 'package:e_com/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

Future<void> main() async {

  /// widgets binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  ///local storage
  await GetStorage.init();

  /// await splash until other items loads
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository())
  );

  runApp(const App());
}
