import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secure_notes/Models/CreateNoteBaseModel.dart';
import 'package:secure_notes/Models/NoteDeleteBaseResponse.dart';
import 'package:secure_notes/Models/UpdateNoteBaseResponse.dart';
import 'package:secure_notes/Network/api_repository.dart';
import 'package:secure_notes/Screens/Dashboard/DashboardController.dart';

import '../../Network/api_urls.dart';
import '../../Utils/AppCommonUtil.dart';
import '../../Utils/AppUiUtils.dart';
import '../../Utils/NotificationService.dart';

class NoteEntryController extends GetxController{

  RxString pickedDate = ''.obs;
  RxBool selected = false.obs;
  RxString selectedTimeDate = ''.obs;
  DateTime scheduleTime = DateTime.now();

  RxBool timePicked = false.obs;

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

  datePick(){
    DatePicker.showDateTimePicker(
      Get.context!,
      showTitleActions: true,
      onChanged: (date) {
        scheduleTime = date;
        selectedTimeDate.value = DateFormat("dd:MM:yyyy hh:mm a").format(date);
        timePicked.value = true;
      },
      onConfirm: (date) {},
    );
  }

  scheduleNotification(){
    NotificationService().scheduleNotification(
        id: Random().nextInt(100),
        title: titleController.text.trim(),
        body: descController.text.trim(),
        scheduledNotificationDateTime: scheduleTime);
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

    if (selected.value) {
      if (timePicked.value == false) {
        UIUtil.instance.showToast(Get.context!, "Please Pick Date & Time");
        return;
      }
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
                if (selected.value) {
                  NotificationService().showNotification(id:0,title:"Schedule Alert",body:"Schedule Set For Notification",payLoad: "");
                  scheduleNotification();
                }
                Get.back();
                getNoteFunction();
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

    if (selected.value) {
      if (timePicked.value == false) {
        UIUtil.instance.showToast(Get.context!, "Please Pick Date & Time");
        return;
      }
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
                if (selected.value) {
                  NotificationService().showNotification(id:0,title:"Schedule Alert",body:"Schedule Set For Notification",payLoad: "");
                  scheduleNotification();
                }
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