import 'dart:async';

import 'package:get/get.dart';
import 'package:secure_notes/Utils/SecureStorage.dart';

class SplashController extends GetxController{

  var name = "";

  @override
  Future<void> onInit() async {
    name = await SecureStorage().readSecureData("Name");
    Timer(const Duration(seconds: 4), () {
      if (name != "No data found!") {
        Get.offAndToNamed("/dashboardPage");
      }else{
        Get.offAndToNamed("/loginPage");
      }

    });
    super.onInit();
  }

}