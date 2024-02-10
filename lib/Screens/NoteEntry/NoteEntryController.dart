import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:secure_notes/Models/CreateNoteBaseModel.dart';
import 'package:secure_notes/Network/api_repository.dart';

import '../../Network/api_urls.dart';
import '../../Utils/AppCommonUtil.dart';
import '../../Utils/AppUiUtils.dart';

class NoteEntryController extends GetxController{

  RxString pickedDate = ''.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final ApiRepository _apiRepository = ApiRepository();

  @override
  void onInit() {
    super.onInit();
  }

  Future createNote() async {

    if (titleController.text.isEmpty) {
      UIUtil.instance.showToast(Get.context!, "Title Can't be Empty");
      return;
    }

    if (descController.text.isEmpty) {
      UIUtil.instance.showToast(Get.context!, "Description Can't be Empty");
      return;
    }


    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {

        Map<String,dynamic> body = {
          "title": titleController.text.trim(),
          "description": descController.text.trim()
        };

        _apiRepository.saveNote(Get.context!, ApiUrls.baseUrl + ApiUrls.getNotes, null,body,
            onSuccess: (CreateNoteBaseModel response) async {
              if (response != null) {
                UIUtil.instance.showToast(Get.context!, response.message.toString());
                Get.back();
              } else {
                UIUtil.instance.onFailed('Failed to Create Note');
              }
            },
            onFailure: (String error) {
              UIUtil.instance.onFailed(error);
            });
      } else {
        UIUtil.instance.onNoInternet();
      }
    });
  }

}