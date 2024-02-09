import 'package:get/get.dart';

class WelcomeController extends GetxController{

  RxString name = "".obs;
  RxString photo = "".obs;
  final arguments = Get.arguments;


  @override
  void onInit() {
    name.value = arguments["name"];
    photo.value = arguments["photo"];
  }

  gotoDashboard(){
    Get.offAndToNamed("/dashboardPage");
  }

}