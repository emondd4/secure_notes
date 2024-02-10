import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:secure_notes/Models/CreateNoteBaseModel.dart';
import 'package:secure_notes/Models/NoteDeleteBaseResponse.dart';
import 'package:secure_notes/Models/UpdateNoteBaseResponse.dart';
import 'package:secure_notes/Network/api_repository.dart';
import 'package:secure_notes/Screens/Dashboard/DashboardController.dart';

import '../../Network/api_urls.dart';
import '../../Utils/AppCommonUtil.dart';
import '../../Utils/AppUiUtils.dart';

class NoteEntryController extends GetxController{

  RxString pickedDate = ''.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final ApiRepository _apiRepository = ApiRepository();
  final arguments = Get.arguments;
  bool flag = false;
  Function() getNoteFunction = Get.find<DashboardController>().getNoteList;

  @override
  void onInit() {
    titleController.text = arguments["title"] ?? "";
    descController.text = arguments["desc"] ?? "";
    flag = arguments["flag"];

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

  Future updateNote() async {

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

        _apiRepository.updateNote(Get.context!, "${ApiUrls.baseUrl}${ApiUrls.updateNote}/${arguments["id"]}", null,body,
            onSuccess: (UpdateNoteBaseResponse response) async {
              if (response != null) {
                UIUtil.instance.showToast(Get.context!, response.message.toString());
                Get.back();
                getNoteFunction();
              } else {
                UIUtil.instance.onFailed('Failed to Update Note');
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

  Future deleteNote() async {

    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {

        _apiRepository.deleteNote(Get.context!, "${ApiUrls.baseUrl}${ApiUrls.updateNote}/${arguments["id"]}", null,null,
            onSuccess: (NoteDeleteBaseResponse response) async {
              if (response != null) {
                UIUtil.instance.showToast(Get.context!, response.message.toString());
                Get.back();
                getNoteFunction();
              } else {
                UIUtil.instance.onFailed('Failed to Delete Note');
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