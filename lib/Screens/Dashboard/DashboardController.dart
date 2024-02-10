import 'package:get/get.dart';
import 'package:secure_notes/Utils/SecureStorage.dart';

class DashboardController extends GetxController{
  RxString name = "".obs;
  RxString image = "".obs;

  @override
  void onInit() async{
    name.value = await SecureStorage().readSecureData("Name");
    image.value = await SecureStorage().readSecureData("Photo");
    super.onInit();
  }

  gotoInputPage() {
    Get.toNamed("/NoteInputPage");
  }

}